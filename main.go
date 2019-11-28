package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
	"path"
	"sort"
	"strconv"
	"strings"

	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/token"
)

const propertyPrefix = "prop"

func mapFromCFNTypeToCue(cfnType string) (lit ast.Expr) {
	switch cfnType {
	case "String":
		lit = &ast.BasicLit{Value: "string"}
	case "Integer", "Long":
		lit = &ast.BasicLit{Value: "int"}
	case "Double":
		lit = &ast.BasicLit{Value: "float"}
	case "Boolean":
		lit = &ast.BasicLit{Value: "bool"}
	case "Json":
		lit = &ast.StructLit{
			Elts: []ast.Decl{
				&ast.Field{
					Label: ast.NewList(&ast.BasicLit{Value: "string"}),
					Value: &ast.BasicLit{Value: "_"},
				},
			},
		}
	case "Map":
		lit = &ast.StructLit{}
	case "Timestamp":
		lit = &ast.BasicLit{Value: "time.Time"}
	default:
		// TODO clean this up... feels super ugly.
		lit = &ast.BasicLit{Value: propertyPrefix + cfnType}
	}
	return lit
}

func convertTypeToCUE(name string) string {
	switch name {
	case "String":
		return "string"
	case "Long":
		return "int"
	case "Integer":
		return "int"
	case "Double":
		return "float"
	case "Boolean":
		return "bool"
	case "Timestamp":
		return "time.Time"
	case "Json":
		return "struct"
	case "Map":
		return "struct"
	default:
		return name
	}
}

func (p Property) getPrimitiveTypeString() string {
	if p.IsPrimitive() {
		return p.PrimitiveType
	}

	if p.IsMap() && p.IsMapOfPrimitives() {
		return p.PrimitiveItemType
	}

	if p.IsList() && p.IsListOfPrimitives() {
		return p.PrimitiveItemType
	}

	return ""
}

func (p Property) getCUEPrimitiveType() ast.Expr {
	return mapFromCFNTypeToCue(p.getPrimitiveTypeString())
}

func getPrimitiveConstraints(prop Property, valueType ValueType) (constraints []ast.Expr, imports map[string]bool) {
	constraints = make([]ast.Expr, 0)
	imports = map[string]bool{}
	if prop.Value.ValueType != "" {
		if valueType.AllowedValues != nil {
			allowedValues := createExprFromAllowedValues(prop, valueType.AllowedValues, prop.getPrimitiveTypeString())
			constraints = append(constraints, allowedValues)
		}
		if valueType.NumberMax > 1 {
			min := valueType.NumberMin
			max := valueType.NumberMax
			allowedValues := createExprFromNumberMinMax(prop, min, max)
			constraints = append(constraints, allowedValues)
		}
		if valueType.StringMax > 0 {
			min := valueType.StringMin
			max := valueType.StringMax
			allowedValues := createExprFromStringMinMax(prop, int64(min), int64(max))
			constraints = append(constraints, allowedValues)
			imports["strings"] = true
		}
		if valueType.AllowedPatternRegex != "" {
			regex := valueType.AllowedPatternRegex
			allowedValues := createExprFromPatternRegex(prop, regex)
			constraints = append(constraints, allowedValues)
		}
		// Going to need to be smarter about this... I need to make sure that the marshalled JSON
		// string of this struct is less that JSONMax characters.
		// if valueType.JSONMax > 0 {
		// 	min := 0
		// 	max := valueType.JSONMax
		// 	allowedValues := createFieldFromStringMinMax(property, propertyResource, int64(min), int64(max))
		// 	propertyDecls = append(propertyDecls, allowedValues)
		// }
	}
	return constraints, imports
}

func mergeMaps(a, b map[string]bool) map[string]bool {
	for str := range b {
		a[str] = true
	}
	return a
}

func createFieldFromProperty(name string, prop Property, resourceSubproperties map[string]Resource, valueTypes map[string]ValueType, parentName string, parentResource Resource) (node *ast.Field, imports map[string]bool) {
	// Need to capture Map Types, and put the PrimitiveItemType or ItemType properly into a struct
	var value ast.Expr
	custom := false

	if parentName == "AWS::AppSync::GraphQLApi" && name == "AdditionalAuthenticationProviders" {
		prop = Property{ItemType: "AdditionalAuthenticationProvider", Type: "List", Required: false}
	}
	if parentName == "AWS::AppSync::GraphQLApi" && name == "Tags" {
		prop = Property{ItemType: "Tag", Type: "List", Required: false}
	}
	if parentName == "AWS::CodeBuild::Project" && name == "FilterGroups" {
		prop = Property{ItemType: "WebhookFilter", Type: "List", Required: false}
	}
	if name == "FilterGroups" && prop.ItemType == "FilterGroup" {
		var v ast.StructLit
		v, imports = createStructFromResource(name, resourceSubproperties["WebhookFilter"], resourceSubproperties, valueTypes)
		value = ast.NewList(&ast.Ellipsis{Type: &v})
		prop = Property{ItemType: "WebhookFilter", Type: "List", Required: false}
		custom = true
	}
	// AWS::EC2::Instance.NoDevice
	if name == "NoDevice" && prop.Type == "NoDevice" {
		prop = Property{PrimitiveType: "String", Required: false}
	}
	// AWS::Glue::SecurityConfiguration.S3Encryptions
	// if name == "S3Encryptions" && prop.Type == "S3Encryption" {
	if parentName == "EncryptionConfiguration" && name == "S3Encryptions" {
		prop = Property{ItemType: "S3Encryption", Type: "List", Required: false}
	}
	// AWS::IoTAnalytics::Channel.ServiceManagedS3 -- Skipped
	// AWS::IoTAnalytics::Datastore.ServiceManagedS3 -- Skipped
	// AWS::LakeFormation::DataLakeSettings.Admins
	if parentName == "AWS::LakeFormation::DataLakeSettings" && name == "Admins" {
		prop = Property{ItemType: "DataLakePrincipal", Type: "List", Required: false}
	}
	// AWS::MediaLive::Channel.AribSourceSettings -- Skipped
	// AWS::Transfer::User.SshPublicKey
	if parentName == "AWS::Transfer::User" && name == "SshPublicKeys" {
		prop = Property{PrimitiveItemType: "String", Type: "List", Required: false}
	}

	if prop.IsPrimitive() || prop.IsMapOfPrimitives() || prop.IsListOfPrimitives() {
		var constraints []ast.Expr
		value = prop.getCUEPrimitiveType()
		constraints, imports = getPrimitiveConstraints(prop, valueTypes[prop.Value.ValueType])
		if convertTypeToCUE(prop.getPrimitiveTypeString()) == "time.Time" {
			imports["time"] = true
		}
		for _, constraint := range constraints {
			val := &ast.BinaryExpr{
				X:  value,
				Op: token.AND,
				Y: &ast.ParenExpr{
					X: constraint,
				},
			}
			value = val
		}

		if len(constraints) > 0 {
			val := &ast.ParenExpr{
				X: value,
			}
			value = val
		}

		value = &ast.BinaryExpr{
			X:  value,
			Op: token.OR,
			Y:  ast.NewSel(ast.NewIdent("fn"), "Fn"),
		}

		if prop.IsList() {
			value = &ast.ParenExpr{X: value}
		}
	} else if !custom {
		// This is a more complex type, we need to recurse...
		var typeName string
		if prop.IsList() || prop.IsMap() {
			typeName = prop.ItemType
		} else {
			typeName = prop.Type
		}
		if typeName == parentResource.Properties[parentName].ItemType {
			// Weird recursion... might need some cleverness with Aliases to structure this correctly.
			value = &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.BasicLit{Value: "string"}),
						Value: &ast.BasicLit{Value: "_"},
					},
				},
			}
		} else {
			var v ast.StructLit
			v, imports = createStructFromResource(name, resourceSubproperties[typeName], resourceSubproperties, valueTypes)
			value = &v
		}
	}

	if prop.IsList() {
		value = ast.NewList(&ast.Ellipsis{Type: value})
		if prop.IsListOfPrimitives() {
			value = &ast.BinaryExpr{
				X:  value,
				Op: token.OR,
				Y:  ast.NewSel(ast.NewIdent("fn"), "Fn"),
			}
		}
	}

	if prop.IsMap() {
		value = &ast.StructLit{
			Elts: []ast.Decl{
				&ast.Field{
					Label: ast.NewList(&ast.BasicLit{Value: "string"}),
					Value: value,
				},
			},
		}
	}

	var optional token.Pos
	switch prop.Required {
	case true:
		optional = token.NoRelPos.Pos()
	case false:
		optional = token.Elided.Pos()
	}
	node = &ast.Field{
		Label:    ast.NewIdent(name),
		Value:    value,
		Optional: optional,
	}

	return node, imports
}

func createExprFromAllowedValues(prop Property, allowedValues []string, propertyType string) (expr ast.Expr) {
	for _, allowedValue := range allowedValues {
		var e ast.Expr
		if propertyType == "Integer" {
			e = &ast.BasicLit{Value: allowedValue}
		} else {
			e = ast.NewString(allowedValue)
		}
		if expr != nil {
			e = &ast.BinaryExpr{X: expr, Op: token.OR, Y: e}
		}
		expr = e
	}

	return expr
}

func createExprFromNumberMinMax(prop Property, min, max float64) (expr ast.Expr) {
	geq := &ast.UnaryExpr{
		Op: token.GEQ,
		X:  &ast.BasicLit{Kind: token.FLOAT, Value: strconv.FormatFloat(min, 'f', -1, 64)},
	}

	leq := &ast.UnaryExpr{
		Op: token.LEQ,
		X:  &ast.BasicLit{Kind: token.FLOAT, Value: strconv.FormatFloat(max, 'f', -1, 64)},
	}

	return &ast.BinaryExpr{X: geq, Op: token.AND, Y: leq}
}

func createExprFromStringMinMax(prop Property, min, max int64) (expr ast.Expr) {
	minLen := ast.NewCall(ast.NewIdent("strings.MinRunes"), &ast.BasicLit{Value: strconv.FormatInt(min, 10)})
	maxLen := ast.NewCall(ast.NewIdent("strings.MaxRunes"), &ast.BasicLit{Value: strconv.FormatInt(max, 10)})

	return &ast.BinaryExpr{X: minLen, Op: token.AND, Y: maxLen}
}

func createExprFromPatternRegex(prop Property, regex string) (expr ast.Expr) {
	return &ast.UnaryExpr{
		Op: token.MAT,
		X:  &ast.BasicLit{Kind: token.STRING, Value: "#\"" + regex + "\"#"},
	}
}

func propertyNames(p map[string]Property) (keys []string) {
	keys = make([]string, 0, len(p))
	for key := range p {
		keys = append(keys, key)
	}
	return keys
}

func createStructFromResource(resourceName string, resource Resource, resourceSubproperties map[string]Resource, valueTypes map[string]ValueType) (s ast.StructLit, imports map[string]bool) {
	properties := resource.Properties
	propertyNames := propertyNames(resource.Properties)
	sort.Strings(propertyNames)
	imports = map[string]bool{}

	propertyDecls := make([]ast.Decl, 0)

	for _, propertyName := range propertyNames {
		propertyResource := properties[propertyName]

		value, propImports := createFieldFromProperty(propertyName, propertyResource, resourceSubproperties, valueTypes, resourceName, resource)
		if len(propImports) > 0 {
			imports = mergeMaps(imports, propImports)
		}
		propertyDecls = append(propertyDecls, value)
	}

	if resourceName == "AWS::CloudFormation::CustomResource" {
		propertyDecls = append(propertyDecls, &ast.Field{
			Label: ast.NewList(&ast.BasicLit{Value: "string"}),
			Value: &ast.BasicLit{Value: "_"},
		})
	}

	// if len(imports) > 0 {
	// 	fmt.Println("struct resource imports:", imports)
	// }

	s = ast.StructLit{
		Elts: propertyDecls,
	}
	return s, imports
}

func resourceNamesSlice(p map[string]Resource) (keys []string) {
	keys = make([]string, 0, len(p))
	for key := range p {
		keys = append(keys, key)
	}
	return keys
}

func main() {
	regions := []string{
		"ap-east-1",
		"ap-northeast-1",
		"ap-northeast-2",
		"ap-northeast-3",
		"ap-south-1",
		"ap-southeast-1",
		"ap-southeast-2",
		"ca-central-1",
		"cn-north-1",
		"cn-northwest-1",
		"eu-central-1",
		"eu-north-1",
		"eu-west-1",
		"eu-west-2",
		"eu-west-3",
		"me-south-1",
		"sa-east-1",
		"us-east-1",
		"us-east-2",
		"us-gov-east-1",
		"us-gov-west-1",
		"us-west-1",
		"us-west-2",
	}

	for _, region := range regions {
		shortRegion := strings.ReplaceAll(region, "-", "")

		if region != "us-west-2" {
			continue
		}

		cloudformationSpec := "https://github.com/aws-cloudformation/cfn-python-lint/raw/master/src/cfnlint/data/CloudSpecs/" + region + ".json"
		fmt.Println(cloudformationSpec)
		data, _ := downloadSpec(cloudformationSpec)

		spec, _ := processSpec("cfn", data)

		propertiesByResource := map[string]map[string]Resource{}

		// Find weird/broken properties
		// fmt.Println("weird/broken properties")
		// weirdProps := []string{}
		// for resourcePropertyName, property := range spec.Properties {
		// 	if len(property.Properties) == 0 {
		// 		weirdProps = append(weirdProps, resourcePropertyName)
		// 	}
		// }
		// sort.Strings(weirdProps)
		// for _, prop := range weirdProps {
		// 	fmt.Println(prop)
		// }
		// panic(0)

		for resourcePropertyName, property := range spec.Properties {
			splits := strings.Split(resourcePropertyName, ".")
			if len(splits) > 1 {
				resourceName := splits[0]
				if propertiesByResource[resourceName] == nil {
					propertiesByResource[resourceName] = map[string]Resource{}
				}
				propertyName := splits[1]
				propertiesByResource[resourceName][propertyName] = property
			}
		}

		for resourceName := range spec.Resources {
			if propertiesByResource[resourceName] == nil {
				propertiesByResource[resourceName] = map[string]Resource{}
			}
			propertiesByResource[resourceName]["Tag"] = spec.Properties["Tag"]
		}

		servicesMap := map[string]bool{}

		for resourceName := range spec.Resources {
			splits := strings.Split(resourceName, "::")
			servicesMap[splits[1]] = true
		}

		serviceNames := make([]string, 0, len(servicesMap))
		for serviceName := range servicesMap {
			serviceNames = append(serviceNames, serviceName)
		}
		sort.Strings(serviceNames)

		resourcesByService := map[string]map[string]Resource{}
		for service := range servicesMap {
			resourcesByService[service] = map[string]Resource{}
		}

		for resourceName, resource := range spec.Resources {
			splits := strings.Split(resourceName, "::")
			service := splits[1]

			resourcesByService[service][resourceName] = resource
		}

		importDeclarations := make([]*ast.ImportSpec, 0)

		resourceTypes := make([]ast.Expr, 0)

		for _, serviceName := range serviceNames {
			resources := resourcesByService[serviceName]
			// fmt.Println(i, ":", serviceName)
			ff := &ast.File{
				Filename: serviceName,
				Decls: []ast.Decl{
					&ast.Package{
						Name: ast.NewIdent(shortRegion),
					},
				},
			}
			importStrings := map[string]bool{}
			imports := &ast.ImportDecl{
				Specs: []*ast.ImportSpec{
					&ast.ImportSpec{
						Path: ast.NewString("github.com/TangoGroup/aws/fn"),
					},
				},
			}

			serviceResources := make([]ast.Decl, 0)

			resourceNames := resourceNamesSlice(resources)
			sort.Strings(resourceNames)

			for _, resourceName := range resourceNames {
				resource := resources[resourceName]

				splits := strings.Split(resourceName, "::")
				resourceSubproperties := propertiesByResource[resourceName]

				resourceStr := splits[2]
				// fmt.Println("  " + resourceName)

				properties, resourceImports := createStructFromResource(resourceName, resource, resourceSubproperties, spec.ValueTypes)
				importStrings = mergeMaps(importStrings, resourceImports)
				propertiesStruct := &ast.Field{
					Label: ast.NewIdent("Properties"),
					Value: &properties,
				}
				resourceType := ast.Field{
					Label: ast.NewIdent("Type"),
					Value: ast.NewString(resourceName),
				}
				if resourceName == "AWS::CloudFormation::CustomResource" {
					resourceType.Value = &ast.BinaryExpr{
						X:  resourceType.Value,
						Op: token.OR,
						Y: &ast.UnaryExpr{
							Op: token.MAT,
							X:  &ast.BasicLit{Kind: token.STRING, Value: "#\"^Custom::[a-zA-Z0-9_@-]{1,60}$\"#"},
						},
					}
				}
				resourceElts := []ast.Decl{
					&resourceType,
					propertiesStruct,
					&ast.Field{
						Label:    ast.NewIdent("DependsOn"),
						Optional: token.Elided.Pos(),
						Value: &ast.BinaryExpr{
							X:  ast.NewIdent("string"),
							Op: token.OR,
							Y:  ast.NewList(&ast.Ellipsis{Type: ast.NewIdent("string")}),
						},
					},
				}

				switch resourceName {
				case "AWS::AutoScaling::AutoScalingGroup", "AWS::EC2::Instance", "AWS::CloudFormation::WaitCondition":
					resourceElts = append(resourceElts, &ast.Field{
						Label:    ast.NewIdent("CreationPolicy"),
						Optional: token.Elided.Pos(),
						Value: &ast.StructLit{
							Elts: []ast.Decl{
								&ast.Field{
									Label:    ast.NewIdent("AutoScalingCreationPolicy"),
									Optional: token.Elided.Pos(),
									Value: &ast.StructLit{
										Elts: []ast.Decl{
											&ast.Field{
												Label:    ast.NewIdent("MinSuccessfulInstancesPercent"),
												Optional: token.Elided.Pos(),
												Value:    &ast.BasicLit{Value: "int"},
											},
										},
									},
								},
								&ast.Field{
									Label:    ast.NewIdent("ResourceSignal"),
									Optional: token.Elided.Pos(),
									Value: &ast.StructLit{
										Elts: []ast.Decl{
											&ast.Field{
												Label:    ast.NewIdent("Count"),
												Optional: token.Elided.Pos(),
												Value:    &ast.BasicLit{Value: "int"},
											},
											&ast.Field{
												Label:    ast.NewIdent("Timeout"),
												Optional: token.Elided.Pos(),
												Value:    &ast.BasicLit{Value: "string"},
											},
										},
									},
								},
							},
						},
					})
				}
				deletionPolicyStrings := []string{"Delete", "Retain"}
				switch resourceName {
				case "AWS::EC2::Volume",
					"AWS::ElastiCache::CacheCluster",
					"AWS::ElastiCache::ReplicationGroup",
					"AWS::Neptune::DBCluster",
					"AWS::RDS::DBCluster",
					"AWS::RDS::DBInstance",
					"AWS::Redshift::Cluster":
					deletionPolicyStrings = append(deletionPolicyStrings, "Snapshot")
				}
				var deletionPolicies ast.Expr
				deletionPolicies = ast.NewString(deletionPolicyStrings[0])

				for _, deletionPolicy := range deletionPolicyStrings[1:] {
					deletionPolicies = &ast.BinaryExpr{X: deletionPolicies, Op: token.OR, Y: ast.NewString(deletionPolicy)}
				}
				resourceElts = append(resourceElts, &ast.Field{
					Label:    ast.NewIdent("DeletionPolicy"),
					Optional: token.Elided.Pos(),
					Value:    deletionPolicies,
				})
				resourceElts = append(resourceElts, &ast.Field{
					Label:    ast.NewIdent("UpdateReplacePolicy"),
					Optional: token.Elided.Pos(),
					Value:    deletionPolicies,
				})

				resourceElts = append(resourceElts, &ast.Field{
					Label:    ast.NewIdent("Metadata"),
					Optional: token.Elided.Pos(),
					Value: &ast.StructLit{
						Elts: []ast.Decl{
							&ast.Field{
								Label: ast.NewList(&ast.BasicLit{Value: "string"}),
								Value: &ast.BasicLit{Value: "_"},
							},
						},
					},
				})

				f := &ast.Field{
					Label: ast.NewIdent(resourceStr),
					Token: token.ISA,
					Value: &ast.StructLit{
						Elts: resourceElts,
					},
				}

				serviceResources = append(serviceResources, f)

				resourceTypes = append(resourceTypes, ast.NewSel(ast.NewIdent(serviceName), resourceStr))
			}

			builtInImports := []string{}

			for importString := range importStrings {
				builtInImports = append(builtInImports, importString)
			}
			sort.Strings(builtInImports)
			for _, importString := range builtInImports {
				imports.Specs = append(imports.Specs, &ast.ImportSpec{Path: ast.NewString(importString)})
			}

			ff.Decls = append(ff.Decls, imports)

			serviceField := &ast.Field{
				Label: ast.NewIdent(serviceName),
				Token: token.ISA,
				Value: &ast.StructLit{
					Elts: serviceResources,
				},
			}

			ff.Decls = append(ff.Decls, serviceField)
			b, _ := format.Node(ff, format.Simplify())

			servicePackage := path.Join("github.com/TangoGroup/aws/", shortRegion)

			importDeclarations = append(importDeclarations,
				ast.NewImport(ast.NewIdent(strings.ToLower(serviceName)),
					servicePackage))

			folder := path.Join("pkg", servicePackage)

			os.MkdirAll(folder, os.ModePerm)

			// fmt.Println("Saving", path.Join(folder, serviceName+".cue"))

			cuefile, err := os.Create(path.Join(folder, serviceName+".cue"))
			if err != nil {
				fmt.Println(err)
				return
			}
			_, err = cuefile.Write(b)
			if err != nil {
				fmt.Println(err)
				cuefile.Close()
				return
			}
			// fmt.Println(l, "bytes written successfully")
			err = cuefile.Close()
			if err != nil {
				fmt.Println(err)
				return
			}
		}

		// expr := resourceTypes[0]

		// for _, resource := range resourceTypes[1:] {
		// 	expr = &ast.BinaryExpr{X: expr, Op: token.OR, Y: resource}
		// }

		expr := ast.NewList(resourceTypes...)

		resourceNames := resourceNamesSlice(spec.Resources)
		sort.Strings(resourceNames)
		var resourceTypeStrings ast.Expr

		resourceTypeStrings = ast.NewString(resourceNames[0])

		for _, resourceName := range resourceNames[1:] {
			resourceTypeStrings = &ast.BinaryExpr{X: resourceTypeStrings, Op: token.OR, Y: ast.NewString(resourceName)}
		}

		declarations := []ast.Decl{
			&ast.Package{
				Name: ast.NewIdent(shortRegion),
			},
			&ast.ImportDecl{
				Specs: []*ast.ImportSpec{
					&ast.ImportSpec{
						Path: ast.NewString("github.com/TangoGroup/aws/fn"),
					},
				},
			},
			&ast.Field{
				Label: ast.NewIdent("ResourceSpecificationVersion"),
				Token: token.ISA,
				Value: ast.NewString(spec.ResourceSpecificationVersion),
			},
		}

		declarations = append(declarations, &ast.Field{
			Label: ast.NewIdent("ResourceTypes"),
			Token: token.ISA,
			Value: expr,
		})

		baseParameterTypes := []string{
			"String",
			"Number",
			"List<Number>",
			"CommaDelimitedList",
		}

		awsParameterTypesMap := map[string]bool{
			"AWS::EC2::AvailabilityZone::Name":   true,
			"AWS::EC2::Image::Id":                true,
			"AWS::EC2::Instance::Id":             true,
			"AWS::EC2::KeyPair::KeyName":         false,
			"AWS::EC2::SecurityGroup::GroupName": true,
			"AWS::EC2::SecurityGroup::Id":        true,
			"AWS::EC2::Subnet::Id":               true,
			"AWS::EC2::Volume::Id":               true,
			"AWS::EC2::VPC::Id":                  true,
			"AWS::Route53::HostedZone::Id":       true,
		}

		awsParameterTypes := []string{}
		for param := range awsParameterTypesMap {
			awsParameterTypes = append(awsParameterTypes, param)
		}

		awsListParameterTypes := []string{}
		for param, listType := range awsParameterTypesMap {
			if listType {
				awsListParameterTypes = append(awsListParameterTypes, "List<"+param+">")
			}
		}
		ssmParameterTypes := []string{
			"AWS::SSM::Parameter::Name",
			"AWS::SSM::Parameter::Value<String>",
			"AWS::SSM::Parameter::Value<List<String>>",
			"AWS::SSM::Parameter::Value<CommaDelimitedList>",
		}
		for _, param := range awsParameterTypes {
			ssmParameterTypes = append(ssmParameterTypes, "AWS::SSM::Parameter::Value<"+param+">")
			ssmParameterTypes = append(ssmParameterTypes, "AWS::SSM::Parameter::Value<List<"+param+">>")
		}

		parameterTypes := []string{}
		parameterTypes = append(parameterTypes, baseParameterTypes...)
		parameterTypes = append(parameterTypes, awsParameterTypes...)
		parameterTypes = append(parameterTypes, awsListParameterTypes...)
		parameterTypes = append(parameterTypes, ssmParameterTypes...)
		sort.Strings(parameterTypes)

		parameterTypesExpr := make([]ast.Expr, 0, len(parameterTypes))

		for _, param := range parameterTypes {
			parameterTypesExpr = append(parameterTypesExpr, ast.NewString(param))
		}

		var parameterDisjunction ast.Expr

		parameterDisjunction = parameterTypesExpr[0]

		for _, param := range parameterTypesExpr[1:] {
			parameterDisjunction = &ast.BinaryExpr{X: parameterDisjunction, Op: token.OR, Y: param}
		}

		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/format-version-structure.html
		templateVersion := &ast.Field{
			Label:    ast.NewIdent("AWSTemplateFormatVersion"),
			Value:    ast.NewString("2010-09-09"),
			Optional: token.Elided.Pos(),
		}

		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-description-structure.html
		templateDescription := &ast.Field{
			Label:    ast.NewIdent("Description"),
			Value:    &ast.BasicLit{Value: "string"},
			Optional: token.Elided.Pos(),
		}

		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/metadata-section-structure.html
		templateMetadata := &ast.Field{
			Label:    ast.NewIdent("Metadata"),
			Optional: token.Elided.Pos(),
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.BasicLit{Value: "string"}),
						Value: &ast.BasicLit{Value: "_"},
					},
				},
			},
		}

		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/mappings-section-structure.html
		templateMappings := &ast.Field{
			Label:    ast.NewIdent("Mappings"),
			Optional: token.Elided.Pos(),
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.BasicLit{Value: "string"}),
						Value: &ast.StructLit{
							Elts: []ast.Decl{
								&ast.Field{
									Label: ast.NewList(&ast.BasicLit{Value: "string"}),
									Value: &ast.StructLit{
										Elts: []ast.Decl{
											&ast.Field{
												Label: ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}),
												Value: &ast.BinaryExpr{
													X:  &ast.BasicLit{Value: "string"},
													Op: token.OR,
													Y:  ast.NewList(&ast.Ellipsis{Type: &ast.BasicLit{Value: "string"}}),
												},
											},
										},
									},
								},
							},
						},
					},
				},
			},
		}
		conditionsFunctions := []ast.Expr{
			ast.NewSel(ast.NewIdent("fn"), "And"),
			ast.NewSel(ast.NewIdent("fn"), "Equals"),
			ast.NewSel(ast.NewIdent("fn"), "If"),
			ast.NewSel(ast.NewIdent("fn"), "Not"),
			ast.NewSel(ast.NewIdent("fn"), "Or"),
		}
		conditionsFunctionDisjunction := conditionsFunctions[0]
		for _, function := range conditionsFunctions[1:] {
			conditionsFunctionDisjunction = &ast.BinaryExpr{X: conditionsFunctionDisjunction, Op: token.OR, Y: function}
		}
		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/conditions-section-structure.html
		templateConditions := &ast.Field{
			Label:    ast.NewIdent("Conditions"),
			Optional: token.Elided.Pos(),
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.BasicLit{Value: "string"}),
						Value: conditionsFunctionDisjunction,
					},
				},
			},
		}
		parameterProperties := [][]string{
			{"AllowedPattern", "string"},
			{"AllowedValues", "string"},
			{"ConstraintDescription", "string"},
			{"Default", "string"},
			{"Description", "string"},
			{"MaxLength", "int"},
			{"MaxValue", "int"},
			{"MinLength", "int"},
			{"MinValue", "int"},
			{"NoEcho", "bool"},
		}
		parameterPropertiesFields := []ast.Decl{
			&ast.Field{
				Label: ast.NewIdent("Type"),
				Value: parameterDisjunction,
			},
		}

		for _, arr := range parameterProperties {
			prop := arr[0]
			propType := arr[1]
			parameterPropertiesFields = append(parameterPropertiesFields, &ast.Field{
				Label:    ast.NewIdent(prop),
				Value:    &ast.BasicLit{Value: propType},
				Optional: token.Elided.Pos(),
			})
		}
		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html
		templateParameters := &ast.Field{
			Label:    ast.NewIdent("Parameters"),
			Optional: token.Elided.Pos(),
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}),
						Value: &ast.StructLit{
							Elts: parameterPropertiesFields,
						},
					},
				},
			},
		}
		deletionPolicyStrings := []string{"Delete", "Retain", "Snapshot"}
		var deletionPolicies ast.Expr
		deletionPolicies = ast.NewString(deletionPolicyStrings[0])

		for _, deletionPolicy := range deletionPolicyStrings[1:] {
			deletionPolicies = &ast.BinaryExpr{X: deletionPolicies, Op: token.OR, Y: ast.NewString(deletionPolicy)}
		}
		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resources-section-structure.html
		templateResources := &ast.Field{
			Label: ast.NewIdent("Resources"),
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}),
						Value: &ast.StructLit{
							Elts: []ast.Decl{
								&ast.Field{
									Label: ast.NewIdent("Type"),
									Value: resourceTypeStrings,
								},
								&ast.Field{
									Label: ast.NewIdent("Properties"),
									Value: &ast.StructLit{
										Elts: []ast.Decl{
											&ast.Field{
												Label: ast.NewList(&ast.BasicLit{Value: "string"}),
												Value: &ast.BasicLit{Value: "_"},
											},
										},
									},
								},
								&ast.Field{
									Label:    ast.NewIdent("DependsOn"),
									Optional: token.Elided.Pos(),
									Value: &ast.BinaryExpr{
										X:  ast.NewIdent("string"),
										Op: token.OR,
										Y:  ast.NewList(&ast.Ellipsis{Type: ast.NewIdent("string")}),
									},
								},
								&ast.Field{
									Label:    ast.NewIdent("DeletionPolicy"),
									Optional: token.Elided.Pos(),
									Value:    deletionPolicies,
								},
								&ast.Field{
									Label:    ast.NewIdent("UpdateReplacePolicy"),
									Optional: token.Elided.Pos(),
									Value:    deletionPolicies,
								},
								&ast.Field{
									Label:    ast.NewIdent("Metadata"),
									Optional: token.Elided.Pos(),
									Value: &ast.StructLit{
										Elts: []ast.Decl{
											&ast.Field{
												Label: ast.NewList(&ast.BasicLit{Value: "string"}),
												Value: &ast.BasicLit{Value: "_"},
											},
										},
									},
								},
							},
						},
					},
				},
			},
		}
		resourcesForLoop := &ast.Comprehension{
			Clauses: []ast.Clause{
				&ast.ForClause{
					Key:    ast.NewIdent("resourceName"),
					Value:  ast.NewIdent("resource"),
					Source: ast.NewIdent("Resources"),
				},
			},
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Comprehension{
						Clauses: []ast.Clause{
							&ast.ForClause{
								// Key: ast.NewIdent("resourceName"),
								Value:  ast.NewIdent("cfnResource"),
								Source: ast.NewIdent("ResourceTypes"),
							},
						},
						Value: &ast.StructLit{
							Elts: []ast.Decl{
								&ast.Comprehension{
									Clauses: []ast.Clause{
										&ast.IfClause{
											Condition: &ast.BinaryExpr{
												X:  ast.NewSel(ast.NewIdent("resource"), "Type"),
												Op: token.EQL,
												Y:  ast.NewSel(ast.NewIdent("cfnResource"), "Type"),
											},
										},
									},
									Value: &ast.StructLit{
										Elts: []ast.Decl{
											&ast.Field{
												Label: ast.NewIdent("Resources"),
												Value: &ast.StructLit{
													Elts: []ast.Decl{
														&ast.Field{
															Label: &ast.Interpolation{
																Elts: []ast.Expr{
																	&ast.BasicLit{
																		Kind:  token.STRING,
																		Value: `"\(resourceName)"`,
																	},
																},
															},
															Value: ast.NewIdent("cfnResource"),
														},
													},
												},
											},
										},
									},
								},
							},
						},
					},
				},
			},
		}

		// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/outputs-section-structure.html
		templateOutputs := &ast.Field{
			Label:    ast.NewIdent("Outputs"),
			Optional: token.Elided.Pos(),
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					&ast.Field{
						Label: ast.NewList(&ast.UnaryExpr{Op: token.MAT, X: ast.NewString("[a-zA-Z0-9]")}),
						Value: &ast.StructLit{
							Elts: []ast.Decl{
								&ast.Field{
									Label:    ast.NewIdent("Description"),
									Value:    &ast.BasicLit{Value: "string"},
									Optional: token.Elided.Pos(),
								},
								&ast.Field{Label: ast.NewIdent("Value"), Value: &ast.BasicLit{Value: "_"}},
								&ast.Field{
									Label:    ast.NewIdent("Export"),
									Optional: token.Elided.Pos(),
									Value: &ast.StructLit{
										Elts: []ast.Decl{
											&ast.Field{
												Label: ast.NewIdent("Name"),
												Value: &ast.BasicLit{Value: "_"},
											},
										},
									},
								},
							},
						},
					},
				},
			},
		}

		declarations = append(declarations, &ast.Field{
			Label: ast.NewIdent("Template"),
			Token: token.ISA,
			Value: &ast.StructLit{
				Elts: []ast.Decl{
					templateVersion,
					templateDescription,
					templateMetadata,
					templateMappings,
					templateConditions,
					templateParameters,
					templateResources,
					resourcesForLoop,
					templateOutputs,
				},
			},
		})

		allServicesFile := &ast.File{
			Filename: shortRegion + ".cue",
			Decls:    declarations,
		}

		b, _ := format.Node(allServicesFile, format.Simplify())
		packageFolder := path.Join("pkg/github.com/TangoGroup/aws", shortRegion)

		os.MkdirAll(packageFolder, os.ModePerm)

		cuefile, err := os.Create(path.Join(packageFolder, shortRegion+".cue"))
		if err != nil {
			fmt.Println(err)
			return
		}
		_, err = cuefile.Write(b)
		if err != nil {
			fmt.Println(err)
			cuefile.Close()
			return
		}
		// fmt.Println(l, "bytes written successfully")
		err = cuefile.Close()
		if err != nil {
			fmt.Println(err)
			return
		}
	}

}

func downloadSpec(location string) ([]byte, error) {
	uri, err := url.Parse(location)
	if err != nil {
		return nil, err
	}

	switch uri.Scheme {
	case "https", "http":
		uri := uri.String()
		response, err := http.Get(uri)
		if err != nil {
			return nil, err
		}

		data, err := ioutil.ReadAll(response.Body)
		if err != nil {
			return nil, err
		}

		return data, nil
	case "file":
		data, err := ioutil.ReadFile(strings.Replace(location, "file://", "", -1))
		if err != nil {
			return nil, err
		}

		return data, nil
	}

	return nil, fmt.Errorf("invalid URL scheme %s", uri.Scheme)
}

func processSpec(specname string, data []byte) (*CloudFormationResourceSpecification, error) {
	// Unmarshall the JSON specification
	spec := &CloudFormationResourceSpecification{}
	if err := json.Unmarshal(data, spec); err != nil {
		return nil, err
	}

	return spec, nil
}

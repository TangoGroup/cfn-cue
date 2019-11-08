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
	case "Json", "Map":
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

func (p Property) getCUEPrimitiveTypeString() string {
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
	return mapFromCFNTypeToCue(p.getCUEPrimitiveTypeString())
}

// func addPrimitiveConstraints()

func createFieldFromProperty(name string, prop Property, valueTypes map[string]ValueType) (node ast.Decl) {
	// Need to capture Map Types, and put the PrimitiveItemType or ItemType properly into a struct
	var value ast.Expr

	if prop.IsPrimitive() || prop.IsMapOfPrimitives() || prop.IsListOfPrimitives() {
		value = prop.getCUEPrimitiveType()
		constraints := make([]ast.Expr, 0)
		if prop.Value.ValueType != "" {
			valueType := valueTypes[prop.Value.ValueType]

			if valueType.AllowedValues != nil {
				allowedValues := createExprFromAllowedValues(prop, valueType.AllowedValues, prop.getCUEPrimitiveTypeString())
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
	} else {
		// This is a more complex type, we need to recurse...
		if prop.IsList() || prop.IsMap() {
			value = mapFromCFNTypeToCue(prop.ItemType)
		} else {
			value = mapFromCFNTypeToCue(prop.Type)
		}
	}

	if prop.IsList() {
		value = ast.NewList(&ast.Ellipsis{Type: value})
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

	return node
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

func createStructFromResource(resource Resource, resourceSubproperties map[string]Resource, valueTypes map[string]ValueType) (s ast.StructLit) {
	properties := resource.Properties
	propertyNames := propertyNames(resource.Properties)
	sort.Strings(propertyNames)

	propertyDecls := make([]ast.Decl, 0)

	for _, propertyName := range propertyNames {
		propertyResource := properties[propertyName]

		value := createFieldFromProperty(propertyName, propertyResource, valueTypes)
		propertyDecls = append(propertyDecls, value)
	}

	s = ast.StructLit{
		Elts: propertyDecls,
	}
	return s
}

func resourceNamesSlice(p map[string]Resource) (keys []string) {
	keys = make([]string, 0, len(p))
	for key := range p {
		keys = append(keys, key)
	}
	return keys
}

func main() {
	cloudformationSpec := "https://github.com/aws-cloudformation/cfn-python-lint/raw/master/src/cfnlint/data/CloudSpecs/us-west-2.json"
	fmt.Println(cloudformationSpec)
	data, _ := downloadSpec(cloudformationSpec)

	spec, _ := processSpec("cfn", data)

	propertiesByResource := map[string]map[string]Resource{}

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

	// prefixMap := map[string]bool{}

	// for resourceName := range spec.Resources {
	// 	splits := strings.Split(resourceName, "::")
	// 	prefixMap[splits[0]] = true
	// }

	// for prefix := range prefixMap {
	// 	fmt.Println(prefix)
	// }

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

	serviceRedeclarations := make([]ast.Decl, 0)

	resourceTypes := make([]ast.Expr, 0)

	for i, serviceName := range serviceNames {
		resources := resourcesByService[serviceName]
		fmt.Println(i, ":", serviceName)
		ff := &ast.File{
			Filename: serviceName,
			Decls: []ast.Decl{
				&ast.Package{
					Name: ast.NewIdent(serviceName),
				},
				&ast.ImportDecl{
					Specs: []*ast.ImportSpec{
						&ast.ImportSpec{
							Path: ast.NewString("github.com/TangoGroup/fn"),
						},
					},
				},
			},
		}

		resourceNames := resourceNamesSlice(resources)
		sort.Strings(resourceNames)

		for _, resourceName := range resourceNames {
			resource := resources[resourceName]
			splits := strings.Split(resourceName, "::")
			resourceSubproperties := propertiesByResource[resourceName]

			// aws := splits[0]
			resourceStr := splits[2]
			// fmt.Print(resourceStr + "  ")

			properties := createStructFromResource(resource, resourceSubproperties, spec.ValueTypes)
			propertiesStruct := &ast.Field{
				Label: ast.NewIdent("Properties"),
				Value: &properties,
			}
			resourceElts := []ast.Decl{
				&ast.Field{
					Label: ast.NewIdent("Type"),
					Value: &ast.BasicLit{Kind: token.STRING, Value: "\"" + resourceName + "\""},
				},
				propertiesStruct,
			}

			subpropertyNames := resourceNamesSlice(resourceSubproperties)
			sort.Strings(subpropertyNames)

			for _, propName := range subpropertyNames {
				prop := resourceSubproperties[propName]

				properties := createStructFromResource(prop, resourceSubproperties, spec.ValueTypes)
				resourceElts = append(resourceElts, &ast.Field{
					Label: ast.NewIdent(propertyPrefix + propName),
					Token: token.ISA,
					Value: &properties,
				})
			}
			f := &ast.Field{
				Label: ast.NewIdent(resourceStr),
				Token: token.ISA,
				Value: &ast.StructLit{
					Elts: resourceElts,
				},
			}
			ff.Decls = append(ff.Decls, f)
			resourceTypes = append(resourceTypes, ast.NewSel(ast.NewIdent(serviceName), resourceStr))
		}
		// fmt.Println("")
		b, _ := format.Node(ff, format.Simplify())

		servicePackage := "github.com/TangoGroup/aws/" + serviceName

		importDeclarations = append(importDeclarations, ast.NewImport(ast.NewIdent(strings.ToLower(serviceName)), servicePackage))
		serviceRedeclarations = append(serviceRedeclarations, &ast.Field{
			Label: ast.NewIdent(serviceName),
			Value: ast.NewIdent(strings.ToLower(serviceName)),
			Token: token.ISA,
		})

		folder := path.Join("pkg/" + servicePackage)

		os.MkdirAll(folder, os.ModePerm)

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

	expr := resourceTypes[0]

	for _, resource := range resourceTypes[1:] {
		expr = &ast.BinaryExpr{X: expr, Op: token.OR, Y: resource}
	}

	declarations := []ast.Decl{
		&ast.Package{
			Name: ast.NewIdent("aws"),
		},
		&ast.ImportDecl{
			Specs: importDeclarations,
		},
	}

	declarations = append(declarations, serviceRedeclarations...)

	declarations = append(declarations, &ast.Field{
		Label: ast.NewIdent("ResourceTypes"),
		Value: expr,
		Token: token.ISA,
	})

	declarations = append(declarations, &ast.Field{
		Label: ast.NewIdent("Template"),
		Token: token.ISA,
		Value: &ast.StructLit{
			Elts: []ast.Decl{
				&ast.Field{
					Label: ast.NewIdent("AWSTemplateFormatVersion"),
					Value: ast.NewString("2010-09-09"),
				},
				&ast.Field{
					Label:    ast.NewIdent("Description"),
					Value:    &ast.BasicLit{Value: "string"},
					Optional: token.Elided.Pos(),
				},
				&ast.Field{
					Label: ast.NewIdent("Resources"),
					Value: &ast.StructLit{
						Elts: []ast.Decl{
							&ast.Field{
								Label: ast.NewList(&ast.UnaryExpr{
									Op: token.MAT,
									X:  ast.NewString("[a-zA-Z0-9]"),
								}),
								Value: ast.NewIdent("ResourceTypes"),
							},
						},
					},
				},
			},
		},
	})

	allServicesFile := &ast.File{
		Filename: "aws.cue",
		Decls:    declarations,
	}

	b, _ := format.Node(allServicesFile, format.Simplify())
	packageFolder := "pkg/github.com/TangoGroup/aws/"

	os.MkdirAll(packageFolder, os.ModePerm)

	cuefile, err := os.Create(path.Join(packageFolder, "aws.cue"))
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

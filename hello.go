package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"strings"

	// "github.com/aws/aws-sdk-go-v2/private/util"

	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/token"
)

func mapFromCFNTypeToCue(cfnType string) (lit ast.Expr) {
	switch cfnType {
	case "String":
		lit = &ast.BasicLit{Value: "string"}
	case "Integer", "Long":
		lit = &ast.BasicLit{Value: "int"}
	case "Double":
		lit = &ast.BasicLit{Value: "float"}
	case "Boolean":
		lit = &ast.BasicLit{Value: "float"}
	case "Json", "Map":
		lit = &ast.StructLit{}
	case "Timestamp":
		lit = &ast.BasicLit{Value: "time.Time"}
	default:
		// TODO clean this up... feels super ugly.
		lit = &ast.BasicLit{Value: "__" + cfnType}
	}
	return lit
}

func createFieldFromProperty(name string, prop Property) (node ast.Decl) {
	// Need to capture List and Map Types, and put the PrimitiveItemType or ItemType properly into a list or struct
	var value ast.Expr
	if prop.PrimitiveItemType != "" || prop.ItemType != "" {
		var itemType ast.Expr
		if prop.PrimitiveItemType != "" {
			itemType = mapFromCFNTypeToCue(prop.PrimitiveItemType)
		} else if prop.ItemType != "" {
			itemType = mapFromCFNTypeToCue(prop.ItemType)
		}
		switch prop.Type {
		case "List":
			value = &ast.ListLit{
				Elts: []ast.Expr{&ast.Ellipsis{Type: itemType}},
			}
		case "Map":
			// TODO: See if I can know anything more about the shape of the Map object
			//       Looks like it should be string -> PrimitiveItemType
			// AWS::SSM::Association looks to be a weird case
			value = &ast.StructLit{}
		}
	} else {
		if prop.PrimitiveType != "" {
			value = mapFromCFNTypeToCue(prop.PrimitiveType)
		} else if prop.Type != "" {
			value = mapFromCFNTypeToCue(prop.Type)
		}
	}
	// switch prop.PrimitiveType {
	// case "String":
	// 	value = &ast.BasicLit{Value: "string"}
	// case "Integer", "Long":
	// 	value = &ast.BasicLit{Value: "int"}
	// case "Double":
	// 	value = &ast.BasicLit{Value: "float"}
	// case "Boolean":
	// 	value = &ast.BasicLit{Value: "float"}
	// case "Json", "Map":
	// 	value = &ast.StructLit{}
	// case "Timestamp":
	// 	value = &ast.BasicLit{Value: "time.Time"}
	// case "":
	// 	value = &ast.BasicLit{Value: prop.Type}
	// default:
	// 	value = &ast.BasicLit{Value: prop.PrimitiveType}
	// }

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

func main() {
	// filename := "hello.cue"
	// file := &ast.File{Filename: filename}
	// fmt.Printf("GoFormation Resource Generator\n")

	cloudformationSpec := "https://d1uauaxba7bl26.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json"
	data, _ := downloadSpec(cloudformationSpec)

	spec, _ := processSpec("cfn", data)
	// spew.Dump(spec.Properties["AWS::WAFRegional::ByteMatchSet.ByteMatchTuple"].Properties["TargetString"])

	// for resource, _ := range spec.Resources {
	// 	fmt.Println(resource)
	// }

	// propertiesByService := make(map[string][]string)

	// type Key struct {
	// 	ResourceName, PropertyName string
	// }

	propertiesByResource := map[string]map[string]Resource{}

	for resourcePropertyName, property := range spec.Properties {
		splits := strings.Split(resourcePropertyName, ".")
		// spew.Dump(splits)
		if len(splits) > 1 {
			resourceName := splits[0]
			if propertiesByResource[resourceName] == nil {
				propertiesByResource[resourceName] = map[string]Resource{}
			}
			propertyName := splits[1]
			propertiesByResource[resourceName][propertyName] = property
		}
	}

	// spew.Dump(propertiesByResource)

	// resourceName := "AWS::S3::BucketPolicy"
	// resourceName := "AWS::EC2::ClientVpnRoute"
	// resourceName := "AWS::Glue::Crawler"
	// resourceName := "AWS::Glue::Job"
	resourceName := "AWS::S3::Bucket"
	// spew.Dump(spec.Resources[resourceName])
	splits := strings.Split(resourceName, "::")

	// aws := splits[0]
	service := splits[1]
	resource := splits[2]

	properties := make([]ast.Decl, len(spec.Resources[resourceName].Properties))
	// (string) (len=9) "Timestamp": (bool) true,
	for property, propertyResource := range spec.Resources[resourceName].Properties {
		value := createFieldFromProperty(property, propertyResource)
		properties = append(properties, value)
	}
	// sort.Slice(properties, func(i, j int) bool {
	// 	iL, _ := ast.LabelName(properties[i].Label)
	// 	jL, _ := ast.LabelName(properties[j].Label)
	// 	return iL < jL
	// })
	// propertyDecls := make([]ast.Decl, len(properties))
	// for prop := range properties {
	// 	propertyDecls = append(propertyDecls, prop)
	// }
	propertiesStruct := &ast.Field{
		Label: ast.NewIdent("Properties"),
		Value: &ast.StructLit{
			Elts: properties,
		},
	}

	resourceElts := []ast.Decl{
		&ast.Field{
			Label: ast.NewIdent("Type"),
			Value: &ast.BasicLit{Kind: token.STRING, Value: "\"" + resourceName + "\""},
		},
		propertiesStruct,
	}
	for propName, prop := range propertiesByResource[resourceName] {
		propertyProperties := make([]ast.Decl, len(prop.Properties))
		for propPropName, propProp := range prop.Properties {
			propertyProperties = append(propertyProperties, createFieldFromProperty(propPropName, propProp))
		}
		resourceElts = append(resourceElts,
			&ast.Alias{
				// TODO clean this up... feels super ugly.
				Ident: ast.NewIdent("__" + propName),
				Expr: &ast.StructLit{
					Elts: propertyProperties,
				},
			})
	}
	f := &ast.Field{
		Label:    ast.NewIdent(resource),
		Token:    token.ISA,
		TokenPos: token.NoSpace.Pos(),
		Value: &ast.StructLit{
			Elts: resourceElts,
		},
	}
	// f := &ast.Field{
	// 	Label: ast.NewIdent(service),
	// 	Token: token.ISA,
	// 	Value: &ast.StructLit{
	// 		Elts: []ast.Decl{&ast.Field{
	// 			Label: ast.NewIdent(resource),
	// 			Token: token.ISA,
	// 			Value: &ast.StructLit{
	// 				Elts: []ast.Decl{propertiesStruct},
	// 			},
	// 		}},
	// 	}}
	ff := &ast.File{
		Filename: service,
		Decls: []ast.Decl{
			&ast.Package{
				Name: ast.NewIdent(service),
			},
			f,
		},
	}
	// f.AddComment(&ast.CommentGroup{
	// 	Line:     false,
	// 	Position: 2,
	// 	List: []*ast.Comment{
	// 		&ast.Comment{Text: "// Comment Test"},
	// 	},
	// })

	b, _ := format.Node(ff,
		format.Simplify(),
		format.UseSpaces(2),
		format.TabIndent(false))

	fmt.Println(string(b))

	fmt.Println(`
MyBucket: Bucket & {
  Properties BucketName: "stuff"
  Properties BucketEncryption ServerSideEncryptionConfiguration: [{
    ServerSideEncryptionByDefault SSEAlgorithm1: "AES256"
  }]
}
  `)

	// types := map[string]map[string]bool{
	// 	"PrimitiveType":     make(map[string]bool),
	// 	"Type":              make(map[string]bool),
	// 	"PrimitiveItemType": make(map[string]bool),
	// 	"ItemType":          make(map[string]bool),
	// }

	// for _, resource := range spec.Resources {
	// 	for _, property := range resource.Properties {
	// 		// if property.PrimitiveType != "" {
	// 		// 	types["PrimitiveType"][property.PrimitiveType] = true
	// 		// }
	// 		// if property.Type != "" {
	// 		// 	types["Type"][property.Type] = true
	// 		// }
	// 		// if property.PrimitiveItemType != "" {
	// 		// 	types["PrimitiveItemType"][property.PrimitiveItemType] = true
	// 		// }
	// 		// if property.ItemType != "" {
	// 		// 	types["ItemType"][property.ItemType] = true
	// 		// }
	// 		if property.PrimitiveItemType != "" || property.ItemType != "" {
	// 			types["Type"][property.Type] = true
	// 		}
	// 	}
	// }
	// for _, resource := range spec.Properties {
	// 	for _, property := range resource.Properties {
	// 		// if property.PrimitiveType != "" {
	// 		// 	types["PrimitiveType"][property.PrimitiveType] = true
	// 		// }
	// 		// if property.Type != "" {
	// 		// 	types["Type"][property.Type] = true
	// 		// }
	// 		// if property.PrimitiveItemType != "" {
	// 		// 	types["PrimitiveItemType"][property.PrimitiveItemType] = true
	// 		// }
	// 		// if property.ItemType != "" {
	// 		// 	types["ItemType"][property.ItemType] = true
	// 		// }
	// 		if property.PrimitiveItemType != "" || property.ItemType != "" {
	// 			types["Type"][property.Type] = true
	// 		}
	// 	}
	// }
	// spew.Dump(types)
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

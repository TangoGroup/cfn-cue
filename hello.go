package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
	"sort"
	"strings"

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
		lit = &ast.BasicLit{Value: "bool"}
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
	// Need to capture Map Types, and put the PrimitiveItemType or ItemType properly into a struct
	var value ast.Expr
	if prop.IsList() {
		var itemType ast.Expr
		if prop.PrimitiveItemType != "" {
			itemType = mapFromCFNTypeToCue(prop.PrimitiveItemType)
		} else if prop.ItemType != "" {
			itemType = mapFromCFNTypeToCue(prop.ItemType)
		}
		value = &ast.ListLit{
			Elts: []ast.Expr{&ast.Ellipsis{Type: itemType}},
		}
	} else if prop.IsMap() {
		value = &ast.StructLit{}
	} else {
		if prop.PrimitiveType != "" {
			value = mapFromCFNTypeToCue(prop.PrimitiveType)
		} else if prop.Type != "" {
			value = mapFromCFNTypeToCue(prop.Type)
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

func createStructFromResource(properties map[string]Property) (s ast.StructLit) {
	sortedProperties := []propertyStruct{}

	for propertyName, property := range properties {
		sortedProperties = append(sortedProperties, propertyStruct{
			name:     propertyName,
			property: property,
		})
	}

	sort.Slice(sortedProperties, func(i, j int) bool {
		return sortedProperties[i].name < sortedProperties[j].name
	})

	propertyDecls := make([]ast.Decl, len(sortedProperties))

	for _, propertyS := range sortedProperties {
		property := propertyS.name
		propertyResource := propertyS.property
		value := createFieldFromProperty(property, propertyResource)
		propertyDecls = append(propertyDecls, value)
	}

	s = ast.StructLit{
		Elts: propertyDecls,
	}
	return s
}

type resourceStruct struct {
	name     string
	resource Resource
}

type propertyStruct struct {
	name     string
	property Property
}

func main() {

	cloudformationSpec := "https://github.com/aws-cloudformation/cfn-python-lint/raw/master/src/cfnlint/data/CloudSpecs/us-west-2.json"
	// cloudformationSpec := "https://github.com/jlongtine/cfn-python-lint/raw/patch-1/src/cfnlint/data/CloudSpecs/us-west-2.json"
	// cloudformationSpec := "file:///Users/joellongtine/Desktop/us-west-2.json"
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

	servicesMap := map[string]bool{}

	for resourceName := range spec.Resources {
		splits := strings.Split(resourceName, "::")
		servicesMap[splits[1]] = true
	}

	services := []string{}
	for service := range servicesMap {
		services = append(services, service)
	}

	resourcesByService := map[string]map[string]Resource{}
	for service := range servicesMap {
		resourcesByService[service] = map[string]Resource{}
	}

	for resourceName, resource := range spec.Resources {
		splits := strings.Split(resourceName, "::")
		service := splits[1]

		resourcesByService[service][resourceName] = resource
	}

	for service, resources := range resourcesByService {
		fmt.Println(service)
		fmt.Print("  ")
		ff := &ast.File{
			Filename: service,
			Decls: []ast.Decl{
				&ast.Package{
					Name: ast.NewIdent(service),
				},
			},
		}

		sortedResources := []resourceStruct{}

		for resourceName, resource := range resources {
			sortedResources = append(sortedResources, resourceStruct{
				name:     resourceName,
				resource: resource,
			})
		}

		sort.Slice(sortedResources, func(i, j int) bool {
			return sortedResources[i].name < sortedResources[j].name
		})

		for _, resourceS := range sortedResources {
			resourceName := resourceS.name
			resource := resourceS.resource
			splits := strings.Split(resourceName, "::")

			// aws := splits[0]
			resourceStr := splits[2]
			fmt.Print(resourceStr + "  ")

			properties := createStructFromResource(resource.Properties)
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
			sortedResourceProperties := []resourceStruct{}
			for resourceName, resource := range propertiesByResource[resourceName] {
				sortedResourceProperties = append(sortedResourceProperties, resourceStruct{
					name:     resourceName,
					resource: resource,
				})
			}

			sort.Slice(sortedResourceProperties, func(i, j int) bool {
				return sortedResourceProperties[i].name < sortedResourceProperties[j].name
			})

			for _, propS := range sortedResourceProperties {
				propName := propS.name
				prop := propS.resource
				properties := createStructFromResource(prop.Properties)
				resourceElts = append(resourceElts,
					&ast.Alias{
						// TODO clean this up... feels super ugly.
						Ident: ast.NewIdent("__" + propName),
						Expr:  &properties,
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
		}
		fmt.Println("")
		b, _ := format.Node(ff,
			format.Simplify(),
			format.UseSpaces(2),
			format.TabIndent(false))

		cuefile, err := os.Create("cfn-specs/" + service + ".cue")
		if err != nil {
			fmt.Println(err)
			return
		}
		l, err := cuefile.Write(b)
		if err != nil {
			fmt.Println(err)
			cuefile.Close()
			return
		}
		fmt.Println(l, "bytes written successfully")
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

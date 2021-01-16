package eucentral1

import "github.com/TangoGroup/aws/fn"

#ServiceCatalogAppRegistry: {
	#Application: {
		Type: "AWS::ServiceCatalogAppRegistry::Application"
		Properties: {
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Tags?:        {
				[string]: string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#AttributeGroup: {
		Type: "AWS::ServiceCatalogAppRegistry::AttributeGroup"
		Properties: {
			Attributes:   {} | fn.#If
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Tags?:        {
				[string]: string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#AttributeGroupAssociation: {
		Type: "AWS::ServiceCatalogAppRegistry::AttributeGroupAssociation"
		Properties: {
			Application:    string | fn.#Fn
			AttributeGroup: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceAssociation: {
		Type: "AWS::ServiceCatalogAppRegistry::ResourceAssociation"
		Properties: {
			Application:  string | fn.#Fn
			Resource:     string | fn.#Fn
			ResourceType: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

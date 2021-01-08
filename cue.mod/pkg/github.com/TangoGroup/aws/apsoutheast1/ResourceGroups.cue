package apsoutheast1

import "github.com/TangoGroup/aws/fn"

#ResourceGroups: {
	#Group: {
		Type: "AWS::ResourceGroups::Group"
		Properties: {
			Description?:   string | fn.#Fn
			Name:           string | fn.#Fn
			ResourceQuery?: {
				Query?: {
					ResourceTypeFilters?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					StackIdentifier?:     string | fn.#Fn
					TagFilters?:          [...{
						Key?:    string | fn.#Fn
						Values?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}] | fn.#If
				} | fn.#If
				Type?: string | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package apnortheast2

import "github.com/TangoGroup/aws/fn"

#EventSchemas: {
	#RegistryPolicy: {
		Type: "AWS::EventSchemas::RegistryPolicy"
		Properties: {
			Policy: {
				[string]: _
			} | fn.#Fn
			RegistryName: string | fn.#Fn
			RevisionId?:  string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

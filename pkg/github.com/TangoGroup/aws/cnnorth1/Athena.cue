package cnnorth1

import "github.com/TangoGroup/aws/fn"

#Athena: {
	#DataCatalog: {
		Type:       "AWS::Athena::DataCatalog"
		Properties: close({
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Parameters?:  {
				[string]: string | fn.#Fn
			} | fn.If
			Tags?: close({
				Tags?: [...close({
					[string]: _
				})] | fn.If
			}) | fn.If
			Type: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

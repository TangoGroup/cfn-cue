package cnnorthwest1

import "github.com/TangoGroup/aws/fn"

#CE: {
	#CostCategory: {
		Type:       "AWS::CE::CostCategory"
		Properties: close({
			Name:        string | fn.#Fn
			RuleVersion: string | fn.#Fn
			Rules:       string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

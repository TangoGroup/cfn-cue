package cnnorth1

import "github.com/TangoGroup/aws/fn"

Athena :: {
	NamedQuery :: {
		Type:       "AWS::Athena::NamedQuery"
		Properties: close({
			Database:     string | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			QueryString:  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WorkGroup :: {
		Type:       "AWS::Athena::WorkGroup"
		Properties: close({
			Description?:           string | fn.Fn
			Name:                   string | fn.Fn
			RecursiveDeleteOption?: bool | fn.Fn
			State?:                 string | fn.Fn
			Tags?:                  close({
			}) | fn.If
			WorkGroupConfiguration?: close({
			}) | fn.If
			WorkGroupConfigurationUpdates?: close({
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package cnnorth1

import "github.com/TangoGroup/aws/fn"

Athena :: {
	DataCatalog :: {
		Type:       "AWS::Athena::DataCatalog"
		Properties: close({
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
			Description?:                   string | fn.Fn
			Name:                           string | fn.Fn
			RecursiveDeleteOption?:         bool | fn.Fn
			State?:                         string | fn.Fn
			Tags?:                          close({}) | fn.If
			WorkGroupConfiguration?:        close({}) | fn.If
			WorkGroupConfigurationUpdates?: close({}) | fn.If
			Name:         string | fn.Fn
			Parameters?:  {
				[string]: string | fn.Fn
			} | fn.If
			Tags?: close({
				Tags?: [...close({
					[string]: _
				})] | fn.If
			}) | fn.If
			Type: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

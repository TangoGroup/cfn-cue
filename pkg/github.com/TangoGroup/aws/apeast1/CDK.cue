package apeast1

import "github.com/TangoGroup/aws/fn"

CDK :: {
	Metadata :: {
		Type:       "AWS::CDK::Metadata"
		Properties: close({
			Modules: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

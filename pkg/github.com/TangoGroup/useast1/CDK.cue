package useast1

import "github.com/TangoGroup/fn"

CDK :: {
	Metadata :: {
		Type: "AWS::CDK::Metadata"
		Properties: Modules: string | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

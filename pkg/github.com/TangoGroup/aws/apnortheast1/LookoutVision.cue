package apnortheast1

import "github.com/TangoGroup/aws/fn"

LookoutVision :: {
	Project :: {
		Type:       "AWS::LookoutVision::Project"
		Properties: close({
			ProjectName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

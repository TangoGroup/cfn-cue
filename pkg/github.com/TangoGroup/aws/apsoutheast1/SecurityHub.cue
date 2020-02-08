package apsoutheast1

import "github.com/TangoGroup/aws/fn"

SecurityHub :: {
	Hub :: {
		Type: "AWS::SecurityHub::Hub"
		Properties: Tags?: {
			[string]: _
		} | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

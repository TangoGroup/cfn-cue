package apsoutheast1

import "github.com/TangoGroup/fn"

SDB :: {
	Domain :: {
		Type: "AWS::SDB::Domain"
		Properties: Description?: string | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

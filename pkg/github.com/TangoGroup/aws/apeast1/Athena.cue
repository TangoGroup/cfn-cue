package apeast1

import "github.com/TangoGroup/aws/fn"

Athena :: {
	NamedQuery :: {
		Type: "AWS::Athena::NamedQuery"
		Properties: {
			Database:     string | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			QueryString:  string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

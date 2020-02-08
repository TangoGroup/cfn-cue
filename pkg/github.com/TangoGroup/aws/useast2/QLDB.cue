package useast2

import "github.com/TangoGroup/aws/fn"

QLDB :: {
	Ledger :: {
		Type: "AWS::QLDB::Ledger"
		Properties: {
			DeletionProtection?: bool | fn.Fn
			Name?:               string | fn.Fn
			PermissionsMode:     string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

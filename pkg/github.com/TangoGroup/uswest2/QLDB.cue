package uswest2

import "github.com/TangoGroup/fn"

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
		DependsOn?:      string | [...string]
		DeletionPolicy?: "Delete" | "Retain"
	}
}

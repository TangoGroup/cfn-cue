package QLDB

import "github.com/TangoGroup/fn"

Ledger :: {
	Type: "AWS::QLDB::Ledger"
	Properties: {
		DeletionProtection?: bool | fn.Fn
		Name?:               string | fn.Fn
		PermissionsMode:     string | fn.Fn
		Tags?: [...__Tag]
	}
}

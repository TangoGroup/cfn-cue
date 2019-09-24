package QLDB

Ledger :: {
	Type: "AWS::QLDB::Ledger"
	Properties: {
		DeletionProtection?: bool
		Name?:               string
		PermissionsMode:     string
		Tags?: [...__Tag]
	}
}

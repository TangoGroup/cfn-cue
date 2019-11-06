package SDB

import "github.com/TangoGroup/fn"

Domain :: {
	Type: "AWS::SDB::Domain"
	Properties: Description?: string | fn.Fn
}

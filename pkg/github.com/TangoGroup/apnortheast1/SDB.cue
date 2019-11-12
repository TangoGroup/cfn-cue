package apnortheast1

import "github.com/TangoGroup/fn"

SDB :: {
	Domain :: {
		Type: "AWS::SDB::Domain"
		Properties: Description?: string | fn.Fn
	}
}

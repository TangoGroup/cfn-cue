package Athena

import "github.com/TangoGroup/fn"

NamedQuery :: {
	Type: "AWS::Athena::NamedQuery"
	Properties: {
		Database:     string | fn.Fn
		Description?: string | fn.Fn
		Name?:        string | fn.Fn
		QueryString:  string | fn.Fn
	}
}

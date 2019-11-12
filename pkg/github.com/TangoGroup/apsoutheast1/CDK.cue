package apsoutheast1

import "github.com/TangoGroup/fn"

CDK :: {
	Metadata :: {
		Type: "AWS::CDK::Metadata"
		Properties: Modules: string | fn.Fn
	}
}

package CDK

import "github.com/TangoGroup/fn"

Metadata :: {
	Type: "AWS::CDK::Metadata"
	Properties: {
		Modules: string | fn.Fn
	}
}

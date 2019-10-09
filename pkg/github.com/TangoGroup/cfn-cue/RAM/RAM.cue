package RAM

import "github.com/TangoGroup/fn"

ResourceShare :: {
	Type: "AWS::RAM::ResourceShare"
	Properties: {
		AllowExternalPrincipals?: bool | fn.Fn
		Name:                     string | fn.Fn
		Principals?:              [...string] | fn.Fn
		ResourceArns?:            [...string] | fn.Fn
		Tags?: [...__Tag]
	}
}

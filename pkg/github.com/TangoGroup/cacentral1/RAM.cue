package cacentral1

import "github.com/TangoGroup/fn"

RAM :: {
	ResourceShare :: {
		Type: "AWS::RAM::ResourceShare"
		Properties: {
			AllowExternalPrincipals?: bool | fn.Fn
			Name:                     string | fn.Fn
			Principals?: [...(string | fn.Fn)]
			ResourceArns?: [...(string | fn.Fn)]
			Tags?: [...{
			}]
		}
	}
}

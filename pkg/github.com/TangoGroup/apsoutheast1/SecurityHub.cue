package apsoutheast1

import "github.com/TangoGroup/fn"

SecurityHub :: {
	Hub :: {
		Type: "AWS::SecurityHub::Hub"
		Properties: Tags?: {
		} | fn.Fn
	}
}

package SecurityHub

import "github.com/TangoGroup/fn"

Hub :: {
	Type: "AWS::SecurityHub::Hub"
	Properties: Tags?: {
	} | fn.Fn
}

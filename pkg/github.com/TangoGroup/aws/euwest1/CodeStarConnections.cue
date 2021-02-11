package euwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

CodeStarConnections :: {
	Connection :: {
		Type:       "AWS::CodeStarConnections::Connection"
		Properties: close({
			ConnectionName: (strings.MinRunes(1) & strings.MaxRunes(32)) | fn.Fn
			HostArn?:       (=~#"arn:aws(-[\w]+)*:.+:.+:[0-9]{12}:.+"#) | fn.Fn
			ProviderType?:  string | fn.Fn
			Tags?:          [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

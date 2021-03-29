package uswest2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

AppIntegrations :: {
	EventIntegration :: {
		Type:       "AWS::AppIntegrations::EventIntegration"
		Properties: close({
			Description?:   (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
			EventBridgeBus: (strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^[a-zA-Z0-9/\._\-]+$"#)) | fn.Fn
			EventFilter:    {
				[string]: _
			} | fn.Fn
			Name:  (strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^[a-zA-Z0-9/\._\-]+$"#)) | fn.Fn
			Tags?: [...close({
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

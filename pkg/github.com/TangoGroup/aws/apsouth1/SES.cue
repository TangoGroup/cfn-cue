package apsouth1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

SES :: {
	ConfigurationSet :: {
		Type:       "AWS::SES::ConfigurationSet"
		Properties: close({
			Name?: (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]{1,64}$"#)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

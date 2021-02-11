package useast2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Timestream :: {
	Database :: {
		Type:       "AWS::Timestream::Database"
		Properties: close({
			DatabaseName?: (=~#"^[a-zA-Z0-9_.-]{3,64}$"#) | fn.Fn
			KmsKeyId?:     (strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.Fn
			Tags?:         [...close({
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
	Table :: {
		Type:       "AWS::Timestream::Table"
		Properties: close({
			DatabaseName:         (=~#"^[a-zA-Z0-9_.-]{3,64}$"#) | fn.Fn
			RetentionProperties?: {
				[string]: _
			} | fn.Fn
			TableName?: (=~#"^[a-zA-Z0-9_.-]{3,64}$"#) | fn.Fn
			Tags?:      [...close({
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

package usgovwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Kinesis :: {
	Stream :: {
		Type:       "AWS::Kinesis::Stream"
		Properties: close({
			Name?:                 (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9_.-]+$"#)) | fn.Fn
			RetentionPeriodHours?: (>=1 & <=168) | fn.Fn
			ShardCount:            (>=1 & <=100000) | fn.Fn
			StreamEncryption?:     close({
				EncryptionType: ("KMS") | fn.Fn
				KeyId:          (strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.Fn
			}) | fn.If
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
	StreamConsumer :: {
		Type:       "AWS::Kinesis::StreamConsumer"
		Properties: close({
			ConsumerName: string | fn.Fn
			StreamARN:    string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

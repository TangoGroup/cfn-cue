package apeast1

import "github.com/TangoGroup/aws/fn"

Kinesis :: {
	Stream :: {
		Type:       "AWS::Kinesis::Stream"
		Properties: close({
			Name?:                 string | fn.Fn
			RetentionPeriodHours?: (>=1 & <=168) | fn.Fn
			ShardCount:            (>=1 & <=100000) | fn.Fn
			StreamEncryption?:     close({
				EncryptionType: string | fn.Fn
				KeyId:          string | fn.Fn
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
}

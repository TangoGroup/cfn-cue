package cnnorth1

import "github.com/TangoGroup/fn"

KMS :: {
	Alias :: {
		Type: "AWS::KMS::Alias"
		Properties: {
			AliasName:   string | fn.Fn
			TargetKeyId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Key :: {
		Type: "AWS::KMS::Key"
		Properties: {
			Description?:       string | fn.Fn
			EnableKeyRotation?: bool | fn.Fn
			Enabled?:           bool | fn.Fn
			KeyPolicy:          {
				[string]: _
			} | fn.Fn
			KeyUsage?:            string | fn.Fn
			PendingWindowInDays?: (int & (>=7 & <=30)) | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

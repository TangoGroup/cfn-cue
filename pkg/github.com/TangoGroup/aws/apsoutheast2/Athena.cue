package apsoutheast2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Athena :: {
	DataCatalog :: {
		Type:       "AWS::Athena::DataCatalog"
		Properties: close({
			Description?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			Name:         (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			Parameters?:  {
				[string]: string | fn.Fn
			} | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: ("LAMBDA" | "GLUE" | "HIVE") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NamedQuery :: {
		Type:       "AWS::Athena::NamedQuery"
		Properties: close({
			Database:     (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			Description?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			Name?:        (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
			QueryString:  (strings.MinRunes(1) & strings.MaxRunes(262144)) | fn.Fn
			WorkGroup?:   (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WorkGroup :: {
		Type:       "AWS::Athena::WorkGroup"
		Properties: close({
			Description?:           string | fn.Fn
			Name:                   (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9._-]{1,128}"#)) | fn.Fn
			RecursiveDeleteOption?: bool | fn.Fn
			State?:                 ("ENABLED" | "DISABLED") | fn.Fn
			Tags?:                  [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			WorkGroupConfiguration?: close({
				BytesScannedCutoffPerQuery?:      int | fn.Fn
				EnforceWorkGroupConfiguration?:   bool | fn.Fn
				PublishCloudWatchMetricsEnabled?: bool | fn.Fn
				RequesterPaysEnabled?:            bool | fn.Fn
				ResultConfiguration?:             close({
					EncryptionConfiguration?: close({
						EncryptionOption: ("SSE_S3" | "SSE_KMS" | "CSE_KMS") | fn.Fn
						KmsKey?:          string | fn.Fn
					}) | fn.If
					OutputLocation?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			WorkGroupConfigurationUpdates?: close({
				BytesScannedCutoffPerQuery?:       int | fn.Fn
				EnforceWorkGroupConfiguration?:    bool | fn.Fn
				PublishCloudWatchMetricsEnabled?:  bool | fn.Fn
				RemoveBytesScannedCutoffPerQuery?: bool | fn.Fn
				RequesterPaysEnabled?:             bool | fn.Fn
				ResultConfigurationUpdates?:       close({
					EncryptionConfiguration?: close({
						EncryptionOption: ("SSE_S3" | "SSE_KMS" | "CSE_KMS") | fn.Fn
						KmsKey?:          string | fn.Fn
					}) | fn.If
					OutputLocation?:                string | fn.Fn
					RemoveEncryptionConfiguration?: bool | fn.Fn
					RemoveOutputLocation?:          bool | fn.Fn
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package useast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

DataBrew :: {
	Dataset :: {
		Type:       "AWS::DataBrew::Dataset"
		Properties: close({
			FormatOptions?: {
				[string]: _
			} | fn.Fn
			Input: {
				[string]: _
			} | fn.Fn
			Name:  (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
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
	Job :: {
		Type:       "AWS::DataBrew::Job"
		Properties: close({
			DatasetName?:      (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			EncryptionKeyArn?: (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
			EncryptionMode?:   ("SSE-KMS" | "SSE-S3") | fn.Fn
			LogSubscription?:  ("ENABLE" | "DISABLE") | fn.Fn
			MaxCapacity?:      int | fn.Fn
			MaxRetries?:       int | fn.Fn
			Name:              (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			OutputLocation?:   {
				[string]: _
			} | fn.Fn
			Outputs?: [...close({
				CompressionFormat?: ("GZIP" | "LZ4" | "SNAPPY" | "BZIP2" | "DEFLATE" | "LZO" | "BROTLI" | "ZSTD" | "ZLIB") | fn.Fn
				Format?:            ("CSV" | "JSON" | "PARQUET" | "GLUEPARQUET" | "AVRO" | "ORC" | "XML") | fn.Fn
				FormatOptions?:     close({
					Csv?: close({
						Delimiter?: (strings.MinRunes(1) & strings.MaxRunes(1)) | fn.Fn
					}) | fn.If
				}) | fn.If
				Location: close({
					Bucket: string | fn.Fn
					Key?:   string | fn.Fn
				}) | fn.If
				Overwrite?:        bool | fn.Fn
				PartitionColumns?: [...(string | fn.Fn)] | (string | fn.Fn)
			})] | fn.If
			ProjectName?: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			Recipe?:      {
				[string]: _
			} | fn.Fn
			RoleArn: string | fn.Fn
			Tags?:   [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Timeout?: int | fn.Fn
			Type:     ("PROFILE" | "RECIPE") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Project :: {
		Type:       "AWS::DataBrew::Project"
		Properties: close({
			DatasetName: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			Name:        (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			RecipeName:  (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			RoleArn:     string | fn.Fn
			Sample?:     {
				[string]: _
			} | fn.Fn
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
	Recipe :: {
		Type:       "AWS::DataBrew::Recipe"
		Properties: close({
			Description?: string | fn.Fn
			Name:         (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			Steps:        [...close({
				Action: close({
					Operation:   string | fn.Fn
					Parameters?: {
						[string]: string | fn.Fn
					} | fn.If
				}) | fn.If
				ConditionExpressions?: [...close({
					Condition:    string | fn.Fn
					TargetColumn: string | fn.Fn
					Value?:       string | fn.Fn
				})] | fn.If
			})] | fn.If
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
	Schedule :: {
		Type:       "AWS::DataBrew::Schedule"
		Properties: close({
			CronExpression: (strings.MinRunes(1) & strings.MaxRunes(512)) | fn.Fn
			JobNames?:      [...((strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn)
			Name:           (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
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

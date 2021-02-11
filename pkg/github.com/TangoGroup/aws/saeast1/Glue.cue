package saeast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Glue :: {
	MLTransform :: {
		Type:       "AWS::Glue::MLTransform"
		Properties: close({
			Description?:      string | fn.Fn
			GlueVersion?:      string | fn.Fn
			InputRecordTables: close({
				GlueTables?: [...close({
					CatalogId?:      string | fn.Fn
					ConnectionName?: string | fn.Fn
					DatabaseName:    string | fn.Fn
					TableName:       string | fn.Fn
				})] | fn.If
			}) | fn.If
			MaxCapacity?:     (>=1 & <=100) | fn.Fn
			MaxRetries?:      int | fn.Fn
			Name?:            string | fn.Fn
			NumberOfWorkers?: int | fn.Fn
			Role:             string | fn.Fn
			Tags?:            {
				[string]: _
			} | fn.Fn
			Timeout?:            int | fn.Fn
			TransformParameters: close({
				FindMatchesParameters?: close({
					AccuracyCostTradeoff?:    number | fn.Fn
					EnforceProvidedLabels?:   bool | fn.Fn
					PrecisionRecallTradeoff?: number | fn.Fn
					PrimaryKeyColumnName:     string | fn.Fn
				}) | fn.If
				TransformType: string | fn.Fn
			}) | fn.If
			WorkerType?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Registry :: {
		Type:       "AWS::Glue::Registry"
		Properties: close({
			Description?: string | fn.Fn
			Name:         (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			Tags?:        [...close({
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
	Schema :: {
		Type:       "AWS::Glue::Schema"
		Properties: close({
			CheckpointVersion?: close({
				IsLatest?:      bool | fn.Fn
				VersionNumber?: (>=1 & <=100000) | fn.Fn
			}) | fn.If
			Compatibility: ("NONE" | "DISABLED" | "BACKWARD" | "BACKWARD_ALL" | "FORWARD" | "FORWARD_ALL" | "FULL" | "FULL_ALL") | fn.Fn
			DataFormat:    ("AVRO") | fn.Fn
			Description?:  string | fn.Fn
			Name:          (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			Registry?:     close({
				Arn?:  (=~#"arn:(aws|aws-us-gov|aws-cn):glue:.*"#) | fn.Fn
				Name?: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			}) | fn.If
			SchemaDefinition: string | fn.Fn
			Tags?:            [...close({
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
	SchemaVersion :: {
		Type:       "AWS::Glue::SchemaVersion"
		Properties: close({
			Schema: close({
				RegistryName?: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
				SchemaArn?:    (=~#"arn:(aws|aws-us-gov|aws-cn):glue:.*"#) | fn.Fn
				SchemaName?:   (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
			}) | fn.If
			SchemaDefinition: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SchemaVersionMetadata :: {
		Type:       "AWS::Glue::SchemaVersionMetadata"
		Properties: close({
			Key:             (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
			SchemaVersionId: (=~#"[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}"#) | fn.Fn
			Value:           (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

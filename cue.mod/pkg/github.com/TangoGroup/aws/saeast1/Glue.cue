package saeast1

import "github.com/TangoGroup/aws/fn"

#Glue: {
	#MLTransform: {
		Type: "AWS::Glue::MLTransform"
		Properties: {
			Description?:      string | fn.#Fn
			GlueVersion?:      string | fn.#Fn
			InputRecordTables: {
				GlueTables?: [...{
					CatalogId?:      string | fn.#Fn
					ConnectionName?: string | fn.#Fn
					DatabaseName:    string | fn.#Fn
					TableName:       string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			MaxCapacity?:     (>=1 & <=100) | fn.#Fn
			MaxRetries?:      int | fn.#Fn
			Name?:            string | fn.#Fn
			NumberOfWorkers?: int | fn.#Fn
			Role:             string | fn.#Fn
			Tags?:            {
				[string]: _
			} | fn.#Fn
			Timeout?:            int | fn.#Fn
			TransformParameters: {
				FindMatchesParameters?: {
					AccuracyCostTradeoff?:    number | fn.#Fn
					EnforceProvidedLabels?:   bool | fn.#Fn
					PrecisionRecallTradeoff?: number | fn.#Fn
					PrimaryKeyColumnName:     string | fn.#Fn
				} | fn.#If
				TransformType: string | fn.#Fn
			} | fn.#If
			WorkerType?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Registry: {
		Type: "AWS::Glue::Registry"
		Properties: {
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Tags?:        [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Schema: {
		Type: "AWS::Glue::Schema"
		Properties: {
			CheckpointVersion?: {
				IsLatest?:      bool | fn.#Fn
				VersionNumber?: int | fn.#Fn
			} | fn.#If
			Compatibility: string | fn.#Fn
			DataFormat:    string | fn.#Fn
			Description?:  string | fn.#Fn
			Name:          string | fn.#Fn
			Registry?:     {
				Arn?:  string | fn.#Fn
				Name?: string | fn.#Fn
			} | fn.#If
			SchemaDefinition: string | fn.#Fn
			Tags?:            [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SchemaVersion: {
		Type: "AWS::Glue::SchemaVersion"
		Properties: {
			Schema: {
				RegistryName?: string | fn.#Fn
				SchemaArn?:    string | fn.#Fn
				SchemaName?:   string | fn.#Fn
			} | fn.#If
			SchemaDefinition: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SchemaVersionMetadata: {
		Type: "AWS::Glue::SchemaVersionMetadata"
		Properties: {
			Key:             string | fn.#Fn
			SchemaVersionId: string | fn.#Fn
			Value:           string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

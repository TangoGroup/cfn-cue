package usgovwest1

import "github.com/TangoGroup/aws/fn"

#Glue: {
	#DataCatalogEncryptionSettings: {
		Type: "AWS::Glue::DataCatalogEncryptionSettings"
		Properties: {
			CatalogId:                     string | fn.#Fn
			DataCatalogEncryptionSettings: {
				ConnectionPasswordEncryption?: {
					KmsKeyId?:                          string | fn.#Fn
					ReturnConnectionPasswordEncrypted?: bool | fn.#Fn
				} | fn.#If
				EncryptionAtRest?: {
					CatalogEncryptionMode?: string | fn.#Fn
					SseAwsKmsKeyId?:        string | fn.#Fn
				} | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
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
}

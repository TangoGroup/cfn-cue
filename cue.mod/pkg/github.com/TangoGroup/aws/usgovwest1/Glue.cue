package usgovwest1

import "github.com/TangoGroup/aws/fn"

#Glue: {
	#MLTransform: {
		Type:       "AWS::Glue::MLTransform"
		Properties: close({
			Description?:      string | fn.#Fn
			GlueVersion?:      string | fn.#Fn
			InputRecordTables: close({
				GlueTables?: [...close({
					CatalogId?:      string | fn.#Fn
					ConnectionName?: string | fn.#Fn
					DatabaseName:    string | fn.#Fn
					TableName:       string | fn.#Fn
				})] | fn.If
			}) | fn.If
			MaxCapacity?:     (>=1 & <=100) | fn.#Fn
			MaxRetries?:      int | fn.#Fn
			Name?:            string | fn.#Fn
			NumberOfWorkers?: int | fn.#Fn
			Role:             string | fn.#Fn
			Tags?:            {
				[string]: _
			} | fn.#Fn
			Timeout?:            int | fn.#Fn
			TransformParameters: close({
				FindMatchesParameters?: close({
					AccuracyCostTradeoff?:    number | fn.#Fn
					EnforceProvidedLabels?:   bool | fn.#Fn
					PrecisionRecallTradeoff?: number | fn.#Fn
					PrimaryKeyColumnName:     string | fn.#Fn
				}) | fn.If
				TransformType: string | fn.#Fn
			}) | fn.If
			WorkerType?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

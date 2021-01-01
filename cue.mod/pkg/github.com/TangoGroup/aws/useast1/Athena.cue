package useast1

import "github.com/TangoGroup/aws/fn"

#Athena: {
	#DataCatalog: {
		Type:       "AWS::Athena::DataCatalog"
		Properties: close({
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Parameters?:  {
				[string]: string | fn.#Fn
			} | fn.If
			Tags?: close({
				Tags?: [...close({
					[string]: _
				})] | fn.If
			}) | fn.If
			Type: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NamedQuery: {
		Type:       "AWS::Athena::NamedQuery"
		Properties: close({
			Database:     string | fn.#Fn
			Description?: string | fn.#Fn
			Name?:        string | fn.#Fn
			QueryString:  string | fn.#Fn
			WorkGroup?:   string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WorkGroup: {
		Type:       "AWS::Athena::WorkGroup"
		Properties: close({
			Description?:           string | fn.#Fn
			Name:                   string | fn.#Fn
			RecursiveDeleteOption?: bool | fn.#Fn
			State?:                 string | fn.#Fn
			Tags?:                  close({
				Tags?: [...close({
					[string]: _
				})] | fn.If
			}) | fn.If
			WorkGroupConfiguration?: close({
				BytesScannedCutoffPerQuery?:      int | fn.#Fn
				EnforceWorkGroupConfiguration?:   bool | fn.#Fn
				PublishCloudWatchMetricsEnabled?: bool | fn.#Fn
				RequesterPaysEnabled?:            bool | fn.#Fn
				ResultConfiguration?:             close({
					EncryptionConfiguration?: close({
						EncryptionOption: string | fn.#Fn
						KmsKey?:          string | fn.#Fn
					}) | fn.If
					OutputLocation?: string | fn.#Fn
				}) | fn.If
			}) | fn.If
			WorkGroupConfigurationUpdates?: close({
				BytesScannedCutoffPerQuery?:       int | fn.#Fn
				EnforceWorkGroupConfiguration?:    bool | fn.#Fn
				PublishCloudWatchMetricsEnabled?:  bool | fn.#Fn
				RemoveBytesScannedCutoffPerQuery?: bool | fn.#Fn
				RequesterPaysEnabled?:             bool | fn.#Fn
				ResultConfigurationUpdates?:       close({
					EncryptionConfiguration?: close({
						EncryptionOption: string | fn.#Fn
						KmsKey?:          string | fn.#Fn
					}) | fn.If
					OutputLocation?:                string | fn.#Fn
					RemoveEncryptionConfiguration?: bool | fn.#Fn
					RemoveOutputLocation?:          bool | fn.#Fn
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

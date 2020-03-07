package saeast1

import "github.com/TangoGroup/aws/fn"

Athena :: {
	WorkGroup :: {
		Type: "AWS::Athena::WorkGroup"
		Properties: {
			Description?:           string | fn.Fn
			Name:                   string | fn.Fn
			RecursiveDeleteOption?: bool | fn.Fn
			State?:                 string | fn.Fn
			Tags?:                  close({
				Tags?: [...close({
					[string]: _
				})] | fn.If
			}) | fn.If
			WorkGroupConfiguration?: close({
				BytesScannedCutoffPerQuery?:      int | fn.Fn
				EnforceWorkGroupConfiguration?:   bool | fn.Fn
				PublishCloudWatchMetricsEnabled?: bool | fn.Fn
				RequesterPaysEnabled?:            bool | fn.Fn
				ResultConfiguration?:             close({
					EncryptionConfiguration?: close({
						EncryptionOption: string | fn.Fn
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
						EncryptionOption: string | fn.Fn
						KmsKey?:          string | fn.Fn
					}) | fn.If
					OutputLocation?:                string | fn.Fn
					RemoveEncryptionConfiguration?: bool | fn.Fn
					RemoveOutputLocation?:          bool | fn.Fn
				}) | fn.If
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

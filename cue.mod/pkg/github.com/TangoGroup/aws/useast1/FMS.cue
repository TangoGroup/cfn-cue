package useast1

import "github.com/TangoGroup/aws/fn"

#FMS: {
	#NotificationChannel: {
		Type:       "AWS::FMS::NotificationChannel"
		Properties: close({
			SnsRoleName: string | fn.#Fn
			SnsTopicArn: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Policy: {
		Type:       "AWS::FMS::Policy"
		Properties: close({
			DeleteAllPolicyResources?: bool | fn.#Fn
			ExcludeMap?:               close({
				ACCOUNT?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				ORGUNIT?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			ExcludeResourceTags: bool | fn.#Fn
			IncludeMap?:         close({
				ACCOUNT?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				ORGUNIT?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			PolicyName:         string | fn.#Fn
			RemediationEnabled: bool | fn.#Fn
			ResourceTags?:      [...close({
				Key:    string | fn.#Fn
				Value?: string | fn.#Fn
			})] | fn.If
			ResourceType:              string | fn.#Fn
			ResourceTypeList?:         [...(string | fn.#Fn)] | (string | fn.#Fn)
			SecurityServicePolicyData: {
				[string]: _
			} | fn.#Fn
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

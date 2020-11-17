package euwest3

import "github.com/TangoGroup/aws/fn"

#GuardDuty: {
	#Detector: {
		Type: "AWS::GuardDuty::Detector"
		Properties: {
			DataSources?: {
				S3Logs?: {
					Enable?: bool | fn.#Fn
				} | fn.If
			} | fn.If
			Enable:                      bool | fn.#Fn
			FindingPublishingFrequency?: ("FIFTEEN_MINUTES" | "ONE_HOUR" | "SIX_HOURS") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

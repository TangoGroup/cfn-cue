package euwest3

import "github.com/TangoGroup/aws/fn"

#GuardDuty: {
	#Detector: {
		Type:       "AWS::GuardDuty::Detector"
		Properties: close({
			Enable:                      bool | fn.#Fn
			FindingPublishingFrequency?: ("FIFTEEN_MINUTES" | "ONE_HOUR" | "SIX_HOURS") | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package euwest3

import "github.com/TangoGroup/aws/fn"

#GuardDuty: {
	#Detector: {
		Type: "AWS::GuardDuty::Detector"
		Properties: {
			DataSources?: {
				S3Logs?: {
					Enable?: bool | fn.#Fn
				} | fn.#If
			} | fn.#If
			Enable:                      bool | fn.#Fn
			FindingPublishingFrequency?: ("FIFTEEN_MINUTES" | "ONE_HOUR" | "SIX_HOURS") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Master: {
		Type: "AWS::GuardDuty::Master"
		Properties: {
			DetectorId:    string | fn.#Fn
			InvitationId?: string | fn.#Fn
			MasterId:      string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Member: {
		Type: "AWS::GuardDuty::Member"
		Properties: {
			DetectorId:                string | fn.#Fn
			DisableEmailNotification?: bool | fn.#Fn
			Email:                     string | fn.#Fn
			MemberId:                  string | fn.#Fn
			Message?:                  string | fn.#Fn
			Status?:                   ("Created" | "Disabled" | "Enabled" | "Invited" | "Removed" | "Resigned") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

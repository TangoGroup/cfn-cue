package uswest2

import "github.com/TangoGroup/aws/fn"

#Signer: {
	#ProfilePermission: {
		Type: "AWS::Signer::ProfilePermission"
		Properties: {
			Action:          string | fn.#Fn
			Principal:       string | fn.#Fn
			ProfileName:     string | fn.#Fn
			ProfileVersion?: string | fn.#Fn
			StatementId:     string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SigningProfile: {
		Type: "AWS::Signer::SigningProfile"
		Properties: {
			PlatformId:               string | fn.#Fn
			SignatureValidityPeriod?: {
				Type?:  string | fn.#Fn
				Value?: int | fn.#Fn
			} | fn.#If
			Tags?: [...{
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
}

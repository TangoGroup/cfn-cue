package apeast1

import "github.com/TangoGroup/aws/fn"

Signer :: {
	ProfilePermission :: {
		Type:       "AWS::Signer::ProfilePermission"
		Properties: close({
			Action:          string | fn.Fn
			Principal:       string | fn.Fn
			ProfileName:     string | fn.Fn
			ProfileVersion?: (=~#"^[0-9a-zA-Z]{10}$"#) | fn.Fn
			StatementId:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SigningProfile :: {
		Type:       "AWS::Signer::SigningProfile"
		Properties: close({
			PlatformId:               ("AWSLambda-SHA384-ECDSA") | fn.Fn
			SignatureValidityPeriod?: close({
				Type?:  ("DAYS" | "MONTHS" | "YEARS") | fn.Fn
				Value?: int | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

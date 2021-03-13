package saeast1

import "github.com/TangoGroup/aws/fn"

CertificateManager :: {
	Account :: {
		Type:       "AWS::CertificateManager::Account"
		Properties: close({
			ExpiryEventsConfiguration: close({
				DaysBeforeExpiry?: (>=1 & <=45) | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Certificate :: {
		Type:       "AWS::CertificateManager::Certificate"
		Properties: close({
			CertificateAuthorityArn?:                  string | fn.Fn
			CertificateTransparencyLoggingPreference?: string | fn.Fn
			DomainName:                                string | fn.Fn
			DomainValidationOptions?:                  [...close({
				DomainName:        string | fn.Fn
				HostedZoneId?:     string | fn.Fn
				ValidationDomain?: string | fn.Fn
			})] | fn.If
			SubjectAlternativeNames?: [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                    [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			ValidationMethod?: ("DNS" | "EMAIL") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

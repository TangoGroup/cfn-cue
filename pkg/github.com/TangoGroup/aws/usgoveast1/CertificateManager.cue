package usgoveast1

import "github.com/TangoGroup/aws/fn"

CertificateManager :: {
	Certificate :: {
		Type: "AWS::CertificateManager::Certificate"
		Properties: {
			DomainName:               string | fn.Fn
			DomainValidationOptions?: [...close({
				DomainName:       string | fn.Fn
				ValidationDomain: string | fn.Fn
			})] | fn.If
			SubjectAlternativeNames?: [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                    [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			ValidationMethod?: ("DNS" | "EMAIL") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

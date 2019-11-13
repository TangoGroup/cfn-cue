package apeast1

import "github.com/TangoGroup/fn"

CertificateManager :: {
	Certificate :: {
		Type: "AWS::CertificateManager::Certificate"
		Properties: {
			DomainName: string | fn.Fn
			DomainValidationOptions?: [...{
				DomainName:       string | fn.Fn
				ValidationDomain: string | fn.Fn
			}]
			SubjectAlternativeNames?: [...(string | fn.Fn)]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			ValidationMethod?: (string & ("DNS" | "EMAIL")) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

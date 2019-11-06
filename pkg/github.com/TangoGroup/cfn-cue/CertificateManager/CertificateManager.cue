package CertificateManager

import "github.com/TangoGroup/fn"

Certificate :: {
	Type: "AWS::CertificateManager::Certificate"
	Properties: {
		DomainName: string | fn.Fn
		DomainValidationOptions?: [...propDomainValidationOption]
		SubjectAlternativeNames?: [...string] | fn.Fn
		Tags?: [...propTag]
		ValidationMethod?: (string & ("DNS" | "EMAIL")) | fn.Fn
	}
	propDomainValidationOption :: {
		DomainName:       string | fn.Fn
		ValidationDomain: string | fn.Fn
	}
}

package CertificateManager

import "github.com/TangoGroup/fn"

Certificate :: {
	Type: "AWS::CertificateManager::Certificate"
	Properties: {
		DomainName: string | fn.Fn
		DomainValidationOptions?: [...__DomainValidationOption]
		SubjectAlternativeNames?: [...string] | fn.Fn
		Tags?: [...__Tag]
		ValidationMethod?: (string & ("DNS" | "EMAIL")) | fn.Fn
	}
	__DomainValidationOption :: {
		DomainName:       string | fn.Fn
		ValidationDomain: string | fn.Fn
	}
}

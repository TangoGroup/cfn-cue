package CertificateManager

Certificate :: {
	Type: "AWS::CertificateManager::Certificate"
	Properties: {
		DomainName: string
		DomainValidationOptions?: [...__DomainValidationOption]
		SubjectAlternativeNames?: [...string]
		Tags?: [...__Tag]
		ValidationMethod?: "DNS" | "EMAIL"
		ValidationMethod?: string
	}
	__DomainValidationOption = {
		DomainName:       string
		ValidationDomain: string
	}
}
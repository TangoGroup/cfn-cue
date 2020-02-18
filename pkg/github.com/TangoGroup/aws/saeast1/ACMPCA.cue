package saeast1

import "github.com/TangoGroup/aws/fn"

ACMPCA :: {
	Certificate :: {
		Type: "AWS::ACMPCA::Certificate"
		Properties: {
			CertificateAuthorityArn:   string | fn.Fn
			CertificateSigningRequest: string | fn.Fn
			SigningAlgorithm:          string | fn.Fn
			TemplateArn?:              string | fn.Fn
			Validity:                  close({
				Type:  string | fn.Fn
				Value: int | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	CertificateAuthority :: {
		Type: "AWS::ACMPCA::CertificateAuthority"
		Properties: {
			KeyAlgorithm:             string | fn.Fn
			RevocationConfiguration?: close({
				CrlConfiguration?: close({
					CustomCname?:      string | fn.Fn
					Enabled?:          bool | fn.Fn
					ExpirationInDays?: int | fn.Fn
					S3BucketName?:     string | fn.Fn
				}) | fn.If
			}) | fn.If
			SigningAlgorithm: string | fn.Fn
			Subject:          close({
				CommonName?:                 string | fn.Fn
				Country?:                    string | fn.Fn
				DistinguishedNameQualifier?: string | fn.Fn
				GenerationQualifier?:        string | fn.Fn
				GivenName?:                  string | fn.Fn
				Initials?:                   string | fn.Fn
				Locality?:                   string | fn.Fn
				Organization?:               string | fn.Fn
				OrganizationalUnit?:         string | fn.Fn
				Pseudonym?:                  string | fn.Fn
				SerialNumber?:               string | fn.Fn
				State?:                      string | fn.Fn
				Surname?:                    string | fn.Fn
				Title?:                      string | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	CertificateAuthorityActivation :: {
		Type: "AWS::ACMPCA::CertificateAuthorityActivation"
		Properties: {
			Certificate:             string | fn.Fn
			CertificateAuthorityArn: string | fn.Fn
			CertificateChain?:       string | fn.Fn
			Status?:                 string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

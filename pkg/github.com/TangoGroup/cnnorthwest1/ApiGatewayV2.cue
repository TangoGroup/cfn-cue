package cnnorthwest1

import "github.com/TangoGroup/fn"

ApiGatewayV2 :: {
	ApiMapping :: {
		Type: "AWS::ApiGatewayV2::ApiMapping"
		Properties: {
			ApiId:          string | fn.Fn
			ApiMappingKey?: string | fn.Fn
			DomainName:     string | fn.Fn
			Stage:          string | fn.Fn
		}
	}
	DomainName :: {
		Type: "AWS::ApiGatewayV2::DomainName"
		Properties: {
			DomainName: string | fn.Fn
			DomainNameConfigurations?: [...{
				CertificateArn?:  string | fn.Fn
				CertificateName?: string | fn.Fn
				EndpointType?:    string | fn.Fn
			}]
			Tags?: {
			} | fn.Fn
		}
	}
}

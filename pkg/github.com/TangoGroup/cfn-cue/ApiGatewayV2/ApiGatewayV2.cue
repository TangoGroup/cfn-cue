package ApiGatewayV2

import "github.com/TangoGroup/fn"

Api :: {
	Type: "AWS::ApiGatewayV2::Api"
	Properties: {
		ApiKeySelectionExpression?: string | fn.Fn
		Description?:               string | fn.Fn
		DisableSchemaValidation?:   bool | fn.Fn
		Name:                       string | fn.Fn
		ProtocolType:               string | fn.Fn
		RouteSelectionExpression:   string | fn.Fn
		Tags?:                      {
		} | fn.Fn
		Version?: string | fn.Fn
	}
}
ApiMapping :: {
	Type: "AWS::ApiGatewayV2::ApiMapping"
	Properties: {
		ApiId:          string | fn.Fn
		ApiMappingKey?: string | fn.Fn
		DomainName:     string | fn.Fn
		Stage:          string | fn.Fn
	}
}
Authorizer :: {
	Type: "AWS::ApiGatewayV2::Authorizer"
	Properties: {
		ApiId:                         string | fn.Fn
		AuthorizerCredentialsArn?:     string | fn.Fn
		AuthorizerResultTtlInSeconds?: int | fn.Fn
		AuthorizerType:                string | fn.Fn
		AuthorizerUri:                 string | fn.Fn
		IdentitySource:                [...string] | fn.Fn
		IdentityValidationExpression?: string | fn.Fn
		Name:                          string | fn.Fn
	}
}
Deployment :: {
	Type: "AWS::ApiGatewayV2::Deployment"
	Properties: {
		ApiId:        string | fn.Fn
		Description?: string | fn.Fn
		StageName?:   string | fn.Fn
	}
}
DomainName :: {
	Type: "AWS::ApiGatewayV2::DomainName"
	Properties: {
		DomainName: string | fn.Fn
		DomainNameConfigurations?: [...propDomainNameConfiguration]
		Tags?: {
		} | fn.Fn
	}
	propDomainNameConfiguration :: {
		CertificateArn?:  string | fn.Fn
		CertificateName?: string | fn.Fn
		EndpointType?:    string | fn.Fn
	}
}
Integration :: {
	Type: "AWS::ApiGatewayV2::Integration"
	Properties: {
		ApiId:                    string | fn.Fn
		ConnectionType?:          string | fn.Fn
		ContentHandlingStrategy?: string | fn.Fn
		CredentialsArn?:          string | fn.Fn
		Description?:             string | fn.Fn
		IntegrationMethod?:       string | fn.Fn
		IntegrationType:          string | fn.Fn
		IntegrationUri?:          string | fn.Fn
		PassthroughBehavior?:     string | fn.Fn
		RequestParameters?:       {
		} | fn.Fn
		RequestTemplates?: {
		} | fn.Fn
		TemplateSelectionExpression?: string | fn.Fn
		TimeoutInMillis?:             int | fn.Fn
	}
}
IntegrationResponse :: {
	Type: "AWS::ApiGatewayV2::IntegrationResponse"
	Properties: {
		ApiId:                    string | fn.Fn
		ContentHandlingStrategy?: string | fn.Fn
		IntegrationId:            string | fn.Fn
		IntegrationResponseKey:   string | fn.Fn
		ResponseParameters?:      {
		} | fn.Fn
		ResponseTemplates?: {
		} | fn.Fn
		TemplateSelectionExpression?: string | fn.Fn
	}
}
Model :: {
	Type: "AWS::ApiGatewayV2::Model"
	Properties: {
		ApiId:        string | fn.Fn
		ContentType?: string | fn.Fn
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		Schema:       {
		} | fn.Fn
	}
}
Route :: {
	Type: "AWS::ApiGatewayV2::Route"
	Properties: {
		ApiId:                     string | fn.Fn
		ApiKeyRequired?:           bool | fn.Fn
		AuthorizationScopes?:      [...string] | fn.Fn
		AuthorizationType?:        string | fn.Fn
		AuthorizerId?:             string | fn.Fn
		ModelSelectionExpression?: string | fn.Fn
		OperationName?:            string | fn.Fn
		RequestModels?:            {
		} | fn.Fn
		RequestParameters?: {
		} | fn.Fn
		RouteKey:                          string | fn.Fn
		RouteResponseSelectionExpression?: string | fn.Fn
		Target?:                           string | fn.Fn
	}
	propParameterConstraints :: {
		Required: bool | fn.Fn
	}
}
RouteResponse :: {
	Type: "AWS::ApiGatewayV2::RouteResponse"
	Properties: {
		ApiId:                     string | fn.Fn
		ModelSelectionExpression?: string | fn.Fn
		ResponseModels?:           {
		} | fn.Fn
		ResponseParameters?: {
		} | fn.Fn
		RouteId:          string | fn.Fn
		RouteResponseKey: string | fn.Fn
	}
	propParameterConstraints :: {
		Required: bool | fn.Fn
	}
}
Stage :: {
	Type: "AWS::ApiGatewayV2::Stage"
	Properties: {
		AccessLogSettings?:    propAccessLogSettings
		ApiId:                 string | fn.Fn
		ClientCertificateId?:  string | fn.Fn
		DefaultRouteSettings?: propRouteSettings
		DeploymentId:          string | fn.Fn
		Description?:          string | fn.Fn
		RouteSettings?:        {
		} | fn.Fn
		StageName:       string | fn.Fn
		StageVariables?: {
		} | fn.Fn
		Tags?: {
		} | fn.Fn
	}
	propAccessLogSettings :: {
		DestinationArn?: string | fn.Fn
		Format?:         string | fn.Fn
	}
	propRouteSettings :: {
		DataTraceEnabled?:       bool | fn.Fn
		DetailedMetricsEnabled?: bool | fn.Fn
		LoggingLevel?:           string | fn.Fn
		ThrottlingBurstLimit?:   int | fn.Fn
		ThrottlingRateLimit?:    float | fn.Fn
	}
}

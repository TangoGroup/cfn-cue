package ApiGatewayV2

Api :: {
	Type: "AWS::ApiGatewayV2::Api"
	Properties: {
		ApiKeySelectionExpression?: string
		Description?:               string
		DisableSchemaValidation?:   bool
		Name:                       string
		ProtocolType:               string
		RouteSelectionExpression:   string
		Tags?: {
		}
		Version?: string
	}
}
ApiMapping :: {
	Type: "AWS::ApiGatewayV2::ApiMapping"
	Properties: {
		ApiId:          string
		ApiMappingKey?: string
		DomainName:     string
		Stage:          string
	}
}
Authorizer :: {
	Type: "AWS::ApiGatewayV2::Authorizer"
	Properties: {
		ApiId:                         string
		AuthorizerCredentialsArn?:     string
		AuthorizerResultTtlInSeconds?: int
		AuthorizerType:                string
		AuthorizerUri:                 string
		IdentitySource: [...string]
		IdentityValidationExpression?: string
		Name:                          string
	}
}
Deployment :: {
	Type: "AWS::ApiGatewayV2::Deployment"
	Properties: {
		ApiId:        string
		Description?: string
		StageName?:   string
	}
}
DomainName :: {
	Type: "AWS::ApiGatewayV2::DomainName"
	Properties: {
		DomainName: string
		DomainNameConfigurations?: [...__DomainNameConfiguration]
		Tags?: {
		}
	}
	__DomainNameConfiguration :: {
		CertificateArn?:  string
		CertificateName?: string
		EndpointType?:    string
	}
}
Integration :: {
	Type: "AWS::ApiGatewayV2::Integration"
	Properties: {
		ApiId:                    string
		ConnectionType?:          string
		ContentHandlingStrategy?: string
		CredentialsArn?:          string
		Description?:             string
		IntegrationMethod?:       string
		IntegrationType:          string
		IntegrationUri?:          string
		PassthroughBehavior?:     string
		RequestParameters?: {
		}
		RequestTemplates?: {
		}
		TemplateSelectionExpression?: string
		TimeoutInMillis?:             int
	}
}
IntegrationResponse :: {
	Type: "AWS::ApiGatewayV2::IntegrationResponse"
	Properties: {
		ApiId:                    string
		ContentHandlingStrategy?: string
		IntegrationId:            string
		IntegrationResponseKey:   string
		ResponseParameters?: {
		}
		ResponseTemplates?: {
		}
		TemplateSelectionExpression?: string
	}
}
Model :: {
	Type: "AWS::ApiGatewayV2::Model"
	Properties: {
		ApiId:        string
		ContentType?: string
		Description?: string
		Name:         string
		Schema: {
		}
	}
}
Route :: {
	Type: "AWS::ApiGatewayV2::Route"
	Properties: {
		ApiId:           string
		ApiKeyRequired?: bool
		AuthorizationScopes?: [...string]
		AuthorizationType?:        string
		AuthorizerId?:             string
		ModelSelectionExpression?: string
		OperationName?:            string
		RequestModels?: {
		}
		RequestParameters?: {
		}
		RouteKey:                          string
		RouteResponseSelectionExpression?: string
		Target?:                           string
	}
	__ParameterConstraints :: {
		Required: bool
	}
}
RouteResponse :: {
	Type: "AWS::ApiGatewayV2::RouteResponse"
	Properties: {
		ApiId:                     string
		ModelSelectionExpression?: string
		ResponseModels?: {
		}
		ResponseParameters?: {
		}
		RouteId:          string
		RouteResponseKey: string
	}
	__ParameterConstraints :: {
		Required: bool
	}
}
Stage :: {
	Type: "AWS::ApiGatewayV2::Stage"
	Properties: {
		AccessLogSettings?:    __AccessLogSettings
		ApiId:                 string
		ClientCertificateId?:  string
		DefaultRouteSettings?: __RouteSettings
		DeploymentId:          string
		Description?:          string
		RouteSettings?: {
		}
		StageName: string
		StageVariables?: {
		}
		Tags?: {
		}
	}
	__AccessLogSettings :: {
		DestinationArn?: string
		Format?:         string
	}
	__RouteSettings :: {
		DataTraceEnabled?:       bool
		DetailedMetricsEnabled?: bool
		LoggingLevel?:           string
		ThrottlingBurstLimit?:   int
		ThrottlingRateLimit?:    float
	}
}

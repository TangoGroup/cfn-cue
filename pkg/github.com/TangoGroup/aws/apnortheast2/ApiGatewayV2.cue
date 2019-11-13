package apnortheast2

import "github.com/TangoGroup/aws/fn"

ApiGatewayV2 :: {
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
				[string]: _
			} | fn.Fn
			Version?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ApiMapping :: {
		Type: "AWS::ApiGatewayV2::ApiMapping"
		Properties: {
			ApiId:          string | fn.Fn
			ApiMappingKey?: string | fn.Fn
			DomainName:     string | fn.Fn
			Stage:          string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Authorizer :: {
		Type: "AWS::ApiGatewayV2::Authorizer"
		Properties: {
			ApiId:                         string | fn.Fn
			AuthorizerCredentialsArn?:     string | fn.Fn
			AuthorizerResultTtlInSeconds?: int | fn.Fn
			AuthorizerType:                string | fn.Fn
			AuthorizerUri:                 string | fn.Fn
			IdentitySource: [...(string | fn.Fn)]
			IdentityValidationExpression?: string | fn.Fn
			Name:                          string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Deployment :: {
		Type: "AWS::ApiGatewayV2::Deployment"
		Properties: {
			ApiId:        string | fn.Fn
			Description?: string | fn.Fn
			StageName?:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
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
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
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
				[string]: _
			} | fn.Fn
			RequestTemplates?: {
				[string]: _
			} | fn.Fn
			TemplateSelectionExpression?: string | fn.Fn
			TimeoutInMillis?:             int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	IntegrationResponse :: {
		Type: "AWS::ApiGatewayV2::IntegrationResponse"
		Properties: {
			ApiId:                    string | fn.Fn
			ContentHandlingStrategy?: string | fn.Fn
			IntegrationId:            string | fn.Fn
			IntegrationResponseKey:   string | fn.Fn
			ResponseParameters?:      {
				[string]: _
			} | fn.Fn
			ResponseTemplates?: {
				[string]: _
			} | fn.Fn
			TemplateSelectionExpression?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Model :: {
		Type: "AWS::ApiGatewayV2::Model"
		Properties: {
			ApiId:        string | fn.Fn
			ContentType?: string | fn.Fn
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			Schema:       {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Route :: {
		Type: "AWS::ApiGatewayV2::Route"
		Properties: {
			ApiId:           string | fn.Fn
			ApiKeyRequired?: bool | fn.Fn
			AuthorizationScopes?: [...(string | fn.Fn)]
			AuthorizationType?:        string | fn.Fn
			AuthorizerId?:             string | fn.Fn
			ModelSelectionExpression?: string | fn.Fn
			OperationName?:            string | fn.Fn
			RequestModels?:            {
				[string]: _
			} | fn.Fn
			RequestParameters?: {
				[string]: _
			} | fn.Fn
			RouteKey:                          string | fn.Fn
			RouteResponseSelectionExpression?: string | fn.Fn
			Target?:                           string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RouteResponse :: {
		Type: "AWS::ApiGatewayV2::RouteResponse"
		Properties: {
			ApiId:                     string | fn.Fn
			ModelSelectionExpression?: string | fn.Fn
			ResponseModels?:           {
				[string]: _
			} | fn.Fn
			ResponseParameters?: {
				[string]: _
			} | fn.Fn
			RouteId:          string | fn.Fn
			RouteResponseKey: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Stage :: {
		Type: "AWS::ApiGatewayV2::Stage"
		Properties: {
			AccessLogSettings?: {
				DestinationArn?: string | fn.Fn
				Format?:         string | fn.Fn
			}
			ApiId:                string | fn.Fn
			ClientCertificateId?: string | fn.Fn
			DefaultRouteSettings?: {
				DataTraceEnabled?:       bool | fn.Fn
				DetailedMetricsEnabled?: bool | fn.Fn
				LoggingLevel?:           string | fn.Fn
				ThrottlingBurstLimit?:   int | fn.Fn
				ThrottlingRateLimit?:    float | fn.Fn
			}
			DeploymentId:   string | fn.Fn
			Description?:   string | fn.Fn
			RouteSettings?: {
				[string]: _
			} | fn.Fn
			StageName:       string | fn.Fn
			StageVariables?: {
				[string]: _
			} | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

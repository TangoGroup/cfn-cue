package euwest1

import "github.com/TangoGroup/aws/fn"

#ApiGatewayV2: {
	#Api: {
		Type:       "AWS::ApiGatewayV2::Api"
		Properties: close({
			ApiKeySelectionExpression?: string | fn.#Fn
			BasePath?:                  string | fn.#Fn
			Body?:                      {
				[string]: _
			} | fn.#Fn
			BodyS3Location?: close({
				Bucket?:  string | fn.#Fn
				Etag?:    string | fn.#Fn
				Key?:     string | fn.#Fn
				Version?: string | fn.#Fn
			}) | fn.If
			CorsConfiguration?: close({
				AllowCredentials?: bool | fn.#Fn
				AllowHeaders?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
				AllowMethods?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
				AllowOrigins?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
				ExposeHeaders?:    [...(string | fn.#Fn)] | (string | fn.#Fn)
				MaxAge?:           int | fn.#Fn
			}) | fn.If
			CredentialsArn?:           string | fn.#Fn
			Description?:              string | fn.#Fn
			DisableSchemaValidation?:  bool | fn.#Fn
			FailOnWarnings?:           bool | fn.#Fn
			Name?:                     string | fn.#Fn
			ProtocolType?:             string | fn.#Fn
			RouteKey?:                 string | fn.#Fn
			RouteSelectionExpression?: string | fn.#Fn
			Tags?:                     {
				[string]: _
			} | fn.#Fn
			Target?:  string | fn.#Fn
			Version?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ApiMapping: {
		Type:       "AWS::ApiGatewayV2::ApiMapping"
		Properties: close({
			ApiId:          string | fn.#Fn
			ApiMappingKey?: string | fn.#Fn
			DomainName:     string | fn.#Fn
			Stage:          string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Authorizer: {
		Type:       "AWS::ApiGatewayV2::Authorizer"
		Properties: close({
			ApiId:                         string | fn.#Fn
			AuthorizerCredentialsArn?:     string | fn.#Fn
			AuthorizerResultTtlInSeconds?: int | fn.#Fn
			AuthorizerType:                string | fn.#Fn
			AuthorizerUri?:                string | fn.#Fn
			IdentitySource:                [...(string | fn.#Fn)] | (string | fn.#Fn)
			IdentityValidationExpression?: string | fn.#Fn
			JwtConfiguration?:             close({
				Audience?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				Issuer?:   string | fn.#Fn
			}) | fn.If
			Name: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Deployment: {
		Type:       "AWS::ApiGatewayV2::Deployment"
		Properties: close({
			ApiId:        string | fn.#Fn
			Description?: string | fn.#Fn
			StageName?:   string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DomainName: {
		Type:       "AWS::ApiGatewayV2::DomainName"
		Properties: close({
			DomainName:                string | fn.#Fn
			DomainNameConfigurations?: [...close({
				CertificateArn?:  string | fn.#Fn
				CertificateName?: string | fn.#Fn
				EndpointType?:    string | fn.#Fn
			})] | fn.If
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Integration: {
		Type:       "AWS::ApiGatewayV2::Integration"
		Properties: close({
			ApiId:                    string | fn.#Fn
			ConnectionId?:            string | fn.#Fn
			ConnectionType?:          string | fn.#Fn
			ContentHandlingStrategy?: string | fn.#Fn
			CredentialsArn?:          string | fn.#Fn
			Description?:             string | fn.#Fn
			IntegrationMethod?:       string | fn.#Fn
			IntegrationType:          string | fn.#Fn
			IntegrationUri?:          string | fn.#Fn
			PassthroughBehavior?:     string | fn.#Fn
			PayloadFormatVersion?:    string | fn.#Fn
			RequestParameters?:       {
				[string]: _
			} | fn.#Fn
			RequestTemplates?: {
				[string]: _
			} | fn.#Fn
			TemplateSelectionExpression?: string | fn.#Fn
			TimeoutInMillis?:             int | fn.#Fn
			TlsConfig?:                   close({
				ServerNameToVerify?: string | fn.#Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#IntegrationResponse: {
		Type:       "AWS::ApiGatewayV2::IntegrationResponse"
		Properties: close({
			ApiId:                    string | fn.#Fn
			ContentHandlingStrategy?: string | fn.#Fn
			IntegrationId:            string | fn.#Fn
			IntegrationResponseKey:   string | fn.#Fn
			ResponseParameters?:      {
				[string]: _
			} | fn.#Fn
			ResponseTemplates?: {
				[string]: _
			} | fn.#Fn
			TemplateSelectionExpression?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Model: {
		Type:       "AWS::ApiGatewayV2::Model"
		Properties: close({
			ApiId:        string | fn.#Fn
			ContentType?: string | fn.#Fn
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Schema:       {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Route: {
		Type:       "AWS::ApiGatewayV2::Route"
		Properties: close({
			ApiId:                     string | fn.#Fn
			ApiKeyRequired?:           bool | fn.#Fn
			AuthorizationScopes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
			AuthorizationType?:        string | fn.#Fn
			AuthorizerId?:             string | fn.#Fn
			ModelSelectionExpression?: string | fn.#Fn
			OperationName?:            string | fn.#Fn
			RequestModels?:            {
				[string]: _
			} | fn.#Fn
			RequestParameters?: {
				[string]: _
			} | fn.#Fn
			RouteKey:                          string | fn.#Fn
			RouteResponseSelectionExpression?: string | fn.#Fn
			Target?:                           string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RouteResponse: {
		Type:       "AWS::ApiGatewayV2::RouteResponse"
		Properties: close({
			ApiId:                     string | fn.#Fn
			ModelSelectionExpression?: string | fn.#Fn
			ResponseModels?:           {
				[string]: _
			} | fn.#Fn
			ResponseParameters?: {
				[string]: _
			} | fn.#Fn
			RouteId:          string | fn.#Fn
			RouteResponseKey: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Stage: {
		Type:       "AWS::ApiGatewayV2::Stage"
		Properties: close({
			AccessLogSettings?: close({
				DestinationArn?: string | fn.#Fn
				Format?:         string | fn.#Fn
			}) | fn.If
			ApiId:                 string | fn.#Fn
			AutoDeploy?:           bool | fn.#Fn
			ClientCertificateId?:  string | fn.#Fn
			DefaultRouteSettings?: close({
				DataTraceEnabled?:       bool | fn.#Fn
				DetailedMetricsEnabled?: bool | fn.#Fn
				LoggingLevel?:           string | fn.#Fn
				ThrottlingBurstLimit?:   int | fn.#Fn
				ThrottlingRateLimit?:    number | fn.#Fn
			}) | fn.If
			DeploymentId?:  string | fn.#Fn
			Description?:   string | fn.#Fn
			RouteSettings?: {
				[string]: _
			} | fn.#Fn
			StageName:       string | fn.#Fn
			StageVariables?: {
				[string]: _
			} | fn.#Fn
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

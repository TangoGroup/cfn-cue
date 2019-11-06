package ApiGateway

import "github.com/TangoGroup/fn"

Account :: {
	Type: "AWS::ApiGateway::Account"
	Properties: CloudWatchRoleArn?: string | fn.Fn
}
ApiKey :: {
	Type: "AWS::ApiGateway::ApiKey"
	Properties: {
		CustomerId?:         string | fn.Fn
		Description?:        string | fn.Fn
		Enabled?:            bool | fn.Fn
		GenerateDistinctId?: bool | fn.Fn
		Name?:               string | fn.Fn
		StageKeys?: [...__StageKey]
		Value?: string | fn.Fn
	}
	__StageKey :: {
		RestApiId?: string | fn.Fn
		StageName?: string | fn.Fn
	}
}
Authorizer :: {
	Type: "AWS::ApiGateway::Authorizer"
	Properties: {
		AuthType?:                     string | fn.Fn
		AuthorizerCredentials?:        string | fn.Fn
		AuthorizerResultTtlInSeconds?: (int & (>=0 & <=3600)) | fn.Fn
		AuthorizerUri?:                string | fn.Fn
		IdentitySource?:               string | fn.Fn
		IdentityValidationExpression?: string | fn.Fn
		Name?:                         string | fn.Fn
		ProviderARNs?:                 [...string] | fn.Fn
		RestApiId:                     string | fn.Fn
		Type:                          (string & ("COGNITO_USER_POOLS" | "REQUEST" | "TOKEN")) | fn.Fn
	}
}
BasePathMapping :: {
	Type: "AWS::ApiGateway::BasePathMapping"
	Properties: {
		BasePath?:  string | fn.Fn
		DomainName: string | fn.Fn
		RestApiId?: string | fn.Fn
		Stage?:     string | fn.Fn
	}
}
ClientCertificate :: {
	Type: "AWS::ApiGateway::ClientCertificate"
	Properties: Description?: string | fn.Fn
}
Deployment :: {
	Type: "AWS::ApiGateway::Deployment"
	Properties: {
		DeploymentCanarySettings?: __DeploymentCanarySettings
		Description?:              string | fn.Fn
		RestApiId:                 string | fn.Fn
		StageDescription?:         __StageDescription
		StageName?:                string | fn.Fn
	}
	__AccessLogSetting :: {
		DestinationArn?: string | fn.Fn
		Format?:         string | fn.Fn
	}
	__CanarySetting :: {
		PercentTraffic?: float | fn.Fn
		StageVariableOverrides?: {
		}
		UseStageCache?: bool | fn.Fn
	}
	__DeploymentCanarySettings :: {
		PercentTraffic?: float | fn.Fn
		StageVariableOverrides?: {
		}
		UseStageCache?: bool | fn.Fn
	}
	__MethodSetting :: {
		CacheDataEncrypted?:   bool | fn.Fn
		CacheTtlInSeconds?:    int | fn.Fn
		CachingEnabled?:       bool | fn.Fn
		DataTraceEnabled?:     bool | fn.Fn
		HttpMethod?:           string | fn.Fn
		LoggingLevel?:         string | fn.Fn
		MetricsEnabled?:       bool | fn.Fn
		ResourcePath?:         string | fn.Fn
		ThrottlingBurstLimit?: int | fn.Fn
		ThrottlingRateLimit?:  float | fn.Fn
	}
	__StageDescription :: {
		AccessLogSetting?:     __AccessLogSetting
		CacheClusterEnabled?:  bool | fn.Fn
		CacheClusterSize?:     string | fn.Fn
		CacheDataEncrypted?:   bool | fn.Fn
		CacheTtlInSeconds?:    int | fn.Fn
		CachingEnabled?:       bool | fn.Fn
		CanarySetting?:        __CanarySetting
		ClientCertificateId?:  string | fn.Fn
		DataTraceEnabled?:     bool | fn.Fn
		Description?:          string | fn.Fn
		DocumentationVersion?: string | fn.Fn
		LoggingLevel?:         string | fn.Fn
		MethodSettings?: [...__MethodSetting]
		MetricsEnabled?: bool | fn.Fn
		Tags?: [...__Tag]
		ThrottlingBurstLimit?: int | fn.Fn
		ThrottlingRateLimit?:  float | fn.Fn
		TracingEnabled?:       bool | fn.Fn
		Variables?: {
		}
	}
}
DocumentationPart :: {
	Type: "AWS::ApiGateway::DocumentationPart"
	Properties: {
		Location:   __Location
		Properties: string | fn.Fn
		RestApiId:  string | fn.Fn
	}
	__Location :: {
		Method?:     string | fn.Fn
		Name?:       string | fn.Fn
		Path?:       string | fn.Fn
		StatusCode?: string | fn.Fn
		Type?:       string | fn.Fn
	}
}
DocumentationVersion :: {
	Type: "AWS::ApiGateway::DocumentationVersion"
	Properties: {
		Description?:         string | fn.Fn
		DocumentationVersion: string | fn.Fn
		RestApiId:            string | fn.Fn
	}
}
DomainName :: {
	Type: "AWS::ApiGateway::DomainName"
	Properties: {
		CertificateArn?:         string | fn.Fn
		DomainName:              string | fn.Fn
		EndpointConfiguration?:  __EndpointConfiguration
		RegionalCertificateArn?: string | fn.Fn
	}
	__EndpointConfiguration :: {
		Types?: [...string] | fn.Fn
	}
}
GatewayResponse :: {
	Type: "AWS::ApiGateway::GatewayResponse"
	Properties: {
		ResponseParameters?: {
		}
		ResponseTemplates?: {
		}
		ResponseType: (string & ("ACCESS_DENIED" | "API_CONFIGURATION_ERROR" | "AUTHORIZER_FAILURE" | "AUTHORIZER_CONFIGURATION_ERROR" | "BAD_REQUEST_PARAMETERS" | "BAD_REQUEST_BODY" | "DEFAULT_4XX" | "DEFAULT_5XX" | "EXPIRED_TOKEN" | "INVALID_SIGNATURE" | "INTEGRATION_FAILURE" | "INTEGRATION_TIMEOUT" | "INVALID_API_KEY" | "MISSING_AUTHENTICATION_TOKEN" | "QUOTA_EXCEEDED" | "REQUEST_TOO_LARGE" | "RESOURCE_NOT_FOUND" | "THROTTLED" | "UNAUTHORIZED" | "UNSUPPORTED_MEDIA_TYPE")) | fn.Fn
		RestApiId:    string | fn.Fn
		StatusCode?:  string | fn.Fn
	}
}
Method :: {
	Type: "AWS::ApiGateway::Method"
	Properties: {
		ApiKeyRequired?:      bool | fn.Fn
		AuthorizationScopes?: [...string] | fn.Fn
		AuthorizationType?:   string | fn.Fn
		AuthorizerId?:        string | fn.Fn
		HttpMethod:           string | fn.Fn
		Integration?:         __Integration
		MethodResponses?: [...__MethodResponse]
		OperationName?: string | fn.Fn
		RequestModels?: {
		}
		RequestParameters?: {
		}
		RequestValidatorId?: string | fn.Fn
		ResourceId:          string | fn.Fn
		RestApiId:           string | fn.Fn
	}
	__Integration :: {
		CacheKeyParameters?:    [...string] | fn.Fn
		CacheNamespace?:        string | fn.Fn
		ConnectionId?:          string | fn.Fn
		ConnectionType?:        string | fn.Fn
		ContentHandling?:       string | fn.Fn
		Credentials?:           string | fn.Fn
		IntegrationHttpMethod?: string | fn.Fn
		IntegrationResponses?: [...__IntegrationResponse]
		PassthroughBehavior?: string | fn.Fn
		RequestParameters?: {
		}
		RequestTemplates?: {
		}
		TimeoutInMillis?: int | fn.Fn
		Type?:            string | fn.Fn
		Uri?:             string | fn.Fn
	}
	__IntegrationResponse :: {
		ContentHandling?: string | fn.Fn
		ResponseParameters?: {
		}
		ResponseTemplates?: {
		}
		SelectionPattern?: string | fn.Fn
		StatusCode:        string | fn.Fn
	}
	__MethodResponse :: {
		ResponseModels?: {
		}
		ResponseParameters?: {
		}
		StatusCode: string | fn.Fn
	}
}
Model :: {
	Type: "AWS::ApiGateway::Model"
	Properties: {
		ContentType?: string | fn.Fn
		Description?: string | fn.Fn
		Name?:        string | fn.Fn
		RestApiId:    string | fn.Fn
		Schema?:      {
		} | fn.Fn
	}
}
RequestValidator :: {
	Type: "AWS::ApiGateway::RequestValidator"
	Properties: {
		Name?:                      string | fn.Fn
		RestApiId:                  string | fn.Fn
		ValidateRequestBody?:       bool | fn.Fn
		ValidateRequestParameters?: bool | fn.Fn
	}
}
Resource :: {
	Type: "AWS::ApiGateway::Resource"
	Properties: {
		ParentId:  string | fn.Fn
		PathPart:  string | fn.Fn
		RestApiId: string | fn.Fn
	}
}
RestApi :: {
	Type: "AWS::ApiGateway::RestApi"
	Properties: {
		ApiKeySourceType?: (string & ("AUTHORIZER" | "HEADER")) | fn.Fn
		BinaryMediaTypes?: [...string] | fn.Fn
		Body?:             {
		} | fn.Fn
		BodyS3Location?:         __S3Location
		CloneFrom?:              string | fn.Fn
		Description?:            string | fn.Fn
		EndpointConfiguration?:  __EndpointConfiguration
		FailOnWarnings?:         bool | fn.Fn
		MinimumCompressionSize?: int | fn.Fn
		Name?:                   string | fn.Fn
		Parameters?: {
		}
		Policy?: {
		} | fn.Fn
	}
	__EndpointConfiguration :: {
		Types?: [...string] | fn.Fn
	}
	__S3Location :: {
		Bucket?:  string | fn.Fn
		ETag?:    string | fn.Fn
		Key?:     string | fn.Fn
		Version?: string | fn.Fn
	}
}
Stage :: {
	Type: "AWS::ApiGateway::Stage"
	Properties: {
		AccessLogSetting?:     __AccessLogSetting
		CacheClusterEnabled?:  bool | fn.Fn
		CacheClusterSize?:     string | fn.Fn
		CanarySetting?:        __CanarySetting
		ClientCertificateId?:  string | fn.Fn
		DeploymentId?:         string | fn.Fn
		Description?:          string | fn.Fn
		DocumentationVersion?: string | fn.Fn
		MethodSettings?: [...__MethodSetting]
		RestApiId:  string | fn.Fn
		StageName?: string | fn.Fn
		Tags?: [...__Tag]
		TracingEnabled?: bool | fn.Fn
		Variables?: {
		}
	}
	__AccessLogSetting :: {
		DestinationArn?: string | fn.Fn
		Format?:         string | fn.Fn
	}
	__CanarySetting :: {
		DeploymentId?:   string | fn.Fn
		PercentTraffic?: float | fn.Fn
		StageVariableOverrides?: {
		}
		UseStageCache?: bool | fn.Fn
	}
	__MethodSetting :: {
		CacheDataEncrypted?:   bool | fn.Fn
		CacheTtlInSeconds?:    int | fn.Fn
		CachingEnabled?:       bool | fn.Fn
		DataTraceEnabled?:     bool | fn.Fn
		HttpMethod?:           string | fn.Fn
		LoggingLevel?:         string | fn.Fn
		MetricsEnabled?:       bool | fn.Fn
		ResourcePath?:         string | fn.Fn
		ThrottlingBurstLimit?: int | fn.Fn
		ThrottlingRateLimit?:  float | fn.Fn
	}
}
UsagePlan :: {
	Type: "AWS::ApiGateway::UsagePlan"
	Properties: {
		ApiStages?: [...__ApiStage]
		Description?:   string | fn.Fn
		Quota?:         __QuotaSettings
		Throttle?:      __ThrottleSettings
		UsagePlanName?: string | fn.Fn
	}
	__ApiStage :: {
		ApiId?: string | fn.Fn
		Stage?: string | fn.Fn
		Throttle?: {
		}
	}
	__QuotaSettings :: {
		Limit?:  int | fn.Fn
		Offset?: int | fn.Fn
		Period?: string | fn.Fn
	}
	__ThrottleSettings :: {
		BurstLimit?: int | fn.Fn
		RateLimit?:  float | fn.Fn
	}
}
UsagePlanKey :: {
	Type: "AWS::ApiGateway::UsagePlanKey"
	Properties: {
		KeyId:       string | fn.Fn
		KeyType:     (string & ("API_KEY")) | fn.Fn
		UsagePlanId: string | fn.Fn
	}
}
VpcLink :: {
	Type: "AWS::ApiGateway::VpcLink"
	Properties: {
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		TargetArns:   [...string] | fn.Fn
	}
}

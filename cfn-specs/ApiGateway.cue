package ApiGateway

Account :: {
  Type: "AWS::ApiGateway::Account"
  Properties: {
    CloudWatchRoleArn?: string
  }
}
ApiKey :: {
  Type: "AWS::ApiGateway::ApiKey"
  Properties: {
    CustomerId?:         string
    Description?:        string
    Enabled?:            bool
    GenerateDistinctId?: bool
    Name?:               string
    StageKeys?: [...__StageKey]
    Value?: string
  }
  __StageKey = {
    RestApiId?: string
    StageName?: string
  }
}
Authorizer :: {
  Type: "AWS::ApiGateway::Authorizer"
  Properties: {
    AuthType?:                     string
    AuthorizerCredentials?:        string
    AuthorizerResultTtlInSeconds?: int
    AuthorizerUri?:                string
    IdentitySource?:               string
    IdentityValidationExpression?: string
    Name?:                         string
    ProviderARNs?: [...string]
    RestApiId: string
    Type:      string
  }
}
BasePathMapping :: {
  Type: "AWS::ApiGateway::BasePathMapping"
  Properties: {
    BasePath?:  string
    DomainName: string
    RestApiId?: string
    Stage?:     string
  }
}
ClientCertificate :: {
  Type: "AWS::ApiGateway::ClientCertificate"
  Properties: {
    Description?: string
  }
}
Deployment :: {
  Type: "AWS::ApiGateway::Deployment"
  Properties: {
    DeploymentCanarySettings?: __DeploymentCanarySettings
    Description?:              string
    RestApiId:                 string
    StageDescription?:         __StageDescription
    StageName?:                string
  }
  __AccessLogSetting = {
    DestinationArn?: string
    Format?:         string
  }
  __CanarySetting = {
    PercentTraffic?: float
    StageVariableOverrides?: {
    }
    UseStageCache?: bool
  }
  __DeploymentCanarySettings = {
    PercentTraffic?: float
    StageVariableOverrides?: {
    }
    UseStageCache?: bool
  }
  __MethodSetting = {
    CacheDataEncrypted?:   bool
    CacheTtlInSeconds?:    int
    CachingEnabled?:       bool
    DataTraceEnabled?:     bool
    HttpMethod?:           string
    LoggingLevel?:         string
    MetricsEnabled?:       bool
    ResourcePath?:         string
    ThrottlingBurstLimit?: int
    ThrottlingRateLimit?:  float
  }
  __StageDescription = {
    AccessLogSetting?:     __AccessLogSetting
    CacheClusterEnabled?:  bool
    CacheClusterSize?:     string
    CacheDataEncrypted?:   bool
    CacheTtlInSeconds?:    int
    CachingEnabled?:       bool
    CanarySetting?:        __CanarySetting
    ClientCertificateId?:  string
    DataTraceEnabled?:     bool
    Description?:          string
    DocumentationVersion?: string
    LoggingLevel?:         string
    MethodSettings?: [...__MethodSetting]
    MetricsEnabled?: bool
    Tags?: [...__Tag]
    ThrottlingBurstLimit?: int
    ThrottlingRateLimit?:  float
    TracingEnabled?:       bool
    Variables?: {
    }
  }
}
DocumentationPart :: {
  Type: "AWS::ApiGateway::DocumentationPart"
  Properties: {
    Location:   __Location
    Properties: string
    RestApiId:  string
  }
  __Location = {
    Method?:     string
    Name?:       string
    Path?:       string
    StatusCode?: string
    Type?:       string
  }
}
DocumentationVersion :: {
  Type: "AWS::ApiGateway::DocumentationVersion"
  Properties: {
    Description?:         string
    DocumentationVersion: string
    RestApiId:            string
  }
}
DomainName :: {
  Type: "AWS::ApiGateway::DomainName"
  Properties: {
    CertificateArn?:         string
    DomainName:              string
    EndpointConfiguration?:  __EndpointConfiguration
    RegionalCertificateArn?: string
  }
  __EndpointConfiguration = {
    Types?: [...string]
  }
}
GatewayResponse :: {
  Type: "AWS::ApiGateway::GatewayResponse"
  Properties: {
    ResponseParameters?: {
    }
    ResponseTemplates?: {
    }
    ResponseType: string
    RestApiId:    string
    StatusCode?:  string
  }
}
Method :: {
  Type: "AWS::ApiGateway::Method"
  Properties: {
    ApiKeyRequired?: bool
    AuthorizationScopes?: [...string]
    AuthorizationType?: string
    AuthorizerId?:      string
    HttpMethod:         string
    Integration?:       __Integration
    MethodResponses?: [...__MethodResponse]
    OperationName?: string
    RequestModels?: {
    }
    RequestParameters?: {
    }
    RequestValidatorId?: string
    ResourceId:          string
    RestApiId:           string
  }
  __Integration = {
    CacheKeyParameters?: [...string]
    CacheNamespace?:        string
    ConnectionId?:          string
    ConnectionType?:        string
    ContentHandling?:       string
    Credentials?:           string
    IntegrationHttpMethod?: string
    IntegrationResponses?: [...__IntegrationResponse]
    PassthroughBehavior?: string
    RequestParameters?: {
    }
    RequestTemplates?: {
    }
    TimeoutInMillis?: int
    Type?:            string
    Uri?:             string
  }
  __IntegrationResponse = {
    ContentHandling?: string
    ResponseParameters?: {
    }
    ResponseTemplates?: {
    }
    SelectionPattern?: string
    StatusCode:        string
  }
  __MethodResponse = {
    ResponseModels?: {
    }
    ResponseParameters?: {
    }
    StatusCode: string
  }
}
Model :: {
  Type: "AWS::ApiGateway::Model"
  Properties: {
    ContentType?: string
    Description?: string
    Name?:        string
    RestApiId:    string
    Schema?: {
    }
  }
}
RequestValidator :: {
  Type: "AWS::ApiGateway::RequestValidator"
  Properties: {
    Name?:                      string
    RestApiId:                  string
    ValidateRequestBody?:       bool
    ValidateRequestParameters?: bool
  }
}
Resource :: {
  Type: "AWS::ApiGateway::Resource"
  Properties: {
    ParentId:  string
    PathPart:  string
    RestApiId: string
  }
}
RestApi :: {
  Type: "AWS::ApiGateway::RestApi"
  Properties: {
    ApiKeySourceType?: string
    BinaryMediaTypes?: [...string]
    Body?: {
    }
    BodyS3Location?:         __S3Location
    CloneFrom?:              string
    Description?:            string
    EndpointConfiguration?:  __EndpointConfiguration
    FailOnWarnings?:         bool
    MinimumCompressionSize?: int
    Name?:                   string
    Parameters?: {
    }
    Policy?: {
    }
  }
  __EndpointConfiguration = {
    Types?: [...string]
  }
  __S3Location = {
    Bucket?:  string
    ETag?:    string
    Key?:     string
    Version?: string
  }
}
Stage :: {
  Type: "AWS::ApiGateway::Stage"
  Properties: {
    AccessLogSetting?:     __AccessLogSetting
    CacheClusterEnabled?:  bool
    CacheClusterSize?:     string
    CanarySetting?:        __CanarySetting
    ClientCertificateId?:  string
    DeploymentId?:         string
    Description?:          string
    DocumentationVersion?: string
    MethodSettings?: [...__MethodSetting]
    RestApiId:  string
    StageName?: string
    Tags?: [...__Tag]
    TracingEnabled?: bool
    Variables?: {
    }
  }
  __AccessLogSetting = {
    DestinationArn?: string
    Format?:         string
  }
  __CanarySetting = {
    DeploymentId?:   string
    PercentTraffic?: float
    StageVariableOverrides?: {
    }
    UseStageCache?: bool
  }
  __MethodSetting = {
    CacheDataEncrypted?:   bool
    CacheTtlInSeconds?:    int
    CachingEnabled?:       bool
    DataTraceEnabled?:     bool
    HttpMethod?:           string
    LoggingLevel?:         string
    MetricsEnabled?:       bool
    ResourcePath?:         string
    ThrottlingBurstLimit?: int
    ThrottlingRateLimit?:  float
  }
}
UsagePlan :: {
  Type: "AWS::ApiGateway::UsagePlan"
  Properties: {
    ApiStages?: [...__ApiStage]
    Description?:   string
    Quota?:         __QuotaSettings
    Throttle?:      __ThrottleSettings
    UsagePlanName?: string
  }
  __ApiStage = {
    ApiId?: string
    Stage?: string
    Throttle?: {
    }
  }
  __QuotaSettings = {
    Limit?:  int
    Offset?: int
    Period?: string
  }
  __ThrottleSettings = {
    BurstLimit?: int
    RateLimit?:  float
  }
}
UsagePlanKey :: {
  Type: "AWS::ApiGateway::UsagePlanKey"
  Properties: {
    KeyId:       string
    KeyType:     string
    UsagePlanId: string
  }
}
VpcLink :: {
  Type: "AWS::ApiGateway::VpcLink"
  Properties: {
    Description?: string
    Name:         string
    TargetArns: [...string]
  }
}

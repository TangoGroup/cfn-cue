package AppSync

ApiKey :: {
  Type: "AWS::AppSync::ApiKey"
  Properties: {
    ApiId:        string
    Description?: string
    Expires?:     float
  }
}
DataSource :: {
  Type: "AWS::AppSync::DataSource"
  Properties: {
    ApiId:                     string
    Description?:              string
    DynamoDBConfig?:           __DynamoDBConfig
    ElasticsearchConfig?:      __ElasticsearchConfig
    HttpConfig?:               __HttpConfig
    LambdaConfig?:             __LambdaConfig
    Name:                      string
    RelationalDatabaseConfig?: __RelationalDatabaseConfig
    ServiceRoleArn?:           string
    Type:                      string
  }
  __AuthorizationConfig = {
    AuthorizationType: string
    AwsIamConfig?:     __AwsIamConfig
  }
  __AwsIamConfig = {
    SigningRegion?:      string
    SigningServiceName?: string
  }
  __DynamoDBConfig = {
    AwsRegion:             string
    TableName:             string
    UseCallerCredentials?: bool
  }
  __ElasticsearchConfig = {
    AwsRegion: string
    Endpoint:  string
  }
  __HttpConfig = {
    AuthorizationConfig?: __AuthorizationConfig
    Endpoint:             string
  }
  __LambdaConfig = {
    LambdaFunctionArn: string
  }
  __RdsHttpEndpointConfig = {
    AwsRegion:           string
    AwsSecretStoreArn:   string
    DatabaseName?:       string
    DbClusterIdentifier: string
    Schema?:             string
  }
  __RelationalDatabaseConfig = {
    RdsHttpEndpointConfig?:       __RdsHttpEndpointConfig
    RelationalDatabaseSourceType: string
  }
}
FunctionConfiguration :: {
  Type: "AWS::AppSync::FunctionConfiguration"
  Properties: {
    ApiId:                              string
    DataSourceName:                     string
    Description?:                       string
    FunctionVersion:                    string
    Name:                               string
    RequestMappingTemplate?:            string
    RequestMappingTemplateS3Location?:  string
    ResponseMappingTemplate?:           string
    ResponseMappingTemplateS3Location?: string
  }
}
GraphQLApi :: {
  Type: "AWS::AppSync::GraphQLApi"
  Properties: {
    AdditionalAuthenticationProviders?: __AdditionalAuthenticationProviders
    AuthenticationType:                 string
    LogConfig?:                         __LogConfig
    Name:                               string
    OpenIDConnectConfig?:               __OpenIDConnectConfig
    Tags?:                              __Tags
    UserPoolConfig?:                    __UserPoolConfig
  }
  __AdditionalAuthenticationProvider = {
    AuthenticationType:   string
    OpenIDConnectConfig?: __OpenIDConnectConfig
    UserPoolConfig?:      __CognitoUserPoolConfig
  }
  __AdditionalAuthenticationProviders = {
  }
  __CognitoUserPoolConfig = {
    AppIdClientRegex?: string
    AwsRegion?:        string
    UserPoolId?:       string
  }
  __LogConfig = {
    CloudWatchLogsRoleArn?: string
    ExcludeVerboseContent?: bool
    FieldLogLevel?:         string
  }
  __OpenIDConnectConfig = {
    AuthTTL?:  float
    ClientId?: string
    IatTTL?:   float
    Issuer?:   string
  }
  __Tags = {
  }
  __UserPoolConfig = {
    AppIdClientRegex?: string
    AwsRegion?:        string
    DefaultAction?:    string
    UserPoolId?:       string
  }
}
GraphQLSchema :: {
  Type: "AWS::AppSync::GraphQLSchema"
  Properties: {
    ApiId:                 string
    Definition?:           string
    DefinitionS3Location?: string
  }
}
Resolver :: {
  Type: "AWS::AppSync::Resolver"
  Properties: {
    ApiId:                              string
    DataSourceName?:                    string
    FieldName:                          string
    Kind?:                              string
    PipelineConfig?:                    __PipelineConfig
    RequestMappingTemplate?:            string
    RequestMappingTemplateS3Location?:  string
    ResponseMappingTemplate?:           string
    ResponseMappingTemplateS3Location?: string
    TypeName:                           string
  }
  __PipelineConfig = {
    Functions?: [...string]
  }
}

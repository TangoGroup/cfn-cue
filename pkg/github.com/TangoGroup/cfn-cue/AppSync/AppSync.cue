package AppSync

import "github.com/TangoGroup/fn"

ApiKey :: {
	Type: "AWS::AppSync::ApiKey"
	Properties: {
		ApiId:        string | fn.Fn
		Description?: string | fn.Fn
		Expires?:     float | fn.Fn
	}
}
DataSource :: {
	Type: "AWS::AppSync::DataSource"
	Properties: {
		ApiId:                     string | fn.Fn
		Description?:              string | fn.Fn
		DynamoDBConfig?:           __DynamoDBConfig
		ElasticsearchConfig?:      __ElasticsearchConfig
		HttpConfig?:               __HttpConfig
		LambdaConfig?:             __LambdaConfig
		Name:                      string | fn.Fn
		RelationalDatabaseConfig?: __RelationalDatabaseConfig
		ServiceRoleArn?:           string | fn.Fn
		Type:                      (string & ("AMAZON_DYNAMODB" | "AMAZON_ELASTICSEARCH" | "AWS_LAMBDA" | "HTTP" | "NONE" | "RELATIONAL_DATABASE")) | fn.Fn
	}
	__AuthorizationConfig :: {
		AuthorizationType: string | fn.Fn
		AwsIamConfig?:     __AwsIamConfig
	}
	__AwsIamConfig :: {
		SigningRegion?:      string | fn.Fn
		SigningServiceName?: string | fn.Fn
	}
	__DynamoDBConfig :: {
		AwsRegion:             string | fn.Fn
		TableName:             string | fn.Fn
		UseCallerCredentials?: bool | fn.Fn
	}
	__ElasticsearchConfig :: {
		AwsRegion: string | fn.Fn
		Endpoint:  string | fn.Fn
	}
	__HttpConfig :: {
		AuthorizationConfig?: __AuthorizationConfig
		Endpoint:             string | fn.Fn
	}
	__LambdaConfig :: {
		LambdaFunctionArn: string | fn.Fn
	}
	__RdsHttpEndpointConfig :: {
		AwsRegion:           string | fn.Fn
		AwsSecretStoreArn:   string | fn.Fn
		DatabaseName?:       string | fn.Fn
		DbClusterIdentifier: string | fn.Fn
		Schema?:             string | fn.Fn
	}
	__RelationalDatabaseConfig :: {
		RdsHttpEndpointConfig?:       __RdsHttpEndpointConfig
		RelationalDatabaseSourceType: string | fn.Fn
	}
}
FunctionConfiguration :: {
	Type: "AWS::AppSync::FunctionConfiguration"
	Properties: {
		ApiId:                              string | fn.Fn
		DataSourceName:                     string | fn.Fn
		Description?:                       string | fn.Fn
		FunctionVersion:                    string | fn.Fn
		Name:                               string | fn.Fn
		RequestMappingTemplate?:            string | fn.Fn
		RequestMappingTemplateS3Location?:  string | fn.Fn
		ResponseMappingTemplate?:           string | fn.Fn
		ResponseMappingTemplateS3Location?: string | fn.Fn
	}
}
GraphQLApi :: {
	Type: "AWS::AppSync::GraphQLApi"
	Properties: {
		AdditionalAuthenticationProviders?: __AdditionalAuthenticationProviders
		AuthenticationType:                 (string & ("AMAZON_COGNITO_USER_POOLS" | "API_KEY" | "AWS_IAM" | "OPENID_CONNECT")) | fn.Fn
		LogConfig?:                         __LogConfig
		Name:                               string | fn.Fn
		OpenIDConnectConfig?:               __OpenIDConnectConfig
		Tags?:                              __Tags
		UserPoolConfig?:                    __UserPoolConfig
	}
	__AdditionalAuthenticationProvider :: {
		AuthenticationType:   string | fn.Fn
		OpenIDConnectConfig?: __OpenIDConnectConfig
		UserPoolConfig?:      __CognitoUserPoolConfig
	}
	__AdditionalAuthenticationProviders :: {
	}
	__CognitoUserPoolConfig :: {
		AppIdClientRegex?: string | fn.Fn
		AwsRegion?:        string | fn.Fn
		UserPoolId?:       string | fn.Fn
	}
	__LogConfig :: {
		CloudWatchLogsRoleArn?: string | fn.Fn
		ExcludeVerboseContent?: bool | fn.Fn
		FieldLogLevel?:         string | fn.Fn
	}
	__OpenIDConnectConfig :: {
		AuthTTL?:  float | fn.Fn
		ClientId?: string | fn.Fn
		IatTTL?:   float | fn.Fn
		Issuer?:   string | fn.Fn
	}
	__Tags :: {
	}
	__UserPoolConfig :: {
		AppIdClientRegex?: string | fn.Fn
		AwsRegion?:        string | fn.Fn
		DefaultAction?:    string | fn.Fn
		UserPoolId?:       string | fn.Fn
	}
}
GraphQLSchema :: {
	Type: "AWS::AppSync::GraphQLSchema"
	Properties: {
		ApiId:                 string | fn.Fn
		Definition?:           string | fn.Fn
		DefinitionS3Location?: string | fn.Fn
	}
}
Resolver :: {
	Type: "AWS::AppSync::Resolver"
	Properties: {
		ApiId:                              string | fn.Fn
		DataSourceName?:                    string | fn.Fn
		FieldName:                          string | fn.Fn
		Kind?:                              (string & ("PIPELINE" | "UNIT")) | fn.Fn
		PipelineConfig?:                    __PipelineConfig
		RequestMappingTemplate?:            string | fn.Fn
		RequestMappingTemplateS3Location?:  string | fn.Fn
		ResponseMappingTemplate?:           string | fn.Fn
		ResponseMappingTemplateS3Location?: string | fn.Fn
		TypeName:                           string | fn.Fn
	}
	__PipelineConfig :: {
		Functions?: [...string] | fn.Fn
	}
}

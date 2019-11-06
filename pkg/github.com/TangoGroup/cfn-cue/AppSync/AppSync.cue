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
		DynamoDBConfig?:           propDynamoDBConfig
		ElasticsearchConfig?:      propElasticsearchConfig
		HttpConfig?:               propHttpConfig
		LambdaConfig?:             propLambdaConfig
		Name:                      string | fn.Fn
		RelationalDatabaseConfig?: propRelationalDatabaseConfig
		ServiceRoleArn?:           string | fn.Fn
		Type:                      (string & ("AMAZON_DYNAMODB" | "AMAZON_ELASTICSEARCH" | "AWS_LAMBDA" | "HTTP" | "NONE" | "RELATIONAL_DATABASE")) | fn.Fn
	}
	propAuthorizationConfig :: {
		AuthorizationType: string | fn.Fn
		AwsIamConfig?:     propAwsIamConfig
	}
	propAwsIamConfig :: {
		SigningRegion?:      string | fn.Fn
		SigningServiceName?: string | fn.Fn
	}
	propDynamoDBConfig :: {
		AwsRegion:             string | fn.Fn
		TableName:             string | fn.Fn
		UseCallerCredentials?: bool | fn.Fn
	}
	propElasticsearchConfig :: {
		AwsRegion: string | fn.Fn
		Endpoint:  string | fn.Fn
	}
	propHttpConfig :: {
		AuthorizationConfig?: propAuthorizationConfig
		Endpoint:             string | fn.Fn
	}
	propLambdaConfig :: {
		LambdaFunctionArn: string | fn.Fn
	}
	propRdsHttpEndpointConfig :: {
		AwsRegion:           string | fn.Fn
		AwsSecretStoreArn:   string | fn.Fn
		DatabaseName?:       string | fn.Fn
		DbClusterIdentifier: string | fn.Fn
		Schema?:             string | fn.Fn
	}
	propRelationalDatabaseConfig :: {
		RdsHttpEndpointConfig?:       propRdsHttpEndpointConfig
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
		AdditionalAuthenticationProviders?: propAdditionalAuthenticationProviders
		AuthenticationType:                 (string & ("AMAZON_COGNITO_USER_POOLS" | "API_KEY" | "AWS_IAM" | "OPENID_CONNECT")) | fn.Fn
		LogConfig?:                         propLogConfig
		Name:                               string | fn.Fn
		OpenIDConnectConfig?:               propOpenIDConnectConfig
		Tags?:                              propTags
		UserPoolConfig?:                    propUserPoolConfig
	}
	propAdditionalAuthenticationProvider :: {
		AuthenticationType:   string | fn.Fn
		OpenIDConnectConfig?: propOpenIDConnectConfig
		UserPoolConfig?:      propCognitoUserPoolConfig
	}
	propAdditionalAuthenticationProviders :: {
	}
	propCognitoUserPoolConfig :: {
		AppIdClientRegex?: string | fn.Fn
		AwsRegion?:        string | fn.Fn
		UserPoolId?:       string | fn.Fn
	}
	propLogConfig :: {
		CloudWatchLogsRoleArn?: string | fn.Fn
		ExcludeVerboseContent?: bool | fn.Fn
		FieldLogLevel?:         string | fn.Fn
	}
	propOpenIDConnectConfig :: {
		AuthTTL?:  float | fn.Fn
		ClientId?: string | fn.Fn
		IatTTL?:   float | fn.Fn
		Issuer?:   string | fn.Fn
	}
	propTags :: {
	}
	propUserPoolConfig :: {
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
		PipelineConfig?:                    propPipelineConfig
		RequestMappingTemplate?:            string | fn.Fn
		RequestMappingTemplateS3Location?:  string | fn.Fn
		ResponseMappingTemplate?:           string | fn.Fn
		ResponseMappingTemplateS3Location?: string | fn.Fn
		TypeName:                           string | fn.Fn
	}
	propPipelineConfig :: {
		Functions?: [...(string | fn.Fn)]
	}
}

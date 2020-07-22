package cacentral1

import "github.com/TangoGroup/aws/fn"

AppSync :: {
	ApiCache :: {
		Type:       "AWS::AppSync::ApiCache"
		Properties: close({
			ApiCachingBehavior:        string | fn.Fn
			ApiId:                     string | fn.Fn
			AtRestEncryptionEnabled?:  bool | fn.Fn
			TransitEncryptionEnabled?: bool | fn.Fn
			Ttl:                       number | fn.Fn
			Type:                      string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApiKey :: {
		Type:       "AWS::AppSync::ApiKey"
		Properties: close({
			ApiId:        string | fn.Fn
			Description?: string | fn.Fn
			Expires?:     number | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DataSource :: {
		Type:       "AWS::AppSync::DataSource"
		Properties: close({
			ApiId:           string | fn.Fn
			Description?:    string | fn.Fn
			DynamoDBConfig?: close({
			}) | fn.If
			ElasticsearchConfig?: close({
			}) | fn.If
			HttpConfig?: close({
			}) | fn.If
			LambdaConfig?: close({
			}) | fn.If
			Name:                      string | fn.Fn
			RelationalDatabaseConfig?: close({
			}) | fn.If
			ServiceRoleArn?: string | fn.Fn
			Type:            string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FunctionConfiguration :: {
		Type:       "AWS::AppSync::FunctionConfiguration"
		Properties: close({
			ApiId:                              string | fn.Fn
			DataSourceName:                     string | fn.Fn
			Description?:                       string | fn.Fn
			FunctionVersion:                    string | fn.Fn
			Name:                               string | fn.Fn
			RequestMappingTemplate?:            string | fn.Fn
			RequestMappingTemplateS3Location?:  string | fn.Fn
			ResponseMappingTemplate?:           string | fn.Fn
			ResponseMappingTemplateS3Location?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GraphQLApi :: {
		Type:       "AWS::AppSync::GraphQLApi"
		Properties: close({
			AdditionalAuthenticationProviders?: [...close({
			})] | fn.If
			AuthenticationType: string | fn.Fn
			LogConfig?:         close({
			}) | fn.If
			Name:                 string | fn.Fn
			OpenIDConnectConfig?: close({
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			UserPoolConfig?: close({
			}) | fn.If
			XrayEnabled?: bool | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GraphQLSchema :: {
		Type:       "AWS::AppSync::GraphQLSchema"
		Properties: close({
			ApiId:                 string | fn.Fn
			Definition?:           string | fn.Fn
			DefinitionS3Location?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Resolver :: {
		Type:       "AWS::AppSync::Resolver"
		Properties: close({
			ApiId:          string | fn.Fn
			CachingConfig?: close({
			}) | fn.If
			DataSourceName?: string | fn.Fn
			FieldName:       string | fn.Fn
			Kind?:           string | fn.Fn
			PipelineConfig?: close({
			}) | fn.If
			RequestMappingTemplate?:            string | fn.Fn
			RequestMappingTemplateS3Location?:  string | fn.Fn
			ResponseMappingTemplate?:           string | fn.Fn
			ResponseMappingTemplateS3Location?: string | fn.Fn
			SyncConfig?:                        close({
			}) | fn.If
			TypeName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

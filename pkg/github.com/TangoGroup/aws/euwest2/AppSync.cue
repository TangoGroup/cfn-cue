package euwest2

import "github.com/TangoGroup/aws/fn"

#AppSync: {
	#ApiCache: {
		Type: "AWS::AppSync::ApiCache"
		Properties: {
			ApiCachingBehavior:        string | fn.#Fn
			ApiId:                     string | fn.#Fn
			AtRestEncryptionEnabled?:  bool | fn.#Fn
			TransitEncryptionEnabled?: bool | fn.#Fn
			Ttl:                       number | fn.#Fn
			Type:                      string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#GraphQLApi: {
		Type: "AWS::AppSync::GraphQLApi"
		Properties: {
			AdditionalAuthenticationProviders?: {} | fn.If
			AuthenticationType:                 ("AMAZON_COGNITO_USER_POOLS" | "API_KEY" | "AWS_IAM" | "OPENID_CONNECT") | fn.#Fn
			LogConfig?:                         {
				CloudWatchLogsRoleArn?: string | fn.#Fn
				ExcludeVerboseContent?: bool | fn.#Fn
				FieldLogLevel?:         string | fn.#Fn
			} | fn.If
			Name:                 string | fn.#Fn
			OpenIDConnectConfig?: {
				AuthTTL?:  number | fn.#Fn
				ClientId?: string | fn.#Fn
				IatTTL?:   number | fn.#Fn
				Issuer?:   string | fn.#Fn
			} | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			UserPoolConfig?: {
				AppIdClientRegex?: string | fn.#Fn
				AwsRegion?:        string | fn.#Fn
				DefaultAction?:    string | fn.#Fn
				UserPoolId?:       string | fn.#Fn
			} | fn.If
			XrayEnabled?: bool | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

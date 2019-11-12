package euwest2

import "github.com/TangoGroup/fn"

AppSync :: {
	GraphQLApi :: {
		Type: "AWS::AppSync::GraphQLApi"
		Properties: {
			AdditionalAuthenticationProviders?: {
			}
			AuthenticationType: (string & ("AMAZON_COGNITO_USER_POOLS" | "API_KEY" | "AWS_IAM" | "OPENID_CONNECT")) | fn.Fn
			LogConfig?: {
				CloudWatchLogsRoleArn?: string | fn.Fn
				ExcludeVerboseContent?: bool | fn.Fn
				FieldLogLevel?:         string | fn.Fn
			}
			Name: string | fn.Fn
			OpenIDConnectConfig?: {
				AuthTTL?:  float | fn.Fn
				ClientId?: string | fn.Fn
				IatTTL?:   float | fn.Fn
				Issuer?:   string | fn.Fn
			}
			Tags?: {
			}
			UserPoolConfig?: {
				AppIdClientRegex?: string | fn.Fn
				AwsRegion?:        string | fn.Fn
				DefaultAction?:    string | fn.Fn
				UserPoolId?:       string | fn.Fn
			}
		}
	}
}

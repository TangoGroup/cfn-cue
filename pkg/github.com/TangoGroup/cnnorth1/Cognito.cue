package cnnorth1

import "github.com/TangoGroup/fn"

Cognito :: {
	IdentityPool :: {
		Type: "AWS::Cognito::IdentityPool"
		Properties: {
			AllowUnauthenticatedIdentities: bool | fn.Fn
			CognitoEvents?:                 {
				[string]: _
			} | fn.Fn
			CognitoIdentityProviders?: [...{
			}]
			CognitoStreams?: {
			}
			DeveloperProviderName?: string | fn.Fn
			IdentityPoolName?:      string | fn.Fn
			OpenIdConnectProviderARNs?: [...(string | fn.Fn)]
			PushSync?: {
			}
			SamlProviderARNs?: [...(string | fn.Fn)]
			SupportedLoginProviders?: {
				[string]: _
			} | fn.Fn
		}
	}
	IdentityPoolRoleAttachment :: {
		Type: "AWS::Cognito::IdentityPoolRoleAttachment"
		Properties: {
			IdentityPoolId: string | fn.Fn
			RoleMappings?:  {
				[string]: _
			} | fn.Fn
			Roles?: {
				[string]: _
			} | fn.Fn
		}
	}
	UserPool :: {
		Type: "AWS::Cognito::UserPool"
		Properties: {
			AdminCreateUserConfig?: {
			}
			AliasAttributes?: [...(string | fn.Fn)]
			AutoVerifiedAttributes?: [...(string | fn.Fn)]
			DeviceConfiguration?: {
			}
			EmailConfiguration?: {
			}
			EmailVerificationMessage?: string | fn.Fn
			EmailVerificationSubject?: string | fn.Fn
			EnabledMfas?: [...(string | fn.Fn)]
			LambdaConfig?: {
			}
			MfaConfiguration?: string | fn.Fn
			Policies?: {
			}
			Schema?: [...{
			}]
			SmsAuthenticationMessage?: string | fn.Fn
			SmsConfiguration?: {
			}
			SmsVerificationMessage?: string | fn.Fn
			UserPoolAddOns?: {
			}
			UserPoolName?: string | fn.Fn
			UserPoolTags?: {
				[string]: _
			} | fn.Fn
			UsernameAttributes?: [...(string | fn.Fn)]
			VerificationMessageTemplate?: {
			}
		}
	}
	UserPoolClient :: {
		Type: "AWS::Cognito::UserPoolClient"
		Properties: {
			AllowedOAuthFlows?: [...(string | fn.Fn)]
			AllowedOAuthFlowsUserPoolClient?: bool | fn.Fn
			AllowedOAuthScopes?: [...(string | fn.Fn)]
			AnalyticsConfiguration?: {
			}
			CallbackURLs?: [...(string | fn.Fn)]
			ClientName?:         string | fn.Fn
			DefaultRedirectURI?: string | fn.Fn
			ExplicitAuthFlows?: [...(string | fn.Fn)]
			GenerateSecret?: bool | fn.Fn
			LogoutURLs?: [...(string | fn.Fn)]
			ReadAttributes?: [...(string | fn.Fn)]
			RefreshTokenValidity?: int | fn.Fn
			SupportedIdentityProviders?: [...(string | fn.Fn)]
			UserPoolId: string | fn.Fn
			WriteAttributes?: [...(string | fn.Fn)]
		}
	}
	UserPoolDomain :: {
		Type: "AWS::Cognito::UserPoolDomain"
		Properties: {
			CustomDomainConfig?: {
			}
			Domain:     string | fn.Fn
			UserPoolId: string | fn.Fn
		}
	}
	UserPoolGroup :: {
		Type: "AWS::Cognito::UserPoolGroup"
		Properties: {
			Description?: string | fn.Fn
			GroupName?:   string | fn.Fn
			Precedence?:  float | fn.Fn
			RoleArn?:     string | fn.Fn
			UserPoolId:   string | fn.Fn
		}
	}
	UserPoolIdentityProvider :: {
		Type: "AWS::Cognito::UserPoolIdentityProvider"
		Properties: {
			AttributeMapping?: {
				[string]: _
			} | fn.Fn
			IdpIdentifiers?: [...(string | fn.Fn)]
			ProviderDetails?: {
				[string]: _
			} | fn.Fn
			ProviderName: string | fn.Fn
			ProviderType: string | fn.Fn
			UserPoolId:   string | fn.Fn
		}
	}
	UserPoolResourceServer :: {
		Type: "AWS::Cognito::UserPoolResourceServer"
		Properties: {
			Identifier: string | fn.Fn
			Name:       string | fn.Fn
			Scopes?: [...{
			}]
			UserPoolId: string | fn.Fn
		}
	}
	UserPoolRiskConfigurationAttachment :: {
		Type: "AWS::Cognito::UserPoolRiskConfigurationAttachment"
		Properties: {
			AccountTakeoverRiskConfiguration?: {
			}
			ClientId: string | fn.Fn
			CompromisedCredentialsRiskConfiguration?: {
			}
			RiskExceptionConfiguration?: {
			}
			UserPoolId: string | fn.Fn
		}
	}
	UserPoolUICustomizationAttachment :: {
		Type: "AWS::Cognito::UserPoolUICustomizationAttachment"
		Properties: {
			CSS?:       string | fn.Fn
			ClientId:   string | fn.Fn
			UserPoolId: string | fn.Fn
		}
	}
	UserPoolUser :: {
		Type: "AWS::Cognito::UserPoolUser"
		Properties: {
			DesiredDeliveryMediums?: [...(string | fn.Fn)]
			ForceAliasCreation?: bool | fn.Fn
			MessageAction?:      string | fn.Fn
			UserAttributes?: [...{
			}]
			UserPoolId: string | fn.Fn
			Username?:  string | fn.Fn
			ValidationData?: [...{
			}]
		}
	}
	UserPoolUserToGroupAttachment :: {
		Type: "AWS::Cognito::UserPoolUserToGroupAttachment"
		Properties: {
			GroupName:  string | fn.Fn
			UserPoolId: string | fn.Fn
			Username:   string | fn.Fn
		}
	}
}

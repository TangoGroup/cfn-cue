package cnnorth1

import "github.com/TangoGroup/aws/fn"

Cognito :: {
	IdentityPool :: {
		Type: "AWS::Cognito::IdentityPool"
		Properties: {
			AllowClassicFlow?:              bool | fn.Fn
			AllowUnauthenticatedIdentities: bool | fn.Fn
			CognitoEvents?:                 {
				[string]: _
			} | fn.Fn
			CognitoIdentityProviders?: [...close({
			})] | fn.If
			CognitoStreams?: close({
			}) | fn.If
			DeveloperProviderName?:     string | fn.Fn
			IdentityPoolName?:          string | fn.Fn
			OpenIdConnectProviderARNs?: [...(string | fn.Fn)] | (string | fn.Fn)
			PushSync?:                  close({
			}) | fn.If
			SamlProviderARNs?:        [...(string | fn.Fn)] | (string | fn.Fn)
			SupportedLoginProviders?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPool :: {
		Type: "AWS::Cognito::UserPool"
		Properties: {
			AccountRecoverySetting?: close({
			}) | fn.If
			AdminCreateUserConfig?: close({
			}) | fn.If
			AliasAttributes?:        [...(string | fn.Fn)] | (string | fn.Fn)
			AutoVerifiedAttributes?: [...(string | fn.Fn)] | (string | fn.Fn)
			DeviceConfiguration?:    close({
			}) | fn.If
			EmailConfiguration?: close({
			}) | fn.If
			EmailVerificationMessage?: string | fn.Fn
			EmailVerificationSubject?: string | fn.Fn
			EnabledMfas?:              [...(string | fn.Fn)] | (string | fn.Fn)
			LambdaConfig?:             close({
			}) | fn.If
			MfaConfiguration?: string | fn.Fn
			Policies?:         close({
			}) | fn.If
			Schema?: [...close({
			})] | fn.If
			SmsAuthenticationMessage?: string | fn.Fn
			SmsConfiguration?:         close({
			}) | fn.If
			SmsVerificationMessage?: string | fn.Fn
			UserPoolAddOns?:         close({
			}) | fn.If
			UserPoolName?: string | fn.Fn
			UserPoolTags?: {
				[string]: _
			} | fn.Fn
			UsernameAttributes?:    [...(string | fn.Fn)] | (string | fn.Fn)
			UsernameConfiguration?: close({
			}) | fn.If
			VerificationMessageTemplate?: close({
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolClient :: {
		Type: "AWS::Cognito::UserPoolClient"
		Properties: {
			AllowedOAuthFlows?:               [...(string | fn.Fn)] | (string | fn.Fn)
			AllowedOAuthFlowsUserPoolClient?: bool | fn.Fn
			AllowedOAuthScopes?:              [...(string | fn.Fn)] | (string | fn.Fn)
			AnalyticsConfiguration?:          close({
			}) | fn.If
			CallbackURLs?:               [...(string | fn.Fn)] | (string | fn.Fn)
			ClientName?:                 string | fn.Fn
			DefaultRedirectURI?:         string | fn.Fn
			ExplicitAuthFlows?:          [...(string | fn.Fn)] | (string | fn.Fn)
			GenerateSecret?:             bool | fn.Fn
			LogoutURLs?:                 [...(string | fn.Fn)] | (string | fn.Fn)
			PreventUserExistenceErrors?: string | fn.Fn
			ReadAttributes?:             [...(string | fn.Fn)] | (string | fn.Fn)
			RefreshTokenValidity?:       int | fn.Fn
			SupportedIdentityProviders?: [...(string | fn.Fn)] | (string | fn.Fn)
			UserPoolId:                  string | fn.Fn
			WriteAttributes?:            [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolDomain :: {
		Type: "AWS::Cognito::UserPoolDomain"
		Properties: {
			CustomDomainConfig?: close({
			}) | fn.If
			Domain:     string | fn.Fn
			UserPoolId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolGroup :: {
		Type: "AWS::Cognito::UserPoolGroup"
		Properties: {
			Description?: string | fn.Fn
			GroupName?:   string | fn.Fn
			Precedence?:  number | fn.Fn
			RoleArn?:     string | fn.Fn
			UserPoolId:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolIdentityProvider :: {
		Type: "AWS::Cognito::UserPoolIdentityProvider"
		Properties: {
			AttributeMapping?: {
				[string]: _
			} | fn.Fn
			IdpIdentifiers?:  [...(string | fn.Fn)] | (string | fn.Fn)
			ProviderDetails?: {
				[string]: _
			} | fn.Fn
			ProviderName: string | fn.Fn
			ProviderType: string | fn.Fn
			UserPoolId:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolResourceServer :: {
		Type: "AWS::Cognito::UserPoolResourceServer"
		Properties: {
			Identifier: string | fn.Fn
			Name:       string | fn.Fn
			Scopes?:    [...close({
			})] | fn.If
			UserPoolId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolRiskConfigurationAttachment :: {
		Type: "AWS::Cognito::UserPoolRiskConfigurationAttachment"
		Properties: {
			AccountTakeoverRiskConfiguration?: close({
			}) | fn.If
			ClientId:                                 string | fn.Fn
			CompromisedCredentialsRiskConfiguration?: close({
			}) | fn.If
			RiskExceptionConfiguration?: close({
			}) | fn.If
			UserPoolId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolUICustomizationAttachment :: {
		Type: "AWS::Cognito::UserPoolUICustomizationAttachment"
		Properties: {
			CSS?:       string | fn.Fn
			ClientId:   string | fn.Fn
			UserPoolId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolUser :: {
		Type: "AWS::Cognito::UserPoolUser"
		Properties: {
			ClientMetadata?: {
				[string]: _
			} | fn.Fn
			DesiredDeliveryMediums?: [...(string | fn.Fn)] | (string | fn.Fn)
			ForceAliasCreation?:     bool | fn.Fn
			MessageAction?:          string | fn.Fn
			UserAttributes?:         [...close({
			})] | fn.If
			UserPoolId:      string | fn.Fn
			Username?:       string | fn.Fn
			ValidationData?: [...close({
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolUserToGroupAttachment :: {
		Type: "AWS::Cognito::UserPoolUserToGroupAttachment"
		Properties: {
			GroupName:  string | fn.Fn
			UserPoolId: string | fn.Fn
			Username:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

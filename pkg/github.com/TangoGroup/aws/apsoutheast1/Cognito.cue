package apsoutheast1

import "github.com/TangoGroup/aws/fn"

Cognito :: {
	IdentityPoolRoleAttachment :: {
		Type:       "AWS::Cognito::IdentityPoolRoleAttachment"
		Properties: close({
			IdentityPoolId: string | fn.Fn
			RoleMappings?:  {
				[string]: _
			} | fn.Fn
			Roles?: {
				[string]: _
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPool :: {
		Type:       "AWS::Cognito::UserPool"
		Properties: close({
			AccountRecoverySetting?: close({
				RecoveryMechanisms?: [...close({
					Name?:     string | fn.Fn
					Priority?: int | fn.Fn
				})] | fn.If
			}) | fn.If
			AdminCreateUserConfig?: close({
				AllowAdminCreateUserOnly?: bool | fn.Fn
				InviteMessageTemplate?:    close({
					EmailMessage?: string | fn.Fn
					EmailSubject?: string | fn.Fn
					SMSMessage?:   string | fn.Fn
				}) | fn.If
				UnusedAccountValidityDays?: number | fn.Fn
			}) | fn.If
			AliasAttributes?:        [...(("email" | "phone_number" | "preferred_username") | fn.Fn)] | (("email" | "phone_number" | "preferred_username") | fn.Fn)
			AutoVerifiedAttributes?: [...(("email" | "phone_number") | fn.Fn)] | (("email" | "phone_number") | fn.Fn)
			DeviceConfiguration?:    close({
				ChallengeRequiredOnNewDevice?:     bool | fn.Fn
				DeviceOnlyRememberedOnUserPrompt?: bool | fn.Fn
			}) | fn.If
			EmailConfiguration?: close({
				EmailSendingAccount?: string | fn.Fn
				ReplyToEmailAddress?: string | fn.Fn
				SourceArn?:           string | fn.Fn
			}) | fn.If
			EmailVerificationMessage?: string | fn.Fn
			EmailVerificationSubject?: string | fn.Fn
			EnabledMfas?:              [...(string | fn.Fn)] | (string | fn.Fn)
			LambdaConfig?:             close({
				CreateAuthChallenge?:         string | fn.Fn
				CustomMessage?:               string | fn.Fn
				DefineAuthChallenge?:         string | fn.Fn
				PostAuthentication?:          string | fn.Fn
				PostConfirmation?:            string | fn.Fn
				PreAuthentication?:           string | fn.Fn
				PreSignUp?:                   string | fn.Fn
				VerifyAuthChallengeResponse?: string | fn.Fn
			}) | fn.If
			MfaConfiguration?: ("OFF" | "ON" | "OPTIONAL") | fn.Fn
			Policies?:         close({
				PasswordPolicy?: close({
					MinimumLength?:                 int | fn.Fn
					RequireLowercase?:              bool | fn.Fn
					RequireNumbers?:                bool | fn.Fn
					RequireSymbols?:                bool | fn.Fn
					RequireUppercase?:              bool | fn.Fn
					TemporaryPasswordValidityDays?: number | fn.Fn
				}) | fn.If
			}) | fn.If
			Schema?: [...close({
				AttributeDataType?:          string | fn.Fn
				DeveloperOnlyAttribute?:     bool | fn.Fn
				Mutable?:                    bool | fn.Fn
				Name?:                       string | fn.Fn
				NumberAttributeConstraints?: close({
					MaxValue?: string | fn.Fn
					MinValue?: string | fn.Fn
				}) | fn.If
				Required?:                   bool | fn.Fn
				StringAttributeConstraints?: close({
					MaxLength?: string | fn.Fn
					MinLength?: string | fn.Fn
				}) | fn.If
			})] | fn.If
			SmsAuthenticationMessage?: string | fn.Fn
			SmsConfiguration?:         close({
				ExternalId:    string | fn.Fn
				SnsCallerArn?: string | fn.Fn
			}) | fn.If
			SmsVerificationMessage?: string | fn.Fn
			UserPoolAddOns?:         close({
				AdvancedSecurityMode?: string | fn.Fn
			}) | fn.If
			UserPoolName?: string | fn.Fn
			UserPoolTags?: {
				[string]: _
			} | fn.Fn
			UsernameAttributes?:    [...(("email" | "phone_number") | fn.Fn)] | (("email" | "phone_number") | fn.Fn)
			UsernameConfiguration?: close({
				CaseSensitive?: bool | fn.Fn
			}) | fn.If
			VerificationMessageTemplate?: close({
				DefaultEmailOption?: string | fn.Fn
				EmailMessage?:       string | fn.Fn
				EmailMessageByLink?: string | fn.Fn
				EmailSubject?:       string | fn.Fn
				EmailSubjectByLink?: string | fn.Fn
				SmsMessage?:         string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolClient :: {
		Type:       "AWS::Cognito::UserPoolClient"
		Properties: close({
			AllowedOAuthFlows?:               [...(string | fn.Fn)] | (string | fn.Fn)
			AllowedOAuthFlowsUserPoolClient?: bool | fn.Fn
			AllowedOAuthScopes?:              [...(string | fn.Fn)] | (string | fn.Fn)
			AnalyticsConfiguration?:          close({
				ApplicationId?:  string | fn.Fn
				ExternalId?:     string | fn.Fn
				RoleArn?:        string | fn.Fn
				UserDataShared?: bool | fn.Fn
			}) | fn.If
			CallbackURLs?:               [...(string | fn.Fn)] | (string | fn.Fn)
			ClientName?:                 string | fn.Fn
			DefaultRedirectURI?:         string | fn.Fn
			ExplicitAuthFlows?:          [...(("ADMIN_NO_SRP_AUTH" | "CUSTOM_AUTH_FLOW_ONLY" | "USER_PASSWORD_AUTH" | "ALLOW_ADMIN_USER_PASSWORD_AUTH" | "ALLOW_CUSTOM_AUTH" | "ALLOW_USER_PASSWORD_AUTH" | "ALLOW_USER_SRP_AUTH" | "ALLOW_REFRESH_TOKEN_AUTH") | fn.Fn)] | (("ADMIN_NO_SRP_AUTH" | "CUSTOM_AUTH_FLOW_ONLY" | "USER_PASSWORD_AUTH" | "ALLOW_ADMIN_USER_PASSWORD_AUTH" | "ALLOW_CUSTOM_AUTH" | "ALLOW_USER_PASSWORD_AUTH" | "ALLOW_USER_SRP_AUTH" | "ALLOW_REFRESH_TOKEN_AUTH") | fn.Fn)
			GenerateSecret?:             bool | fn.Fn
			LogoutURLs?:                 [...(string | fn.Fn)] | (string | fn.Fn)
			PreventUserExistenceErrors?: string | fn.Fn
			ReadAttributes?:             [...(string | fn.Fn)] | (string | fn.Fn)
			RefreshTokenValidity?:       (>=0 & <=3650) | fn.Fn
			SupportedIdentityProviders?: [...(string | fn.Fn)] | (string | fn.Fn)
			UserPoolId:                  string | fn.Fn
			WriteAttributes?:            [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolDomain :: {
		Type:       "AWS::Cognito::UserPoolDomain"
		Properties: close({
			CustomDomainConfig?: close({
				CertificateArn?: string | fn.Fn
			}) | fn.If
			Domain:     string | fn.Fn
			UserPoolId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolIdentityProvider :: {
		Type:       "AWS::Cognito::UserPoolIdentityProvider"
		Properties: close({
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
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolResourceServer :: {
		Type:       "AWS::Cognito::UserPoolResourceServer"
		Properties: close({
			Identifier: string | fn.Fn
			Name:       string | fn.Fn
			Scopes?:    [...close({
				ScopeDescription: string | fn.Fn
				ScopeName:        string | fn.Fn
			})] | fn.If
			UserPoolId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolRiskConfigurationAttachment :: {
		Type:       "AWS::Cognito::UserPoolRiskConfigurationAttachment"
		Properties: close({
			AccountTakeoverRiskConfiguration?: close({
				Actions: close({
					HighAction?: close({
						EventAction: string | fn.Fn
						Notify:      bool | fn.Fn
					}) | fn.If
					LowAction?: close({
						EventAction: string | fn.Fn
						Notify:      bool | fn.Fn
					}) | fn.If
					MediumAction?: close({
						EventAction: string | fn.Fn
						Notify:      bool | fn.Fn
					}) | fn.If
				}) | fn.If
				NotifyConfiguration?: close({
					BlockEmail?: close({
						HtmlBody?: string | fn.Fn
						Subject:   string | fn.Fn
						TextBody?: string | fn.Fn
					}) | fn.If
					From?:     string | fn.Fn
					MfaEmail?: close({
						HtmlBody?: string | fn.Fn
						Subject:   string | fn.Fn
						TextBody?: string | fn.Fn
					}) | fn.If
					NoActionEmail?: close({
						HtmlBody?: string | fn.Fn
						Subject:   string | fn.Fn
						TextBody?: string | fn.Fn
					}) | fn.If
					ReplyTo?:  string | fn.Fn
					SourceArn: string | fn.Fn
				}) | fn.If
			}) | fn.If
			ClientId:                                 string | fn.Fn
			CompromisedCredentialsRiskConfiguration?: close({
				Actions: close({
					EventAction: string | fn.Fn
				}) | fn.If
				EventFilter?: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			RiskExceptionConfiguration?: close({
				BlockedIPRangeList?: [...(string | fn.Fn)] | (string | fn.Fn)
				SkippedIPRangeList?: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			UserPoolId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserPoolUICustomizationAttachment :: {
		Type:       "AWS::Cognito::UserPoolUICustomizationAttachment"
		Properties: close({
			CSS?:       string | fn.Fn
			ClientId:   string | fn.Fn
			UserPoolId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

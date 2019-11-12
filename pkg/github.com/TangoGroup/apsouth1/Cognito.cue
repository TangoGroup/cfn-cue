package apsouth1

import "github.com/TangoGroup/fn"

Cognito :: {
	IdentityPoolRoleAttachment :: {
		Type: "AWS::Cognito::IdentityPoolRoleAttachment"
		Properties: {
			IdentityPoolId: string | fn.Fn
			RoleMappings?:  {
			} | fn.Fn
			Roles?: {
			} | fn.Fn
		}
	}
	UserPool :: {
		Type: "AWS::Cognito::UserPool"
		Properties: {
			AdminCreateUserConfig?: {
				AllowAdminCreateUserOnly?: bool | fn.Fn
				InviteMessageTemplate?: {
					EmailMessage?: string | fn.Fn
					EmailSubject?: string | fn.Fn
					SMSMessage?:   string | fn.Fn
				}
				UnusedAccountValidityDays?: float | fn.Fn
			}
			AliasAttributes?: [...((string & ("email" | "phone_number" | "preferred_username")) | fn.Fn)]
			AutoVerifiedAttributes?: [...((string & ("email" | "phone_number")) | fn.Fn)]
			DeviceConfiguration?: {
				ChallengeRequiredOnNewDevice?:     bool | fn.Fn
				DeviceOnlyRememberedOnUserPrompt?: bool | fn.Fn
			}
			EmailConfiguration?: {
				EmailSendingAccount?: string | fn.Fn
				ReplyToEmailAddress?: string | fn.Fn
				SourceArn?:           string | fn.Fn
			}
			EmailVerificationMessage?: string | fn.Fn
			EmailVerificationSubject?: string | fn.Fn
			EnabledMfas?: [...(string | fn.Fn)]
			LambdaConfig?: {
				CreateAuthChallenge?:         string | fn.Fn
				CustomMessage?:               string | fn.Fn
				DefineAuthChallenge?:         string | fn.Fn
				PostAuthentication?:          string | fn.Fn
				PostConfirmation?:            string | fn.Fn
				PreAuthentication?:           string | fn.Fn
				PreSignUp?:                   string | fn.Fn
				VerifyAuthChallengeResponse?: string | fn.Fn
			}
			MfaConfiguration?: (string & ("OFF" | "ON" | "OPTIONAL")) | fn.Fn
			Policies?: PasswordPolicy?: {
				MinimumLength?:                 int | fn.Fn
				RequireLowercase?:              bool | fn.Fn
				RequireNumbers?:                bool | fn.Fn
				RequireSymbols?:                bool | fn.Fn
				RequireUppercase?:              bool | fn.Fn
				TemporaryPasswordValidityDays?: float | fn.Fn
			}
			Schema?: [...{
				AttributeDataType?:      string | fn.Fn
				DeveloperOnlyAttribute?: bool | fn.Fn
				Mutable?:                bool | fn.Fn
				Name?:                   string | fn.Fn
				NumberAttributeConstraints?: {
					MaxValue?: string | fn.Fn
					MinValue?: string | fn.Fn
				}
				Required?: bool | fn.Fn
				StringAttributeConstraints?: {
					MaxLength?: string | fn.Fn
					MinLength?: string | fn.Fn
				}
			}]
			SmsAuthenticationMessage?: string | fn.Fn
			SmsConfiguration?: {
				ExternalId:    string | fn.Fn
				SnsCallerArn?: string | fn.Fn
			}
			SmsVerificationMessage?: string | fn.Fn
			UserPoolAddOns?: AdvancedSecurityMode?: string | fn.Fn
			UserPoolName?: string | fn.Fn
			UserPoolTags?: {
			} | fn.Fn
			UsernameAttributes?: [...((string & ("email" | "phone_number")) | fn.Fn)]
			VerificationMessageTemplate?: {
				DefaultEmailOption?: string | fn.Fn
				EmailMessage?:       string | fn.Fn
				EmailMessageByLink?: string | fn.Fn
				EmailSubject?:       string | fn.Fn
				EmailSubjectByLink?: string | fn.Fn
				SmsMessage?:         string | fn.Fn
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
				ApplicationId?:  string | fn.Fn
				ExternalId?:     string | fn.Fn
				RoleArn?:        string | fn.Fn
				UserDataShared?: bool | fn.Fn
			}
			CallbackURLs?: [...(string | fn.Fn)]
			ClientName?:         string | fn.Fn
			DefaultRedirectURI?: string | fn.Fn
			ExplicitAuthFlows?: [...((string & ("ADMIN_NO_SRP_AUTH" | "CUSTOM_AUTH_FLOW_ONLY" | "USER_PASSWORD_AUTH")) | fn.Fn)]
			GenerateSecret?: bool | fn.Fn
			LogoutURLs?: [...(string | fn.Fn)]
			ReadAttributes?: [...(string | fn.Fn)]
			RefreshTokenValidity?: (int & (>=0 & <=3650)) | fn.Fn
			SupportedIdentityProviders?: [...(string | fn.Fn)]
			UserPoolId: string | fn.Fn
			WriteAttributes?: [...(string | fn.Fn)]
		}
	}
	UserPoolDomain :: {
		Type: "AWS::Cognito::UserPoolDomain"
		Properties: {
			CustomDomainConfig?: CertificateArn?: string | fn.Fn
			Domain:     string | fn.Fn
			UserPoolId: string | fn.Fn
		}
	}
	UserPoolIdentityProvider :: {
		Type: "AWS::Cognito::UserPoolIdentityProvider"
		Properties: {
			AttributeMapping?: {
			} | fn.Fn
			IdpIdentifiers?: [...(string | fn.Fn)]
			ProviderDetails?: {
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
				ScopeDescription: string | fn.Fn
				ScopeName:        string | fn.Fn
			}]
			UserPoolId: string | fn.Fn
		}
	}
	UserPoolRiskConfigurationAttachment :: {
		Type: "AWS::Cognito::UserPoolRiskConfigurationAttachment"
		Properties: {
			AccountTakeoverRiskConfiguration?: {
				Actions: {
					HighAction?: {
						EventAction: string | fn.Fn
						Notify:      bool | fn.Fn
					}
					LowAction?: {
						EventAction: string | fn.Fn
						Notify:      bool | fn.Fn
					}
					MediumAction?: {
						EventAction: string | fn.Fn
						Notify:      bool | fn.Fn
					}
				}
				NotifyConfiguration?: {
					BlockEmail?: {
						HtmlBody?: string | fn.Fn
						Subject:   string | fn.Fn
						TextBody?: string | fn.Fn
					}
					From?: string | fn.Fn
					MfaEmail?: {
						HtmlBody?: string | fn.Fn
						Subject:   string | fn.Fn
						TextBody?: string | fn.Fn
					}
					NoActionEmail?: {
						HtmlBody?: string | fn.Fn
						Subject:   string | fn.Fn
						TextBody?: string | fn.Fn
					}
					ReplyTo?:  string | fn.Fn
					SourceArn: string | fn.Fn
				}
			}
			ClientId: string | fn.Fn
			CompromisedCredentialsRiskConfiguration?: {
				Actions: EventAction: string | fn.Fn
				EventFilter?: [...(string | fn.Fn)]
			}
			RiskExceptionConfiguration?: {
				BlockedIPRangeList?: [...(string | fn.Fn)]
				SkippedIPRangeList?: [...(string | fn.Fn)]
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
}

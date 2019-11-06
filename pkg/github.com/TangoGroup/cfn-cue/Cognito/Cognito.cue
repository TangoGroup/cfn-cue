package Cognito

import "github.com/TangoGroup/fn"

IdentityPool :: {
	Type: "AWS::Cognito::IdentityPool"
	Properties: {
		AllowUnauthenticatedIdentities: bool | fn.Fn
		CognitoEvents?:                 {
		} | fn.Fn
		CognitoIdentityProviders?: [...__CognitoIdentityProvider]
		CognitoStreams?:            __CognitoStreams
		DeveloperProviderName?:     string | fn.Fn
		IdentityPoolName?:          string | fn.Fn
		OpenIdConnectProviderARNs?: [...string] | fn.Fn
		PushSync?:                  __PushSync
		SamlProviderARNs?:          [...string] | fn.Fn
		SupportedLoginProviders?:   {
		} | fn.Fn
	}
	__CognitoIdentityProvider :: {
		ClientId?:             string | fn.Fn
		ProviderName?:         string | fn.Fn
		ServerSideTokenCheck?: bool | fn.Fn
	}
	__CognitoStreams :: {
		RoleArn?:         string | fn.Fn
		StreamName?:      string | fn.Fn
		StreamingStatus?: (string & ("DISABLED" | "ENABLED")) | fn.Fn
	}
	__PushSync :: {
		ApplicationArns?: [...string] | fn.Fn
		RoleArn?:         string | fn.Fn
	}
}
IdentityPoolRoleAttachment :: {
	Type: "AWS::Cognito::IdentityPoolRoleAttachment"
	Properties: {
		IdentityPoolId: string | fn.Fn
		RoleMappings?:  {
		} | fn.Fn
		Roles?: {
		} | fn.Fn
	}
	__MappingRule :: {
		Claim:     string | fn.Fn
		MatchType: string | fn.Fn
		RoleARN:   string | fn.Fn
		Value:     string | fn.Fn
	}
	__RoleMapping :: {
		AmbiguousRoleResolution?: string | fn.Fn
		IdentityProvider?:        string | fn.Fn
		RulesConfiguration?:      __RulesConfigurationType
		Type:                     string | fn.Fn
	}
	__RulesConfigurationType :: {
		Rules: [...__MappingRule]
	}
}
UserPool :: {
	Type: "AWS::Cognito::UserPool"
	Properties: {
		AdminCreateUserConfig?:    __AdminCreateUserConfig
		AliasAttributes?:          ([...string] & ("email" | "phone_number" | "preferred_username")) | fn.Fn
		AutoVerifiedAttributes?:   ([...string] & ("email" | "phone_number")) | fn.Fn
		DeviceConfiguration?:      __DeviceConfiguration
		EmailConfiguration?:       __EmailConfiguration
		EmailVerificationMessage?: string | fn.Fn
		EmailVerificationSubject?: string | fn.Fn
		EnabledMfas?:              [...string] | fn.Fn
		LambdaConfig?:             __LambdaConfig
		MfaConfiguration?:         (string & ("OFF" | "ON" | "OPTIONAL")) | fn.Fn
		Policies?:                 __Policies
		Schema?: [...__SchemaAttribute]
		SmsAuthenticationMessage?: string | fn.Fn
		SmsConfiguration?:         __SmsConfiguration
		SmsVerificationMessage?:   string | fn.Fn
		UserPoolAddOns?:           __UserPoolAddOns
		UserPoolName?:             string | fn.Fn
		UserPoolTags?:             {
		} | fn.Fn
		UsernameAttributes?:          ([...string] & ("email" | "phone_number")) | fn.Fn
		VerificationMessageTemplate?: __VerificationMessageTemplate
	}
	__AdminCreateUserConfig :: {
		AllowAdminCreateUserOnly?:  bool | fn.Fn
		InviteMessageTemplate?:     __InviteMessageTemplate
		UnusedAccountValidityDays?: int | fn.Fn
	}
	__DeviceConfiguration :: {
		ChallengeRequiredOnNewDevice?:     bool | fn.Fn
		DeviceOnlyRememberedOnUserPrompt?: bool | fn.Fn
	}
	__EmailConfiguration :: {
		EmailSendingAccount?: string | fn.Fn
		ReplyToEmailAddress?: string | fn.Fn
		SourceArn?:           string | fn.Fn
	}
	__InviteMessageTemplate :: {
		EmailMessage?: string | fn.Fn
		EmailSubject?: string | fn.Fn
		SMSMessage?:   string | fn.Fn
	}
	__LambdaConfig :: {
		CreateAuthChallenge?:         string | fn.Fn
		CustomMessage?:               string | fn.Fn
		DefineAuthChallenge?:         string | fn.Fn
		PostAuthentication?:          string | fn.Fn
		PostConfirmation?:            string | fn.Fn
		PreAuthentication?:           string | fn.Fn
		PreSignUp?:                   string | fn.Fn
		PreTokenGeneration?:          string | fn.Fn
		UserMigration?:               string | fn.Fn
		VerifyAuthChallengeResponse?: string | fn.Fn
	}
	__NumberAttributeConstraints :: {
		MaxValue?: string | fn.Fn
		MinValue?: string | fn.Fn
	}
	__PasswordPolicy :: {
		MinimumLength?:                 int | fn.Fn
		RequireLowercase?:              bool | fn.Fn
		RequireNumbers?:                bool | fn.Fn
		RequireSymbols?:                bool | fn.Fn
		RequireUppercase?:              bool | fn.Fn
		TemporaryPasswordValidityDays?: int | fn.Fn
	}
	__Policies :: {
		PasswordPolicy?: __PasswordPolicy
	}
	__SchemaAttribute :: {
		AttributeDataType?:          (string & ("Boolean" | "DateTime" | "Number" | "String")) | fn.Fn
		DeveloperOnlyAttribute?:     bool | fn.Fn
		Mutable?:                    bool | fn.Fn
		Name?:                       string | fn.Fn
		NumberAttributeConstraints?: __NumberAttributeConstraints
		Required?:                   bool | fn.Fn
		StringAttributeConstraints?: __StringAttributeConstraints
	}
	__SmsConfiguration :: {
		ExternalId:    string | fn.Fn
		SnsCallerArn?: string | fn.Fn
	}
	__StringAttributeConstraints :: {
		MaxLength?: string | fn.Fn
		MinLength?: string | fn.Fn
	}
	__UserPoolAddOns :: {
		AdvancedSecurityMode?: string | fn.Fn
	}
	__VerificationMessageTemplate :: {
		DefaultEmailOption?: string | fn.Fn
		EmailMessage?:       string | fn.Fn
		EmailMessageByLink?: string | fn.Fn
		EmailSubject?:       string | fn.Fn
		EmailSubjectByLink?: string | fn.Fn
		SmsMessage?:         string | fn.Fn
	}
}
UserPoolClient :: {
	Type: "AWS::Cognito::UserPoolClient"
	Properties: {
		AllowedOAuthFlows?:               [...string] | fn.Fn
		AllowedOAuthFlowsUserPoolClient?: bool | fn.Fn
		AllowedOAuthScopes?:              [...string] | fn.Fn
		AnalyticsConfiguration?:          __AnalyticsConfiguration
		CallbackURLs?:                    [...string] | fn.Fn
		ClientName?:                      string | fn.Fn
		DefaultRedirectURI?:              string | fn.Fn
		ExplicitAuthFlows?:               ([...string] & ("ADMIN_NO_SRP_AUTH" | "CUSTOM_AUTH_FLOW_ONLY" | "USER_PASSWORD_AUTH")) | fn.Fn
		GenerateSecret?:                  bool | fn.Fn
		LogoutURLs?:                      [...string] | fn.Fn
		ReadAttributes?:                  [...string] | fn.Fn
		RefreshTokenValidity?:            (int & (>=0 & <=3650)) | fn.Fn
		SupportedIdentityProviders?:      [...string] | fn.Fn
		UserPoolId:                       string | fn.Fn
		WriteAttributes?:                 [...string] | fn.Fn
	}
	__AnalyticsConfiguration :: {
		ApplicationId?:  string | fn.Fn
		ExternalId?:     string | fn.Fn
		RoleArn?:        string | fn.Fn
		UserDataShared?: bool | fn.Fn
	}
}
UserPoolDomain :: {
	Type: "AWS::Cognito::UserPoolDomain"
	Properties: {
		CustomDomainConfig?: __CustomDomainConfigType
		Domain:              string | fn.Fn
		UserPoolId:          string | fn.Fn
	}
	__CustomDomainConfigType :: {
		CertificateArn?: string | fn.Fn
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
		} | fn.Fn
		IdpIdentifiers?:  [...string] | fn.Fn
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
		Scopes?: [...__ResourceServerScopeType]
		UserPoolId: string | fn.Fn
	}
	__ResourceServerScopeType :: {
		ScopeDescription: string | fn.Fn
		ScopeName:        string | fn.Fn
	}
}
UserPoolRiskConfigurationAttachment :: {
	Type: "AWS::Cognito::UserPoolRiskConfigurationAttachment"
	Properties: {
		AccountTakeoverRiskConfiguration?:        __AccountTakeoverRiskConfigurationType
		ClientId:                                 string | fn.Fn
		CompromisedCredentialsRiskConfiguration?: __CompromisedCredentialsRiskConfigurationType
		RiskExceptionConfiguration?:              __RiskExceptionConfigurationType
		UserPoolId:                               string | fn.Fn
	}
	__AccountTakeoverActionType :: {
		EventAction: string | fn.Fn
		Notify:      bool | fn.Fn
	}
	__AccountTakeoverActionsType :: {
		HighAction?:   __AccountTakeoverActionType
		LowAction?:    __AccountTakeoverActionType
		MediumAction?: __AccountTakeoverActionType
	}
	__AccountTakeoverRiskConfigurationType :: {
		Actions:              __AccountTakeoverActionsType
		NotifyConfiguration?: __NotifyConfigurationType
	}
	__CompromisedCredentialsActionsType :: {
		EventAction: string | fn.Fn
	}
	__CompromisedCredentialsRiskConfigurationType :: {
		Actions:      __CompromisedCredentialsActionsType
		EventFilter?: [...string] | fn.Fn
	}
	__NotifyConfigurationType :: {
		BlockEmail?:    __NotifyEmailType
		From?:          string | fn.Fn
		MfaEmail?:      __NotifyEmailType
		NoActionEmail?: __NotifyEmailType
		ReplyTo?:       string | fn.Fn
		SourceArn:      string | fn.Fn
	}
	__NotifyEmailType :: {
		HtmlBody?: string | fn.Fn
		Subject:   string | fn.Fn
		TextBody?: string | fn.Fn
	}
	__RiskExceptionConfigurationType :: {
		BlockedIPRangeList?: [...string] | fn.Fn
		SkippedIPRangeList?: [...string] | fn.Fn
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
		DesiredDeliveryMediums?: ([...string] & ("EMAIL" | "SMS")) | fn.Fn
		ForceAliasCreation?:     bool | fn.Fn
		MessageAction?:          (string & ("RESEND" | "SUPPRESS")) | fn.Fn
		UserAttributes?: [...__AttributeType]
		UserPoolId: string | fn.Fn
		Username?:  string | fn.Fn
		ValidationData?: [...__AttributeType]
	}
	__AttributeType :: {
		Name?:  string | fn.Fn
		Value?: string | fn.Fn
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

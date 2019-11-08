package Cognito

import "github.com/TangoGroup/fn"

IdentityPool :: {
	Type: "AWS::Cognito::IdentityPool"
	Properties: {
		AllowUnauthenticatedIdentities: bool | fn.Fn
		CognitoEvents?:                 {
		} | fn.Fn
		CognitoIdentityProviders?: [...propCognitoIdentityProvider]
		CognitoStreams?:        propCognitoStreams
		DeveloperProviderName?: string | fn.Fn
		IdentityPoolName?:      string | fn.Fn
		OpenIdConnectProviderARNs?: [...(string | fn.Fn)]
		PushSync?: propPushSync
		SamlProviderARNs?: [...(string | fn.Fn)]
		SupportedLoginProviders?: {
		} | fn.Fn
	}
	propCognitoIdentityProvider :: {
		ClientId?:             string | fn.Fn
		ProviderName?:         string | fn.Fn
		ServerSideTokenCheck?: bool | fn.Fn
	}
	propCognitoStreams :: {
		RoleArn?:         string | fn.Fn
		StreamName?:      string | fn.Fn
		StreamingStatus?: (string & ("DISABLED" | "ENABLED")) | fn.Fn
	}
	propPushSync :: {
		ApplicationArns?: [...(string | fn.Fn)]
		RoleArn?: string | fn.Fn
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
	propMappingRule :: {
		Claim:     string | fn.Fn
		MatchType: string | fn.Fn
		RoleARN:   string | fn.Fn
		Value:     string | fn.Fn
	}
	propRoleMapping :: {
		AmbiguousRoleResolution?: string | fn.Fn
		IdentityProvider?:        string | fn.Fn
		RulesConfiguration?:      propRulesConfigurationType
		Type:                     string | fn.Fn
	}
	propRulesConfigurationType :: {
		Rules: [...propMappingRule]
	}
}
UserPool :: {
	Type: "AWS::Cognito::UserPool"
	Properties: {
		AdminCreateUserConfig?: propAdminCreateUserConfig
		AliasAttributes?: [...((string & ("email" | "phone_number" | "preferred_username")) | fn.Fn)]
		AutoVerifiedAttributes?: [...((string & ("email" | "phone_number")) | fn.Fn)]
		DeviceConfiguration?:      propDeviceConfiguration
		EmailConfiguration?:       propEmailConfiguration
		EmailVerificationMessage?: string | fn.Fn
		EmailVerificationSubject?: string | fn.Fn
		EnabledMfas?: [...(string | fn.Fn)]
		LambdaConfig?:     propLambdaConfig
		MfaConfiguration?: (string & ("OFF" | "ON" | "OPTIONAL")) | fn.Fn
		Policies?:         propPolicies
		Schema?: [...propSchemaAttribute]
		SmsAuthenticationMessage?: string | fn.Fn
		SmsConfiguration?:         propSmsConfiguration
		SmsVerificationMessage?:   string | fn.Fn
		UserPoolAddOns?:           propUserPoolAddOns
		UserPoolName?:             string | fn.Fn
		UserPoolTags?:             {
		} | fn.Fn
		UsernameAttributes?: [...((string & ("email" | "phone_number")) | fn.Fn)]
		VerificationMessageTemplate?: propVerificationMessageTemplate
	}
	propAdminCreateUserConfig :: {
		AllowAdminCreateUserOnly?:  bool | fn.Fn
		InviteMessageTemplate?:     propInviteMessageTemplate
		UnusedAccountValidityDays?: int | fn.Fn
	}
	propDeviceConfiguration :: {
		ChallengeRequiredOnNewDevice?:     bool | fn.Fn
		DeviceOnlyRememberedOnUserPrompt?: bool | fn.Fn
	}
	propEmailConfiguration :: {
		EmailSendingAccount?: string | fn.Fn
		ReplyToEmailAddress?: string | fn.Fn
		SourceArn?:           string | fn.Fn
	}
	propInviteMessageTemplate :: {
		EmailMessage?: string | fn.Fn
		EmailSubject?: string | fn.Fn
		SMSMessage?:   string | fn.Fn
	}
	propLambdaConfig :: {
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
	propNumberAttributeConstraints :: {
		MaxValue?: string | fn.Fn
		MinValue?: string | fn.Fn
	}
	propPasswordPolicy :: {
		MinimumLength?:                 int | fn.Fn
		RequireLowercase?:              bool | fn.Fn
		RequireNumbers?:                bool | fn.Fn
		RequireSymbols?:                bool | fn.Fn
		RequireUppercase?:              bool | fn.Fn
		TemporaryPasswordValidityDays?: int | fn.Fn
	}
	propPolicies :: {
		PasswordPolicy?: propPasswordPolicy
	}
	propSchemaAttribute :: {
		AttributeDataType?:          (string & ("Boolean" | "DateTime" | "Number" | "String")) | fn.Fn
		DeveloperOnlyAttribute?:     bool | fn.Fn
		Mutable?:                    bool | fn.Fn
		Name?:                       string | fn.Fn
		NumberAttributeConstraints?: propNumberAttributeConstraints
		Required?:                   bool | fn.Fn
		StringAttributeConstraints?: propStringAttributeConstraints
	}
	propSmsConfiguration :: {
		ExternalId:    string | fn.Fn
		SnsCallerArn?: string | fn.Fn
	}
	propStringAttributeConstraints :: {
		MaxLength?: string | fn.Fn
		MinLength?: string | fn.Fn
	}
	propUserPoolAddOns :: {
		AdvancedSecurityMode?: string | fn.Fn
	}
	propVerificationMessageTemplate :: {
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
		AllowedOAuthFlows?: [...(string | fn.Fn)]
		AllowedOAuthFlowsUserPoolClient?: bool | fn.Fn
		AllowedOAuthScopes?: [...(string | fn.Fn)]
		AnalyticsConfiguration?: propAnalyticsConfiguration
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
	propAnalyticsConfiguration :: {
		ApplicationId?:  string | fn.Fn
		ExternalId?:     string | fn.Fn
		RoleArn?:        string | fn.Fn
		UserDataShared?: bool | fn.Fn
	}
}
UserPoolDomain :: {
	Type: "AWS::Cognito::UserPoolDomain"
	Properties: {
		CustomDomainConfig?: propCustomDomainConfigType
		Domain:              string | fn.Fn
		UserPoolId:          string | fn.Fn
	}
	propCustomDomainConfigType :: {
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
		Scopes?: [...propResourceServerScopeType]
		UserPoolId: string | fn.Fn
	}
	propResourceServerScopeType :: {
		ScopeDescription: string | fn.Fn
		ScopeName:        string | fn.Fn
	}
}
UserPoolRiskConfigurationAttachment :: {
	Type: "AWS::Cognito::UserPoolRiskConfigurationAttachment"
	Properties: {
		AccountTakeoverRiskConfiguration?:        propAccountTakeoverRiskConfigurationType
		ClientId:                                 string | fn.Fn
		CompromisedCredentialsRiskConfiguration?: propCompromisedCredentialsRiskConfigurationType
		RiskExceptionConfiguration?:              propRiskExceptionConfigurationType
		UserPoolId:                               string | fn.Fn
	}
	propAccountTakeoverActionType :: {
		EventAction: string | fn.Fn
		Notify:      bool | fn.Fn
	}
	propAccountTakeoverActionsType :: {
		HighAction?:   propAccountTakeoverActionType
		LowAction?:    propAccountTakeoverActionType
		MediumAction?: propAccountTakeoverActionType
	}
	propAccountTakeoverRiskConfigurationType :: {
		Actions:              propAccountTakeoverActionsType
		NotifyConfiguration?: propNotifyConfigurationType
	}
	propCompromisedCredentialsActionsType :: {
		EventAction: string | fn.Fn
	}
	propCompromisedCredentialsRiskConfigurationType :: {
		Actions: propCompromisedCredentialsActionsType
		EventFilter?: [...(string | fn.Fn)]
	}
	propNotifyConfigurationType :: {
		BlockEmail?:    propNotifyEmailType
		From?:          string | fn.Fn
		MfaEmail?:      propNotifyEmailType
		NoActionEmail?: propNotifyEmailType
		ReplyTo?:       string | fn.Fn
		SourceArn:      string | fn.Fn
	}
	propNotifyEmailType :: {
		HtmlBody?: string | fn.Fn
		Subject:   string | fn.Fn
		TextBody?: string | fn.Fn
	}
	propRiskExceptionConfigurationType :: {
		BlockedIPRangeList?: [...(string | fn.Fn)]
		SkippedIPRangeList?: [...(string | fn.Fn)]
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
		DesiredDeliveryMediums?: [...((string & ("EMAIL" | "SMS")) | fn.Fn)]
		ForceAliasCreation?: bool | fn.Fn
		MessageAction?:      (string & ("RESEND" | "SUPPRESS")) | fn.Fn
		UserAttributes?: [...propAttributeType]
		UserPoolId: string | fn.Fn
		Username?:  string | fn.Fn
		ValidationData?: [...propAttributeType]
	}
	propAttributeType :: {
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

package Cognito

IdentityPool :: {
  Type: "AWS::Cognito::IdentityPool"
  Properties: {
    AllowUnauthenticatedIdentities: bool
    CognitoEvents?: {
    }
    CognitoIdentityProviders?: [...__CognitoIdentityProvider]
    CognitoStreams?:        __CognitoStreams
    DeveloperProviderName?: string
    IdentityPoolName?:      string
    OpenIdConnectProviderARNs?: [...string]
    PushSync?: __PushSync
    SamlProviderARNs?: [...string]
    SupportedLoginProviders?: {
    }
  }
  __CognitoIdentityProvider = {
    ClientId?:             string
    ProviderName?:         string
    ServerSideTokenCheck?: bool
  }
  __CognitoStreams = {
    RoleArn?:         string
    StreamName?:      string
    StreamingStatus?: "DISABLED" | "ENABLED"
    StreamingStatus?: string
  }
  __PushSync = {
    ApplicationArns?: [...string]
    RoleArn?: string
  }
}
IdentityPoolRoleAttachment :: {
  Type: "AWS::Cognito::IdentityPoolRoleAttachment"
  Properties: {
    IdentityPoolId: string
    RoleMappings?: {
    }
    Roles?: {
    }
  }
  __MappingRule = {
    Claim:     string
    MatchType: string
    RoleARN:   string
    Value:     string
  }
  __RoleMapping = {
    AmbiguousRoleResolution?: string
    RulesConfiguration?:      __RulesConfigurationType
    Type:                     string
  }
  __RulesConfigurationType = {
    Rules: [...__MappingRule]
  }
}
UserPool :: {
  Type: "AWS::Cognito::UserPool"
  Properties: {
    AdminCreateUserConfig?: __AdminCreateUserConfig
    AliasAttributes?:       "email" | "phone_number" | "preferred_username"
    AliasAttributes?: [...string]
    AutoVerifiedAttributes?: "email" | "phone_number"
    AutoVerifiedAttributes?: [...string]
    DeviceConfiguration?:      __DeviceConfiguration
    EmailConfiguration?:       __EmailConfiguration
    EmailVerificationMessage?: string
    EmailVerificationSubject?: string
    LambdaConfig?:             __LambdaConfig
    MfaConfiguration?:         "OFF" | "ON" | "OPTIONAL"
    MfaConfiguration?:         string
    Policies?:                 __Policies
    Schema?: [...__SchemaAttribute]
    SmsAuthenticationMessage?: string
    SmsConfiguration?:         __SmsConfiguration
    SmsVerificationMessage?:   string
    UserPoolAddOns?:           __UserPoolAddOns
    UserPoolName?:             string
    UserPoolTags?: {
    }
    UsernameAttributes?: "email" | "phone_number"
    UsernameAttributes?: [...string]
    VerificationMessageTemplate?: __VerificationMessageTemplate
  }
  __AdminCreateUserConfig = {
    AllowAdminCreateUserOnly?:  bool
    InviteMessageTemplate?:     __InviteMessageTemplate
    UnusedAccountValidityDays?: int
  }
  __DeviceConfiguration = {
    ChallengeRequiredOnNewDevice?:     bool
    DeviceOnlyRememberedOnUserPrompt?: bool
  }
  __EmailConfiguration = {
    EmailSendingAccount?: string
    ReplyToEmailAddress?: string
    SourceArn?:           string
  }
  __InviteMessageTemplate = {
    EmailMessage?: string
    EmailSubject?: string
    SMSMessage?:   string
  }
  __LambdaConfig = {
    CreateAuthChallenge?:         string
    CustomMessage?:               string
    DefineAuthChallenge?:         string
    PostAuthentication?:          string
    PostConfirmation?:            string
    PreAuthentication?:           string
    PreSignUp?:                   string
    PreTokenGeneration?:          string
    UserMigration?:               string
    VerifyAuthChallengeResponse?: string
  }
  __NumberAttributeConstraints = {
    MaxValue?: string
    MinValue?: string
  }
  __PasswordPolicy = {
    MinimumLength?:                 int
    RequireLowercase?:              bool
    RequireNumbers?:                bool
    RequireSymbols?:                bool
    RequireUppercase?:              bool
    TemporaryPasswordValidityDays?: int
  }
  __Policies = {
    PasswordPolicy?: __PasswordPolicy
  }
  __SchemaAttribute = {
    AttributeDataType?:          "Boolean" | "DateTime" | "Number" | "String"
    AttributeDataType?:          string
    DeveloperOnlyAttribute?:     bool
    Mutable?:                    bool
    Name?:                       string
    NumberAttributeConstraints?: __NumberAttributeConstraints
    Required?:                   bool
    StringAttributeConstraints?: __StringAttributeConstraints
  }
  __SmsConfiguration = {
    ExternalId:    string
    SnsCallerArn?: string
  }
  __StringAttributeConstraints = {
    MaxLength?: string
    MinLength?: string
  }
  __UserPoolAddOns = {
    AdvancedSecurityMode?: string
  }
  __VerificationMessageTemplate = {
    DefaultEmailOption?: string
    EmailMessage?:       string
    EmailMessageByLink?: string
    EmailSubject?:       string
    EmailSubjectByLink?: string
    SmsMessage?:         string
  }
}
UserPoolClient :: {
  Type: "AWS::Cognito::UserPoolClient"
  Properties: {
    AllowedOAuthFlows?: [...string]
    AllowedOAuthFlowsUserPoolClient?: bool
    AllowedOAuthScopes?: [...string]
    AnalyticsConfiguration?: __AnalyticsConfiguration
    CallbackURLs?: [...string]
    ClientName?:         string
    DefaultRedirectURI?: string
    ExplicitAuthFlows?:  "ADMIN_NO_SRP_AUTH" | "CUSTOM_AUTH_FLOW_ONLY" | "USER_PASSWORD_AUTH"
    ExplicitAuthFlows?: [...string]
    GenerateSecret?: bool
    LogoutURLs?: [...string]
    ReadAttributes?: [...string]
    RefreshTokenValidity?: >=0 & <=3650
    RefreshTokenValidity?: int
    SupportedIdentityProviders?: [...string]
    UserPoolId: string
    WriteAttributes?: [...string]
  }
  __AnalyticsConfiguration = {
    ApplicationId?:  string
    ExternalId?:     string
    RoleArn?:        string
    UserDataShared?: bool
  }
}
UserPoolGroup :: {
  Type: "AWS::Cognito::UserPoolGroup"
  Properties: {
    Description?: string
    GroupName?:   string
    Precedence?:  float
    RoleArn?:     string
    UserPoolId:   string
  }
}
UserPoolUser :: {
  Type: "AWS::Cognito::UserPoolUser"
  Properties: {
    DesiredDeliveryMediums?: "EMAIL" | "SMS"
    DesiredDeliveryMediums?: [...string]
    ForceAliasCreation?: bool
    MessageAction?:      "RESEND" | "SUPPRESS"
    MessageAction?:      string
    UserAttributes?: [...__AttributeType]
    UserPoolId: string
    Username?:  string
    ValidationData?: [...__AttributeType]
  }
  __AttributeType = {
    Name?:  string
    Value?: string
  }
}
UserPoolUserToGroupAttachment :: {
  Type: "AWS::Cognito::UserPoolUserToGroupAttachment"
  Properties: {
    GroupName:  string
    UserPoolId: string
    Username:   string
  }
}

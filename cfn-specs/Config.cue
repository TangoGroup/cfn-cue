package Config

AggregationAuthorization :: {
  Type: "AWS::Config::AggregationAuthorization"
  Properties: {
    AuthorizedAccountId: string
    AuthorizedAwsRegion: string
  }
}
ConfigRule :: {
  Type: "AWS::Config::ConfigRule"
  Properties: {
    ConfigRuleName?: string
    Description?:    string
    InputParameters?: {
    }
    MaximumExecutionFrequency?: string
    Scope?:                     __Scope
    Source:                     __Source
  }
  __Scope = {
    ComplianceResourceId?: string
    ComplianceResourceTypes?: [...string]
    TagKey?:   string
    TagValue?: string
  }
  __Source = {
    Owner: string
    SourceDetails?: [...__SourceDetail]
    SourceIdentifier: string
  }
  __SourceDetail = {
    EventSource:                string
    MaximumExecutionFrequency?: string
    MessageType:                string
  }
}
ConfigurationAggregator :: {
  Type: "AWS::Config::ConfigurationAggregator"
  Properties: {
    AccountAggregationSources?: [...__AccountAggregationSource]
    ConfigurationAggregatorName:    string
    OrganizationAggregationSource?: __OrganizationAggregationSource
  }
  __AccountAggregationSource = {
    AccountIds: [...string]
    AllAwsRegions?: bool
    AwsRegions?: [...string]
  }
  __OrganizationAggregationSource = {
    AllAwsRegions?: bool
    AwsRegions?: [...string]
    RoleArn: string
  }
}
ConfigurationRecorder :: {
  Type: "AWS::Config::ConfigurationRecorder"
  Properties: {
    Name?:           string
    RecordingGroup?: __RecordingGroup
    RoleARN:         string
  }
  __RecordingGroup = {
    AllSupported?:               bool
    IncludeGlobalResourceTypes?: bool
    ResourceTypes?: [...string]
  }
}
DeliveryChannel :: {
  Type: "AWS::Config::DeliveryChannel"
  Properties: {
    ConfigSnapshotDeliveryProperties?: __ConfigSnapshotDeliveryProperties
    Name?:                             string
    S3BucketName:                      string
    S3KeyPrefix?:                      string
    SnsTopicARN?:                      string
  }
  __ConfigSnapshotDeliveryProperties = {
    DeliveryFrequency?: string
  }
}
OrganizationConfigRule :: {
  Type: "AWS::Config::OrganizationConfigRule"
  Properties: {
    ExcludedAccounts?: [...string]
    OrganizationConfigRuleName:       string
    OrganizationCustomRuleMetadata?:  __OrganizationCustomRuleMetadata
    OrganizationManagedRuleMetadata?: __OrganizationManagedRuleMetadata
  }
  __OrganizationCustomRuleMetadata = {
    Description?:               string
    InputParameters?:           string
    LambdaFunctionArn:          string
    MaximumExecutionFrequency?: string
    OrganizationConfigRuleTriggerTypes: [...string]
    ResourceIdScope?: string
    ResourceTypesScope?: [...string]
    TagKeyScope?:   string
    TagValueScope?: string
  }
  __OrganizationManagedRuleMetadata = {
    Description?:               string
    InputParameters?:           string
    MaximumExecutionFrequency?: string
    ResourceIdScope?:           string
    ResourceTypesScope?: [...string]
    RuleIdentifier: string
    TagKeyScope?:   string
    TagValueScope?: string
  }
}
RemediationConfiguration :: {
  Type: "AWS::Config::RemediationConfiguration"
  Properties: {
    ConfigRuleName: string
    Parameters?: {
    }
    ResourceType?:  string
    TargetId:       string
    TargetType:     string
    TargetVersion?: string
  }
  __RemediationParameterValue = {
    ResourceValue?: __ResourceValue
    StaticValue?:   __StaticValue
  }
  __ResourceValue = {
    Value?: string
  }
  __StaticValue = {
    Values?: [...string]
  }
}

package SES

ConfigurationSet :: {
  Type: "AWS::SES::ConfigurationSet"
  Properties: {
    Name?: string
  }
}
ConfigurationSetEventDestination :: {
  Type: "AWS::SES::ConfigurationSetEventDestination"
  Properties: {
    ConfigurationSetName: string
    EventDestination:     __EventDestination
  }
  __CloudWatchDestination = {
    DimensionConfigurations?: [...__DimensionConfiguration]
  }
  __DimensionConfiguration = {
    DefaultDimensionValue: string
    DimensionName:         string
    DimensionValueSource:  string
  }
  __EventDestination = {
    CloudWatchDestination?:      __CloudWatchDestination
    Enabled?:                    bool
    KinesisFirehoseDestination?: __KinesisFirehoseDestination
    MatchingEventTypes: [...string]
    Name?: string
  }
  __KinesisFirehoseDestination = {
    DeliveryStreamARN: string
    IAMRoleARN:        string
  }
}
ReceiptFilter :: {
  Type: "AWS::SES::ReceiptFilter"
  Properties: {
    Filter: __Filter
  }
  __Filter = {
    IpFilter: __IpFilter
    Name?:    string
  }
  __IpFilter = {
    Cidr:   string
    Policy: string
  }
}
ReceiptRule :: {
  Type: "AWS::SES::ReceiptRule"
  Properties: {
    After?:      string
    Rule:        __Rule
    RuleSetName: string
  }
  __Action = {
    AddHeaderAction?: __AddHeaderAction
    BounceAction?:    __BounceAction
    LambdaAction?:    __LambdaAction
    S3Action?:        __S3Action
    SNSAction?:       __SNSAction
    StopAction?:      __StopAction
    WorkmailAction?:  __WorkmailAction
  }
  __AddHeaderAction = {
    HeaderName:  string
    HeaderValue: string
  }
  __BounceAction = {
    Message:       string
    Sender:        string
    SmtpReplyCode: string
    StatusCode?:   string
    TopicArn?:     string
  }
  __LambdaAction = {
    FunctionArn:     string
    InvocationType?: string
    TopicArn?:       string
  }
  __Rule = {
    Actions?: [...__Action]
    Enabled?: bool
    Name?:    string
    Recipients?: [...string]
    ScanEnabled?: bool
    TlsPolicy?:   "Optional" | "Require"
    TlsPolicy?:   string
  }
  __S3Action = {
    BucketName:       string
    KmsKeyArn?:       string
    ObjectKeyPrefix?: string
    TopicArn?:        string
  }
  __SNSAction = {
    Encoding?: string
    TopicArn?: string
  }
  __StopAction = {
    Scope:     string
    TopicArn?: string
  }
  __WorkmailAction = {
    OrganizationArn: string
    TopicArn?:       string
  }
}
ReceiptRuleSet :: {
  Type: "AWS::SES::ReceiptRuleSet"
  Properties: {
    RuleSetName?: string
  }
}
Template :: {
  Type: "AWS::SES::Template"
  Properties: {
    Template?: __Template
  }
  __Template = {
    HtmlPart?:     string
    SubjectPart?:  string
    TemplateName?: string
    TextPart?:     string
  }
}

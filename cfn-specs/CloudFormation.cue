package CloudFormation

CustomResource :: {
  Type: "AWS::CloudFormation::CustomResource"
  Properties: {
    ServiceToken: string
  }
}
Macro :: {
  Type: "AWS::CloudFormation::Macro"
  Properties: {
    Description?:  string
    FunctionName:  string
    LogGroupName?: string
    LogRoleARN?:   string
    Name:          string
  }
}
Stack :: {
  Type: "AWS::CloudFormation::Stack"
  Properties: {
    NotificationARNs?: [...string]
    Parameters?: {
    }
    Tags?: [...__Tag]
    TemplateURL:       string
    TimeoutInMinutes?: int
  }
}
WaitCondition :: {
  Type: "AWS::CloudFormation::WaitCondition"
  Properties: {
    Count?:   int
    Handle?:  string
    Timeout?: >=0 & <=43200
    Timeout?: string
  }
}
WaitConditionHandle :: {
  Type: "AWS::CloudFormation::WaitConditionHandle"
  Properties: {
  }
}

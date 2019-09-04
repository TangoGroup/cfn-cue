package CodeDeploy

Application :: {
  Type: "AWS::CodeDeploy::Application"
  Properties: {
    ApplicationName?: string
    ComputePlatform?: string
  }
}
DeploymentConfig :: {
  Type: "AWS::CodeDeploy::DeploymentConfig"
  Properties: {
    DeploymentConfigName?: string
    MinimumHealthyHosts?:  __MinimumHealthyHosts
  }
  __MinimumHealthyHosts = {
    Type:  string
    Value: int
  }
}
DeploymentGroup :: {
  Type: "AWS::CodeDeploy::DeploymentGroup"
  Properties: {
    AlarmConfiguration?:        __AlarmConfiguration
    ApplicationName:            string
    AutoRollbackConfiguration?: __AutoRollbackConfiguration
    AutoScalingGroups?: [...string]
    Deployment?:           __Deployment
    DeploymentConfigName?: string
    DeploymentGroupName?:  string
    DeploymentStyle?:      __DeploymentStyle
    Ec2TagFilters?: [...__EC2TagFilter]
    Ec2TagSet?:        __EC2TagSet
    LoadBalancerInfo?: __LoadBalancerInfo
    OnPremisesInstanceTagFilters?: [...__TagFilter]
    OnPremisesTagSet?: __OnPremisesTagSet
    ServiceRoleArn:    string
    TriggerConfigurations?: [...__TriggerConfig]
  }
  __Alarm = {
    Name?: string
  }
  __AlarmConfiguration = {
    Alarms?: [...__Alarm]
    Enabled?:                bool
    IgnorePollAlarmFailure?: bool
  }
  __AutoRollbackConfiguration = {
    Enabled?: bool
    Events?: [...string]
  }
  __Deployment = {
    Description?:                   string
    IgnoreApplicationStopFailures?: bool
    Revision:                       __RevisionLocation
  }
  __DeploymentStyle = {
    DeploymentOption?: string
    DeploymentType?:   string
  }
  __EC2TagFilter = {
    Key?:   string
    Type?:  string
    Value?: string
  }
  __EC2TagSet = {
    Ec2TagSetList?: [...__EC2TagSetListObject]
  }
  __EC2TagSetListObject = {
    Ec2TagGroup?: [...__EC2TagFilter]
  }
  __ELBInfo = {
    Name?: string
  }
  __GitHubLocation = {
    CommitId:   string
    Repository: string
  }
  __LoadBalancerInfo = {
    ElbInfoList?: [...__ELBInfo]
    TargetGroupInfoList?: [...__TargetGroupInfo]
  }
  __OnPremisesTagSet = {
    OnPremisesTagSetList?: [...__OnPremisesTagSetListObject]
  }
  __OnPremisesTagSetListObject = {
    OnPremisesTagGroup?: [...__TagFilter]
  }
  __RevisionLocation = {
    GitHubLocation?: __GitHubLocation
    RevisionType?:   string
    S3Location?:     __S3Location
  }
  __S3Location = {
    Bucket:      string
    BundleType?: string
    ETag?:       string
    Key:         string
    Version?:    string
  }
  __TagFilter = {
    Key?:   string
    Type?:  string
    Value?: string
  }
  __TargetGroupInfo = {
    Name?: string
  }
  __TriggerConfig = {
    TriggerEvents?: [...string]
    TriggerName?:      string
    TriggerTargetArn?: string
  }
}

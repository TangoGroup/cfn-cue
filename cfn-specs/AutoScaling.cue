package AutoScaling

AutoScalingGroup :: {
  Type: "AWS::AutoScaling::AutoScalingGroup"
  Properties: {
    AutoScalingGroupName?: string
    AvailabilityZones?: [...string]
    Cooldown?:                string
    DesiredCapacity?:         string
    HealthCheckGracePeriod?:  int
    HealthCheckType?:         string
    InstanceId?:              string
    LaunchConfigurationName?: string
    LaunchTemplate?:          __LaunchTemplateSpecification
    LifecycleHookSpecificationList?: [...__LifecycleHookSpecification]
    LoadBalancerNames?: [...string]
    MaxSize: string
    MetricsCollection?: [...__MetricsCollection]
    MinSize:               string
    MixedInstancesPolicy?: __MixedInstancesPolicy
    NotificationConfigurations?: [...__NotificationConfiguration]
    PlacementGroup?:       string
    ServiceLinkedRoleARN?: string
    Tags?: [...__TagProperty]
    TargetGroupARNs?: [...string]
    TerminationPolicies?: [...string]
    VPCZoneIdentifier?: [...string]
  }
  __InstancesDistribution = {
    OnDemandAllocationStrategy?:          string
    OnDemandBaseCapacity?:                int
    OnDemandPercentageAboveBaseCapacity?: int
    SpotAllocationStrategy?:              string
    SpotInstancePools?:                   int
    SpotMaxPrice?:                        string
  }
  __LaunchTemplate = {
    LaunchTemplateSpecification: __LaunchTemplateSpecification
    Overrides?: [...__LaunchTemplateOverrides]
  }
  __LaunchTemplateOverrides = {
    InstanceType?: string
  }
  __LaunchTemplateSpecification = {
    LaunchTemplateId?:   string
    LaunchTemplateName?: string
    Version:             string
  }
  __LifecycleHookSpecification = {
    DefaultResult?:         string
    HeartbeatTimeout?:      int
    LifecycleHookName:      string
    LifecycleTransition:    string
    NotificationMetadata?:  string
    NotificationTargetARN?: string
    RoleARN?:               string
  }
  __MetricsCollection = {
    Granularity: string
    Metrics?: [...string]
  }
  __MixedInstancesPolicy = {
    InstancesDistribution?: __InstancesDistribution
    LaunchTemplate:         __LaunchTemplate
  }
  __NotificationConfiguration = {
    NotificationTypes?: [...string]
    TopicARN: string
  }
  __TagProperty = {
    Key:               string
    PropagateAtLaunch: bool
    Value:             string
  }
}
LaunchConfiguration :: {
  Type: "AWS::AutoScaling::LaunchConfiguration"
  Properties: {
    AssociatePublicIpAddress?: bool
    BlockDeviceMappings?: [...__BlockDeviceMapping]
    ClassicLinkVPCId?: string
    ClassicLinkVPCSecurityGroups?: [...string]
    EbsOptimized?:            bool
    IamInstanceProfile?:      string
    ImageId:                  string
    InstanceId?:              string
    InstanceMonitoring?:      bool
    InstanceType:             string
    KernelId?:                string
    KeyName?:                 string
    LaunchConfigurationName?: string
    PlacementTenancy?:        string
    RamDiskId?:               string
    SecurityGroups?: [...string]
    SpotPrice?: string
    UserData?:  string
  }
  __BlockDevice = {
    DeleteOnTermination?: bool
    Encrypted?:           bool
    Iops?:                int
    SnapshotId?:          string
    VolumeSize?:          int
    VolumeType?:          string
  }
  __BlockDeviceMapping = {
    DeviceName:   string
    Ebs?:         __BlockDevice
    NoDevice?:    bool
    VirtualName?: string
  }
}
LifecycleHook :: {
  Type: "AWS::AutoScaling::LifecycleHook"
  Properties: {
    AutoScalingGroupName:   string
    DefaultResult?:         string
    HeartbeatTimeout?:      int
    LifecycleHookName?:     string
    LifecycleTransition:    string
    NotificationMetadata?:  string
    NotificationTargetARN?: string
    RoleARN?:               string
  }
}
ScalingPolicy :: {
  Type: "AWS::AutoScaling::ScalingPolicy"
  Properties: {
    AdjustmentType?:          string
    AutoScalingGroupName:     string
    Cooldown?:                string
    EstimatedInstanceWarmup?: int
    MetricAggregationType?:   string
    MinAdjustmentMagnitude?:  int
    PolicyType?:              string
    ScalingAdjustment?:       int
    StepAdjustments?: [...__StepAdjustment]
    TargetTrackingConfiguration?: __TargetTrackingConfiguration
  }
  __CustomizedMetricSpecification = {
    Dimensions?: [...__MetricDimension]
    MetricName: string
    Namespace:  string
    Statistic:  string
    Unit?:      string
  }
  __MetricDimension = {
    Name:  string
    Value: string
  }
  __PredefinedMetricSpecification = {
    PredefinedMetricType: string
    ResourceLabel?:       string
  }
  __StepAdjustment = {
    MetricIntervalLowerBound?: float
    MetricIntervalUpperBound?: float
    ScalingAdjustment:         int
  }
  __TargetTrackingConfiguration = {
    CustomizedMetricSpecification?: __CustomizedMetricSpecification
    DisableScaleIn?:                bool
    PredefinedMetricSpecification?: __PredefinedMetricSpecification
    TargetValue:                    float
  }
}
ScheduledAction :: {
  Type: "AWS::AutoScaling::ScheduledAction"
  Properties: {
    AutoScalingGroupName: string
    DesiredCapacity?:     int
    EndTime?:             string
    MaxSize?:             int
    MinSize?:             int
    Recurrence?:          string
    StartTime?:           string
  }
}

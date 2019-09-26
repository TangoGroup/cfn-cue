package AutoScaling

AutoScalingGroup :: {
	Type: "AWS::AutoScaling::AutoScalingGroup"
	Properties: {
		AutoScalingGroupName?: string
		AvailabilityZones?: [...string]
		Cooldown?:                string
		DesiredCapacity?:         string
		HealthCheckGracePeriod?:  int
		HealthCheckType?:         "EC2" | "ELB"
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
	__InstancesDistribution :: {
		OnDemandAllocationStrategy?:          string
		OnDemandBaseCapacity?:                int
		OnDemandPercentageAboveBaseCapacity?: int
		SpotAllocationStrategy?:              string
		SpotInstancePools?:                   int
		SpotMaxPrice?:                        string
	}
	__LaunchTemplate :: {
		LaunchTemplateSpecification: __LaunchTemplateSpecification
		Overrides?: [...__LaunchTemplateOverrides]
	}
	__LaunchTemplateOverrides :: {
		InstanceType?: string
	}
	__LaunchTemplateSpecification :: {
		LaunchTemplateId?:   string
		LaunchTemplateName?: string
		Version:             string
	}
	__LifecycleHookSpecification :: {
		DefaultResult?:         "ABANDON" | "CONTINUE"
		DefaultResult?:         string
		HeartbeatTimeout?:      int
		LifecycleHookName:      string
		LifecycleTransition:    "autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING"
		LifecycleTransition:    string
		NotificationMetadata?:  string
		NotificationTargetARN?: string
		RoleARN?:               string
	}
	__MetricsCollection :: {
		Granularity: string
		Metrics?: [...string]
	}
	__MixedInstancesPolicy :: {
		InstancesDistribution?: __InstancesDistribution
		LaunchTemplate:         __LaunchTemplate
	}
	__NotificationConfiguration :: {
		NotificationTypes?: [...string]
		TopicARN: string
	}
	__TagProperty :: {
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
		InstanceType:             "a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge"
		InstanceType:             string
		KernelId?:                string
		KeyName?:                 string
		LaunchConfigurationName?: string
		PlacementTenancy?:        "dedicated" | "default"
		PlacementTenancy?:        string
		RamDiskId?:               string
		SecurityGroups?: [...string]
		SpotPrice?: string
		UserData?:  string
	}
	__BlockDevice :: {
		DeleteOnTermination?: bool
		Encrypted?:           bool
		Iops?:                int
		SnapshotId?:          string
		VolumeSize?:          int
		VolumeType?:          "gp2" | "io1" | "sc1" | "st1" | "standard"
		VolumeType?:          string
	}
	__BlockDeviceMapping :: {
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
		DefaultResult?:         "ABANDON" | "CONTINUE"
		DefaultResult?:         string
		HeartbeatTimeout?:      int
		LifecycleHookName?:     string
		LifecycleTransition:    "autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING"
		LifecycleTransition:    string
		NotificationMetadata?:  string
		NotificationTargetARN?: string
		RoleARN?:               string
	}
}
ScalingPolicy :: {
	Type: "AWS::AutoScaling::ScalingPolicy"
	Properties: {
		AdjustmentType?:          "ChangeInCapacity" | "ExactCapacity" | "PercentChangeInCapacity"
		AdjustmentType?:          string
		AutoScalingGroupName:     string
		Cooldown?:                string
		EstimatedInstanceWarmup?: int
		MetricAggregationType?:   "Average" | "Maximum" | "Minimum"
		MetricAggregationType?:   string
		MinAdjustmentMagnitude?:  int
		PolicyType?:              "SimpleScaling" | "StepScaling" | "TargetTrackingScaling"
		PolicyType?:              string
		ScalingAdjustment?:       int
		StepAdjustments?: [...__StepAdjustment]
		TargetTrackingConfiguration?: __TargetTrackingConfiguration
	}
	__CustomizedMetricSpecification :: {
		Dimensions?: [...__MetricDimension]
		MetricName: string
		Namespace:  string
		Statistic:  "Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum"
		Statistic:  string
		Unit?:      string
	}
	__MetricDimension :: {
		Name:  string
		Value: string
	}
	__PredefinedMetricSpecification :: {
		PredefinedMetricType: "ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut"
		PredefinedMetricType: string
		ResourceLabel?:       string
	}
	__StepAdjustment :: {
		MetricIntervalLowerBound?: float
		MetricIntervalUpperBound?: float
		ScalingAdjustment:         int
	}
	__TargetTrackingConfiguration :: {
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

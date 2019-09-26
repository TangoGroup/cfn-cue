package EMR

Cluster :: {
	Type: "AWS::EMR::Cluster"
	Properties: {
		AdditionalInfo?: {
		}
		Applications?: [...__Application]
		AutoScalingRole?: string
		BootstrapActions?: [...__BootstrapActionConfig]
		Configurations?: [...__Configuration]
		CustomAmiId?:           string
		EbsRootVolumeSize?:     int
		Instances:              __JobFlowInstancesConfig
		JobFlowRole:            =~"[a-zA-Z0-9+=,.@\-_]+"
		JobFlowRole:            string
		KerberosAttributes?:    __KerberosAttributes
		LogUri?:                string
		Name:                   string
		ReleaseLabel?:          string
		ScaleDownBehavior?:     string
		SecurityConfiguration?: string
		ServiceRole:            string
		Steps?: [...__StepConfig]
		Tags?: [...__Tag]
		VisibleToAllUsers?: bool
	}
	__Application :: {
		AdditionalInfo?: {
		}
		Args?: [...string]
		Name?:    string
		Version?: string
	}
	__AutoScalingPolicy :: {
		Constraints: __ScalingConstraints
		Rules: [...__ScalingRule]
	}
	__BootstrapActionConfig :: {
		Name:                  string
		ScriptBootstrapAction: __ScriptBootstrapActionConfig
	}
	__CloudWatchAlarmDefinition :: {
		ComparisonOperator: string
		Dimensions?: [...__MetricDimension]
		EvaluationPeriods?: int
		MetricName:         string
		Namespace?:         string
		Period:             int
		Statistic?:         string
		Threshold:          float
		Unit?:              string
	}
	__Configuration :: {
		Classification?: string
		ConfigurationProperties?: {
		}
		Configurations?: [...__Configuration]
	}
	__EbsBlockDeviceConfig :: {
		VolumeSpecification: __VolumeSpecification
		VolumesPerInstance?: int
	}
	__EbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...__EbsBlockDeviceConfig]
		EbsOptimized?: bool
	}
	__HadoopJarStepConfig :: {
		Args?: [...string]
		Jar:        string
		MainClass?: string
		StepProperties?: [...__KeyValue]
	}
	__InstanceFleetConfig :: {
		InstanceTypeConfigs?: [...__InstanceTypeConfig]
		LaunchSpecifications?:   __InstanceFleetProvisioningSpecifications
		Name?:                   string
		TargetOnDemandCapacity?: int
		TargetSpotCapacity?:     int
	}
	__InstanceFleetProvisioningSpecifications :: {
		SpotSpecification: __SpotProvisioningSpecification
	}
	__InstanceGroupConfig :: {
		AutoScalingPolicy?: __AutoScalingPolicy
		BidPrice?:          string
		Configurations?: [...__Configuration]
		EbsConfiguration?: __EbsConfiguration
		InstanceCount:     int
		InstanceType:      string
		Market?:           string
		Name?:             string
	}
	__InstanceTypeConfig :: {
		BidPrice?:                            string
		BidPriceAsPercentageOfOnDemandPrice?: float
		Configurations?: [...__Configuration]
		EbsConfiguration?: __EbsConfiguration
		InstanceType:      string
		WeightedCapacity?: int
	}
	__JobFlowInstancesConfig :: {
		AdditionalMasterSecurityGroups?: [...string]
		AdditionalSlaveSecurityGroups?: [...string]
		CoreInstanceFleet?: __InstanceFleetConfig
		CoreInstanceGroup?: __InstanceGroupConfig
		Ec2KeyName?:        string
		Ec2SubnetId?:       string
		Ec2SubnetIds?: [...string]
		EmrManagedMasterSecurityGroup?: string
		EmrManagedSlaveSecurityGroup?:  string
		HadoopVersion?:                 string
		KeepJobFlowAliveWhenNoSteps?:   bool
		MasterInstanceFleet?:           __InstanceFleetConfig
		MasterInstanceGroup?:           __InstanceGroupConfig
		Placement?:                     __PlacementType
		ServiceAccessSecurityGroup?:    string
		TerminationProtected?:          bool
	}
	__KerberosAttributes :: {
		ADDomainJoinPassword?:             string
		ADDomainJoinUser?:                 string
		CrossRealmTrustPrincipalPassword?: string
		KdcAdminPassword:                  string
		Realm:                             string
	}
	__KeyValue :: {
		Key?:   string
		Value?: string
	}
	__MetricDimension :: {
		Key:   string
		Value: string
	}
	__PlacementType :: {
		AvailabilityZone: string
	}
	__ScalingAction :: {
		Market?:                          string
		SimpleScalingPolicyConfiguration: __SimpleScalingPolicyConfiguration
	}
	__ScalingConstraints :: {
		MaxCapacity: int
		MinCapacity: int
	}
	__ScalingRule :: {
		Action:       __ScalingAction
		Description?: string
		Name:         string
		Trigger:      __ScalingTrigger
	}
	__ScalingTrigger :: {
		CloudWatchAlarmDefinition: __CloudWatchAlarmDefinition
	}
	__ScriptBootstrapActionConfig :: {
		Args?: [...string]
		Path: string
	}
	__SimpleScalingPolicyConfiguration :: {
		AdjustmentType?:   string
		CoolDown?:         int
		ScalingAdjustment: int
	}
	__SpotProvisioningSpecification :: {
		BlockDurationMinutes?:  int
		TimeoutAction:          string
		TimeoutDurationMinutes: int
	}
	__StepConfig :: {
		ActionOnFailure?: string
		HadoopJarStep:    __HadoopJarStepConfig
		Name:             string
	}
	__VolumeSpecification :: {
		Iops?:      int
		SizeInGB:   int
		VolumeType: string
	}
}
InstanceFleetConfig :: {
	Type: "AWS::EMR::InstanceFleetConfig"
	Properties: {
		ClusterId:         string
		InstanceFleetType: string
		InstanceTypeConfigs?: [...__InstanceTypeConfig]
		LaunchSpecifications?:   __InstanceFleetProvisioningSpecifications
		Name?:                   string
		TargetOnDemandCapacity?: int
		TargetSpotCapacity?:     int
	}
	__Configuration :: {
		Classification?: string
		ConfigurationProperties?: {
		}
		Configurations?: [...__Configuration]
	}
	__EbsBlockDeviceConfig :: {
		VolumeSpecification: __VolumeSpecification
		VolumesPerInstance?: int
	}
	__EbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...__EbsBlockDeviceConfig]
		EbsOptimized?: bool
	}
	__InstanceFleetProvisioningSpecifications :: {
		SpotSpecification: __SpotProvisioningSpecification
	}
	__InstanceTypeConfig :: {
		BidPrice?:                            string
		BidPriceAsPercentageOfOnDemandPrice?: float
		Configurations?: [...__Configuration]
		EbsConfiguration?: __EbsConfiguration
		InstanceType:      string
		WeightedCapacity?: int
	}
	__SpotProvisioningSpecification :: {
		BlockDurationMinutes?:  int
		TimeoutAction:          string
		TimeoutDurationMinutes: int
	}
	__VolumeSpecification :: {
		Iops?:      int
		SizeInGB:   int
		VolumeType: string
	}
}
InstanceGroupConfig :: {
	Type: "AWS::EMR::InstanceGroupConfig"
	Properties: {
		AutoScalingPolicy?: __AutoScalingPolicy
		BidPrice?:          string
		Configurations?: [...__Configuration]
		EbsConfiguration?: __EbsConfiguration
		InstanceCount:     int
		InstanceRole:      string
		InstanceType:      string
		JobFlowId:         string
		Market?:           string
		Name?:             string
	}
	__AutoScalingPolicy :: {
		Constraints: __ScalingConstraints
		Rules: [...__ScalingRule]
	}
	__CloudWatchAlarmDefinition :: {
		ComparisonOperator: string
		Dimensions?: [...__MetricDimension]
		EvaluationPeriods?: int
		MetricName:         string
		Namespace?:         string
		Period:             int
		Statistic?:         string
		Threshold:          float
		Unit?:              string
	}
	__Configuration :: {
		Classification?: string
		ConfigurationProperties?: {
		}
		Configurations?: [...__Configuration]
	}
	__EbsBlockDeviceConfig :: {
		VolumeSpecification: __VolumeSpecification
		VolumesPerInstance?: int
	}
	__EbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...__EbsBlockDeviceConfig]
		EbsOptimized?: bool
	}
	__MetricDimension :: {
		Key:   string
		Value: string
	}
	__ScalingAction :: {
		Market?:                          string
		SimpleScalingPolicyConfiguration: __SimpleScalingPolicyConfiguration
	}
	__ScalingConstraints :: {
		MaxCapacity: int
		MinCapacity: int
	}
	__ScalingRule :: {
		Action:       __ScalingAction
		Description?: string
		Name:         string
		Trigger:      __ScalingTrigger
	}
	__ScalingTrigger :: {
		CloudWatchAlarmDefinition: __CloudWatchAlarmDefinition
	}
	__SimpleScalingPolicyConfiguration :: {
		AdjustmentType?:   string
		CoolDown?:         int
		ScalingAdjustment: int
	}
	__VolumeSpecification :: {
		Iops?:      int
		SizeInGB:   int
		VolumeType: string
	}
}
SecurityConfiguration :: {
	Type: "AWS::EMR::SecurityConfiguration"
	Properties: {
		Name?: string
		SecurityConfiguration: {
		}
	}
}
Step :: {
	Type: "AWS::EMR::Step"
	Properties: {
		ActionOnFailure: string
		HadoopJarStep:   __HadoopJarStepConfig
		JobFlowId:       string
		Name:            string
	}
	__HadoopJarStepConfig :: {
		Args?: [...string]
		Jar:        string
		MainClass?: string
		StepProperties?: [...__KeyValue]
	}
	__KeyValue :: {
		Key?:   string
		Value?: string
	}
}

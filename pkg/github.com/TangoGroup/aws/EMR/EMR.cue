package EMR

import "github.com/TangoGroup/fn"

Cluster :: {
	Type: "AWS::EMR::Cluster"
	Properties: {
		AdditionalInfo?: {
		} | fn.Fn
		Applications?: [...propApplication]
		AutoScalingRole?: string | fn.Fn
		BootstrapActions?: [...propBootstrapActionConfig]
		Configurations?: [...propConfiguration]
		CustomAmiId?:           string | fn.Fn
		EbsRootVolumeSize?:     int | fn.Fn
		Instances:              propJobFlowInstancesConfig
		JobFlowRole:            (string & (=~#"[a-zA-Z0-9+=,.@\-_]+"#)) | fn.Fn
		KerberosAttributes?:    propKerberosAttributes
		LogUri?:                string | fn.Fn
		Name:                   string | fn.Fn
		ReleaseLabel?:          string | fn.Fn
		ScaleDownBehavior?:     string | fn.Fn
		SecurityConfiguration?: string | fn.Fn
		ServiceRole:            string | fn.Fn
		Steps?: [...propStepConfig]
		Tags?: [...propTag]
		VisibleToAllUsers?: bool | fn.Fn
	}
	propApplication :: {
		AdditionalInfo?: {
		}
		Args?: [...(string | fn.Fn)]
		Name?:    string | fn.Fn
		Version?: string | fn.Fn
	}
	propAutoScalingPolicy :: {
		Constraints: propScalingConstraints
		Rules: [...propScalingRule]
	}
	propBootstrapActionConfig :: {
		Name:                  string | fn.Fn
		ScriptBootstrapAction: propScriptBootstrapActionConfig
	}
	propCloudWatchAlarmDefinition :: {
		ComparisonOperator: string | fn.Fn
		Dimensions?: [...propMetricDimension]
		EvaluationPeriods?: int | fn.Fn
		MetricName:         string | fn.Fn
		Namespace?:         string | fn.Fn
		Period:             int | fn.Fn
		Statistic?:         string | fn.Fn
		Threshold:          float | fn.Fn
		Unit?:              string | fn.Fn
	}
	propConfiguration :: {
		Classification?: string | fn.Fn
		ConfigurationProperties?: {
		}
		Configurations?: [...propConfiguration]
	}
	propEbsBlockDeviceConfig :: {
		VolumeSpecification: propVolumeSpecification
		VolumesPerInstance?: int | fn.Fn
	}
	propEbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...propEbsBlockDeviceConfig]
		EbsOptimized?: bool | fn.Fn
	}
	propHadoopJarStepConfig :: {
		Args?: [...(string | fn.Fn)]
		Jar:        string | fn.Fn
		MainClass?: string | fn.Fn
		StepProperties?: [...propKeyValue]
	}
	propInstanceFleetConfig :: {
		InstanceTypeConfigs?: [...propInstanceTypeConfig]
		LaunchSpecifications?:   propInstanceFleetProvisioningSpecifications
		Name?:                   string | fn.Fn
		TargetOnDemandCapacity?: int | fn.Fn
		TargetSpotCapacity?:     int | fn.Fn
	}
	propInstanceFleetProvisioningSpecifications :: {
		SpotSpecification: propSpotProvisioningSpecification
	}
	propInstanceGroupConfig :: {
		AutoScalingPolicy?: propAutoScalingPolicy
		BidPrice?:          string | fn.Fn
		Configurations?: [...propConfiguration]
		EbsConfiguration?: propEbsConfiguration
		InstanceCount:     int | fn.Fn
		InstanceType:      string | fn.Fn
		Market?:           string | fn.Fn
		Name?:             string | fn.Fn
	}
	propInstanceTypeConfig :: {
		BidPrice?:                            string | fn.Fn
		BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
		Configurations?: [...propConfiguration]
		EbsConfiguration?: propEbsConfiguration
		InstanceType:      string | fn.Fn
		WeightedCapacity?: int | fn.Fn
	}
	propJobFlowInstancesConfig :: {
		AdditionalMasterSecurityGroups?: [...(string | fn.Fn)]
		AdditionalSlaveSecurityGroups?: [...(string | fn.Fn)]
		CoreInstanceFleet?: propInstanceFleetConfig
		CoreInstanceGroup?: propInstanceGroupConfig
		Ec2KeyName?:        string | fn.Fn
		Ec2SubnetId?:       string | fn.Fn
		Ec2SubnetIds?: [...(string | fn.Fn)]
		EmrManagedMasterSecurityGroup?: string | fn.Fn
		EmrManagedSlaveSecurityGroup?:  string | fn.Fn
		HadoopVersion?:                 string | fn.Fn
		KeepJobFlowAliveWhenNoSteps?:   bool | fn.Fn
		MasterInstanceFleet?:           propInstanceFleetConfig
		MasterInstanceGroup?:           propInstanceGroupConfig
		Placement?:                     propPlacementType
		ServiceAccessSecurityGroup?:    string | fn.Fn
		TerminationProtected?:          bool | fn.Fn
	}
	propKerberosAttributes :: {
		ADDomainJoinPassword?:             string | fn.Fn
		ADDomainJoinUser?:                 string | fn.Fn
		CrossRealmTrustPrincipalPassword?: string | fn.Fn
		KdcAdminPassword:                  string | fn.Fn
		Realm:                             string | fn.Fn
	}
	propKeyValue :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
	propMetricDimension :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	propPlacementType :: {
		AvailabilityZone: string | fn.Fn
	}
	propScalingAction :: {
		Market?:                          string | fn.Fn
		SimpleScalingPolicyConfiguration: propSimpleScalingPolicyConfiguration
	}
	propScalingConstraints :: {
		MaxCapacity: int | fn.Fn
		MinCapacity: int | fn.Fn
	}
	propScalingRule :: {
		Action:       propScalingAction
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		Trigger:      propScalingTrigger
	}
	propScalingTrigger :: {
		CloudWatchAlarmDefinition: propCloudWatchAlarmDefinition
	}
	propScriptBootstrapActionConfig :: {
		Args?: [...(string | fn.Fn)]
		Path: string | fn.Fn
	}
	propSimpleScalingPolicyConfiguration :: {
		AdjustmentType?:   string | fn.Fn
		CoolDown?:         int | fn.Fn
		ScalingAdjustment: int | fn.Fn
	}
	propSpotProvisioningSpecification :: {
		BlockDurationMinutes?:  int | fn.Fn
		TimeoutAction:          string | fn.Fn
		TimeoutDurationMinutes: int | fn.Fn
	}
	propStepConfig :: {
		ActionOnFailure?: string | fn.Fn
		HadoopJarStep:    propHadoopJarStepConfig
		Name:             string | fn.Fn
	}
	propVolumeSpecification :: {
		Iops?:      int | fn.Fn
		SizeInGB:   int | fn.Fn
		VolumeType: string | fn.Fn
	}
}
InstanceFleetConfig :: {
	Type: "AWS::EMR::InstanceFleetConfig"
	Properties: {
		ClusterId:         string | fn.Fn
		InstanceFleetType: string | fn.Fn
		InstanceTypeConfigs?: [...propInstanceTypeConfig]
		LaunchSpecifications?:   propInstanceFleetProvisioningSpecifications
		Name?:                   string | fn.Fn
		TargetOnDemandCapacity?: int | fn.Fn
		TargetSpotCapacity?:     int | fn.Fn
	}
	propConfiguration :: {
		Classification?: string | fn.Fn
		ConfigurationProperties?: {
		}
		Configurations?: [...propConfiguration]
	}
	propEbsBlockDeviceConfig :: {
		VolumeSpecification: propVolumeSpecification
		VolumesPerInstance?: int | fn.Fn
	}
	propEbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...propEbsBlockDeviceConfig]
		EbsOptimized?: bool | fn.Fn
	}
	propInstanceFleetProvisioningSpecifications :: {
		SpotSpecification: propSpotProvisioningSpecification
	}
	propInstanceTypeConfig :: {
		BidPrice?:                            string | fn.Fn
		BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
		Configurations?: [...propConfiguration]
		EbsConfiguration?: propEbsConfiguration
		InstanceType:      string | fn.Fn
		WeightedCapacity?: int | fn.Fn
	}
	propSpotProvisioningSpecification :: {
		BlockDurationMinutes?:  int | fn.Fn
		TimeoutAction:          string | fn.Fn
		TimeoutDurationMinutes: int | fn.Fn
	}
	propVolumeSpecification :: {
		Iops?:      int | fn.Fn
		SizeInGB:   int | fn.Fn
		VolumeType: string | fn.Fn
	}
}
InstanceGroupConfig :: {
	Type: "AWS::EMR::InstanceGroupConfig"
	Properties: {
		AutoScalingPolicy?: propAutoScalingPolicy
		BidPrice?:          string | fn.Fn
		Configurations?: [...propConfiguration]
		EbsConfiguration?: propEbsConfiguration
		InstanceCount:     int | fn.Fn
		InstanceRole:      string | fn.Fn
		InstanceType:      string | fn.Fn
		JobFlowId:         string | fn.Fn
		Market?:           string | fn.Fn
		Name?:             string | fn.Fn
	}
	propAutoScalingPolicy :: {
		Constraints: propScalingConstraints
		Rules: [...propScalingRule]
	}
	propCloudWatchAlarmDefinition :: {
		ComparisonOperator: string | fn.Fn
		Dimensions?: [...propMetricDimension]
		EvaluationPeriods?: int | fn.Fn
		MetricName:         string | fn.Fn
		Namespace?:         string | fn.Fn
		Period:             int | fn.Fn
		Statistic?:         string | fn.Fn
		Threshold:          float | fn.Fn
		Unit?:              string | fn.Fn
	}
	propConfiguration :: {
		Classification?: string | fn.Fn
		ConfigurationProperties?: {
		}
		Configurations?: [...propConfiguration]
	}
	propEbsBlockDeviceConfig :: {
		VolumeSpecification: propVolumeSpecification
		VolumesPerInstance?: int | fn.Fn
	}
	propEbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...propEbsBlockDeviceConfig]
		EbsOptimized?: bool | fn.Fn
	}
	propMetricDimension :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	propScalingAction :: {
		Market?:                          string | fn.Fn
		SimpleScalingPolicyConfiguration: propSimpleScalingPolicyConfiguration
	}
	propScalingConstraints :: {
		MaxCapacity: int | fn.Fn
		MinCapacity: int | fn.Fn
	}
	propScalingRule :: {
		Action:       propScalingAction
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		Trigger:      propScalingTrigger
	}
	propScalingTrigger :: {
		CloudWatchAlarmDefinition: propCloudWatchAlarmDefinition
	}
	propSimpleScalingPolicyConfiguration :: {
		AdjustmentType?:   string | fn.Fn
		CoolDown?:         int | fn.Fn
		ScalingAdjustment: int | fn.Fn
	}
	propVolumeSpecification :: {
		Iops?:      int | fn.Fn
		SizeInGB:   int | fn.Fn
		VolumeType: string | fn.Fn
	}
}
SecurityConfiguration :: {
	Type: "AWS::EMR::SecurityConfiguration"
	Properties: {
		Name?:                 string | fn.Fn
		SecurityConfiguration: {
		} | fn.Fn
	}
}
Step :: {
	Type: "AWS::EMR::Step"
	Properties: {
		ActionOnFailure: string | fn.Fn
		HadoopJarStep:   propHadoopJarStepConfig
		JobFlowId:       string | fn.Fn
		Name:            string | fn.Fn
	}
	propHadoopJarStepConfig :: {
		Args?: [...(string | fn.Fn)]
		Jar:        string | fn.Fn
		MainClass?: string | fn.Fn
		StepProperties?: [...propKeyValue]
	}
	propKeyValue :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
}

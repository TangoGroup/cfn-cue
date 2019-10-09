package EMR

import "github.com/TangoGroup/fn"

Cluster :: {
	Type: "AWS::EMR::Cluster"
	Properties: {
		AdditionalInfo?: {
		} | fn.Fn
		Applications?: [...__Application]
		AutoScalingRole?: string | fn.Fn
		BootstrapActions?: [...__BootstrapActionConfig]
		Configurations?: [...__Configuration]
		CustomAmiId?:           string | fn.Fn
		EbsRootVolumeSize?:     int | fn.Fn
		Instances:              __JobFlowInstancesConfig
		JobFlowRole:            (string & (=~#"[a-zA-Z0-9+=,.@\-_]+"#)) | fn.Fn
		KerberosAttributes?:    __KerberosAttributes
		LogUri?:                string | fn.Fn
		Name:                   string | fn.Fn
		ReleaseLabel?:          string | fn.Fn
		ScaleDownBehavior?:     string | fn.Fn
		SecurityConfiguration?: string | fn.Fn
		ServiceRole:            string | fn.Fn
		Steps?: [...__StepConfig]
		Tags?: [...__Tag]
		VisibleToAllUsers?: bool | fn.Fn
	}
	__Application :: {
		AdditionalInfo?: {
		}
		Args?:    [...string] | fn.Fn
		Name?:    string | fn.Fn
		Version?: string | fn.Fn
	}
	__AutoScalingPolicy :: {
		Constraints: __ScalingConstraints
		Rules: [...__ScalingRule]
	}
	__BootstrapActionConfig :: {
		Name:                  string | fn.Fn
		ScriptBootstrapAction: __ScriptBootstrapActionConfig
	}
	__CloudWatchAlarmDefinition :: {
		ComparisonOperator: string | fn.Fn
		Dimensions?: [...__MetricDimension]
		EvaluationPeriods?: int | fn.Fn
		MetricName:         string | fn.Fn
		Namespace?:         string | fn.Fn
		Period:             int | fn.Fn
		Statistic?:         string | fn.Fn
		Threshold:          float | fn.Fn
		Unit?:              string | fn.Fn
	}
	__Configuration :: {
		Classification?: string | fn.Fn
		ConfigurationProperties?: {
		}
		Configurations?: [...__Configuration]
	}
	__EbsBlockDeviceConfig :: {
		VolumeSpecification: __VolumeSpecification
		VolumesPerInstance?: int | fn.Fn
	}
	__EbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...__EbsBlockDeviceConfig]
		EbsOptimized?: bool | fn.Fn
	}
	__HadoopJarStepConfig :: {
		Args?:      [...string] | fn.Fn
		Jar:        string | fn.Fn
		MainClass?: string | fn.Fn
		StepProperties?: [...__KeyValue]
	}
	__InstanceFleetConfig :: {
		InstanceTypeConfigs?: [...__InstanceTypeConfig]
		LaunchSpecifications?:   __InstanceFleetProvisioningSpecifications
		Name?:                   string | fn.Fn
		TargetOnDemandCapacity?: int | fn.Fn
		TargetSpotCapacity?:     int | fn.Fn
	}
	__InstanceFleetProvisioningSpecifications :: {
		SpotSpecification: __SpotProvisioningSpecification
	}
	__InstanceGroupConfig :: {
		AutoScalingPolicy?: __AutoScalingPolicy
		BidPrice?:          string | fn.Fn
		Configurations?: [...__Configuration]
		EbsConfiguration?: __EbsConfiguration
		InstanceCount:     int | fn.Fn
		InstanceType:      string | fn.Fn
		Market?:           string | fn.Fn
		Name?:             string | fn.Fn
	}
	__InstanceTypeConfig :: {
		BidPrice?:                            string | fn.Fn
		BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
		Configurations?: [...__Configuration]
		EbsConfiguration?: __EbsConfiguration
		InstanceType:      string | fn.Fn
		WeightedCapacity?: int | fn.Fn
	}
	__JobFlowInstancesConfig :: {
		AdditionalMasterSecurityGroups?: [...string] | fn.Fn
		AdditionalSlaveSecurityGroups?:  [...string] | fn.Fn
		CoreInstanceFleet?:              __InstanceFleetConfig
		CoreInstanceGroup?:              __InstanceGroupConfig
		Ec2KeyName?:                     string | fn.Fn
		Ec2SubnetId?:                    string | fn.Fn
		Ec2SubnetIds?:                   [...string] | fn.Fn
		EmrManagedMasterSecurityGroup?:  string | fn.Fn
		EmrManagedSlaveSecurityGroup?:   string | fn.Fn
		HadoopVersion?:                  string | fn.Fn
		KeepJobFlowAliveWhenNoSteps?:    bool | fn.Fn
		MasterInstanceFleet?:            __InstanceFleetConfig
		MasterInstanceGroup?:            __InstanceGroupConfig
		Placement?:                      __PlacementType
		ServiceAccessSecurityGroup?:     string | fn.Fn
		TerminationProtected?:           bool | fn.Fn
	}
	__KerberosAttributes :: {
		ADDomainJoinPassword?:             string | fn.Fn
		ADDomainJoinUser?:                 string | fn.Fn
		CrossRealmTrustPrincipalPassword?: string | fn.Fn
		KdcAdminPassword:                  string | fn.Fn
		Realm:                             string | fn.Fn
	}
	__KeyValue :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
	__MetricDimension :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	__PlacementType :: {
		AvailabilityZone: string | fn.Fn
	}
	__ScalingAction :: {
		Market?:                          string | fn.Fn
		SimpleScalingPolicyConfiguration: __SimpleScalingPolicyConfiguration
	}
	__ScalingConstraints :: {
		MaxCapacity: int | fn.Fn
		MinCapacity: int | fn.Fn
	}
	__ScalingRule :: {
		Action:       __ScalingAction
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		Trigger:      __ScalingTrigger
	}
	__ScalingTrigger :: {
		CloudWatchAlarmDefinition: __CloudWatchAlarmDefinition
	}
	__ScriptBootstrapActionConfig :: {
		Args?: [...string] | fn.Fn
		Path:  string | fn.Fn
	}
	__SimpleScalingPolicyConfiguration :: {
		AdjustmentType?:   string | fn.Fn
		CoolDown?:         int | fn.Fn
		ScalingAdjustment: int | fn.Fn
	}
	__SpotProvisioningSpecification :: {
		BlockDurationMinutes?:  int | fn.Fn
		TimeoutAction:          string | fn.Fn
		TimeoutDurationMinutes: int | fn.Fn
	}
	__StepConfig :: {
		ActionOnFailure?: string | fn.Fn
		HadoopJarStep:    __HadoopJarStepConfig
		Name:             string | fn.Fn
	}
	__VolumeSpecification :: {
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
		InstanceTypeConfigs?: [...__InstanceTypeConfig]
		LaunchSpecifications?:   __InstanceFleetProvisioningSpecifications
		Name?:                   string | fn.Fn
		TargetOnDemandCapacity?: int | fn.Fn
		TargetSpotCapacity?:     int | fn.Fn
	}
	__Configuration :: {
		Classification?: string | fn.Fn
		ConfigurationProperties?: {
		}
		Configurations?: [...__Configuration]
	}
	__EbsBlockDeviceConfig :: {
		VolumeSpecification: __VolumeSpecification
		VolumesPerInstance?: int | fn.Fn
	}
	__EbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...__EbsBlockDeviceConfig]
		EbsOptimized?: bool | fn.Fn
	}
	__InstanceFleetProvisioningSpecifications :: {
		SpotSpecification: __SpotProvisioningSpecification
	}
	__InstanceTypeConfig :: {
		BidPrice?:                            string | fn.Fn
		BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
		Configurations?: [...__Configuration]
		EbsConfiguration?: __EbsConfiguration
		InstanceType:      string | fn.Fn
		WeightedCapacity?: int | fn.Fn
	}
	__SpotProvisioningSpecification :: {
		BlockDurationMinutes?:  int | fn.Fn
		TimeoutAction:          string | fn.Fn
		TimeoutDurationMinutes: int | fn.Fn
	}
	__VolumeSpecification :: {
		Iops?:      int | fn.Fn
		SizeInGB:   int | fn.Fn
		VolumeType: string | fn.Fn
	}
}
InstanceGroupConfig :: {
	Type: "AWS::EMR::InstanceGroupConfig"
	Properties: {
		AutoScalingPolicy?: __AutoScalingPolicy
		BidPrice?:          string | fn.Fn
		Configurations?: [...__Configuration]
		EbsConfiguration?: __EbsConfiguration
		InstanceCount:     int | fn.Fn
		InstanceRole:      string | fn.Fn
		InstanceType:      string | fn.Fn
		JobFlowId:         string | fn.Fn
		Market?:           string | fn.Fn
		Name?:             string | fn.Fn
	}
	__AutoScalingPolicy :: {
		Constraints: __ScalingConstraints
		Rules: [...__ScalingRule]
	}
	__CloudWatchAlarmDefinition :: {
		ComparisonOperator: string | fn.Fn
		Dimensions?: [...__MetricDimension]
		EvaluationPeriods?: int | fn.Fn
		MetricName:         string | fn.Fn
		Namespace?:         string | fn.Fn
		Period:             int | fn.Fn
		Statistic?:         string | fn.Fn
		Threshold:          float | fn.Fn
		Unit?:              string | fn.Fn
	}
	__Configuration :: {
		Classification?: string | fn.Fn
		ConfigurationProperties?: {
		}
		Configurations?: [...__Configuration]
	}
	__EbsBlockDeviceConfig :: {
		VolumeSpecification: __VolumeSpecification
		VolumesPerInstance?: int | fn.Fn
	}
	__EbsConfiguration :: {
		EbsBlockDeviceConfigs?: [...__EbsBlockDeviceConfig]
		EbsOptimized?: bool | fn.Fn
	}
	__MetricDimension :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	__ScalingAction :: {
		Market?:                          string | fn.Fn
		SimpleScalingPolicyConfiguration: __SimpleScalingPolicyConfiguration
	}
	__ScalingConstraints :: {
		MaxCapacity: int | fn.Fn
		MinCapacity: int | fn.Fn
	}
	__ScalingRule :: {
		Action:       __ScalingAction
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		Trigger:      __ScalingTrigger
	}
	__ScalingTrigger :: {
		CloudWatchAlarmDefinition: __CloudWatchAlarmDefinition
	}
	__SimpleScalingPolicyConfiguration :: {
		AdjustmentType?:   string | fn.Fn
		CoolDown?:         int | fn.Fn
		ScalingAdjustment: int | fn.Fn
	}
	__VolumeSpecification :: {
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
		HadoopJarStep:   __HadoopJarStepConfig
		JobFlowId:       string | fn.Fn
		Name:            string | fn.Fn
	}
	__HadoopJarStepConfig :: {
		Args?:      [...string] | fn.Fn
		Jar:        string | fn.Fn
		MainClass?: string | fn.Fn
		StepProperties?: [...__KeyValue]
	}
	__KeyValue :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
}

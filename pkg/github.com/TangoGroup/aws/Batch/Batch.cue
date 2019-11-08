package Batch

import "github.com/TangoGroup/fn"

ComputeEnvironment :: {
	Type: "AWS::Batch::ComputeEnvironment"
	Properties: {
		ComputeEnvironmentName?: string | fn.Fn
		ComputeResources?:       propComputeResources
		ServiceRole:             (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		State?:                  string | fn.Fn
		Type:                    string | fn.Fn
	}
	propComputeResources :: {
		AllocationStrategy?: string | fn.Fn
		BidPercentage?:      int | fn.Fn
		DesiredvCpus?:       int | fn.Fn
		Ec2KeyPair?:         string | fn.Fn
		ImageId?:            string | fn.Fn
		InstanceRole:        string | fn.Fn
		InstanceTypes: [...(string | fn.Fn)]
		LaunchTemplate?: propLaunchTemplateSpecification
		MaxvCpus:        int | fn.Fn
		MinvCpus:        int | fn.Fn
		PlacementGroup?: string | fn.Fn
		SecurityGroupIds?: [...(string | fn.Fn)]
		SpotIamFleetRole?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		Subnets: [...(string | fn.Fn)]
		Tags?: {
		} | fn.Fn
		Type: string | fn.Fn
	}
	propLaunchTemplateSpecification :: {
		LaunchTemplateId?:   string | fn.Fn
		LaunchTemplateName?: string | fn.Fn
		Version?:            string | fn.Fn
	}
}
JobDefinition :: {
	Type: "AWS::Batch::JobDefinition"
	Properties: {
		ContainerProperties?: propContainerProperties
		JobDefinitionName?:   string | fn.Fn
		NodeProperties?:      propNodeProperties
		Parameters?:          {
		} | fn.Fn
		RetryStrategy?: propRetryStrategy
		Timeout?:       propTimeout
		Type:           string | fn.Fn
	}
	propContainerProperties :: {
		Command?: [...(string | fn.Fn)]
		Environment?: [...propEnvironment]
		Image:            string | fn.Fn
		InstanceType?:    string | fn.Fn
		JobRoleArn?:      string | fn.Fn
		LinuxParameters?: propLinuxParameters
		Memory:           int | fn.Fn
		MountPoints?: [...propMountPoints]
		Privileged?:             bool | fn.Fn
		ReadonlyRootFilesystem?: bool | fn.Fn
		ResourceRequirements?: [...propResourceRequirement]
		Ulimits?: [...propUlimit]
		User?: string | fn.Fn
		Vcpus: int | fn.Fn
		Volumes?: [...propVolumes]
	}
	propDevice :: {
		ContainerPath?: string | fn.Fn
		HostPath?:      string | fn.Fn
		Permissions?: [...(string | fn.Fn)]
	}
	propEnvironment :: {
		Name?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	propLinuxParameters :: {
		Devices?: [...propDevice]
	}
	propMountPoints :: {
		ContainerPath?: string | fn.Fn
		ReadOnly?:      bool | fn.Fn
		SourceVolume?:  string | fn.Fn
	}
	propNodeProperties :: {
		MainNode: int | fn.Fn
		NodeRangeProperties: [...propNodeRangeProperty]
		NumNodes: int | fn.Fn
	}
	propNodeRangeProperty :: {
		Container?:  propContainerProperties
		TargetNodes: string | fn.Fn
	}
	propResourceRequirement :: {
		Type?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	propRetryStrategy :: {
		Attempts?: int | fn.Fn
	}
	propTimeout :: {
		AttemptDurationSeconds?: int | fn.Fn
	}
	propUlimit :: {
		HardLimit: int | fn.Fn
		Name:      string | fn.Fn
		SoftLimit: int | fn.Fn
	}
	propVolumes :: {
		Host?: propVolumesHost
		Name?: string | fn.Fn
	}
	propVolumesHost :: {
		SourcePath?: string | fn.Fn
	}
}
JobQueue :: {
	Type: "AWS::Batch::JobQueue"
	Properties: {
		ComputeEnvironmentOrder: [...propComputeEnvironmentOrder]
		JobQueueName?: string | fn.Fn
		Priority:      int | fn.Fn
		State?:        string | fn.Fn
	}
	propComputeEnvironmentOrder :: {
		ComputeEnvironment: string | fn.Fn
		Order:              int | fn.Fn
	}
}

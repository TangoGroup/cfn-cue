package Batch

import "github.com/TangoGroup/fn"

ComputeEnvironment :: {
	Type: "AWS::Batch::ComputeEnvironment"
	Properties: {
		ComputeEnvironmentName?: string | fn.Fn
		ComputeResources?:       __ComputeResources
		ServiceRole:             (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		State?:                  string | fn.Fn
		Type:                    string | fn.Fn
	}
	__ComputeResources :: {
		AllocationStrategy?: string | fn.Fn
		BidPercentage?:      int | fn.Fn
		DesiredvCpus?:       int | fn.Fn
		Ec2KeyPair?:         string | fn.Fn
		ImageId?:            string | fn.Fn
		InstanceRole:        string | fn.Fn
		InstanceTypes:       [...string] | fn.Fn
		LaunchTemplate?:     __LaunchTemplateSpecification
		MaxvCpus:            int | fn.Fn
		MinvCpus:            int | fn.Fn
		PlacementGroup?:     string | fn.Fn
		SecurityGroupIds?:   [...string] | fn.Fn
		SpotIamFleetRole?:   (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		Subnets:             [...string] | fn.Fn
		Tags?:               {
		} | fn.Fn
		Type: string | fn.Fn
	}
	__LaunchTemplateSpecification :: {
		LaunchTemplateId?:   string | fn.Fn
		LaunchTemplateName?: string | fn.Fn
		Version?:            string | fn.Fn
	}
}
JobDefinition :: {
	Type: "AWS::Batch::JobDefinition"
	Properties: {
		ContainerProperties?: __ContainerProperties
		JobDefinitionName?:   string | fn.Fn
		NodeProperties?:      __NodeProperties
		Parameters?:          {
		} | fn.Fn
		RetryStrategy?: __RetryStrategy
		Timeout?:       __Timeout
		Type:           string | fn.Fn
	}
	__ContainerProperties :: {
		Command?: [...string] | fn.Fn
		Environment?: [...__Environment]
		Image:            string | fn.Fn
		InstanceType?:    string | fn.Fn
		JobRoleArn?:      string | fn.Fn
		LinuxParameters?: __LinuxParameters
		Memory:           int | fn.Fn
		MountPoints?: [...__MountPoints]
		Privileged?:             bool | fn.Fn
		ReadonlyRootFilesystem?: bool | fn.Fn
		ResourceRequirements?: [...__ResourceRequirement]
		Ulimits?: [...__Ulimit]
		User?: string | fn.Fn
		Vcpus: int | fn.Fn
		Volumes?: [...__Volumes]
	}
	__Device :: {
		ContainerPath?: string | fn.Fn
		HostPath?:      string | fn.Fn
		Permissions?:   [...string] | fn.Fn
	}
	__Environment :: {
		Name?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	__LinuxParameters :: {
		Devices?: [...__Device]
	}
	__MountPoints :: {
		ContainerPath?: string | fn.Fn
		ReadOnly?:      bool | fn.Fn
		SourceVolume?:  string | fn.Fn
	}
	__NodeProperties :: {
		MainNode: int | fn.Fn
		NodeRangeProperties: [...__NodeRangeProperty]
		NumNodes: int | fn.Fn
	}
	__NodeRangeProperty :: {
		Container?:  __ContainerProperties
		TargetNodes: string | fn.Fn
	}
	__ResourceRequirement :: {
		Type?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	__RetryStrategy :: {
		Attempts?: int | fn.Fn
	}
	__Timeout :: {
		AttemptDurationSeconds?: int | fn.Fn
	}
	__Ulimit :: {
		HardLimit: int | fn.Fn
		Name:      string | fn.Fn
		SoftLimit: int | fn.Fn
	}
	__Volumes :: {
		Host?: __VolumesHost
		Name?: string | fn.Fn
	}
	__VolumesHost :: {
		SourcePath?: string | fn.Fn
	}
}
JobQueue :: {
	Type: "AWS::Batch::JobQueue"
	Properties: {
		ComputeEnvironmentOrder: [...__ComputeEnvironmentOrder]
		JobQueueName?: string | fn.Fn
		Priority:      int | fn.Fn
		State?:        string | fn.Fn
	}
	__ComputeEnvironmentOrder :: {
		ComputeEnvironment: string | fn.Fn
		Order:              int | fn.Fn
	}
}

package Batch

ComputeEnvironment :: {
	Type: "AWS::Batch::ComputeEnvironment"
	Properties: {
		ComputeEnvironmentName?: string
		ComputeResources?:       __ComputeResources
		ServiceRole:             =~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#
		ServiceRole:             string
		State?:                  string
		Type:                    string
	}
	__ComputeResources :: {
		BidPercentage?: int
		DesiredvCpus?:  int
		Ec2KeyPair?:    string
		ImageId?:       string
		InstanceRole:   string
		InstanceTypes: [...string]
		LaunchTemplate?: __LaunchTemplateSpecification
		MaxvCpus:        int
		MinvCpus:        int
		PlacementGroup?: string
		SecurityGroupIds?: [...string]
		SpotIamFleetRole?: =~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#
		SpotIamFleetRole?: string
		Subnets: [...string]
		Tags?: {
		}
		Type: string
	}
	__LaunchTemplateSpecification :: {
		LaunchTemplateId?:   string
		LaunchTemplateName?: string
		Version?:            string
	}
}
JobDefinition :: {
	Type: "AWS::Batch::JobDefinition"
	Properties: {
		ContainerProperties?: __ContainerProperties
		JobDefinitionName?:   string
		NodeProperties?:      __NodeProperties
		Parameters?: {
		}
		RetryStrategy?: __RetryStrategy
		Timeout?:       __Timeout
		Type:           string
	}
	__ContainerProperties :: {
		Command?: [...string]
		Environment?: [...__Environment]
		Image:            string
		InstanceType?:    string
		JobRoleArn?:      string
		LinuxParameters?: __LinuxParameters
		Memory:           int
		MountPoints?: [...__MountPoints]
		Privileged?:             bool
		ReadonlyRootFilesystem?: bool
		ResourceRequirements?: [...__ResourceRequirement]
		Ulimits?: [...__Ulimit]
		User?: string
		Vcpus: int
		Volumes?: [...__Volumes]
	}
	__Device :: {
		ContainerPath?: string
		HostPath?:      string
		Permissions?: [...string]
	}
	__Environment :: {
		Name?:  string
		Value?: string
	}
	__LinuxParameters :: {
		Devices?: [...__Device]
	}
	__MountPoints :: {
		ContainerPath?: string
		ReadOnly?:      bool
		SourceVolume?:  string
	}
	__NodeProperties :: {
		MainNode: int
		NodeRangeProperties: [...__NodeRangeProperty]
		NumNodes: int
	}
	__NodeRangeProperty :: {
		Container?:  __ContainerProperties
		TargetNodes: string
	}
	__ResourceRequirement :: {
		Type?:  string
		Value?: string
	}
	__RetryStrategy :: {
		Attempts?: int
	}
	__Timeout :: {
		AttemptDurationSeconds?: int
	}
	__Ulimit :: {
		HardLimit: int
		Name:      string
		SoftLimit: int
	}
	__Volumes :: {
		Host?: __VolumesHost
		Name?: string
	}
	__VolumesHost :: {
		SourcePath?: string
	}
}
JobQueue :: {
	Type: "AWS::Batch::JobQueue"
	Properties: {
		ComputeEnvironmentOrder: [...__ComputeEnvironmentOrder]
		JobQueueName?: string
		Priority:      int
		State?:        string
	}
	__ComputeEnvironmentOrder :: {
		ComputeEnvironment: string
		Order:              int
	}
}

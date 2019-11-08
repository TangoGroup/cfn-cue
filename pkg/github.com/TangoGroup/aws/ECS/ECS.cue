package ECS

import "github.com/TangoGroup/fn"

Cluster :: {
	Type: "AWS::ECS::Cluster"
	Properties: {
		ClusterName?: string | fn.Fn
		Tags?: [...propTag]
	}
}
Service :: {
	Type: "AWS::ECS::Service"
	Properties: {
		Cluster?:                       string | fn.Fn
		DeploymentConfiguration?:       propDeploymentConfiguration
		DesiredCount?:                  int | fn.Fn
		EnableECSManagedTags?:          bool | fn.Fn
		HealthCheckGracePeriodSeconds?: int | fn.Fn
		LaunchType?:                    (string & ("EC2" | "FARGATE")) | fn.Fn
		LoadBalancers?: [...propLoadBalancer]
		NetworkConfiguration?: propNetworkConfiguration
		PlacementConstraints?: [...propPlacementConstraint]
		PlacementStrategies?: [...propPlacementStrategy]
		PlatformVersion?:    string | fn.Fn
		PropagateTags?:      string | fn.Fn
		Role?:               string | fn.Fn
		SchedulingStrategy?: (string & ("DAEMON" | "REPLICA")) | fn.Fn
		ServiceName?:        string | fn.Fn
		ServiceRegistries?: [...propServiceRegistry]
		Tags?: [...propTag]
		TaskDefinition: string | fn.Fn
	}
	propAwsVpcConfiguration :: {
		AssignPublicIp?: string | fn.Fn
		SecurityGroups?: [...(string | fn.Fn)]
		Subnets: [...(string | fn.Fn)]
	}
	propDeploymentConfiguration :: {
		MaximumPercent?:        int | fn.Fn
		MinimumHealthyPercent?: int | fn.Fn
	}
	propLoadBalancer :: {
		ContainerName?:    string | fn.Fn
		ContainerPort:     int | fn.Fn
		LoadBalancerName?: string | fn.Fn
		TargetGroupArn?:   string | fn.Fn
	}
	propNetworkConfiguration :: {
		AwsvpcConfiguration?: propAwsVpcConfiguration
	}
	propPlacementConstraint :: {
		Expression?: string | fn.Fn
		Type:        string | fn.Fn
	}
	propPlacementStrategy :: {
		Field?: string | fn.Fn
		Type:   string | fn.Fn
	}
	propServiceRegistry :: {
		ContainerName?: string | fn.Fn
		ContainerPort?: int | fn.Fn
		Port?:          int | fn.Fn
		RegistryArn?:   string | fn.Fn
	}
}
TaskDefinition :: {
	Type: "AWS::ECS::TaskDefinition"
	Properties: {
		ContainerDefinitions?: [...propContainerDefinition]
		Cpu?:              string | fn.Fn
		ExecutionRoleArn?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		Family?:           string | fn.Fn
		InferenceAccelerators?: [...propInferenceAccelerator]
		IpcMode?:     string | fn.Fn
		Memory?:      string | fn.Fn
		NetworkMode?: (string & ("awsvpc" | "bridge" | "host" | "none")) | fn.Fn
		PidMode?:     string | fn.Fn
		PlacementConstraints?: [...propTaskDefinitionPlacementConstraint]
		ProxyConfiguration?: propProxyConfiguration
		RequiresCompatibilities?: [...(string | fn.Fn)]
		Tags?: [...propTag]
		TaskRoleArn?: string | fn.Fn
		Volumes?: [...propVolume]
	}
	propContainerDefinition :: {
		Command?: [...(string | fn.Fn)]
		Cpu?: int | fn.Fn
		DependsOn?: [...propContainerDependency]
		DisableNetworking?: bool | fn.Fn
		DnsSearchDomains?: [...(string | fn.Fn)]
		DnsServers?: [...(string | fn.Fn)]
		DockerLabels?: [string]: string | fn.Fn
		DockerSecurityOptions?: [...(string | fn.Fn)]
		EntryPoint?: [...(string | fn.Fn)]
		Environment?: [...propKeyValuePair]
		Essential?: bool | fn.Fn
		ExtraHosts?: [...propHostEntry]
		HealthCheck?: propHealthCheck
		Hostname?:    string | fn.Fn
		Image?:       string | fn.Fn
		Interactive?: bool | fn.Fn
		Links?: [...(string | fn.Fn)]
		LinuxParameters?:   propLinuxParameters
		LogConfiguration?:  propLogConfiguration
		Memory?:            int | fn.Fn
		MemoryReservation?: int | fn.Fn
		MountPoints?: [...propMountPoint]
		Name?: string | fn.Fn
		PortMappings?: [...propPortMapping]
		Privileged?:             bool | fn.Fn
		PseudoTerminal?:         bool | fn.Fn
		ReadonlyRootFilesystem?: bool | fn.Fn
		RepositoryCredentials?:  propRepositoryCredentials
		ResourceRequirements?: [...propResourceRequirement]
		Secrets?: [...propSecret]
		StartTimeout?: int | fn.Fn
		StopTimeout?:  int | fn.Fn
		SystemControls?: [...propSystemControl]
		Ulimits?: [...propUlimit]
		User?: string | fn.Fn
		VolumesFrom?: [...propVolumeFrom]
		WorkingDirectory?: string | fn.Fn
	}
	propContainerDependency :: {
		Condition:     string | fn.Fn
		ContainerName: string | fn.Fn
	}
	propDevice :: {
		ContainerPath?: string | fn.Fn
		HostPath:       string | fn.Fn
		Permissions?: [...(string | fn.Fn)]
	}
	propDockerVolumeConfiguration :: {
		Autoprovision?: bool | fn.Fn
		Driver?:        string | fn.Fn
		DriverOpts?: [string]: string | fn.Fn
		Labels?: [string]:     string | fn.Fn
		Scope?: string | fn.Fn
	}
	propHealthCheck :: {
		Command: [...(string | fn.Fn)]
		Interval?:    int | fn.Fn
		Retries?:     int | fn.Fn
		StartPeriod?: int | fn.Fn
		Timeout?:     int | fn.Fn
	}
	propHostEntry :: {
		Hostname:  string | fn.Fn
		IpAddress: string | fn.Fn
	}
	propHostVolumeProperties :: {
		SourcePath?: string | fn.Fn
	}
	propInferenceAccelerator :: {
		DeviceName?: string | fn.Fn
		DeviceType?: string | fn.Fn
	}
	propKernelCapabilities :: {
		Add?: [...(string | fn.Fn)]
		Drop?: [...(string | fn.Fn)]
	}
	propKeyValuePair :: {
		Name?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	propLinuxParameters :: {
		Capabilities?: propKernelCapabilities
		Devices?: [...propDevice]
		InitProcessEnabled?: bool | fn.Fn
		SharedMemorySize?:   int | fn.Fn
		Tmpfs?: [...propTmpfs]
	}
	propLogConfiguration :: {
		LogDriver: string | fn.Fn
		Options?: [string]: string | fn.Fn
		SecretOptions?: [...propSecret]
	}
	propMountPoint :: {
		ContainerPath?: string | fn.Fn
		ReadOnly?:      bool | fn.Fn
		SourceVolume?:  string | fn.Fn
	}
	propPortMapping :: {
		ContainerPort?: int | fn.Fn
		HostPort?:      int | fn.Fn
		Protocol?:      string | fn.Fn
	}
	propProxyConfiguration :: {
		ContainerName: string | fn.Fn
		ProxyConfigurationProperties?: [...propKeyValuePair]
		Type?: (string & ("APPMESH")) | fn.Fn
	}
	propRepositoryCredentials :: {
		CredentialsParameter?: string | fn.Fn
	}
	propResourceRequirement :: {
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
	propSecret :: {
		Name:      string | fn.Fn
		ValueFrom: string | fn.Fn
	}
	propSystemControl :: {
		Namespace: string | fn.Fn
		Value:     string | fn.Fn
	}
	propTaskDefinitionPlacementConstraint :: {
		Expression?: string | fn.Fn
		Type:        string | fn.Fn
	}
	propTmpfs :: {
		ContainerPath?: string | fn.Fn
		MountOptions?: [...(string | fn.Fn)]
		Size: int | fn.Fn
	}
	propUlimit :: {
		HardLimit: int | fn.Fn
		Name:      string | fn.Fn
		SoftLimit: int | fn.Fn
	}
	propVolume :: {
		DockerVolumeConfiguration?: propDockerVolumeConfiguration
		Host?:                      propHostVolumeProperties
		Name?:                      string | fn.Fn
	}
	propVolumeFrom :: {
		ReadOnly?:        bool | fn.Fn
		SourceContainer?: string | fn.Fn
	}
}

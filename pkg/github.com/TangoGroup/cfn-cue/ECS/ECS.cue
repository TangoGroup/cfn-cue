package ECS

Cluster :: {
	Type: "AWS::ECS::Cluster"
	Properties: {
		ClusterName?: string
		Tags?: [...__Tag]
	}
}
Service :: {
	Type: "AWS::ECS::Service"
	Properties: {
		Cluster?:                       string
		DeploymentConfiguration?:       __DeploymentConfiguration
		DesiredCount?:                  int
		EnableECSManagedTags?:          bool
		HealthCheckGracePeriodSeconds?: int
		LaunchType?:                    "EC2" | "FARGATE"
		LaunchType?:                    string
		LoadBalancers?: [...__LoadBalancer]
		NetworkConfiguration?: __NetworkConfiguration
		PlacementConstraints?: [...__PlacementConstraint]
		PlacementStrategies?: [...__PlacementStrategy]
		PlatformVersion?:    string
		PropagateTags?:      string
		Role?:               string
		SchedulingStrategy?: "DAEMON" | "REPLICA"
		SchedulingStrategy?: string
		ServiceName?:        string
		ServiceRegistries?: [...__ServiceRegistry]
		Tags?: [...__Tag]
		TaskDefinition: string
	}
	__AwsVpcConfiguration :: {
		AssignPublicIp?: string
		SecurityGroups?: [...string]
		Subnets: [...string]
	}
	__DeploymentConfiguration :: {
		MaximumPercent?:        int
		MinimumHealthyPercent?: int
	}
	__LoadBalancer :: {
		ContainerName?:    string
		ContainerPort:     int
		LoadBalancerName?: string
		TargetGroupArn?:   string
	}
	__NetworkConfiguration :: {
		AwsvpcConfiguration?: __AwsVpcConfiguration
	}
	__PlacementConstraint :: {
		Expression?: string
		Type:        string
	}
	__PlacementStrategy :: {
		Field?: string
		Type:   string
	}
	__ServiceRegistry :: {
		ContainerName?: string
		ContainerPort?: int
		Port?:          int
		RegistryArn?:   string
	}
}
TaskDefinition :: {
	Type: "AWS::ECS::TaskDefinition"
	Properties: {
		ContainerDefinitions?: [...__ContainerDefinition]
		Cpu?:              string
		ExecutionRoleArn?: =~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#
		ExecutionRoleArn?: string
		Family?:           string
		IpcMode?:          string
		Memory?:           string
		NetworkMode?:      "awsvpc" | "bridge" | "host" | "none"
		NetworkMode?:      string
		PidMode?:          string
		PlacementConstraints?: [...__TaskDefinitionPlacementConstraint]
		ProxyConfiguration?: __ProxyConfiguration
		RequiresCompatibilities?: [...string]
		Tags?: [...__Tag]
		TaskRoleArn?: string
		Volumes?: [...__Volume]
	}
	__ContainerDefinition :: {
		Command?: [...string]
		Cpu?: int
		DependsOn?: [...__ContainerDependency]
		DisableNetworking?: bool
		DnsSearchDomains?: [...string]
		DnsServers?: [...string]
		DockerLabels?: {
		}
		DockerSecurityOptions?: [...string]
		EntryPoint?: [...string]
		Environment?: [...__KeyValuePair]
		Essential?: bool
		ExtraHosts?: [...__HostEntry]
		HealthCheck?: __HealthCheck
		Hostname?:    string
		Image?:       string
		Interactive?: bool
		Links?: [...string]
		LinuxParameters?:   __LinuxParameters
		LogConfiguration?:  __LogConfiguration
		Memory?:            int
		MemoryReservation?: int
		MountPoints?: [...__MountPoint]
		Name?: string
		PortMappings?: [...__PortMapping]
		Privileged?:             bool
		PseudoTerminal?:         bool
		ReadonlyRootFilesystem?: bool
		RepositoryCredentials?:  __RepositoryCredentials
		ResourceRequirements?: [...__ResourceRequirement]
		Secrets?: [...__Secret]
		StartTimeout?: int
		StopTimeout?:  int
		SystemControls?: [...__SystemControl]
		Ulimits?: [...__Ulimit]
		User?: string
		VolumesFrom?: [...__VolumeFrom]
		WorkingDirectory?: string
	}
	__ContainerDependency :: {
		Condition:     string
		ContainerName: string
	}
	__Device :: {
		ContainerPath?: string
		HostPath:       string
		Permissions?: [...string]
	}
	__DockerVolumeConfiguration :: {
		Autoprovision?: bool
		Driver?:        string
		DriverOpts?: {
		}
		Labels?: {
		}
		Scope?: string
	}
	__HealthCheck :: {
		Command: [...string]
		Interval?:    int
		Retries?:     int
		StartPeriod?: int
		Timeout?:     int
	}
	__HostEntry :: {
		Hostname:  string
		IpAddress: string
	}
	__HostVolumeProperties :: {
		SourcePath?: string
	}
	__KernelCapabilities :: {
		Add?: [...string]
		Drop?: [...string]
	}
	__KeyValuePair :: {
		Name?:  string
		Value?: string
	}
	__LinuxParameters :: {
		Capabilities?: __KernelCapabilities
		Devices?: [...__Device]
		InitProcessEnabled?: bool
		SharedMemorySize?:   int
		Tmpfs?: [...__Tmpfs]
	}
	__LogConfiguration :: {
		LogDriver: string
		Options?: {
		}
		SecretOptions?: [...__Secret]
	}
	__MountPoint :: {
		ContainerPath?: string
		ReadOnly?:      bool
		SourceVolume?:  string
	}
	__PortMapping :: {
		ContainerPort?: int
		HostPort?:      int
		Protocol?:      string
	}
	__ProxyConfiguration :: {
		ContainerName: string
		ProxyConfigurationProperties?: [...__KeyValuePair]
		Type?: "APPMESH"
		Type?: string
	}
	__RepositoryCredentials :: {
		CredentialsParameter?: string
	}
	__ResourceRequirement :: {
		Type:  string
		Value: string
	}
	__Secret :: {
		Name:      string
		ValueFrom: string
	}
	__SystemControl :: {
		Namespace: string
		Value:     string
	}
	__TaskDefinitionPlacementConstraint :: {
		Expression?: string
		Type:        string
	}
	__Tmpfs :: {
		ContainerPath?: string
		MountOptions?: [...string]
		Size: int
	}
	__Ulimit :: {
		HardLimit: int
		Name:      string
		SoftLimit: int
	}
	__Volume :: {
		DockerVolumeConfiguration?: __DockerVolumeConfiguration
		Host?:                      __HostVolumeProperties
		Name?:                      string
	}
	__VolumeFrom :: {
		ReadOnly?:        bool
		SourceContainer?: string
	}
}

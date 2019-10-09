package ECS

import "github.com/TangoGroup/fn"

Cluster :: {
	Type: "AWS::ECS::Cluster"
	Properties: {
		ClusterName?: string | fn.Fn
		Tags?: [...__Tag]
	}
}
Service :: {
	Type: "AWS::ECS::Service"
	Properties: {
		Cluster?:                       string | fn.Fn
		DeploymentConfiguration?:       __DeploymentConfiguration
		DesiredCount?:                  int | fn.Fn
		EnableECSManagedTags?:          bool | fn.Fn
		HealthCheckGracePeriodSeconds?: int | fn.Fn
		LaunchType?:                    (string & ("EC2" | "FARGATE")) | fn.Fn
		LoadBalancers?: [...__LoadBalancer]
		NetworkConfiguration?: __NetworkConfiguration
		PlacementConstraints?: [...__PlacementConstraint]
		PlacementStrategies?: [...__PlacementStrategy]
		PlatformVersion?:    string | fn.Fn
		PropagateTags?:      string | fn.Fn
		Role?:               string | fn.Fn
		SchedulingStrategy?: (string & ("DAEMON" | "REPLICA")) | fn.Fn
		ServiceName?:        string | fn.Fn
		ServiceRegistries?: [...__ServiceRegistry]
		Tags?: [...__Tag]
		TaskDefinition: string | fn.Fn
	}
	__AwsVpcConfiguration :: {
		AssignPublicIp?: string | fn.Fn
		SecurityGroups?: [...string] | fn.Fn
		Subnets:         [...string] | fn.Fn
	}
	__DeploymentConfiguration :: {
		MaximumPercent?:        int | fn.Fn
		MinimumHealthyPercent?: int | fn.Fn
	}
	__LoadBalancer :: {
		ContainerName?:    string | fn.Fn
		ContainerPort:     int | fn.Fn
		LoadBalancerName?: string | fn.Fn
		TargetGroupArn?:   string | fn.Fn
	}
	__NetworkConfiguration :: {
		AwsvpcConfiguration?: __AwsVpcConfiguration
	}
	__PlacementConstraint :: {
		Expression?: string | fn.Fn
		Type:        string | fn.Fn
	}
	__PlacementStrategy :: {
		Field?: string | fn.Fn
		Type:   string | fn.Fn
	}
	__ServiceRegistry :: {
		ContainerName?: string | fn.Fn
		ContainerPort?: int | fn.Fn
		Port?:          int | fn.Fn
		RegistryArn?:   string | fn.Fn
	}
}
TaskDefinition :: {
	Type: "AWS::ECS::TaskDefinition"
	Properties: {
		ContainerDefinitions?: [...__ContainerDefinition]
		Cpu?:              string | fn.Fn
		ExecutionRoleArn?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		Family?:           string | fn.Fn
		IpcMode?:          string | fn.Fn
		Memory?:           string | fn.Fn
		NetworkMode?:      (string & ("awsvpc" | "bridge" | "host" | "none")) | fn.Fn
		PidMode?:          string | fn.Fn
		PlacementConstraints?: [...__TaskDefinitionPlacementConstraint]
		ProxyConfiguration?:      __ProxyConfiguration
		RequiresCompatibilities?: [...string] | fn.Fn
		Tags?: [...__Tag]
		TaskRoleArn?: string | fn.Fn
		Volumes?: [...__Volume]
	}
	__ContainerDefinition :: {
		Command?: [...string] | fn.Fn
		Cpu?:     int | fn.Fn
		DependsOn?: [...__ContainerDependency]
		DisableNetworking?: bool | fn.Fn
		DnsSearchDomains?:  [...string] | fn.Fn
		DnsServers?:        [...string] | fn.Fn
		DockerLabels?: {
		}
		DockerSecurityOptions?: [...string] | fn.Fn
		EntryPoint?:            [...string] | fn.Fn
		Environment?: [...__KeyValuePair]
		Essential?: bool | fn.Fn
		ExtraHosts?: [...__HostEntry]
		HealthCheck?:       __HealthCheck
		Hostname?:          string | fn.Fn
		Image?:             string | fn.Fn
		Interactive?:       bool | fn.Fn
		Links?:             [...string] | fn.Fn
		LinuxParameters?:   __LinuxParameters
		LogConfiguration?:  __LogConfiguration
		Memory?:            int | fn.Fn
		MemoryReservation?: int | fn.Fn
		MountPoints?: [...__MountPoint]
		Name?: string | fn.Fn
		PortMappings?: [...__PortMapping]
		Privileged?:             bool | fn.Fn
		PseudoTerminal?:         bool | fn.Fn
		ReadonlyRootFilesystem?: bool | fn.Fn
		RepositoryCredentials?:  __RepositoryCredentials
		ResourceRequirements?: [...__ResourceRequirement]
		Secrets?: [...__Secret]
		StartTimeout?: int | fn.Fn
		StopTimeout?:  int | fn.Fn
		SystemControls?: [...__SystemControl]
		Ulimits?: [...__Ulimit]
		User?: string | fn.Fn
		VolumesFrom?: [...__VolumeFrom]
		WorkingDirectory?: string | fn.Fn
	}
	__ContainerDependency :: {
		Condition:     string | fn.Fn
		ContainerName: string | fn.Fn
	}
	__Device :: {
		ContainerPath?: string | fn.Fn
		HostPath:       string | fn.Fn
		Permissions?:   [...string] | fn.Fn
	}
	__DockerVolumeConfiguration :: {
		Autoprovision?: bool | fn.Fn
		Driver?:        string | fn.Fn
		DriverOpts?: {
		}
		Labels?: {
		}
		Scope?: string | fn.Fn
	}
	__HealthCheck :: {
		Command:      [...string] | fn.Fn
		Interval?:    int | fn.Fn
		Retries?:     int | fn.Fn
		StartPeriod?: int | fn.Fn
		Timeout?:     int | fn.Fn
	}
	__HostEntry :: {
		Hostname:  string | fn.Fn
		IpAddress: string | fn.Fn
	}
	__HostVolumeProperties :: {
		SourcePath?: string | fn.Fn
	}
	__KernelCapabilities :: {
		Add?:  [...string] | fn.Fn
		Drop?: [...string] | fn.Fn
	}
	__KeyValuePair :: {
		Name?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	__LinuxParameters :: {
		Capabilities?: __KernelCapabilities
		Devices?: [...__Device]
		InitProcessEnabled?: bool | fn.Fn
		SharedMemorySize?:   int | fn.Fn
		Tmpfs?: [...__Tmpfs]
	}
	__LogConfiguration :: {
		LogDriver: string | fn.Fn
		Options?: {
		}
		SecretOptions?: [...__Secret]
	}
	__MountPoint :: {
		ContainerPath?: string | fn.Fn
		ReadOnly?:      bool | fn.Fn
		SourceVolume?:  string | fn.Fn
	}
	__PortMapping :: {
		ContainerPort?: int | fn.Fn
		HostPort?:      int | fn.Fn
		Protocol?:      string | fn.Fn
	}
	__ProxyConfiguration :: {
		ContainerName: string | fn.Fn
		ProxyConfigurationProperties?: [...__KeyValuePair]
		Type?: (string & ("APPMESH")) | fn.Fn
	}
	__RepositoryCredentials :: {
		CredentialsParameter?: string | fn.Fn
	}
	__ResourceRequirement :: {
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
	__Secret :: {
		Name:      string | fn.Fn
		ValueFrom: string | fn.Fn
	}
	__SystemControl :: {
		Namespace: string | fn.Fn
		Value:     string | fn.Fn
	}
	__TaskDefinitionPlacementConstraint :: {
		Expression?: string | fn.Fn
		Type:        string | fn.Fn
	}
	__Tmpfs :: {
		ContainerPath?: string | fn.Fn
		MountOptions?:  [...string] | fn.Fn
		Size:           int | fn.Fn
	}
	__Ulimit :: {
		HardLimit: int | fn.Fn
		Name:      string | fn.Fn
		SoftLimit: int | fn.Fn
	}
	__Volume :: {
		DockerVolumeConfiguration?: __DockerVolumeConfiguration
		Host?:                      __HostVolumeProperties
		Name?:                      string | fn.Fn
	}
	__VolumeFrom :: {
		ReadOnly?:        bool | fn.Fn
		SourceContainer?: string | fn.Fn
	}
}

package OpsWorks

App :: {
	Type: "AWS::OpsWorks::App"
	Properties: {
		AppSource?: __Source
		Attributes?: {
		}
		DataSources?: [...__DataSource]
		Description?: string
		Domains?: [...string]
		EnableSsl?: bool
		Environment?: [...__EnvironmentVariable]
		Name:              string
		Shortname?:        string
		SslConfiguration?: __SslConfiguration
		StackId:           string
		Type:              string
	}
	__DataSource = {
		Arn?:          string
		DatabaseName?: string
		Type?:         string
	}
	__EnvironmentVariable = {
		Key:     string
		Secure?: bool
		Value:   string
	}
	__Source = {
		Password?: string
		Revision?: string
		SshKey?:   string
		Type?:     string
		Url?:      string
		Username?: string
	}
	__SslConfiguration = {
		Certificate?: string
		Chain?:       string
		PrivateKey?:  string
	}
}
ElasticLoadBalancerAttachment :: {
	Type: "AWS::OpsWorks::ElasticLoadBalancerAttachment"
	Properties: {
		ElasticLoadBalancerName: string
		LayerId:                 string
	}
}
Instance :: {
	Type: "AWS::OpsWorks::Instance"
	Properties: {
		AgentVersion?:     string
		AmiId?:            string
		Architecture?:     string
		AutoScalingType?:  string
		AvailabilityZone?: string
		BlockDeviceMappings?: [...__BlockDeviceMapping]
		EbsOptimized?: bool
		ElasticIps?: [...string]
		Hostname?:             string
		InstallUpdatesOnBoot?: bool
		InstanceType:          string
		LayerIds: [...string]
		Os?:                   string
		RootDeviceType?:       string
		SshKeyName?:           string
		StackId:               string
		SubnetId?:             string
		Tenancy?:              string
		TimeBasedAutoScaling?: __TimeBasedAutoScaling
		VirtualizationType?:   string
		Volumes?: [...string]
	}
	__BlockDeviceMapping = {
		DeviceName?:  string
		Ebs?:         __EbsBlockDevice
		NoDevice?:    string
		VirtualName?: string
	}
	__EbsBlockDevice = {
		DeleteOnTermination?: bool
		Iops?:                int
		SnapshotId?:          string
		VolumeSize?:          int
		VolumeType?:          "gp2" | "io1" | "sc1" | "st1" | "standard"
		VolumeType?:          string
	}
	__TimeBasedAutoScaling = {
		Friday?: {
		}
		Monday?: {
		}
		Saturday?: {
		}
		Sunday?: {
		}
		Thursday?: {
		}
		Tuesday?: {
		}
		Wednesday?: {
		}
	}
}
Layer :: {
	Type: "AWS::OpsWorks::Layer"
	Properties: {
		Attributes?: {
		}
		AutoAssignElasticIps:      bool
		AutoAssignPublicIps:       bool
		CustomInstanceProfileArn?: string
		CustomJson?: {
		}
		CustomRecipes?: __Recipes
		CustomSecurityGroupIds?: [...string]
		EnableAutoHealing:            bool
		InstallUpdatesOnBoot?:        bool
		LifecycleEventConfiguration?: __LifecycleEventConfiguration
		LoadBasedAutoScaling?:        __LoadBasedAutoScaling
		Name:                         string
		Packages?: [...string]
		Shortname: string
		StackId:   string
		Tags?: [...__Tag]
		Type:                      string
		UseEbsOptimizedInstances?: bool
		VolumeConfigurations?: [...__VolumeConfiguration]
	}
	__AutoScalingThresholds = {
		CpuThreshold?:       float
		IgnoreMetricsTime?:  int
		InstanceCount?:      int
		LoadThreshold?:      float
		MemoryThreshold?:    float
		ThresholdsWaitTime?: int
	}
	__LifecycleEventConfiguration = {
		ShutdownEventConfiguration?: __ShutdownEventConfiguration
	}
	__LoadBasedAutoScaling = {
		DownScaling?: __AutoScalingThresholds
		Enable?:      bool
		UpScaling?:   __AutoScalingThresholds
	}
	__Recipes = {
		Configure?: [...string]
		Deploy?: [...string]
		Setup?: [...string]
		Shutdown?: [...string]
		Undeploy?: [...string]
	}
	__ShutdownEventConfiguration = {
		DelayUntilElbConnectionsDrained?: bool
		ExecutionTimeout?:                int
	}
	__VolumeConfiguration = {
		Encrypted?:     bool
		Iops?:          int
		MountPoint?:    string
		NumberOfDisks?: int
		RaidLevel?:     int
		Size?:          int
		VolumeType?:    "gp2" | "io1" | "sc1" | "st1" | "standard"
		VolumeType?:    string
	}
}
Stack :: {
	Type: "AWS::OpsWorks::Stack"
	Properties: {
		AgentVersion?: string
		Attributes?: {
		}
		ChefConfiguration?: __ChefConfiguration
		CloneAppIds?: [...string]
		ClonePermissions?:      bool
		ConfigurationManager?:  __StackConfigurationManager
		CustomCookbooksSource?: __Source
		CustomJson?: {
		}
		DefaultAvailabilityZone?:  string
		DefaultInstanceProfileArn: string
		DefaultOs?:                string
		DefaultRootDeviceType?:    string
		DefaultSshKeyName?:        string
		DefaultSubnetId?:          string
		EcsClusterArn?:            string
		ElasticIps?: [...__ElasticIp]
		HostnameTheme?: string
		Name:           string
		RdsDbInstances?: [...__RdsDbInstance]
		ServiceRoleArn: string
		SourceStackId?: string
		Tags?: [...__Tag]
		UseCustomCookbooks?:        bool
		UseOpsworksSecurityGroups?: bool
		VpcId?:                     string
	}
	__ChefConfiguration = {
		BerkshelfVersion?: string
		ManageBerkshelf?:  bool
	}
	__ElasticIp = {
		Ip:    string
		Name?: string
	}
	__RdsDbInstance = {
		DbPassword:       string
		DbUser:           string
		RdsDbInstanceArn: string
	}
	__Source = {
		Password?: string
		Revision?: string
		SshKey?:   string
		Type?:     string
		Url?:      string
		Username?: string
	}
	__StackConfigurationManager = {
		Name?:    string
		Version?: string
	}
}
UserProfile :: {
	Type: "AWS::OpsWorks::UserProfile"
	Properties: {
		AllowSelfManagement?: bool
		IamUserArn:           string
		SshPublicKey?:        string
		SshUsername?:         string
	}
}
Volume :: {
	Type: "AWS::OpsWorks::Volume"
	Properties: {
		Ec2VolumeId: string
		MountPoint?: string
		Name?:       string
		StackId:     string
	}
}

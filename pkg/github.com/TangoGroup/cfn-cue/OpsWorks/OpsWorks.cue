package OpsWorks

import "github.com/TangoGroup/fn"

App :: {
	Type: "AWS::OpsWorks::App"
	Properties: {
		AppSource?: __Source
		Attributes?: {
		}
		DataSources?: [...__DataSource]
		Description?: string | fn.Fn
		Domains?:     [...string] | fn.Fn
		EnableSsl?:   bool | fn.Fn
		Environment?: [...__EnvironmentVariable]
		Name:              string | fn.Fn
		Shortname?:        string | fn.Fn
		SslConfiguration?: __SslConfiguration
		StackId:           string | fn.Fn
		Type:              string | fn.Fn
	}
	__DataSource :: {
		Arn?:          string | fn.Fn
		DatabaseName?: string | fn.Fn
		Type?:         string | fn.Fn
	}
	__EnvironmentVariable :: {
		Key:     string | fn.Fn
		Secure?: bool | fn.Fn
		Value:   string | fn.Fn
	}
	__Source :: {
		Password?: string | fn.Fn
		Revision?: string | fn.Fn
		SshKey?:   string | fn.Fn
		Type?:     string | fn.Fn
		Url?:      string | fn.Fn
		Username?: string | fn.Fn
	}
	__SslConfiguration :: {
		Certificate?: string | fn.Fn
		Chain?:       string | fn.Fn
		PrivateKey?:  string | fn.Fn
	}
}
ElasticLoadBalancerAttachment :: {
	Type: "AWS::OpsWorks::ElasticLoadBalancerAttachment"
	Properties: {
		ElasticLoadBalancerName: string | fn.Fn
		LayerId:                 string | fn.Fn
	}
}
Instance :: {
	Type: "AWS::OpsWorks::Instance"
	Properties: {
		AgentVersion?:     string | fn.Fn
		AmiId?:            string | fn.Fn
		Architecture?:     string | fn.Fn
		AutoScalingType?:  string | fn.Fn
		AvailabilityZone?: string | fn.Fn
		BlockDeviceMappings?: [...__BlockDeviceMapping]
		EbsOptimized?:         bool | fn.Fn
		ElasticIps?:           [...string] | fn.Fn
		Hostname?:             string | fn.Fn
		InstallUpdatesOnBoot?: bool | fn.Fn
		InstanceType:          string | fn.Fn
		LayerIds:              [...string] | fn.Fn
		Os?:                   string | fn.Fn
		RootDeviceType?:       string | fn.Fn
		SshKeyName?:           string | fn.Fn
		StackId:               string | fn.Fn
		SubnetId?:             string | fn.Fn
		Tenancy?:              string | fn.Fn
		TimeBasedAutoScaling?: __TimeBasedAutoScaling
		VirtualizationType?:   string | fn.Fn
		Volumes?:              [...string] | fn.Fn
	}
	__BlockDeviceMapping :: {
		DeviceName?:  string | fn.Fn
		Ebs?:         __EbsBlockDevice
		NoDevice?:    string | fn.Fn
		VirtualName?: string | fn.Fn
	}
	__EbsBlockDevice :: {
		DeleteOnTermination?: bool | fn.Fn
		Iops?:                int | fn.Fn
		SnapshotId?:          string | fn.Fn
		VolumeSize?:          int | fn.Fn
		VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
	}
	__TimeBasedAutoScaling :: {
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
		AutoAssignElasticIps:      bool | fn.Fn
		AutoAssignPublicIps:       bool | fn.Fn
		CustomInstanceProfileArn?: string | fn.Fn
		CustomJson?:               {
		} | fn.Fn
		CustomRecipes?:               __Recipes
		CustomSecurityGroupIds?:      [...string] | fn.Fn
		EnableAutoHealing:            bool | fn.Fn
		InstallUpdatesOnBoot?:        bool | fn.Fn
		LifecycleEventConfiguration?: __LifecycleEventConfiguration
		LoadBasedAutoScaling?:        __LoadBasedAutoScaling
		Name:                         string | fn.Fn
		Packages?:                    [...string] | fn.Fn
		Shortname:                    string | fn.Fn
		StackId:                      string | fn.Fn
		Tags?: [...__Tag]
		Type:                      string | fn.Fn
		UseEbsOptimizedInstances?: bool | fn.Fn
		VolumeConfigurations?: [...__VolumeConfiguration]
	}
	__AutoScalingThresholds :: {
		CpuThreshold?:       float | fn.Fn
		IgnoreMetricsTime?:  int | fn.Fn
		InstanceCount?:      int | fn.Fn
		LoadThreshold?:      float | fn.Fn
		MemoryThreshold?:    float | fn.Fn
		ThresholdsWaitTime?: int | fn.Fn
	}
	__LifecycleEventConfiguration :: {
		ShutdownEventConfiguration?: __ShutdownEventConfiguration
	}
	__LoadBasedAutoScaling :: {
		DownScaling?: __AutoScalingThresholds
		Enable?:      bool | fn.Fn
		UpScaling?:   __AutoScalingThresholds
	}
	__Recipes :: {
		Configure?: [...string] | fn.Fn
		Deploy?:    [...string] | fn.Fn
		Setup?:     [...string] | fn.Fn
		Shutdown?:  [...string] | fn.Fn
		Undeploy?:  [...string] | fn.Fn
	}
	__ShutdownEventConfiguration :: {
		DelayUntilElbConnectionsDrained?: bool | fn.Fn
		ExecutionTimeout?:                int | fn.Fn
	}
	__VolumeConfiguration :: {
		Encrypted?:     bool | fn.Fn
		Iops?:          int | fn.Fn
		MountPoint?:    string | fn.Fn
		NumberOfDisks?: int | fn.Fn
		RaidLevel?:     int | fn.Fn
		Size?:          int | fn.Fn
		VolumeType?:    (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
	}
}
Stack :: {
	Type: "AWS::OpsWorks::Stack"
	Properties: {
		AgentVersion?: string | fn.Fn
		Attributes?: {
		}
		ChefConfiguration?:     __ChefConfiguration
		CloneAppIds?:           [...string] | fn.Fn
		ClonePermissions?:      bool | fn.Fn
		ConfigurationManager?:  __StackConfigurationManager
		CustomCookbooksSource?: __Source
		CustomJson?:            {
		} | fn.Fn
		DefaultAvailabilityZone?:  string | fn.Fn
		DefaultInstanceProfileArn: string | fn.Fn
		DefaultOs?:                string | fn.Fn
		DefaultRootDeviceType?:    string | fn.Fn
		DefaultSshKeyName?:        string | fn.Fn
		DefaultSubnetId?:          string | fn.Fn
		EcsClusterArn?:            string | fn.Fn
		ElasticIps?: [...__ElasticIp]
		HostnameTheme?: string | fn.Fn
		Name:           string | fn.Fn
		RdsDbInstances?: [...__RdsDbInstance]
		ServiceRoleArn: string | fn.Fn
		SourceStackId?: string | fn.Fn
		Tags?: [...__Tag]
		UseCustomCookbooks?:        bool | fn.Fn
		UseOpsworksSecurityGroups?: bool | fn.Fn
		VpcId?:                     string | fn.Fn
	}
	__ChefConfiguration :: {
		BerkshelfVersion?: string | fn.Fn
		ManageBerkshelf?:  bool | fn.Fn
	}
	__ElasticIp :: {
		Ip:    string | fn.Fn
		Name?: string | fn.Fn
	}
	__RdsDbInstance :: {
		DbPassword:       string | fn.Fn
		DbUser:           string | fn.Fn
		RdsDbInstanceArn: string | fn.Fn
	}
	__Source :: {
		Password?: string | fn.Fn
		Revision?: string | fn.Fn
		SshKey?:   string | fn.Fn
		Type?:     string | fn.Fn
		Url?:      string | fn.Fn
		Username?: string | fn.Fn
	}
	__StackConfigurationManager :: {
		Name?:    string | fn.Fn
		Version?: string | fn.Fn
	}
}
UserProfile :: {
	Type: "AWS::OpsWorks::UserProfile"
	Properties: {
		AllowSelfManagement?: bool | fn.Fn
		IamUserArn:           string | fn.Fn
		SshPublicKey?:        string | fn.Fn
		SshUsername?:         string | fn.Fn
	}
}
Volume :: {
	Type: "AWS::OpsWorks::Volume"
	Properties: {
		Ec2VolumeId: string | fn.Fn
		MountPoint?: string | fn.Fn
		Name?:       string | fn.Fn
		StackId:     string | fn.Fn
	}
}

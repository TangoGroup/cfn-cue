package apsouth1

import "github.com/TangoGroup/aws/fn"

OpsWorks :: {
	App :: {
		Type:       "AWS::OpsWorks::App"
		Properties: close({
			AppSource?: close({
				Password?: string | fn.Fn
				Revision?: string | fn.Fn
				SshKey?:   string | fn.Fn
				Type?:     string | fn.Fn
				Url?:      string | fn.Fn
				Username?: string | fn.Fn
			}) | fn.If
			Attributes?: {
				[string]: string | fn.Fn
			} | fn.If
			DataSources?: [...close({
				Arn?:          string | fn.Fn
				DatabaseName?: string | fn.Fn
				Type?:         string | fn.Fn
			})] | fn.If
			Description?: string | fn.Fn
			Domains?:     [...(string | fn.Fn)] | (string | fn.Fn)
			EnableSsl?:   bool | fn.Fn
			Environment?: [...close({
				Key:     string | fn.Fn
				Secure?: bool | fn.Fn
				Value:   string | fn.Fn
			})] | fn.If
			Name:              string | fn.Fn
			Shortname?:        string | fn.Fn
			SslConfiguration?: close({
				Certificate?: string | fn.Fn
				Chain?:       string | fn.Fn
				PrivateKey?:  string | fn.Fn
			}) | fn.If
			StackId: string | fn.Fn
			Type:    string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ElasticLoadBalancerAttachment :: {
		Type:       "AWS::OpsWorks::ElasticLoadBalancerAttachment"
		Properties: close({
			ElasticLoadBalancerName: string | fn.Fn
			LayerId:                 string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Instance :: {
		Type:       "AWS::OpsWorks::Instance"
		Properties: close({
			AgentVersion?:        string | fn.Fn
			AmiId?:               string | fn.Fn
			Architecture?:        string | fn.Fn
			AutoScalingType?:     string | fn.Fn
			AvailabilityZone?:    string | fn.Fn
			BlockDeviceMappings?: [...close({
				DeviceName?: string | fn.Fn
				Ebs?:        close({
					DeleteOnTermination?: bool | fn.Fn
					Iops?:                int | fn.Fn
					SnapshotId?:          string | fn.Fn
					VolumeSize?:          int | fn.Fn
					VolumeType?:          ("gp2" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.Fn
				}) | fn.If
				NoDevice?:    string | fn.Fn
				VirtualName?: string | fn.Fn
			})] | fn.If
			EbsOptimized?:         bool | fn.Fn
			ElasticIps?:           [...(string | fn.Fn)] | (string | fn.Fn)
			Hostname?:             string | fn.Fn
			InstallUpdatesOnBoot?: bool | fn.Fn
			InstanceType:          string | fn.Fn
			LayerIds:              [...(string | fn.Fn)] | (string | fn.Fn)
			Os?:                   string | fn.Fn
			RootDeviceType?:       string | fn.Fn
			SshKeyName?:           string | fn.Fn
			StackId:               string | fn.Fn
			SubnetId?:             string | fn.Fn
			Tenancy?:              string | fn.Fn
			TimeBasedAutoScaling?: close({
				Friday?: {
					[string]: string | fn.Fn
				} | fn.If
				Monday?: {
					[string]: string | fn.Fn
				} | fn.If
				Saturday?: {
					[string]: string | fn.Fn
				} | fn.If
				Sunday?: {
					[string]: string | fn.Fn
				} | fn.If
				Thursday?: {
					[string]: string | fn.Fn
				} | fn.If
				Tuesday?: {
					[string]: string | fn.Fn
				} | fn.If
				Wednesday?: {
					[string]: string | fn.Fn
				} | fn.If
			}) | fn.If
			VirtualizationType?: string | fn.Fn
			Volumes?:            [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Layer :: {
		Type:       "AWS::OpsWorks::Layer"
		Properties: close({
			Attributes?: {
				[string]: string | fn.Fn
			} | fn.If
			AutoAssignElasticIps:      bool | fn.Fn
			AutoAssignPublicIps:       bool | fn.Fn
			CustomInstanceProfileArn?: string | fn.Fn
			CustomJson?:               {
				[string]: _
			} | fn.Fn
			CustomRecipes?: close({
				Configure?: [...(string | fn.Fn)] | (string | fn.Fn)
				Deploy?:    [...(string | fn.Fn)] | (string | fn.Fn)
				Setup?:     [...(string | fn.Fn)] | (string | fn.Fn)
				Shutdown?:  [...(string | fn.Fn)] | (string | fn.Fn)
				Undeploy?:  [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			CustomSecurityGroupIds?:      [...(string | fn.Fn)] | (string | fn.Fn)
			EnableAutoHealing:            bool | fn.Fn
			InstallUpdatesOnBoot?:        bool | fn.Fn
			LifecycleEventConfiguration?: close({
				ShutdownEventConfiguration?: close({
					DelayUntilElbConnectionsDrained?: bool | fn.Fn
					ExecutionTimeout?:                int | fn.Fn
				}) | fn.If
			}) | fn.If
			LoadBasedAutoScaling?: close({
				DownScaling?: close({
					CpuThreshold?:       number | fn.Fn
					IgnoreMetricsTime?:  int | fn.Fn
					InstanceCount?:      int | fn.Fn
					LoadThreshold?:      number | fn.Fn
					MemoryThreshold?:    number | fn.Fn
					ThresholdsWaitTime?: int | fn.Fn
				}) | fn.If
				Enable?:    bool | fn.Fn
				UpScaling?: close({
					CpuThreshold?:       number | fn.Fn
					IgnoreMetricsTime?:  int | fn.Fn
					InstanceCount?:      int | fn.Fn
					LoadThreshold?:      number | fn.Fn
					MemoryThreshold?:    number | fn.Fn
					ThresholdsWaitTime?: int | fn.Fn
				}) | fn.If
			}) | fn.If
			Name:      string | fn.Fn
			Packages?: [...(string | fn.Fn)] | (string | fn.Fn)
			Shortname: string | fn.Fn
			StackId:   string | fn.Fn
			Tags?:     [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type:                      string | fn.Fn
			UseEbsOptimizedInstances?: bool | fn.Fn
			VolumeConfigurations?:     [...close({
				Encrypted?:     bool | fn.Fn
				Iops?:          int | fn.Fn
				MountPoint?:    string | fn.Fn
				NumberOfDisks?: int | fn.Fn
				RaidLevel?:     int | fn.Fn
				Size?:          int | fn.Fn
				VolumeType?:    ("gp2" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Stack :: {
		Type:       "AWS::OpsWorks::Stack"
		Properties: close({
			AgentVersion?: string | fn.Fn
			Attributes?:   {
				[string]: string | fn.Fn
			} | fn.If
			ChefConfiguration?: close({
				BerkshelfVersion?: string | fn.Fn
				ManageBerkshelf?:  bool | fn.Fn
			}) | fn.If
			CloneAppIds?:          [...(string | fn.Fn)] | (string | fn.Fn)
			ClonePermissions?:     bool | fn.Fn
			ConfigurationManager?: close({
				Name?:    string | fn.Fn
				Version?: string | fn.Fn
			}) | fn.If
			CustomCookbooksSource?: close({
				Password?: string | fn.Fn
				Revision?: string | fn.Fn
				SshKey?:   string | fn.Fn
				Type?:     string | fn.Fn
				Url?:      string | fn.Fn
				Username?: string | fn.Fn
			}) | fn.If
			CustomJson?: {
				[string]: _
			} | fn.Fn
			DefaultAvailabilityZone?:  string | fn.Fn
			DefaultInstanceProfileArn: string | fn.Fn
			DefaultOs?:                string | fn.Fn
			DefaultRootDeviceType?:    string | fn.Fn
			DefaultSshKeyName?:        string | fn.Fn
			DefaultSubnetId?:          string | fn.Fn
			EcsClusterArn?:            string | fn.Fn
			ElasticIps?:               [...close({
				Ip:    string | fn.Fn
				Name?: string | fn.Fn
			})] | fn.If
			HostnameTheme?:  string | fn.Fn
			Name:            string | fn.Fn
			RdsDbInstances?: [...close({
				DbPassword:       string | fn.Fn
				DbUser:           string | fn.Fn
				RdsDbInstanceArn: string | fn.Fn
			})] | fn.If
			ServiceRoleArn: string | fn.Fn
			SourceStackId?: string | fn.Fn
			Tags?:          [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			UseCustomCookbooks?:        bool | fn.Fn
			UseOpsworksSecurityGroups?: bool | fn.Fn
			VpcId?:                     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserProfile :: {
		Type:       "AWS::OpsWorks::UserProfile"
		Properties: close({
			AllowSelfManagement?: bool | fn.Fn
			IamUserArn:           string | fn.Fn
			SshPublicKey?:        string | fn.Fn
			SshUsername?:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Volume :: {
		Type:       "AWS::OpsWorks::Volume"
		Properties: close({
			Ec2VolumeId: string | fn.Fn
			MountPoint?: string | fn.Fn
			Name?:       string | fn.Fn
			StackId:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

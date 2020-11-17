package apnortheast1

import "github.com/TangoGroup/aws/fn"

#OpsWorks: {
	#App: {
		Type: "AWS::OpsWorks::App"
		Properties: {
			AppSource?: {
				Password?: string | fn.#Fn
				Revision?: string | fn.#Fn
				SshKey?:   string | fn.#Fn
				Type?:     string | fn.#Fn
				Url?:      string | fn.#Fn
				Username?: string | fn.#Fn
			} | fn.If
			Attributes?: {
				[string]: string | fn.#Fn
			} | fn.If
			DataSources?: [...{
				Arn?:          string | fn.#Fn
				DatabaseName?: string | fn.#Fn
				Type?:         string | fn.#Fn
			}] | fn.If
			Description?: string | fn.#Fn
			Domains?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
			EnableSsl?:   bool | fn.#Fn
			Environment?: [...{
				Key:     string | fn.#Fn
				Secure?: bool | fn.#Fn
				Value:   string | fn.#Fn
			}] | fn.If
			Name:              string | fn.#Fn
			Shortname?:        string | fn.#Fn
			SslConfiguration?: {
				Certificate?: string | fn.#Fn
				Chain?:       string | fn.#Fn
				PrivateKey?:  string | fn.#Fn
			} | fn.If
			StackId: string | fn.#Fn
			Type:    string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ElasticLoadBalancerAttachment: {
		Type: "AWS::OpsWorks::ElasticLoadBalancerAttachment"
		Properties: {
			ElasticLoadBalancerName: string | fn.#Fn
			LayerId:                 string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Instance: {
		Type: "AWS::OpsWorks::Instance"
		Properties: {
			AgentVersion?:        string | fn.#Fn
			AmiId?:               string | fn.#Fn
			Architecture?:        string | fn.#Fn
			AutoScalingType?:     string | fn.#Fn
			AvailabilityZone?:    ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn
			BlockDeviceMappings?: [...{
				DeviceName?: string | fn.#Fn
				Ebs?:        {
					DeleteOnTermination?: bool | fn.#Fn
					Iops?:                int | fn.#Fn
					SnapshotId?:          string | fn.#Fn
					VolumeSize?:          int | fn.#Fn
					VolumeType?:          ("gp2" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
				} | fn.If
				NoDevice?:    string | fn.#Fn
				VirtualName?: string | fn.#Fn
			}] | fn.If
			EbsOptimized?:         bool | fn.#Fn
			ElasticIps?:           [...(string | fn.#Fn)] | (string | fn.#Fn)
			Hostname?:             string | fn.#Fn
			InstallUpdatesOnBoot?: bool | fn.#Fn
			InstanceType:          string | fn.#Fn
			LayerIds:              [...(string | fn.#Fn)] | (string | fn.#Fn)
			Os?:                   string | fn.#Fn
			RootDeviceType?:       string | fn.#Fn
			SshKeyName?:           string | fn.#Fn
			StackId:               string | fn.#Fn
			SubnetId?:             string | fn.#Fn
			Tenancy?:              string | fn.#Fn
			TimeBasedAutoScaling?: {
				Friday?: {
					[string]: string | fn.#Fn
				} | fn.If
				Monday?: {
					[string]: string | fn.#Fn
				} | fn.If
				Saturday?: {
					[string]: string | fn.#Fn
				} | fn.If
				Sunday?: {
					[string]: string | fn.#Fn
				} | fn.If
				Thursday?: {
					[string]: string | fn.#Fn
				} | fn.If
				Tuesday?: {
					[string]: string | fn.#Fn
				} | fn.If
				Wednesday?: {
					[string]: string | fn.#Fn
				} | fn.If
			} | fn.If
			VirtualizationType?: string | fn.#Fn
			Volumes?:            [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Layer: {
		Type: "AWS::OpsWorks::Layer"
		Properties: {
			Attributes?: {
				[string]: string | fn.#Fn
			} | fn.If
			AutoAssignElasticIps:      bool | fn.#Fn
			AutoAssignPublicIps:       bool | fn.#Fn
			CustomInstanceProfileArn?: string | fn.#Fn
			CustomJson?:               {
				[string]: _
			} | fn.#Fn
			CustomRecipes?: {
				Configure?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				Deploy?:    [...(string | fn.#Fn)] | (string | fn.#Fn)
				Setup?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
				Shutdown?:  [...(string | fn.#Fn)] | (string | fn.#Fn)
				Undeploy?:  [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.If
			CustomSecurityGroupIds?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
			EnableAutoHealing:            bool | fn.#Fn
			InstallUpdatesOnBoot?:        bool | fn.#Fn
			LifecycleEventConfiguration?: {
				ShutdownEventConfiguration?: {
					DelayUntilElbConnectionsDrained?: bool | fn.#Fn
					ExecutionTimeout?:                int | fn.#Fn
				} | fn.If
			} | fn.If
			LoadBasedAutoScaling?: {
				DownScaling?: {
					CpuThreshold?:       number | fn.#Fn
					IgnoreMetricsTime?:  int | fn.#Fn
					InstanceCount?:      int | fn.#Fn
					LoadThreshold?:      number | fn.#Fn
					MemoryThreshold?:    number | fn.#Fn
					ThresholdsWaitTime?: int | fn.#Fn
				} | fn.If
				Enable?:    bool | fn.#Fn
				UpScaling?: {
					CpuThreshold?:       number | fn.#Fn
					IgnoreMetricsTime?:  int | fn.#Fn
					InstanceCount?:      int | fn.#Fn
					LoadThreshold?:      number | fn.#Fn
					MemoryThreshold?:    number | fn.#Fn
					ThresholdsWaitTime?: int | fn.#Fn
				} | fn.If
			} | fn.If
			Name:      string | fn.#Fn
			Packages?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Shortname: string | fn.#Fn
			StackId:   string | fn.#Fn
			Tags?:     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			Type:                      string | fn.#Fn
			UseEbsOptimizedInstances?: bool | fn.#Fn
			VolumeConfigurations?:     [...{
				Encrypted?:     bool | fn.#Fn
				Iops?:          int | fn.#Fn
				MountPoint?:    string | fn.#Fn
				NumberOfDisks?: int | fn.#Fn
				RaidLevel?:     int | fn.#Fn
				Size?:          int | fn.#Fn
				VolumeType?:    ("gp2" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Stack: {
		Type: "AWS::OpsWorks::Stack"
		Properties: {
			AgentVersion?: string | fn.#Fn
			Attributes?:   {
				[string]: string | fn.#Fn
			} | fn.If
			ChefConfiguration?: {
				BerkshelfVersion?: string | fn.#Fn
				ManageBerkshelf?:  bool | fn.#Fn
			} | fn.If
			CloneAppIds?:          [...(string | fn.#Fn)] | (string | fn.#Fn)
			ClonePermissions?:     bool | fn.#Fn
			ConfigurationManager?: {
				Name?:    string | fn.#Fn
				Version?: string | fn.#Fn
			} | fn.If
			CustomCookbooksSource?: {
				Password?: string | fn.#Fn
				Revision?: string | fn.#Fn
				SshKey?:   string | fn.#Fn
				Type?:     string | fn.#Fn
				Url?:      string | fn.#Fn
				Username?: string | fn.#Fn
			} | fn.If
			CustomJson?: {
				[string]: _
			} | fn.#Fn
			DefaultAvailabilityZone?:  string | fn.#Fn
			DefaultInstanceProfileArn: string | fn.#Fn
			DefaultOs?:                string | fn.#Fn
			DefaultRootDeviceType?:    string | fn.#Fn
			DefaultSshKeyName?:        string | fn.#Fn
			DefaultSubnetId?:          string | fn.#Fn
			EcsClusterArn?:            string | fn.#Fn
			ElasticIps?:               [...{
				Ip:    string | fn.#Fn
				Name?: string | fn.#Fn
			}] | fn.If
			HostnameTheme?:  string | fn.#Fn
			Name:            string | fn.#Fn
			RdsDbInstances?: [...{
				DbPassword:       string | fn.#Fn
				DbUser:           string | fn.#Fn
				RdsDbInstanceArn: string | fn.#Fn
			}] | fn.If
			ServiceRoleArn: string | fn.#Fn
			SourceStackId?: string | fn.#Fn
			Tags?:          [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			UseCustomCookbooks?:        bool | fn.#Fn
			UseOpsworksSecurityGroups?: bool | fn.#Fn
			VpcId?:                     string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#UserProfile: {
		Type: "AWS::OpsWorks::UserProfile"
		Properties: {
			AllowSelfManagement?: bool | fn.#Fn
			IamUserArn:           string | fn.#Fn
			SshPublicKey?:        string | fn.#Fn
			SshUsername?:         string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Volume: {
		Type: "AWS::OpsWorks::Volume"
		Properties: {
			Ec2VolumeId: string | fn.#Fn
			MountPoint?: string | fn.#Fn
			Name?:       string | fn.#Fn
			StackId:     string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

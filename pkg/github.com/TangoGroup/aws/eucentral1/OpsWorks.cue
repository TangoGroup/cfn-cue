package eucentral1

import "github.com/TangoGroup/aws/fn"

OpsWorks :: {
	App :: {
		Type: "AWS::OpsWorks::App"
		Properties: {
			AppSource?: {
				Password?: string | fn.Fn
				Revision?: string | fn.Fn
				SshKey?:   string | fn.Fn
				Type?:     string | fn.Fn
				Url?:      string | fn.Fn
				Username?: string | fn.Fn
			}
			Attributes?: [string]: string | fn.Fn
			DataSources?: [...{
				Arn?:          string | fn.Fn
				DatabaseName?: string | fn.Fn
				Type?:         string | fn.Fn
			}]
			Description?: string | fn.Fn
			Domains?:     [...(string | fn.Fn)] | (string | fn.Fn)
			EnableSsl?:   bool | fn.Fn
			Environment?: [...{
				Key:     string | fn.Fn
				Secure?: bool | fn.Fn
				Value:   string | fn.Fn
			}]
			Name:       string | fn.Fn
			Shortname?: string | fn.Fn
			SslConfiguration?: {
				Certificate?: string | fn.Fn
				Chain?:       string | fn.Fn
				PrivateKey?:  string | fn.Fn
			}
			StackId: string | fn.Fn
			Type:    string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ElasticLoadBalancerAttachment :: {
		Type: "AWS::OpsWorks::ElasticLoadBalancerAttachment"
		Properties: {
			ElasticLoadBalancerName: string | fn.Fn
			LayerId:                 string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Instance :: {
		Type: "AWS::OpsWorks::Instance"
		Properties: {
			AgentVersion?:     string | fn.Fn
			AmiId?:            string | fn.Fn
			Architecture?:     string | fn.Fn
			AutoScalingType?:  string | fn.Fn
			AvailabilityZone?: string | fn.Fn
			BlockDeviceMappings?: [...{
				DeviceName?: string | fn.Fn
				Ebs?: {
					DeleteOnTermination?: bool | fn.Fn
					Iops?:                int | fn.Fn
					SnapshotId?:          string | fn.Fn
					VolumeSize?:          int | fn.Fn
					VolumeType?:          ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
				}
				NoDevice?:    string | fn.Fn
				VirtualName?: string | fn.Fn
			}]
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
			TimeBasedAutoScaling?: {
				Friday?: [string]:    string | fn.Fn
				Monday?: [string]:    string | fn.Fn
				Saturday?: [string]:  string | fn.Fn
				Sunday?: [string]:    string | fn.Fn
				Thursday?: [string]:  string | fn.Fn
				Tuesday?: [string]:   string | fn.Fn
				Wednesday?: [string]: string | fn.Fn
			}
			VirtualizationType?: string | fn.Fn
			Volumes?:            [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Layer :: {
		Type: "AWS::OpsWorks::Layer"
		Properties: {
			Attributes?: [string]: string | fn.Fn
			AutoAssignElasticIps:      bool | fn.Fn
			AutoAssignPublicIps:       bool | fn.Fn
			CustomInstanceProfileArn?: string | fn.Fn
			CustomJson?:               {
				[string]: _
			} | fn.Fn
			CustomRecipes?: {
				Configure?: [...(string | fn.Fn)] | (string | fn.Fn)
				Deploy?:    [...(string | fn.Fn)] | (string | fn.Fn)
				Setup?:     [...(string | fn.Fn)] | (string | fn.Fn)
				Shutdown?:  [...(string | fn.Fn)] | (string | fn.Fn)
				Undeploy?:  [...(string | fn.Fn)] | (string | fn.Fn)
			}
			CustomSecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
			EnableAutoHealing:       bool | fn.Fn
			InstallUpdatesOnBoot?:   bool | fn.Fn
			LifecycleEventConfiguration?: ShutdownEventConfiguration?: {
				DelayUntilElbConnectionsDrained?: bool | fn.Fn
				ExecutionTimeout?:                int | fn.Fn
			}
			LoadBasedAutoScaling?: {
				DownScaling?: {
					CpuThreshold?:       number | fn.Fn
					IgnoreMetricsTime?:  int | fn.Fn
					InstanceCount?:      int | fn.Fn
					LoadThreshold?:      number | fn.Fn
					MemoryThreshold?:    number | fn.Fn
					ThresholdsWaitTime?: int | fn.Fn
				}
				Enable?: bool | fn.Fn
				UpScaling?: {
					CpuThreshold?:       number | fn.Fn
					IgnoreMetricsTime?:  int | fn.Fn
					InstanceCount?:      int | fn.Fn
					LoadThreshold?:      number | fn.Fn
					MemoryThreshold?:    number | fn.Fn
					ThresholdsWaitTime?: int | fn.Fn
				}
			}
			Name:      string | fn.Fn
			Packages?: [...(string | fn.Fn)] | (string | fn.Fn)
			Shortname: string | fn.Fn
			StackId:   string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Type:                      string | fn.Fn
			UseEbsOptimizedInstances?: bool | fn.Fn
			VolumeConfigurations?: [...{
				Encrypted?:     bool | fn.Fn
				Iops?:          int | fn.Fn
				MountPoint?:    string | fn.Fn
				NumberOfDisks?: int | fn.Fn
				RaidLevel?:     int | fn.Fn
				Size?:          int | fn.Fn
				VolumeType?:    ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Stack :: {
		Type: "AWS::OpsWorks::Stack"
		Properties: {
			AgentVersion?: string | fn.Fn
			Attributes?: [string]: string | fn.Fn
			ChefConfiguration?: {
				BerkshelfVersion?: string | fn.Fn
				ManageBerkshelf?:  bool | fn.Fn
			}
			CloneAppIds?:      [...(string | fn.Fn)] | (string | fn.Fn)
			ClonePermissions?: bool | fn.Fn
			ConfigurationManager?: {
				Name?:    string | fn.Fn
				Version?: string | fn.Fn
			}
			CustomCookbooksSource?: {
				Password?: string | fn.Fn
				Revision?: string | fn.Fn
				SshKey?:   string | fn.Fn
				Type?:     string | fn.Fn
				Url?:      string | fn.Fn
				Username?: string | fn.Fn
			}
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
			ElasticIps?: [...{
				Ip:    string | fn.Fn
				Name?: string | fn.Fn
			}]
			HostnameTheme?: string | fn.Fn
			Name:           string | fn.Fn
			RdsDbInstances?: [...{
				DbPassword:       string | fn.Fn
				DbUser:           string | fn.Fn
				RdsDbInstanceArn: string | fn.Fn
			}]
			ServiceRoleArn: string | fn.Fn
			SourceStackId?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			UseCustomCookbooks?:        bool | fn.Fn
			UseOpsworksSecurityGroups?: bool | fn.Fn
			VpcId?:                     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserProfile :: {
		Type: "AWS::OpsWorks::UserProfile"
		Properties: {
			AllowSelfManagement?: bool | fn.Fn
			IamUserArn:           string | fn.Fn
			SshPublicKey?:        string | fn.Fn
			SshUsername?:         string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Volume :: {
		Type: "AWS::OpsWorks::Volume"
		Properties: {
			Ec2VolumeId: string | fn.Fn
			MountPoint?: string | fn.Fn
			Name?:       string | fn.Fn
			StackId:     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

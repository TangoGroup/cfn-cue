package apeast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

EC2 :: {
	CustomerGateway :: {
		Type: "AWS::EC2::CustomerGateway"
		Properties: {
			BgpAsn:    int | fn.Fn
			IpAddress: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Type: ("ipsec.1") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	DHCPOptions :: {
		Type: "AWS::EC2::DHCPOptions"
		Properties: {
			DomainName?:         string | fn.Fn
			DomainNameServers?:  [...(string | fn.Fn)] | fn.Fn
			NetbiosNameServers?: [...(string | fn.Fn)] | fn.Fn
			NetbiosNodeType?:    (1 | 2 | 4 | 8) | fn.Fn
			NtpServers?:         [...(string | fn.Fn)] | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	EC2Fleet :: {
		Type: "AWS::EC2::EC2Fleet"
		Properties: {
			ExcessCapacityTerminationPolicy?: ("no-termination" | "termination") | fn.Fn
			LaunchTemplateConfigs: [...{
				LaunchTemplateSpecification?: {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version?:            string | fn.Fn
				}
				Overrides?: [...{
					AvailabilityZone?: string | fn.Fn
					InstanceType?:     ("c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "x1.16xlarge" | "x1.32xlarge") | fn.Fn
					MaxPrice?:         string | fn.Fn
					Priority?:         float | fn.Fn
					SubnetId?:         string | fn.Fn
					WeightedCapacity?: float | fn.Fn
				}]
			}]
			OnDemandOptions?: AllocationStrategy?: ("lowest-price" | "prioritized") | fn.Fn
			ReplaceUnhealthyInstances?: bool | fn.Fn
			SpotOptions?: {
				AllocationStrategy?:           ("capacityOptimized" | "diversified" | "lowestPrice") | fn.Fn
				InstanceInterruptionBehavior?: ("hibernate" | "stop" | "terminate") | fn.Fn
				InstancePoolsToUseCount?:      int | fn.Fn
			}
			TagSpecifications?: [...{
				ResourceType?: string | fn.Fn
				Tags?: [...{
					Key?:   string | fn.Fn
					Value?: string | fn.Fn
				}]
			}]
			TargetCapacitySpecification: {
				DefaultTargetCapacityType?: ("on-demand" | "spot") | fn.Fn
				OnDemandTargetCapacity?:    int | fn.Fn
				SpotTargetCapacity?:        int | fn.Fn
				TotalTargetCapacity:        int | fn.Fn
			}
			TerminateInstancesWithExpiration?: bool | fn.Fn
			Type?:                             ("instant" | "maintain" | "request") | fn.Fn
			ValidFrom?:                        string | fn.Fn
			ValidUntil?:                       string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	EIP :: {
		Type: "AWS::EC2::EIP"
		Properties: {
			Domain?:         ("standard" | "vpc") | fn.Fn
			InstanceId?:     string | fn.Fn
			PublicIpv4Pool?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	EIPAssociation :: {
		Type: "AWS::EC2::EIPAssociation"
		Properties: {
			AllocationId?:       string | fn.Fn
			EIP?:                string | fn.Fn
			InstanceId?:         string | fn.Fn
			NetworkInterfaceId?: string | fn.Fn
			PrivateIpAddress?:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	EgressOnlyInternetGateway :: {
		Type: "AWS::EC2::EgressOnlyInternetGateway"
		Properties: VpcId: string | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	FlowLog :: {
		Type: "AWS::EC2::FlowLog"
		Properties: {
			DeliverLogsPermissionArn?: string | fn.Fn
			LogDestination?:           string | fn.Fn
			LogDestinationType?:       ("cloud-watch-logs" | "s3") | fn.Fn
			LogGroupName?:             string | fn.Fn
			ResourceId:                string | fn.Fn
			ResourceType:              ("NetworkInterface" | "Subnet" | "VPC") | fn.Fn
			TrafficType:               ("ACCEPT" | "ALL" | "REJECT") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Host :: {
		Type: "AWS::EC2::Host"
		Properties: {
			AutoPlacement?:   ("off" | "on") | fn.Fn
			AvailabilityZone: string | fn.Fn
			HostRecovery?:    string | fn.Fn
			InstanceType:     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Instance :: {
		Type: "AWS::EC2::Instance"
		Properties: {
			AdditionalInfo?:   string | fn.Fn
			Affinity?:         ("default" | "host") | fn.Fn
			AvailabilityZone?: string | fn.Fn
			BlockDeviceMappings?: [...{
				DeviceName: string | fn.Fn
				Ebs?: {
					DeleteOnTermination?: bool | fn.Fn
					Encrypted?:           bool | fn.Fn
					Iops?:                (>=100 & <=20000) | fn.Fn
					KmsKeyId?:            string | fn.Fn
					SnapshotId?:          string | fn.Fn
					VolumeSize?:          int | fn.Fn
					VolumeType?:          ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
				}
				NoDevice?:    string | fn.Fn
				VirtualName?: string | fn.Fn
			}]
			CpuOptions?: {
				CoreCount?:      int | fn.Fn
				ThreadsPerCore?: int | fn.Fn
			}
			CreditSpecification?: CPUCredits?: ("standard" | "unlimited") | fn.Fn
			DisableApiTermination?: bool | fn.Fn
			EbsOptimized?:          bool | fn.Fn
			ElasticGpuSpecifications?: [...{
				Type: string | fn.Fn
			}]
			ElasticInferenceAccelerators?: [...{
				Count?: int | fn.Fn
				Type:   ("eia1.large" | "eia1.medium" | "eia1.xlarge") | fn.Fn
			}]
			HibernationOptions?: Configured?: bool | fn.Fn
			HostId?:                            string | fn.Fn
			HostResourceGroupArn?:              string | fn.Fn
			IamInstanceProfile?:                (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.Fn
			ImageId?:                           string | fn.Fn
			InstanceInitiatedShutdownBehavior?: string | fn.Fn
			InstanceType?:                      ("c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "x1.16xlarge" | "x1.32xlarge") | fn.Fn
			Ipv6AddressCount?:                  int | fn.Fn
			Ipv6Addresses?: [...{
				Ipv6Address: string | fn.Fn
			}]
			KernelId?: string | fn.Fn
			KeyName?:  string | fn.Fn
			LaunchTemplate?: {
				LaunchTemplateId?:   string | fn.Fn
				LaunchTemplateName?: string | fn.Fn
				Version:             string | fn.Fn
			}
			LicenseSpecifications?: [...{
				LicenseConfigurationArn: string | fn.Fn
			}]
			Monitoring?: bool | fn.Fn
			NetworkInterfaces?: [...{
				AssociatePublicIpAddress?: bool | fn.Fn
				DeleteOnTermination?:      bool | fn.Fn
				Description?:              string | fn.Fn
				DeviceIndex:               string | fn.Fn
				GroupSet?:                 [...(string | fn.Fn)] | fn.Fn
				Ipv6AddressCount?:         int | fn.Fn
				Ipv6Addresses?: [...{
					Ipv6Address: string | fn.Fn
				}]
				NetworkInterfaceId?: string | fn.Fn
				PrivateIpAddress?:   string | fn.Fn
				PrivateIpAddresses?: [...{
					Primary:          bool | fn.Fn
					PrivateIpAddress: string | fn.Fn
				}]
				SecondaryPrivateIpAddressCount?: int | fn.Fn
				SubnetId?:                       string | fn.Fn
			}]
			PlacementGroupName?: string | fn.Fn
			PrivateIpAddress?:   string | fn.Fn
			RamdiskId?:          string | fn.Fn
			SecurityGroupIds?:   [...(string | fn.Fn)] | fn.Fn
			SecurityGroups?:     [...(string | fn.Fn)] | fn.Fn
			SourceDestCheck?:    bool | fn.Fn
			SsmAssociations?: [...{
				AssociationParameters?: [...{
					Key:   string | fn.Fn
					Value: [...(string | fn.Fn)] | fn.Fn
				}]
				DocumentName: string | fn.Fn
			}]
			SubnetId?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Tenancy?:  ("dedicated" | "default" | "host") | fn.Fn
			UserData?: string | fn.Fn
			Volumes?: [...{
				Device:   string | fn.Fn
				VolumeId: string | fn.Fn
			}]
		}
		DependsOn?: string | [...string]
		CreationPolicy?: {
			AutoScalingCreationPolicy?: MinSuccessfulInstancesPercent?: int
			ResourceSignal?: {
				Count?:   int
				Timeout?: string
			}
		}
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	InternetGateway :: {
		Type: "AWS::EC2::InternetGateway"
		Properties: Tags?: [...{
			Key:   string | fn.Fn
			Value: string | fn.Fn
		}]
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LaunchTemplate :: {
		Type: "AWS::EC2::LaunchTemplate"
		Properties: {
			LaunchTemplateData?: {
				BlockDeviceMappings?: [...{
					DeviceName?: string | fn.Fn
					Ebs?: {
						DeleteOnTermination?: bool | fn.Fn
						Encrypted?:           bool | fn.Fn
						Iops?:                int | fn.Fn
						KmsKeyId?:            string | fn.Fn
						SnapshotId?:          string | fn.Fn
						VolumeSize?:          int | fn.Fn
						VolumeType?:          ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
					}
					NoDevice?:    string | fn.Fn
					VirtualName?: string | fn.Fn
				}]
				CapacityReservationSpecification?: {
					CapacityReservationPreference?: string | fn.Fn
					CapacityReservationTarget?: CapacityReservationId?: string | fn.Fn
				}
				CpuOptions?: {
					CoreCount?:      int | fn.Fn
					ThreadsPerCore?: int | fn.Fn
				}
				CreditSpecification?: CpuCredits?: ("standard" | "unlimited") | fn.Fn
				DisableApiTermination?: bool | fn.Fn
				EbsOptimized?:          bool | fn.Fn
				ElasticGpuSpecifications?: [...{
					Type?: string | fn.Fn
				}]
				ElasticInferenceAccelerators?: [...{
					Type?: string | fn.Fn
				}]
				HibernationOptions?: Configured?: bool | fn.Fn
				IamInstanceProfile?: {
					Arn?:  string | fn.Fn
					Name?: (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.Fn
				}
				ImageId?:                           string | fn.Fn
				InstanceInitiatedShutdownBehavior?: ("stop" | "terminate") | fn.Fn
				InstanceMarketOptions?: {
					MarketType?: ("spot") | fn.Fn
					SpotOptions?: {
						BlockDurationMinutes?:         int | fn.Fn
						InstanceInterruptionBehavior?: ("hibernate" | "stop" | "terminate") | fn.Fn
						MaxPrice?:                     string | fn.Fn
						SpotInstanceType?:             ("one-time" | "persistent") | fn.Fn
						ValidUntil?:                   string | fn.Fn
					}
				}
				InstanceType?: ("c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "x1.16xlarge" | "x1.32xlarge") | fn.Fn
				KernelId?:     string | fn.Fn
				KeyName?:      string | fn.Fn
				LicenseSpecifications?: [...{
					LicenseConfigurationArn?: string | fn.Fn
				}]
				Monitoring?: Enabled?: bool | fn.Fn
				NetworkInterfaces?: [...{
					AssociatePublicIpAddress?: bool | fn.Fn
					DeleteOnTermination?:      bool | fn.Fn
					Description?:              string | fn.Fn
					DeviceIndex?:              int | fn.Fn
					Groups?:                   [...(string | fn.Fn)] | fn.Fn
					InterfaceType?:            string | fn.Fn
					Ipv6AddressCount?:         int | fn.Fn
					Ipv6Addresses?: [...{
						Ipv6Address?: string | fn.Fn
					}]
					NetworkInterfaceId?: string | fn.Fn
					PrivateIpAddress?:   string | fn.Fn
					PrivateIpAddresses?: [...{
						Primary?:          bool | fn.Fn
						PrivateIpAddress?: string | fn.Fn
					}]
					SecondaryPrivateIpAddressCount?: int | fn.Fn
					SubnetId?:                       string | fn.Fn
				}]
				Placement?: {
					Affinity?:         string | fn.Fn
					AvailabilityZone?: string | fn.Fn
					GroupName?:        string | fn.Fn
					HostId?:           string | fn.Fn
					Tenancy?:          ("dedicated" | "default" | "host") | fn.Fn
				}
				RamDiskId?:        string | fn.Fn
				SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
				SecurityGroups?:   [...(string | fn.Fn)] | fn.Fn
				TagSpecifications?: [...{
					ResourceType: ("instance" | "volume") | fn.Fn
					Tags: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				UserData?: string | fn.Fn
			}
			LaunchTemplateName?: (strings.MinRunes(3) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9().\-/_]+$"#)) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	NatGateway :: {
		Type: "AWS::EC2::NatGateway"
		Properties: {
			AllocationId: string | fn.Fn
			SubnetId:     string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	NetworkAcl :: {
		Type: "AWS::EC2::NetworkAcl"
		Properties: {
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	NetworkAclEntry :: {
		Type: "AWS::EC2::NetworkAclEntry"
		Properties: {
			CidrBlock?: (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
			Egress?:    bool | fn.Fn
			Icmp?: {
				Code?: int | fn.Fn
				Type?: int | fn.Fn
			}
			Ipv6CidrBlock?: string | fn.Fn
			NetworkAclId:   string | fn.Fn
			PortRange?: {
				From?: int | fn.Fn
				To?:   int | fn.Fn
			}
			Protocol:   int | fn.Fn
			RuleAction: ("allow" | "deny") | fn.Fn
			RuleNumber: (>=1 & <=32766) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	NetworkInterface :: {
		Type: "AWS::EC2::NetworkInterface"
		Properties: {
			Description?:      string | fn.Fn
			GroupSet?:         [...(string | fn.Fn)] | fn.Fn
			InterfaceType?:    string | fn.Fn
			Ipv6AddressCount?: int | fn.Fn
			Ipv6Addresses?: Ipv6Address: string | fn.Fn
			PrivateIpAddress?: string | fn.Fn
			PrivateIpAddresses?: [...{
				Primary:          bool | fn.Fn
				PrivateIpAddress: string | fn.Fn
			}]
			SecondaryPrivateIpAddressCount?: int | fn.Fn
			SourceDestCheck?:                bool | fn.Fn
			SubnetId:                        string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	NetworkInterfaceAttachment :: {
		Type: "AWS::EC2::NetworkInterfaceAttachment"
		Properties: {
			DeleteOnTermination?: bool | fn.Fn
			DeviceIndex:          string | fn.Fn
			InstanceId:           string | fn.Fn
			NetworkInterfaceId:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	NetworkInterfacePermission :: {
		Type: "AWS::EC2::NetworkInterfacePermission"
		Properties: {
			AwsAccountId:       string | fn.Fn
			NetworkInterfaceId: string | fn.Fn
			Permission:         ("EIP-ASSOCIATE" | "INSTANCE-ATTACH") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	PlacementGroup :: {
		Type: "AWS::EC2::PlacementGroup"
		Properties: Strategy?: ("cluster" | "partition" | "spread") | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Route :: {
		Type: "AWS::EC2::Route"
		Properties: {
			DestinationCidrBlock?:        string | fn.Fn
			DestinationIpv6CidrBlock?:    string | fn.Fn
			EgressOnlyInternetGatewayId?: string | fn.Fn
			GatewayId?:                   string | fn.Fn
			InstanceId?:                  string | fn.Fn
			NatGatewayId?:                string | fn.Fn
			NetworkInterfaceId?:          string | fn.Fn
			RouteTableId:                 string | fn.Fn
			TransitGatewayId?:            string | fn.Fn
			VpcPeeringConnectionId?:      string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RouteTable :: {
		Type: "AWS::EC2::RouteTable"
		Properties: {
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SecurityGroup :: {
		Type: "AWS::EC2::SecurityGroup"
		Properties: {
			GroupDescription: (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.Fn
			GroupName?:       string | fn.Fn
			SecurityGroupEgress?: [...{
				CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
				CidrIpv6?:                   string | fn.Fn
				Description?:                string | fn.Fn
				DestinationPrefixListId?:    string | fn.Fn
				DestinationSecurityGroupId?: string | fn.Fn
				FromPort?:                   int | fn.Fn
				IpProtocol:                  string | fn.Fn
				ToPort?:                     int | fn.Fn
			}]
			SecurityGroupIngress?: [...{
				CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
				CidrIpv6?:                   string | fn.Fn
				Description?:                string | fn.Fn
				FromPort?:                   int | fn.Fn
				IpProtocol:                  string | fn.Fn
				SourcePrefixListId?:         string | fn.Fn
				SourceSecurityGroupId?:      string | fn.Fn
				SourceSecurityGroupName?:    string | fn.Fn
				SourceSecurityGroupOwnerId?: string | fn.Fn
				ToPort?:                     int | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcId?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SecurityGroupEgress :: {
		Type: "AWS::EC2::SecurityGroupEgress"
		Properties: {
			CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
			CidrIpv6?:                   string | fn.Fn
			Description?:                string | fn.Fn
			DestinationPrefixListId?:    string | fn.Fn
			DestinationSecurityGroupId?: string | fn.Fn
			FromPort?:                   int | fn.Fn
			GroupId:                     string | fn.Fn
			IpProtocol:                  string | fn.Fn
			ToPort?:                     int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SecurityGroupIngress :: {
		Type: "AWS::EC2::SecurityGroupIngress"
		Properties: {
			CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
			CidrIpv6?:                   string | fn.Fn
			Description?:                string | fn.Fn
			FromPort?:                   int | fn.Fn
			GroupId?:                    string | fn.Fn
			GroupName?:                  string | fn.Fn
			IpProtocol:                  string | fn.Fn
			SourcePrefixListId?:         string | fn.Fn
			SourceSecurityGroupId?:      string | fn.Fn
			SourceSecurityGroupName?:    string | fn.Fn
			SourceSecurityGroupOwnerId?: string | fn.Fn
			ToPort?:                     int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SpotFleet :: {
		Type: "AWS::EC2::SpotFleet"
		Properties: SpotFleetRequestConfigData: {
			AllocationStrategy?:              ("capacityOptimized" | "diversified" | "lowestPrice") | fn.Fn
			ExcessCapacityTerminationPolicy?: ("default" | "noTermination") | fn.Fn
			IamFleetRole:                     (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
			InstanceInterruptionBehavior?:    ("hibernate" | "stop" | "terminate") | fn.Fn
			LaunchSpecifications?: [...{
				BlockDeviceMappings?: [...{
					DeviceName: string | fn.Fn
					Ebs?: {
						DeleteOnTermination?: bool | fn.Fn
						Encrypted?:           bool | fn.Fn
						Iops?:                int | fn.Fn
						SnapshotId?:          string | fn.Fn
						VolumeSize?:          int | fn.Fn
						VolumeType?:          ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
					}
					NoDevice?:    string | fn.Fn
					VirtualName?: string | fn.Fn
				}]
				EbsOptimized?: bool | fn.Fn
				IamInstanceProfile?: Arn?: string | fn.Fn
				ImageId:      string | fn.Fn
				InstanceType: ("c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "x1.16xlarge" | "x1.32xlarge") | fn.Fn
				KernelId?:    string | fn.Fn
				KeyName?:     string | fn.Fn
				Monitoring?: Enabled?: bool | fn.Fn
				NetworkInterfaces?: [...{
					AssociatePublicIpAddress?: bool | fn.Fn
					DeleteOnTermination?:      bool | fn.Fn
					Description?:              string | fn.Fn
					DeviceIndex?:              int | fn.Fn
					Groups?:                   [...(string | fn.Fn)] | fn.Fn
					Ipv6AddressCount?:         int | fn.Fn
					Ipv6Addresses?: [...{
						Ipv6Address: string | fn.Fn
					}]
					NetworkInterfaceId?: string | fn.Fn
					PrivateIpAddresses?: [...{
						Primary?:         bool | fn.Fn
						PrivateIpAddress: string | fn.Fn
					}]
					SecondaryPrivateIpAddressCount?: int | fn.Fn
					SubnetId?:                       string | fn.Fn
				}]
				Placement?: {
					AvailabilityZone?: string | fn.Fn
					GroupName?:        string | fn.Fn
					Tenancy?:          string | fn.Fn
				}
				RamdiskId?: string | fn.Fn
				SecurityGroups?: [...{
					GroupId: string | fn.Fn
				}]
				SpotPrice?: string | fn.Fn
				SubnetId?:  string | fn.Fn
				TagSpecifications?: [...{
					ResourceType?: string | fn.Fn
					Tags?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				UserData?:         string | fn.Fn
				WeightedCapacity?: float | fn.Fn
			}]
			LaunchTemplateConfigs?: [...{
				LaunchTemplateSpecification?: {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version:             string | fn.Fn
				}
				Overrides?: [...{
					AvailabilityZone?: string | fn.Fn
					InstanceType?:     string | fn.Fn
					SpotPrice?:        string | fn.Fn
					SubnetId?:         string | fn.Fn
					WeightedCapacity?: float | fn.Fn
				}]
			}]
			LoadBalancersConfig?: {
				ClassicLoadBalancersConfig?: ClassicLoadBalancers: [...{
					Name: string | fn.Fn
				}]
				TargetGroupsConfig?: TargetGroups: [...{
					Arn: string | fn.Fn
				}]
			}
			ReplaceUnhealthyInstances?:        bool | fn.Fn
			SpotPrice?:                        string | fn.Fn
			TargetCapacity:                    int | fn.Fn
			TerminateInstancesWithExpiration?: bool | fn.Fn
			Type?:                             ("instant" | "maintain" | "request") | fn.Fn
			ValidFrom?:                        string | fn.Fn
			ValidUntil?:                       string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Subnet :: {
		Type: "AWS::EC2::Subnet"
		Properties: {
			AssignIpv6AddressOnCreation?: bool | fn.Fn
			AvailabilityZone?:            string | fn.Fn
			CidrBlock:                    string | fn.Fn
			Ipv6CidrBlock?:               string | fn.Fn
			MapPublicIpOnLaunch?:         bool | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SubnetCidrBlock :: {
		Type: "AWS::EC2::SubnetCidrBlock"
		Properties: {
			Ipv6CidrBlock: string | fn.Fn
			SubnetId:      string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SubnetNetworkAclAssociation :: {
		Type: "AWS::EC2::SubnetNetworkAclAssociation"
		Properties: {
			NetworkAclId: string | fn.Fn
			SubnetId:     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SubnetRouteTableAssociation :: {
		Type: "AWS::EC2::SubnetRouteTableAssociation"
		Properties: {
			RouteTableId: string | fn.Fn
			SubnetId:     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	TrafficMirrorFilter :: {
		Type: "AWS::EC2::TrafficMirrorFilter"
		Properties: {
			Description?:     string | fn.Fn
			NetworkServices?: [...(string | fn.Fn)] | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	TrafficMirrorFilterRule :: {
		Type: "AWS::EC2::TrafficMirrorFilterRule"
		Properties: {
			Description?:         string | fn.Fn
			DestinationCidrBlock: string | fn.Fn
			DestinationPortRange?: {
				FromPort: int | fn.Fn
				ToPort:   int | fn.Fn
			}
			Protocol?:       int | fn.Fn
			RuleAction:      string | fn.Fn
			RuleNumber:      int | fn.Fn
			SourceCidrBlock: string | fn.Fn
			SourcePortRange?: {
				FromPort: int | fn.Fn
				ToPort:   int | fn.Fn
			}
			TrafficDirection:      string | fn.Fn
			TrafficMirrorFilterId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	TrafficMirrorSession :: {
		Type: "AWS::EC2::TrafficMirrorSession"
		Properties: {
			Description?:       string | fn.Fn
			NetworkInterfaceId: string | fn.Fn
			PacketLength?:      int | fn.Fn
			SessionNumber:      int | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TrafficMirrorFilterId: string | fn.Fn
			TrafficMirrorTargetId: string | fn.Fn
			VirtualNetworkId?:     int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	TrafficMirrorTarget :: {
		Type: "AWS::EC2::TrafficMirrorTarget"
		Properties: {
			Description?:            string | fn.Fn
			NetworkInterfaceId?:     string | fn.Fn
			NetworkLoadBalancerArn?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPC :: {
		Type: "AWS::EC2::VPC"
		Properties: {
			CidrBlock:           string | fn.Fn
			EnableDnsHostnames?: bool | fn.Fn
			EnableDnsSupport?:   bool | fn.Fn
			InstanceTenancy?:    ("dedicated" | "default") | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPCCidrBlock :: {
		Type: "AWS::EC2::VPCCidrBlock"
		Properties: {
			AmazonProvidedIpv6CidrBlock?: bool | fn.Fn
			CidrBlock?:                   string | fn.Fn
			VpcId:                        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPCDHCPOptionsAssociation :: {
		Type: "AWS::EC2::VPCDHCPOptionsAssociation"
		Properties: {
			DhcpOptionsId: string | fn.Fn
			VpcId:         string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPCEndpoint :: {
		Type: "AWS::EC2::VPCEndpoint"
		Properties: {
			PolicyDocument?: {
				[string]: _
			} | fn.Fn
			PrivateDnsEnabled?: bool | fn.Fn
			RouteTableIds?:     [...(string | fn.Fn)] | fn.Fn
			SecurityGroupIds?:  [...(string | fn.Fn)] | fn.Fn
			ServiceName:        string | fn.Fn
			SubnetIds?:         [...(string | fn.Fn)] | fn.Fn
			VpcEndpointType?:   ("Gateway" | "Interface") | fn.Fn
			VpcId:              string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPCEndpointConnectionNotification :: {
		Type: "AWS::EC2::VPCEndpointConnectionNotification"
		Properties: {
			ConnectionEvents:          [...(("Accept" | "Connect" | "Delete" | "Reject") | fn.Fn)] | fn.Fn
			ConnectionNotificationArn: string | fn.Fn
			ServiceId?:                string | fn.Fn
			VPCEndpointId?:            string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPCEndpointService :: {
		Type: "AWS::EC2::VPCEndpointService"
		Properties: {
			AcceptanceRequired?:     bool | fn.Fn
			NetworkLoadBalancerArns: [...(string | fn.Fn)] | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPCEndpointServicePermissions :: {
		Type: "AWS::EC2::VPCEndpointServicePermissions"
		Properties: {
			AllowedPrincipals?: [...(string | fn.Fn)] | fn.Fn
			ServiceId:          string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPCGatewayAttachment :: {
		Type: "AWS::EC2::VPCGatewayAttachment"
		Properties: {
			InternetGatewayId?: string | fn.Fn
			VpcId:              string | fn.Fn
			VpnGatewayId?:      string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPCPeeringConnection :: {
		Type: "AWS::EC2::VPCPeeringConnection"
		Properties: {
			PeerOwnerId?: string | fn.Fn
			PeerRegion?:  string | fn.Fn
			PeerRoleArn?: string | fn.Fn
			PeerVpcId:    string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPNConnection :: {
		Type: "AWS::EC2::VPNConnection"
		Properties: {
			CustomerGatewayId: string | fn.Fn
			StaticRoutesOnly?: bool | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TransitGatewayId?: string | fn.Fn
			Type:              ("ipsec.1") | fn.Fn
			VpnGatewayId?:     string | fn.Fn
			VpnTunnelOptionsSpecifications?: [...{
				PreSharedKey?:     string | fn.Fn
				TunnelInsideCidr?: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPNConnectionRoute :: {
		Type: "AWS::EC2::VPNConnectionRoute"
		Properties: {
			DestinationCidrBlock: string | fn.Fn
			VpnConnectionId:      string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPNGateway :: {
		Type: "AWS::EC2::VPNGateway"
		Properties: {
			AmazonSideAsn?: int | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Type: ("ipsec.1") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VPNGatewayRoutePropagation :: {
		Type: "AWS::EC2::VPNGatewayRoutePropagation"
		Properties: {
			RouteTableIds: [...(string | fn.Fn)] | fn.Fn
			VpnGatewayId:  string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Volume :: {
		Type: "AWS::EC2::Volume"
		Properties: {
			AutoEnableIO?:    bool | fn.Fn
			AvailabilityZone: string | fn.Fn
			Encrypted?:       bool | fn.Fn
			Iops?:            int | fn.Fn
			KmsKeyId?:        string | fn.Fn
			Size?:            int | fn.Fn
			SnapshotId?:      string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VolumeType?: ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
	}
	VolumeAttachment :: {
		Type: "AWS::EC2::VolumeAttachment"
		Properties: {
			Device:     string | fn.Fn
			InstanceId: string | fn.Fn
			VolumeId:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

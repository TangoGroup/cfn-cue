package apnortheast3

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

EC2 :: {
	CustomerGateway :: {
		Type:       "AWS::EC2::CustomerGateway"
		Properties: close({
			BgpAsn:    int | fn.Fn
			IpAddress: string | fn.Fn
			Tags?:     [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: ("ipsec.1") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DHCPOptions :: {
		Type:       "AWS::EC2::DHCPOptions"
		Properties: close({
			DomainName?:         string | fn.Fn
			DomainNameServers?:  [...(string | fn.Fn)] | (string | fn.Fn)
			NetbiosNameServers?: [...(string | fn.Fn)] | (string | fn.Fn)
			NetbiosNodeType?:    (1 | 2 | 4 | 8) | fn.Fn
			NtpServers?:         [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EC2Fleet :: {
		Type:       "AWS::EC2::EC2Fleet"
		Properties: close({
			ExcessCapacityTerminationPolicy?: ("no-termination" | "termination") | fn.Fn
			LaunchTemplateConfigs:            [...close({
				LaunchTemplateSpecification?: close({
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version?:            string | fn.Fn
				}) | fn.If
				Overrides?: [...close({
					AvailabilityZone?: string | fn.Fn
					InstanceType?:     ("c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge") | fn.Fn
					MaxPrice?:         string | fn.Fn
					Placement?:        close({
						Affinity?:             string | fn.Fn
						AvailabilityZone?:     string | fn.Fn
						GroupName?:            string | fn.Fn
						HostId?:               string | fn.Fn
						HostResourceGroupArn?: string | fn.Fn
						PartitionNumber?:      int | fn.Fn
						SpreadDomain?:         string | fn.Fn
						Tenancy?:              string | fn.Fn
					}) | fn.If
					Priority?:         number | fn.Fn
					SubnetId?:         string | fn.Fn
					WeightedCapacity?: number | fn.Fn
				})] | fn.If
			})] | fn.If
			OnDemandOptions?: close({
				AllocationStrategy?:         ("lowest-price" | "prioritized") | fn.Fn
				CapacityReservationOptions?: close({
					UsageStrategy?: string | fn.Fn
				}) | fn.If
				MaxTotalPrice?:          string | fn.Fn
				MinTargetCapacity?:      int | fn.Fn
				SingleAvailabilityZone?: bool | fn.Fn
				SingleInstanceType?:     bool | fn.Fn
			}) | fn.If
			ReplaceUnhealthyInstances?: bool | fn.Fn
			SpotOptions?:               close({
				AllocationStrategy?:           ("capacityOptimized" | "diversified" | "lowestPrice") | fn.Fn
				InstanceInterruptionBehavior?: ("hibernate" | "stop" | "terminate") | fn.Fn
				InstancePoolsToUseCount?:      int | fn.Fn
				MaxTotalPrice?:                string | fn.Fn
				MinTargetCapacity?:            int | fn.Fn
				SingleAvailabilityZone?:       bool | fn.Fn
				SingleInstanceType?:           bool | fn.Fn
			}) | fn.If
			TagSpecifications?: [...close({
				ResourceType?: string | fn.Fn
				Tags?:         [...close({
					Key:   string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
			})] | fn.If
			TargetCapacitySpecification: close({
				DefaultTargetCapacityType?: ("on-demand" | "spot") | fn.Fn
				OnDemandTargetCapacity?:    int | fn.Fn
				SpotTargetCapacity?:        int | fn.Fn
				TotalTargetCapacity:        int | fn.Fn
			}) | fn.If
			TerminateInstancesWithExpiration?: bool | fn.Fn
			Type?:                             ("instant" | "maintain" | "request") | fn.Fn
			ValidFrom?:                        string | fn.Fn
			ValidUntil?:                       string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EIP :: {
		Type:       "AWS::EC2::EIP"
		Properties: close({
			Domain?:         ("standard" | "vpc") | fn.Fn
			InstanceId?:     string | fn.Fn
			PublicIpv4Pool?: string | fn.Fn
			Tags?:           [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EIPAssociation :: {
		Type:       "AWS::EC2::EIPAssociation"
		Properties: close({
			AllocationId?:       string | fn.Fn
			EIP?:                string | fn.Fn
			InstanceId?:         string | fn.Fn
			NetworkInterfaceId?: string | fn.Fn
			PrivateIpAddress?:   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EgressOnlyInternetGateway :: {
		Type:       "AWS::EC2::EgressOnlyInternetGateway"
		Properties: close({
			VpcId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FlowLog :: {
		Type:       "AWS::EC2::FlowLog"
		Properties: close({
			DeliverLogsPermissionArn?: string | fn.Fn
			LogDestination?:           string | fn.Fn
			LogDestinationType?:       ("cloud-watch-logs" | "s3") | fn.Fn
			LogGroupName?:             string | fn.Fn
			ResourceId:                string | fn.Fn
			ResourceType:              ("NetworkInterface" | "Subnet" | "VPC") | fn.Fn
			TrafficType:               ("ACCEPT" | "ALL" | "REJECT") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GatewayRouteTableAssociation :: {
		Type:       "AWS::EC2::GatewayRouteTableAssociation"
		Properties: close({
			GatewayId:    string | fn.Fn
			RouteTableId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Host :: {
		Type:       "AWS::EC2::Host"
		Properties: close({
			AutoPlacement?:   ("off" | "on") | fn.Fn
			AvailabilityZone: string | fn.Fn
			HostRecovery?:    string | fn.Fn
			InstanceType:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Instance :: {
		Type:       "AWS::EC2::Instance"
		Properties: close({
			AdditionalInfo?:      string | fn.Fn
			Affinity?:            ("default" | "host") | fn.Fn
			AvailabilityZone?:    string | fn.Fn
			BlockDeviceMappings?: [...close({
				DeviceName: string | fn.Fn
				Ebs?:       close({
					DeleteOnTermination?: bool | fn.Fn
					Encrypted?:           bool | fn.Fn
					Iops?:                (>=100 & <=20000) | fn.Fn
					KmsKeyId?:            string | fn.Fn
					SnapshotId?:          string | fn.Fn
					VolumeSize?:          int | fn.Fn
					VolumeType?:          ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
				}) | fn.If
				NoDevice?:    string | fn.Fn
				VirtualName?: string | fn.Fn
			})] | fn.If
			CpuOptions?: close({
				CoreCount?:      int | fn.Fn
				ThreadsPerCore?: int | fn.Fn
			}) | fn.If
			CreditSpecification?: close({
				CPUCredits?: ("standard" | "unlimited") | fn.Fn
			}) | fn.If
			DisableApiTermination?:    bool | fn.Fn
			EbsOptimized?:             bool | fn.Fn
			ElasticGpuSpecifications?: [...close({
				Type: string | fn.Fn
			})] | fn.If
			ElasticInferenceAccelerators?: [...close({
				Count?: int | fn.Fn
				Type:   ("eia1.large" | "eia1.medium" | "eia1.xlarge") | fn.Fn
			})] | fn.If
			HibernationOptions?: close({
				Configured?: bool | fn.Fn
			}) | fn.If
			HostId?:                            string | fn.Fn
			HostResourceGroupArn?:              string | fn.Fn
			IamInstanceProfile?:                (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.Fn
			ImageId?:                           string | fn.Fn
			InstanceInitiatedShutdownBehavior?: string | fn.Fn
			InstanceType?:                      ("c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge") | fn.Fn
			Ipv6AddressCount?:                  int | fn.Fn
			Ipv6Addresses?:                     [...close({
				Ipv6Address: string | fn.Fn
			})] | fn.If
			KernelId?:       string | fn.Fn
			KeyName?:        string | fn.Fn
			LaunchTemplate?: close({
				LaunchTemplateId?:   string | fn.Fn
				LaunchTemplateName?: string | fn.Fn
				Version:             string | fn.Fn
			}) | fn.If
			LicenseSpecifications?: [...close({
				LicenseConfigurationArn: string | fn.Fn
			})] | fn.If
			Monitoring?:        bool | fn.Fn
			NetworkInterfaces?: [...close({
				AssociatePublicIpAddress?: bool | fn.Fn
				DeleteOnTermination?:      bool | fn.Fn
				Description?:              string | fn.Fn
				DeviceIndex:               string | fn.Fn
				GroupSet?:                 [...(string | fn.Fn)] | (string | fn.Fn)
				Ipv6AddressCount?:         int | fn.Fn
				Ipv6Addresses?:            [...close({
					Ipv6Address: string | fn.Fn
				})] | fn.If
				NetworkInterfaceId?: string | fn.Fn
				PrivateIpAddress?:   string | fn.Fn
				PrivateIpAddresses?: [...close({
					Primary:          bool | fn.Fn
					PrivateIpAddress: string | fn.Fn
				})] | fn.If
				SecondaryPrivateIpAddressCount?: int | fn.Fn
				SubnetId?:                       string | fn.Fn
			})] | fn.If
			PlacementGroupName?: string | fn.Fn
			PrivateIpAddress?:   string | fn.Fn
			RamdiskId?:          string | fn.Fn
			SecurityGroupIds?:   [...(string | fn.Fn)] | (string | fn.Fn)
			SecurityGroups?:     [...(string | fn.Fn)] | (string | fn.Fn)
			SourceDestCheck?:    bool | fn.Fn
			SsmAssociations?:    [...close({
				AssociationParameters?: [...close({
					Key:   string | fn.Fn
					Value: [...(string | fn.Fn)] | (string | fn.Fn)
				})] | fn.If
				DocumentName: string | fn.Fn
			})] | fn.If
			SubnetId?: string | fn.Fn
			Tags?:     [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Tenancy?:  ("dedicated" | "default" | "host") | fn.Fn
			UserData?: string | fn.Fn
			Volumes?:  [...close({
				Device:   string | fn.Fn
				VolumeId: string | fn.Fn
			})] | fn.If
		})
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
		Condition?: string
	}
	InternetGateway :: {
		Type:       "AWS::EC2::InternetGateway"
		Properties: close({
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LaunchTemplate :: {
		Type:       "AWS::EC2::LaunchTemplate"
		Properties: close({
			LaunchTemplateData?: close({
				BlockDeviceMappings?: [...close({
					DeviceName?: string | fn.Fn
					Ebs?:        close({
						DeleteOnTermination?: bool | fn.Fn
						Encrypted?:           bool | fn.Fn
						Iops?:                int | fn.Fn
						KmsKeyId?:            string | fn.Fn
						SnapshotId?:          string | fn.Fn
						VolumeSize?:          int | fn.Fn
						VolumeType?:          ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
					}) | fn.If
					NoDevice?:    string | fn.Fn
					VirtualName?: string | fn.Fn
				})] | fn.If
				CapacityReservationSpecification?: close({
					CapacityReservationPreference?: string | fn.Fn
					CapacityReservationTarget?:     close({
						CapacityReservationId?: string | fn.Fn
					}) | fn.If
				}) | fn.If
				CpuOptions?: close({
					CoreCount?:      int | fn.Fn
					ThreadsPerCore?: int | fn.Fn
				}) | fn.If
				CreditSpecification?: close({
					CpuCredits?: ("standard" | "unlimited") | fn.Fn
				}) | fn.If
				DisableApiTermination?:    bool | fn.Fn
				EbsOptimized?:             bool | fn.Fn
				ElasticGpuSpecifications?: [...close({
					Type?: string | fn.Fn
				})] | fn.If
				ElasticInferenceAccelerators?: [...close({
					Count?: int | fn.Fn
					Type?:  string | fn.Fn
				})] | fn.If
				HibernationOptions?: close({
					Configured?: bool | fn.Fn
				}) | fn.If
				IamInstanceProfile?: close({
					Arn?:  string | fn.Fn
					Name?: (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.Fn
				}) | fn.If
				ImageId?:                           string | fn.Fn
				InstanceInitiatedShutdownBehavior?: ("stop" | "terminate") | fn.Fn
				InstanceMarketOptions?:             close({
					MarketType?:  ("spot") | fn.Fn
					SpotOptions?: close({
						BlockDurationMinutes?:         int | fn.Fn
						InstanceInterruptionBehavior?: ("hibernate" | "stop" | "terminate") | fn.Fn
						MaxPrice?:                     string | fn.Fn
						SpotInstanceType?:             ("one-time" | "persistent") | fn.Fn
						ValidUntil?:                   string | fn.Fn
					}) | fn.If
				}) | fn.If
				InstanceType?:          ("c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge") | fn.Fn
				KernelId?:              string | fn.Fn
				KeyName?:               string | fn.Fn
				LicenseSpecifications?: [...close({
					LicenseConfigurationArn?: string | fn.Fn
				})] | fn.If
				MetadataOptions?: close({
					HttpEndpoint?:            string | fn.Fn
					HttpPutResponseHopLimit?: int | fn.Fn
					HttpTokens?:              string | fn.Fn
				}) | fn.If
				Monitoring?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				NetworkInterfaces?: [...close({
					AssociatePublicIpAddress?: bool | fn.Fn
					DeleteOnTermination?:      bool | fn.Fn
					Description?:              string | fn.Fn
					DeviceIndex?:              int | fn.Fn
					Groups?:                   [...(string | fn.Fn)] | (string | fn.Fn)
					InterfaceType?:            string | fn.Fn
					Ipv6AddressCount?:         int | fn.Fn
					Ipv6Addresses?:            [...close({
						Ipv6Address?: string | fn.Fn
					})] | fn.If
					NetworkInterfaceId?: string | fn.Fn
					PrivateIpAddress?:   string | fn.Fn
					PrivateIpAddresses?: [...close({
						Primary?:          bool | fn.Fn
						PrivateIpAddress?: string | fn.Fn
					})] | fn.If
					SecondaryPrivateIpAddressCount?: int | fn.Fn
					SubnetId?:                       string | fn.Fn
				})] | fn.If
				Placement?: close({
					Affinity?:             string | fn.Fn
					AvailabilityZone?:     string | fn.Fn
					GroupName?:            string | fn.Fn
					HostId?:               string | fn.Fn
					HostResourceGroupArn?: string | fn.Fn
					PartitionNumber?:      int | fn.Fn
					SpreadDomain?:         string | fn.Fn
					Tenancy?:              ("dedicated" | "default" | "host") | fn.Fn
				}) | fn.If
				RamDiskId?:         string | fn.Fn
				SecurityGroupIds?:  [...(string | fn.Fn)] | (string | fn.Fn)
				SecurityGroups?:    [...(string | fn.Fn)] | (string | fn.Fn)
				TagSpecifications?: [...close({
					ResourceType: ("instance" | "volume") | fn.Fn
					Tags:         [...close({
						Key:   string | fn.Fn
						Value: string | fn.Fn
					})] | fn.If
				})] | fn.If
				UserData?: string | fn.Fn
			}) | fn.If
			LaunchTemplateName?: (strings.MinRunes(3) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9().\-/_]+$"#)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NatGateway :: {
		Type:       "AWS::EC2::NatGateway"
		Properties: close({
			AllocationId: string | fn.Fn
			SubnetId:     string | fn.Fn
			Tags?:        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NetworkAcl :: {
		Type:       "AWS::EC2::NetworkAcl"
		Properties: close({
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NetworkAclEntry :: {
		Type:       "AWS::EC2::NetworkAclEntry"
		Properties: close({
			CidrBlock?: (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
			Egress?:    bool | fn.Fn
			Icmp?:      close({
				Code?: int | fn.Fn
				Type?: int | fn.Fn
			}) | fn.If
			Ipv6CidrBlock?: string | fn.Fn
			NetworkAclId:   string | fn.Fn
			PortRange?:     close({
				From?: int | fn.Fn
				To?:   int | fn.Fn
			}) | fn.If
			Protocol:   int | fn.Fn
			RuleAction: ("allow" | "deny") | fn.Fn
			RuleNumber: (>=1 & <=32766) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NetworkInterface :: {
		Type:       "AWS::EC2::NetworkInterface"
		Properties: close({
			Description?:      string | fn.Fn
			GroupSet?:         [...(string | fn.Fn)] | (string | fn.Fn)
			InterfaceType?:    string | fn.Fn
			Ipv6AddressCount?: int | fn.Fn
			Ipv6Addresses?:    close({
				Ipv6Address: string | fn.Fn
			}) | fn.If
			PrivateIpAddress?:   string | fn.Fn
			PrivateIpAddresses?: [...close({
				Primary:          bool | fn.Fn
				PrivateIpAddress: string | fn.Fn
			})] | fn.If
			SecondaryPrivateIpAddressCount?: int | fn.Fn
			SourceDestCheck?:                bool | fn.Fn
			SubnetId:                        string | fn.Fn
			Tags?:                           [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NetworkInterfaceAttachment :: {
		Type:       "AWS::EC2::NetworkInterfaceAttachment"
		Properties: close({
			DeleteOnTermination?: bool | fn.Fn
			DeviceIndex:          string | fn.Fn
			InstanceId:           string | fn.Fn
			NetworkInterfaceId:   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NetworkInterfacePermission :: {
		Type:       "AWS::EC2::NetworkInterfacePermission"
		Properties: close({
			AwsAccountId:       string | fn.Fn
			NetworkInterfaceId: string | fn.Fn
			Permission:         ("EIP-ASSOCIATE" | "INSTANCE-ATTACH") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PlacementGroup :: {
		Type:       "AWS::EC2::PlacementGroup"
		Properties: close({
			Strategy?: ("cluster" | "partition" | "spread") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Route :: {
		Type:       "AWS::EC2::Route"
		Properties: close({
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
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RouteTable :: {
		Type:       "AWS::EC2::RouteTable"
		Properties: close({
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SecurityGroup :: {
		Type:       "AWS::EC2::SecurityGroup"
		Properties: close({
			GroupDescription:     (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.Fn
			GroupName?:           string | fn.Fn
			SecurityGroupEgress?: [...close({
				CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
				CidrIpv6?:                   string | fn.Fn
				Description?:                (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.Fn
				DestinationPrefixListId?:    string | fn.Fn
				DestinationSecurityGroupId?: string | fn.Fn
				FromPort?:                   int | fn.Fn
				IpProtocol:                  string | fn.Fn
				ToPort?:                     int | fn.Fn
			})] | fn.If
			SecurityGroupIngress?: [...close({
				CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
				CidrIpv6?:                   string | fn.Fn
				Description?:                (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.Fn
				FromPort?:                   int | fn.Fn
				IpProtocol:                  string | fn.Fn
				SourcePrefixListId?:         string | fn.Fn
				SourceSecurityGroupId?:      string | fn.Fn
				SourceSecurityGroupName?:    string | fn.Fn
				SourceSecurityGroupOwnerId?: string | fn.Fn
				ToPort?:                     int | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcId?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SecurityGroupEgress :: {
		Type:       "AWS::EC2::SecurityGroupEgress"
		Properties: close({
			CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
			CidrIpv6?:                   string | fn.Fn
			Description?:                string | fn.Fn
			DestinationPrefixListId?:    string | fn.Fn
			DestinationSecurityGroupId?: string | fn.Fn
			FromPort?:                   int | fn.Fn
			GroupId:                     string | fn.Fn
			IpProtocol:                  string | fn.Fn
			ToPort?:                     int | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SecurityGroupIngress :: {
		Type:       "AWS::EC2::SecurityGroupIngress"
		Properties: close({
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
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SpotFleet :: {
		Type:       "AWS::EC2::SpotFleet"
		Properties: close({
			SpotFleetRequestConfigData: close({
				AllocationStrategy?:              ("capacityOptimized" | "diversified" | "lowestPrice") | fn.Fn
				ExcessCapacityTerminationPolicy?: ("default" | "noTermination") | fn.Fn
				IamFleetRole:                     (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
				InstanceInterruptionBehavior?:    ("hibernate" | "stop" | "terminate") | fn.Fn
				LaunchSpecifications?:            [...close({
					BlockDeviceMappings?: [...close({
						DeviceName: string | fn.Fn
						Ebs?:       close({
							DeleteOnTermination?: bool | fn.Fn
							Encrypted?:           bool | fn.Fn
							Iops?:                int | fn.Fn
							SnapshotId?:          string | fn.Fn
							VolumeSize?:          int | fn.Fn
							VolumeType?:          ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
						}) | fn.If
						NoDevice?:    string | fn.Fn
						VirtualName?: string | fn.Fn
					})] | fn.If
					EbsOptimized?:       bool | fn.Fn
					IamInstanceProfile?: close({
						Arn?: string | fn.Fn
					}) | fn.If
					ImageId:      string | fn.Fn
					InstanceType: ("c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge") | fn.Fn
					KernelId?:    string | fn.Fn
					KeyName?:     string | fn.Fn
					Monitoring?:  close({
						Enabled?: bool | fn.Fn
					}) | fn.If
					NetworkInterfaces?: [...close({
						AssociatePublicIpAddress?: bool | fn.Fn
						DeleteOnTermination?:      bool | fn.Fn
						Description?:              string | fn.Fn
						DeviceIndex?:              int | fn.Fn
						Groups?:                   [...(string | fn.Fn)] | (string | fn.Fn)
						Ipv6AddressCount?:         int | fn.Fn
						Ipv6Addresses?:            [...close({
							Ipv6Address: string | fn.Fn
						})] | fn.If
						NetworkInterfaceId?: string | fn.Fn
						PrivateIpAddresses?: [...close({
							Primary?:         bool | fn.Fn
							PrivateIpAddress: string | fn.Fn
						})] | fn.If
						SecondaryPrivateIpAddressCount?: int | fn.Fn
						SubnetId?:                       string | fn.Fn
					})] | fn.If
					Placement?: close({
						AvailabilityZone?: string | fn.Fn
						GroupName?:        string | fn.Fn
						Tenancy?:          string | fn.Fn
					}) | fn.If
					RamdiskId?:      string | fn.Fn
					SecurityGroups?: [...close({
						GroupId: string | fn.Fn
					})] | fn.If
					SpotPrice?:         string | fn.Fn
					SubnetId?:          string | fn.Fn
					TagSpecifications?: [...close({
						ResourceType?: string | fn.Fn
						Tags?:         [...close({
							Key:   string | fn.Fn
							Value: string | fn.Fn
						})] | fn.If
					})] | fn.If
					UserData?:         string | fn.Fn
					WeightedCapacity?: number | fn.Fn
				})] | fn.If
				LaunchTemplateConfigs?: [...close({
					LaunchTemplateSpecification?: close({
						LaunchTemplateId?:   string | fn.Fn
						LaunchTemplateName?: string | fn.Fn
						Version:             string | fn.Fn
					}) | fn.If
					Overrides?: [...close({
						AvailabilityZone?: string | fn.Fn
						InstanceType?:     string | fn.Fn
						SpotPrice?:        string | fn.Fn
						SubnetId?:         string | fn.Fn
						WeightedCapacity?: number | fn.Fn
					})] | fn.If
				})] | fn.If
				LoadBalancersConfig?: close({
					ClassicLoadBalancersConfig?: close({
						ClassicLoadBalancers: [...close({
							Name: string | fn.Fn
						})] | fn.If
					}) | fn.If
					TargetGroupsConfig?: close({
						TargetGroups: [...close({
							Arn: string | fn.Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
				ReplaceUnhealthyInstances?:        bool | fn.Fn
				SpotPrice?:                        string | fn.Fn
				TargetCapacity:                    int | fn.Fn
				TerminateInstancesWithExpiration?: bool | fn.Fn
				Type?:                             ("instant" | "maintain" | "request") | fn.Fn
				ValidFrom?:                        string | fn.Fn
				ValidUntil?:                       string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Subnet :: {
		Type:       "AWS::EC2::Subnet"
		Properties: close({
			AssignIpv6AddressOnCreation?: bool | fn.Fn
			AvailabilityZone?:            string | fn.Fn
			CidrBlock:                    string | fn.Fn
			Ipv6CidrBlock?:               string | fn.Fn
			MapPublicIpOnLaunch?:         bool | fn.Fn
			Tags?:                        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SubnetCidrBlock :: {
		Type:       "AWS::EC2::SubnetCidrBlock"
		Properties: close({
			Ipv6CidrBlock: string | fn.Fn
			SubnetId:      string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SubnetNetworkAclAssociation :: {
		Type:       "AWS::EC2::SubnetNetworkAclAssociation"
		Properties: close({
			NetworkAclId: string | fn.Fn
			SubnetId:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SubnetRouteTableAssociation :: {
		Type:       "AWS::EC2::SubnetRouteTableAssociation"
		Properties: close({
			RouteTableId: string | fn.Fn
			SubnetId:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPC :: {
		Type:       "AWS::EC2::VPC"
		Properties: close({
			CidrBlock:           string | fn.Fn
			EnableDnsHostnames?: bool | fn.Fn
			EnableDnsSupport?:   bool | fn.Fn
			InstanceTenancy?:    ("dedicated" | "default") | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPCCidrBlock :: {
		Type:       "AWS::EC2::VPCCidrBlock"
		Properties: close({
			AmazonProvidedIpv6CidrBlock?: bool | fn.Fn
			CidrBlock?:                   string | fn.Fn
			VpcId:                        string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPCDHCPOptionsAssociation :: {
		Type:       "AWS::EC2::VPCDHCPOptionsAssociation"
		Properties: close({
			DhcpOptionsId: string | fn.Fn
			VpcId:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPCEndpoint :: {
		Type:       "AWS::EC2::VPCEndpoint"
		Properties: close({
			PolicyDocument?: {
				[string]: _
				Version:  string | *"2012-10-17"
			} | fn.Fn
			PrivateDnsEnabled?: bool | fn.Fn
			RouteTableIds?:     [...(string | fn.Fn)] | (string | fn.Fn)
			SecurityGroupIds?:  [...(string | fn.Fn)] | (string | fn.Fn)
			ServiceName:        string | fn.Fn
			SubnetIds?:         [...(string | fn.Fn)] | (string | fn.Fn)
			VpcEndpointType?:   ("Gateway" | "Interface") | fn.Fn
			VpcId:              string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPCEndpointConnectionNotification :: {
		Type:       "AWS::EC2::VPCEndpointConnectionNotification"
		Properties: close({
			ConnectionEvents:          [...(("Accept" | "Connect" | "Delete" | "Reject") | fn.Fn)] | (("Accept" | "Connect" | "Delete" | "Reject") | fn.Fn)
			ConnectionNotificationArn: string | fn.Fn
			ServiceId?:                string | fn.Fn
			VPCEndpointId?:            string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPCEndpointService :: {
		Type:       "AWS::EC2::VPCEndpointService"
		Properties: close({
			AcceptanceRequired?:     bool | fn.Fn
			NetworkLoadBalancerArns: [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPCEndpointServicePermissions :: {
		Type:       "AWS::EC2::VPCEndpointServicePermissions"
		Properties: close({
			AllowedPrincipals?: [...(string | fn.Fn)] | (string | fn.Fn)
			ServiceId:          string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPCGatewayAttachment :: {
		Type:       "AWS::EC2::VPCGatewayAttachment"
		Properties: close({
			InternetGatewayId?: string | fn.Fn
			VpcId:              string | fn.Fn
			VpnGatewayId?:      string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPCPeeringConnection :: {
		Type:       "AWS::EC2::VPCPeeringConnection"
		Properties: close({
			PeerOwnerId?: string | fn.Fn
			PeerRegion?:  string | fn.Fn
			PeerRoleArn?: string | fn.Fn
			PeerVpcId:    string | fn.Fn
			Tags?:        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPNConnection :: {
		Type:       "AWS::EC2::VPNConnection"
		Properties: close({
			CustomerGatewayId: string | fn.Fn
			StaticRoutesOnly?: bool | fn.Fn
			Tags?:             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TransitGatewayId?:               string | fn.Fn
			Type:                            ("ipsec.1") | fn.Fn
			VpnGatewayId?:                   string | fn.Fn
			VpnTunnelOptionsSpecifications?: [...close({
				PreSharedKey?:     string | fn.Fn
				TunnelInsideCidr?: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPNConnectionRoute :: {
		Type:       "AWS::EC2::VPNConnectionRoute"
		Properties: close({
			DestinationCidrBlock: string | fn.Fn
			VpnConnectionId:      string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPNGateway :: {
		Type:       "AWS::EC2::VPNGateway"
		Properties: close({
			AmazonSideAsn?: int | fn.Fn
			Tags?:          [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: ("ipsec.1") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VPNGatewayRoutePropagation :: {
		Type:       "AWS::EC2::VPNGatewayRoutePropagation"
		Properties: close({
			RouteTableIds: [...(string | fn.Fn)] | (string | fn.Fn)
			VpnGatewayId:  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Volume :: {
		Type:       "AWS::EC2::Volume"
		Properties: close({
			AutoEnableIO?:       bool | fn.Fn
			AvailabilityZone:    string | fn.Fn
			Encrypted?:          bool | fn.Fn
			Iops?:               int | fn.Fn
			KmsKeyId?:           string | fn.Fn
			MultiAttachEnabled?: bool | fn.Fn
			OutpostArn?:         string | fn.Fn
			Size?:               int | fn.Fn
			SnapshotId?:         string | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VolumeType?: ("gp2" | "io1" | "sc1" | "st1" | "standard") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	VolumeAttachment :: {
		Type:       "AWS::EC2::VolumeAttachment"
		Properties: close({
			Device:     string | fn.Fn
			InstanceId: string | fn.Fn
			VolumeId:   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

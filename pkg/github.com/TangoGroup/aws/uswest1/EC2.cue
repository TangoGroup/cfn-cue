package uswest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

#EC2: {
	#CapacityReservation: {
		Type: "AWS::EC2::CapacityReservation"
		Properties: {
			AvailabilityZone:       string | fn.#Fn
			EbsOptimized?:          bool | fn.#Fn
			EndDate?:               string | fn.#Fn
			EndDateType?:           ("limited" | "unlimited") | fn.#Fn
			EphemeralStorage?:      bool | fn.#Fn
			InstanceCount:          int | fn.#Fn
			InstanceMatchCriteria?: ("open" | "targeted") | fn.#Fn
			InstancePlatform:       ("Linux with SQL Server Enterprise" | "Linux with SQL Server Standard" | "Linux with SQL Server Web" | "Linux/UNIX" | "Red Hat Enterprise Linux" | "SUSE Linux" | "Windows" | "Windows with SQL Server" | "Windows with SQL Server Enterprise" | "Windows with SQL Server Standard" | "Windows with SQL Server Web") | fn.#Fn
			InstanceType:           ("c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge") | fn.#Fn
			TagSpecifications?:     [...{
				ResourceType?: string | fn.#Fn
				Tags?:         [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.If
			}] | fn.If
			Tenancy?: ("dedicated" | "default") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ClientVpnAuthorizationRule: {
		Type: "AWS::EC2::ClientVpnAuthorizationRule"
		Properties: {
			AccessGroupId?:      string | fn.#Fn
			AuthorizeAllGroups?: bool | fn.#Fn
			ClientVpnEndpointId: string | fn.#Fn
			Description?:        string | fn.#Fn
			TargetNetworkCidr:   (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ClientVpnEndpoint: {
		Type: "AWS::EC2::ClientVpnEndpoint"
		Properties: {
			AuthenticationOptions: [...{
				ActiveDirectory?: {
					DirectoryId: string | fn.#Fn
				} | fn.If
				FederatedAuthentication?: {
					SAMLProviderArn:             string | fn.#Fn
					SelfServiceSAMLProviderArn?: string | fn.#Fn
				} | fn.If
				MutualAuthentication?: {
					ClientRootCertificateChainArn: string | fn.#Fn
				} | fn.If
				Type: string | fn.#Fn
			}] | fn.If
			ClientCidrBlock:       (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			ClientConnectOptions?: {
				Enabled:            bool | fn.#Fn
				LambdaFunctionArn?: string | fn.#Fn
			} | fn.If
			ConnectionLogOptions: {
				CloudwatchLogGroup?:  string | fn.#Fn
				CloudwatchLogStream?: string | fn.#Fn
				Enabled:              bool | fn.#Fn
			} | fn.If
			Description?:         string | fn.#Fn
			DnsServers?:          [...(string | fn.#Fn)] | (string | fn.#Fn)
			SecurityGroupIds?:    [...(string | fn.#Fn)] | (string | fn.#Fn)
			SelfServicePortal?:   string | fn.#Fn
			ServerCertificateArn: string | fn.#Fn
			SplitTunnel?:         bool | fn.#Fn
			TagSpecifications?:   [...{
				ResourceType: string | fn.#Fn
				Tags:         [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.If
			}] | fn.If
			TransportProtocol?: string | fn.#Fn
			VpcId?:             string | fn.#Fn
			VpnPort?:           int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ClientVpnRoute: {
		Type: "AWS::EC2::ClientVpnRoute"
		Properties: {
			ClientVpnEndpointId:  string | fn.#Fn
			Description?:         string | fn.#Fn
			DestinationCidrBlock: string | fn.#Fn
			TargetVpcSubnetId:    string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ClientVpnTargetNetworkAssociation: {
		Type: "AWS::EC2::ClientVpnTargetNetworkAssociation"
		Properties: {
			ClientVpnEndpointId: string | fn.#Fn
			SubnetId:            string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#CustomerGateway: {
		Type: "AWS::EC2::CustomerGateway"
		Properties: {
			BgpAsn:    int | fn.#Fn
			IpAddress: string | fn.#Fn
			Tags?:     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			Type: ("ipsec.1") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DHCPOptions: {
		Type: "AWS::EC2::DHCPOptions"
		Properties: {
			DomainName?:         string | fn.#Fn
			DomainNameServers?:  [...(string | fn.#Fn)] | (string | fn.#Fn)
			NetbiosNameServers?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			NetbiosNodeType?:    (1 | 2 | 4 | 8) | fn.#Fn
			NtpServers?:         [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:               [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EC2Fleet: {
		Type: "AWS::EC2::EC2Fleet"
		Properties: {
			ExcessCapacityTerminationPolicy?: ("no-termination" | "termination") | fn.#Fn
			LaunchTemplateConfigs:            [...{
				LaunchTemplateSpecification?: {
					LaunchTemplateId?:   string | fn.#Fn
					LaunchTemplateName?: string | fn.#Fn
					Version?:            string | fn.#Fn
				} | fn.If
				Overrides?: [...{
					AvailabilityZone?: string | fn.#Fn
					InstanceType?:     ("c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge") | fn.#Fn
					MaxPrice?:         string | fn.#Fn
					Placement?:        {
						Affinity?:             string | fn.#Fn
						AvailabilityZone?:     string | fn.#Fn
						GroupName?:            string | fn.#Fn
						HostId?:               string | fn.#Fn
						HostResourceGroupArn?: string | fn.#Fn
						PartitionNumber?:      int | fn.#Fn
						SpreadDomain?:         string | fn.#Fn
						Tenancy?:              string | fn.#Fn
					} | fn.If
					Priority?:         number | fn.#Fn
					SubnetId?:         string | fn.#Fn
					WeightedCapacity?: number | fn.#Fn
				}] | fn.If
			}] | fn.If
			OnDemandOptions?: {
				AllocationStrategy?:         ("lowest-price" | "prioritized") | fn.#Fn
				CapacityReservationOptions?: {
					UsageStrategy?: string | fn.#Fn
				} | fn.If
				MaxTotalPrice?:          string | fn.#Fn
				MinTargetCapacity?:      int | fn.#Fn
				SingleAvailabilityZone?: bool | fn.#Fn
				SingleInstanceType?:     bool | fn.#Fn
			} | fn.If
			ReplaceUnhealthyInstances?: bool | fn.#Fn
			SpotOptions?:               {
				AllocationStrategy?:           ("capacityOptimized" | "diversified" | "lowestPrice") | fn.#Fn
				InstanceInterruptionBehavior?: ("hibernate" | "stop" | "terminate") | fn.#Fn
				InstancePoolsToUseCount?:      int | fn.#Fn
				MaxTotalPrice?:                string | fn.#Fn
				MinTargetCapacity?:            int | fn.#Fn
				SingleAvailabilityZone?:       bool | fn.#Fn
				SingleInstanceType?:           bool | fn.#Fn
			} | fn.If
			TagSpecifications?: [...{
				ResourceType?: string | fn.#Fn
				Tags?:         [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.If
			}] | fn.If
			TargetCapacitySpecification: {
				DefaultTargetCapacityType?: ("on-demand" | "spot") | fn.#Fn
				OnDemandTargetCapacity?:    int | fn.#Fn
				SpotTargetCapacity?:        int | fn.#Fn
				TotalTargetCapacity:        int | fn.#Fn
			} | fn.If
			TerminateInstancesWithExpiration?: bool | fn.#Fn
			Type?:                             ("instant" | "maintain" | "request") | fn.#Fn
			ValidFrom?:                        string | fn.#Fn
			ValidUntil?:                       string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EIP: {
		Type: "AWS::EC2::EIP"
		Properties: {
			Domain?:         ("standard" | "vpc") | fn.#Fn
			InstanceId?:     string | fn.#Fn
			PublicIpv4Pool?: string | fn.#Fn
			Tags?:           [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EIPAssociation: {
		Type: "AWS::EC2::EIPAssociation"
		Properties: {
			AllocationId?:       string | fn.#Fn
			EIP?:                string | fn.#Fn
			InstanceId?:         string | fn.#Fn
			NetworkInterfaceId?: string | fn.#Fn
			PrivateIpAddress?:   string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EgressOnlyInternetGateway: {
		Type: "AWS::EC2::EgressOnlyInternetGateway"
		Properties: VpcId: string | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#FlowLog: {
		Type: "AWS::EC2::FlowLog"
		Properties: {
			DeliverLogsPermissionArn?: string | fn.#Fn
			LogDestination?:           string | fn.#Fn
			LogDestinationType?:       ("cloud-watch-logs" | "s3") | fn.#Fn
			LogFormat?:                string | fn.#Fn
			LogGroupName?:             string | fn.#Fn
			MaxAggregationInterval?:   int | fn.#Fn
			ResourceId:                string | fn.#Fn
			ResourceType:              ("NetworkInterface" | "Subnet" | "VPC") | fn.#Fn
			Tags?:                     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			TrafficType: ("ACCEPT" | "ALL" | "REJECT") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#GatewayRouteTableAssociation: {
		Type: "AWS::EC2::GatewayRouteTableAssociation"
		Properties: {
			GatewayId:    string | fn.#Fn
			RouteTableId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Host: {
		Type: "AWS::EC2::Host"
		Properties: {
			AutoPlacement?:   ("off" | "on") | fn.#Fn
			AvailabilityZone: ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn
			HostRecovery?:    string | fn.#Fn
			InstanceType:     string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Instance: {
		Type: "AWS::EC2::Instance"
		Properties: {
			AdditionalInfo?:      string | fn.#Fn
			Affinity?:            ("default" | "host") | fn.#Fn
			AvailabilityZone?:    ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn
			BlockDeviceMappings?: [...{
				DeviceName: string | fn.#Fn
				Ebs?:       {
					DeleteOnTermination?: bool | fn.#Fn
					Encrypted?:           bool | fn.#Fn
					Iops?:                (>=100 & <=20000) | fn.#Fn
					KmsKeyId?:            string | fn.#Fn
					SnapshotId?:          string | fn.#Fn
					VolumeSize?:          int | fn.#Fn
					VolumeType?:          ("gp2" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
				} | fn.If
				NoDevice?:    string | fn.#Fn
				VirtualName?: string | fn.#Fn
			}] | fn.If
			CpuOptions?: {
				CoreCount?:      int | fn.#Fn
				ThreadsPerCore?: int | fn.#Fn
			} | fn.If
			CreditSpecification?: {
				CPUCredits?: ("standard" | "unlimited") | fn.#Fn
			} | fn.If
			DisableApiTermination?:    bool | fn.#Fn
			EbsOptimized?:             bool | fn.#Fn
			ElasticGpuSpecifications?: [...{
				Type: string | fn.#Fn
			}] | fn.If
			ElasticInferenceAccelerators?: [...{
				Count?: int | fn.#Fn
				Type:   ("eia1.large" | "eia1.medium" | "eia1.xlarge") | fn.#Fn
			}] | fn.If
			HibernationOptions?: {
				Configured?: bool | fn.#Fn
			} | fn.If
			HostId?:                            string | fn.#Fn
			HostResourceGroupArn?:              string | fn.#Fn
			IamInstanceProfile?:                (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.#Fn
			ImageId?:                           string | fn.#Fn
			InstanceInitiatedShutdownBehavior?: string | fn.#Fn
			InstanceType?:                      ("c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge") | fn.#Fn
			Ipv6AddressCount?:                  int | fn.#Fn
			Ipv6Addresses?:                     [...{
				Ipv6Address: string | fn.#Fn
			}] | fn.If
			KernelId?:       string | fn.#Fn
			KeyName?:        string | fn.#Fn
			LaunchTemplate?: {
				LaunchTemplateId?:   string | fn.#Fn
				LaunchTemplateName?: string | fn.#Fn
				Version:             string | fn.#Fn
			} | fn.If
			LicenseSpecifications?: [...{
				LicenseConfigurationArn: string | fn.#Fn
			}] | fn.If
			Monitoring?:        bool | fn.#Fn
			NetworkInterfaces?: [...{
				AssociatePublicIpAddress?: bool | fn.#Fn
				DeleteOnTermination?:      bool | fn.#Fn
				Description?:              string | fn.#Fn
				DeviceIndex:               string | fn.#Fn
				GroupSet?:                 [...(string | fn.#Fn)] | (string | fn.#Fn)
				Ipv6AddressCount?:         int | fn.#Fn
				Ipv6Addresses?:            [...{
					Ipv6Address: string | fn.#Fn
				}] | fn.If
				NetworkInterfaceId?: string | fn.#Fn
				PrivateIpAddress?:   string | fn.#Fn
				PrivateIpAddresses?: [...{
					Primary:          bool | fn.#Fn
					PrivateIpAddress: string | fn.#Fn
				}] | fn.If
				SecondaryPrivateIpAddressCount?: int | fn.#Fn
				SubnetId?:                       string | fn.#Fn
			}] | fn.If
			PlacementGroupName?: string | fn.#Fn
			PrivateIpAddress?:   string | fn.#Fn
			RamdiskId?:          string | fn.#Fn
			SecurityGroupIds?:   [...(string | fn.#Fn)] | (string | fn.#Fn)
			SecurityGroups?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
			SourceDestCheck?:    bool | fn.#Fn
			SsmAssociations?:    [...{
				AssociationParameters?: [...{
					Key:   string | fn.#Fn
					Value: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}] | fn.If
				DocumentName: string | fn.#Fn
			}] | fn.If
			SubnetId?: string | fn.#Fn
			Tags?:     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			Tenancy?:  ("dedicated" | "default" | "host") | fn.#Fn
			UserData?: string | fn.#Fn
			Volumes?:  [...{
				Device:   string | fn.#Fn
				VolumeId: string | fn.#Fn
			}] | fn.If
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
		Condition?: string
	}
	#InternetGateway: {
		Type: "AWS::EC2::InternetGateway"
		Properties: Tags?: [...{
			Key:   string | fn.#Fn
			Value: string | fn.#Fn
		}] | fn.If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LaunchTemplate: {
		Type: "AWS::EC2::LaunchTemplate"
		Properties: {
			LaunchTemplateData?: {
				BlockDeviceMappings?: [...{
					DeviceName?: string | fn.#Fn
					Ebs?:        {
						DeleteOnTermination?: bool | fn.#Fn
						Encrypted?:           bool | fn.#Fn
						Iops?:                int | fn.#Fn
						KmsKeyId?:            string | fn.#Fn
						SnapshotId?:          string | fn.#Fn
						VolumeSize?:          int | fn.#Fn
						VolumeType?:          ("gp2" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
					} | fn.If
					NoDevice?:    string | fn.#Fn
					VirtualName?: string | fn.#Fn
				}] | fn.If
				CapacityReservationSpecification?: {
					CapacityReservationPreference?: string | fn.#Fn
					CapacityReservationTarget?:     {
						CapacityReservationId?:               string | fn.#Fn
						CapacityReservationResourceGroupArn?: string | fn.#Fn
					} | fn.If
				} | fn.If
				CpuOptions?: {
					CoreCount?:      int | fn.#Fn
					ThreadsPerCore?: int | fn.#Fn
				} | fn.If
				CreditSpecification?: {
					CpuCredits?: ("standard" | "unlimited") | fn.#Fn
				} | fn.If
				DisableApiTermination?:    bool | fn.#Fn
				EbsOptimized?:             bool | fn.#Fn
				ElasticGpuSpecifications?: [...{
					Type?: string | fn.#Fn
				}] | fn.If
				ElasticInferenceAccelerators?: [...{
					Count?: int | fn.#Fn
					Type?:  string | fn.#Fn
				}] | fn.If
				HibernationOptions?: {
					Configured?: bool | fn.#Fn
				} | fn.If
				IamInstanceProfile?: {
					Arn?:  string | fn.#Fn
					Name?: (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.#Fn
				} | fn.If
				ImageId?:                           string | fn.#Fn
				InstanceInitiatedShutdownBehavior?: ("stop" | "terminate") | fn.#Fn
				InstanceMarketOptions?:             {
					MarketType?:  ("spot") | fn.#Fn
					SpotOptions?: {
						BlockDurationMinutes?:         int | fn.#Fn
						InstanceInterruptionBehavior?: ("hibernate" | "stop" | "terminate") | fn.#Fn
						MaxPrice?:                     string | fn.#Fn
						SpotInstanceType?:             ("one-time" | "persistent") | fn.#Fn
						ValidUntil?:                   string | fn.#Fn
					} | fn.If
				} | fn.If
				InstanceType?:          ("c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge") | fn.#Fn
				KernelId?:              string | fn.#Fn
				KeyName?:               string | fn.#Fn
				LicenseSpecifications?: [...{
					LicenseConfigurationArn?: string | fn.#Fn
				}] | fn.If
				MetadataOptions?: {
					HttpEndpoint?:            string | fn.#Fn
					HttpPutResponseHopLimit?: int | fn.#Fn
					HttpTokens?:              string | fn.#Fn
				} | fn.If
				Monitoring?: {
					Enabled?: bool | fn.#Fn
				} | fn.If
				NetworkInterfaces?: [...{
					AssociateCarrierIpAddress?: bool | fn.#Fn
					AssociatePublicIpAddress?:  bool | fn.#Fn
					DeleteOnTermination?:       bool | fn.#Fn
					Description?:               string | fn.#Fn
					DeviceIndex?:               int | fn.#Fn
					Groups?:                    [...(string | fn.#Fn)] | (string | fn.#Fn)
					InterfaceType?:             string | fn.#Fn
					Ipv6AddressCount?:          int | fn.#Fn
					Ipv6Addresses?:             [...{
						Ipv6Address?: string | fn.#Fn
					}] | fn.If
					NetworkCardIndex?:   int | fn.#Fn
					NetworkInterfaceId?: string | fn.#Fn
					PrivateIpAddress?:   string | fn.#Fn
					PrivateIpAddresses?: [...{
						Primary?:          bool | fn.#Fn
						PrivateIpAddress?: string | fn.#Fn
					}] | fn.If
					SecondaryPrivateIpAddressCount?: int | fn.#Fn
					SubnetId?:                       string | fn.#Fn
				}] | fn.If
				Placement?: {
					Affinity?:             string | fn.#Fn
					AvailabilityZone?:     ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn
					GroupName?:            string | fn.#Fn
					HostId?:               string | fn.#Fn
					HostResourceGroupArn?: string | fn.#Fn
					PartitionNumber?:      int | fn.#Fn
					SpreadDomain?:         string | fn.#Fn
					Tenancy?:              ("dedicated" | "default" | "host") | fn.#Fn
				} | fn.If
				RamDiskId?:         string | fn.#Fn
				SecurityGroupIds?:  [...(string | fn.#Fn)] | (string | fn.#Fn)
				SecurityGroups?:    [...(string | fn.#Fn)] | (string | fn.#Fn)
				TagSpecifications?: [...{
					ResourceType: ("client-vpn-endpoint" | "customer-gateway" | "dedicated-host" | "dhcp-options" | "egress-only-internet-gateway" | "elastic-gpu" | "elastic-ip" | "export-image-task" | "export-instance-task" | "fleet" | "fpga-image" | "host-reservation" | "image" | "import-image-task" | "import-snapshot-task" | "instance" | "internet-gateway" | "key-pair" | "launch-template" | "local-gateway-route-table-vpc-association" | "natgateway" | "network-acl" | "network-interface" | "placement-group" | "reserved-instances" | "route-table" | "security-group" | "snapshot" | "spot-fleet-request" | "spot-instances-request" | "subnet" | "traffic-mirror-filter" | "traffic-mirror-session" | "traffic-mirror-target" | "transit-gateway" | "transit-gateway-attachment" | "transit-gateway-multicast-domain" | "transit-gateway-route-table" | "volume" | "vpc" | "vpc-flow-log" | "vpc-peering-connection" | "vpn-connection" | "vpn-gateway") | fn.#Fn
					Tags:         [...{
						Key:   string | fn.#Fn
						Value: string | fn.#Fn
					}] | fn.If
				}] | fn.If
				UserData?: string | fn.#Fn
			} | fn.If
			LaunchTemplateName?: (strings.MinRunes(3) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9().\-/_]+$"#)) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LocalGatewayRoute: {
		Type: "AWS::EC2::LocalGatewayRoute"
		Properties: {
			DestinationCidrBlock:                (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			LocalGatewayRouteTableId:            string | fn.#Fn
			LocalGatewayVirtualInterfaceGroupId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LocalGatewayRouteTableVPCAssociation: {
		Type: "AWS::EC2::LocalGatewayRouteTableVPCAssociation"
		Properties: {
			LocalGatewayRouteTableId: string | fn.#Fn
			Tags?:                    {
				Tags?: [...{
					[string]: _
				}] | fn.If
			} | fn.If
			VpcId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NatGateway: {
		Type: "AWS::EC2::NatGateway"
		Properties: {
			AllocationId: string | fn.#Fn
			SubnetId:     string | fn.#Fn
			Tags?:        [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NetworkAcl: {
		Type: "AWS::EC2::NetworkAcl"
		Properties: {
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VpcId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NetworkAclEntry: {
		Type: "AWS::EC2::NetworkAclEntry"
		Properties: {
			CidrBlock?: (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			Egress?:    bool | fn.#Fn
			Icmp?:      {
				Code?: int | fn.#Fn
				Type?: int | fn.#Fn
			} | fn.If
			Ipv6CidrBlock?: string | fn.#Fn
			NetworkAclId:   string | fn.#Fn
			PortRange?:     {
				From?: int | fn.#Fn
				To?:   int | fn.#Fn
			} | fn.If
			Protocol:   int | fn.#Fn
			RuleAction: ("allow" | "deny") | fn.#Fn
			RuleNumber: (>=1 & <=32766) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NetworkInterface: {
		Type: "AWS::EC2::NetworkInterface"
		Properties: {
			Description?:      string | fn.#Fn
			GroupSet?:         [...(string | fn.#Fn)] | (string | fn.#Fn)
			InterfaceType?:    string | fn.#Fn
			Ipv6AddressCount?: int | fn.#Fn
			Ipv6Addresses?:    [...{
				Ipv6Address: string | fn.#Fn
			}] | fn.If
			PrivateIpAddress?:   string | fn.#Fn
			PrivateIpAddresses?: [...{
				Primary:          bool | fn.#Fn
				PrivateIpAddress: string | fn.#Fn
			}] | fn.If
			SecondaryPrivateIpAddressCount?: int | fn.#Fn
			SourceDestCheck?:                bool | fn.#Fn
			SubnetId:                        string | fn.#Fn
			Tags?:                           [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NetworkInterfaceAttachment: {
		Type: "AWS::EC2::NetworkInterfaceAttachment"
		Properties: {
			DeleteOnTermination?: bool | fn.#Fn
			DeviceIndex:          string | fn.#Fn
			InstanceId:           string | fn.#Fn
			NetworkInterfaceId:   string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NetworkInterfacePermission: {
		Type: "AWS::EC2::NetworkInterfacePermission"
		Properties: {
			AwsAccountId:       string | fn.#Fn
			NetworkInterfaceId: string | fn.#Fn
			Permission:         ("EIP-ASSOCIATE" | "INSTANCE-ATTACH") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PlacementGroup: {
		Type: "AWS::EC2::PlacementGroup"
		Properties: Strategy?: ("cluster" | "partition" | "spread") | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PrefixList: {
		Type: "AWS::EC2::PrefixList"
		Properties: {
			AddressFamily: string | fn.#Fn
			Entries?:      [...{
				Cidr:         (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
				Description?: string | fn.#Fn
			}] | fn.If
			MaxEntries:     int | fn.#Fn
			PrefixListName: string | fn.#Fn
			Tags?:          [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Route: {
		Type: "AWS::EC2::Route"
		Properties: {
			CarrierGatewayId?:            string | fn.#Fn
			DestinationCidrBlock?:        (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			DestinationIpv6CidrBlock?:    string | fn.#Fn
			EgressOnlyInternetGatewayId?: string | fn.#Fn
			GatewayId?:                   string | fn.#Fn
			InstanceId?:                  string | fn.#Fn
			LocalGatewayId?:              string | fn.#Fn
			NatGatewayId?:                string | fn.#Fn
			NetworkInterfaceId?:          string | fn.#Fn
			RouteTableId:                 string | fn.#Fn
			TransitGatewayId?:            string | fn.#Fn
			VpcEndpointId?:               string | fn.#Fn
			VpcPeeringConnectionId?:      string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RouteTable: {
		Type: "AWS::EC2::RouteTable"
		Properties: {
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VpcId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SecurityGroup: {
		Type: "AWS::EC2::SecurityGroup"
		Properties: {
			GroupDescription:     (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.#Fn
			GroupName?:           string | fn.#Fn
			SecurityGroupEgress?: [...{
				CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
				CidrIpv6?:                   string | fn.#Fn
				Description?:                (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.#Fn
				DestinationPrefixListId?:    string | fn.#Fn
				DestinationSecurityGroupId?: string | fn.#Fn
				FromPort?:                   int | fn.#Fn
				IpProtocol:                  string | fn.#Fn
				ToPort?:                     int | fn.#Fn
			}] | fn.If
			SecurityGroupIngress?: [...{
				CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
				CidrIpv6?:                   string | fn.#Fn
				Description?:                (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.#Fn
				FromPort?:                   int | fn.#Fn
				IpProtocol:                  string | fn.#Fn
				SourcePrefixListId?:         string | fn.#Fn
				SourceSecurityGroupId?:      string | fn.#Fn
				SourceSecurityGroupName?:    string | fn.#Fn
				SourceSecurityGroupOwnerId?: string | fn.#Fn
				ToPort?:                     int | fn.#Fn
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VpcId?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SecurityGroupEgress: {
		Type: "AWS::EC2::SecurityGroupEgress"
		Properties: {
			CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			CidrIpv6?:                   string | fn.#Fn
			Description?:                string | fn.#Fn
			DestinationPrefixListId?:    string | fn.#Fn
			DestinationSecurityGroupId?: string | fn.#Fn
			FromPort?:                   int | fn.#Fn
			GroupId:                     string | fn.#Fn
			IpProtocol:                  string | fn.#Fn
			ToPort?:                     int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SecurityGroupIngress: {
		Type: "AWS::EC2::SecurityGroupIngress"
		Properties: {
			CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			CidrIpv6?:                   string | fn.#Fn
			Description?:                string | fn.#Fn
			FromPort?:                   int | fn.#Fn
			GroupId?:                    string | fn.#Fn
			GroupName?:                  string | fn.#Fn
			IpProtocol:                  string | fn.#Fn
			SourcePrefixListId?:         string | fn.#Fn
			SourceSecurityGroupId?:      string | fn.#Fn
			SourceSecurityGroupName?:    string | fn.#Fn
			SourceSecurityGroupOwnerId?: string | fn.#Fn
			ToPort?:                     int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SpotFleet: {
		Type: "AWS::EC2::SpotFleet"
		Properties: SpotFleetRequestConfigData: {
			AllocationStrategy?:              ("capacityOptimized" | "diversified" | "lowestPrice") | fn.#Fn
			ExcessCapacityTerminationPolicy?: ("default" | "noTermination") | fn.#Fn
			IamFleetRole:                     (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
			InstanceInterruptionBehavior?:    ("hibernate" | "stop" | "terminate") | fn.#Fn
			LaunchSpecifications?:            [...{
				BlockDeviceMappings?: [...{
					DeviceName: string | fn.#Fn
					Ebs?:       {
						DeleteOnTermination?: bool | fn.#Fn
						Encrypted?:           bool | fn.#Fn
						Iops?:                int | fn.#Fn
						SnapshotId?:          string | fn.#Fn
						VolumeSize?:          int | fn.#Fn
						VolumeType?:          ("gp2" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
					} | fn.If
					NoDevice?:    string | fn.#Fn
					VirtualName?: string | fn.#Fn
				}] | fn.If
				EbsOptimized?:       bool | fn.#Fn
				IamInstanceProfile?: {
					Arn?: string | fn.#Fn
				} | fn.If
				ImageId:      string | fn.#Fn
				InstanceType: ("c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge") | fn.#Fn
				KernelId?:    string | fn.#Fn
				KeyName?:     string | fn.#Fn
				Monitoring?:  {
					Enabled?: bool | fn.#Fn
				} | fn.If
				NetworkInterfaces?: [...{
					AssociatePublicIpAddress?: bool | fn.#Fn
					DeleteOnTermination?:      bool | fn.#Fn
					Description?:              string | fn.#Fn
					DeviceIndex?:              int | fn.#Fn
					Groups?:                   [...(string | fn.#Fn)] | (string | fn.#Fn)
					Ipv6AddressCount?:         int | fn.#Fn
					Ipv6Addresses?:            [...{
						Ipv6Address: string | fn.#Fn
					}] | fn.If
					NetworkInterfaceId?: string | fn.#Fn
					PrivateIpAddresses?: [...{
						Primary?:         bool | fn.#Fn
						PrivateIpAddress: string | fn.#Fn
					}] | fn.If
					SecondaryPrivateIpAddressCount?: int | fn.#Fn
					SubnetId?:                       string | fn.#Fn
				}] | fn.If
				Placement?: {
					AvailabilityZone?: ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn
					GroupName?:        string | fn.#Fn
					Tenancy?:          string | fn.#Fn
				} | fn.If
				RamdiskId?:      string | fn.#Fn
				SecurityGroups?: [...{
					GroupId: string | fn.#Fn
				}] | fn.If
				SpotPrice?:         string | fn.#Fn
				SubnetId?:          string | fn.#Fn
				TagSpecifications?: [...{
					ResourceType?: string | fn.#Fn
					Tags?:         [...{
						Key:   string | fn.#Fn
						Value: string | fn.#Fn
					}] | fn.If
				}] | fn.If
				UserData?:         string | fn.#Fn
				WeightedCapacity?: number | fn.#Fn
			}] | fn.If
			LaunchTemplateConfigs?: [...{
				LaunchTemplateSpecification?: {
					LaunchTemplateId?:   string | fn.#Fn
					LaunchTemplateName?: string | fn.#Fn
					Version:             string | fn.#Fn
				} | fn.If
				Overrides?: [...{
					AvailabilityZone?: ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn
					InstanceType?:     string | fn.#Fn
					SpotPrice?:        string | fn.#Fn
					SubnetId?:         string | fn.#Fn
					WeightedCapacity?: number | fn.#Fn
				}] | fn.If
			}] | fn.If
			LoadBalancersConfig?: {
				ClassicLoadBalancersConfig?: {
					ClassicLoadBalancers: [...{
						Name: string | fn.#Fn
					}] | fn.If
				} | fn.If
				TargetGroupsConfig?: {
					TargetGroups: [...{
						Arn: string | fn.#Fn
					}] | fn.If
				} | fn.If
			} | fn.If
			ReplaceUnhealthyInstances?:        bool | fn.#Fn
			SpotPrice?:                        string | fn.#Fn
			TargetCapacity:                    int | fn.#Fn
			TerminateInstancesWithExpiration?: bool | fn.#Fn
			Type?:                             ("instant" | "maintain" | "request") | fn.#Fn
			ValidFrom?:                        string | fn.#Fn
			ValidUntil?:                       string | fn.#Fn
		} | fn.If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Subnet: {
		Type: "AWS::EC2::Subnet"
		Properties: {
			AssignIpv6AddressOnCreation?: bool | fn.#Fn
			AvailabilityZone?:            ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn
			CidrBlock:                    (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(1[6-9]|2[0-8]))$"#) | fn.#Fn
			Ipv6CidrBlock?:               string | fn.#Fn
			MapPublicIpOnLaunch?:         bool | fn.#Fn
			OutpostArn?:                  string | fn.#Fn
			Tags?:                        [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VpcId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubnetCidrBlock: {
		Type: "AWS::EC2::SubnetCidrBlock"
		Properties: {
			Ipv6CidrBlock: string | fn.#Fn
			SubnetId:      string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubnetNetworkAclAssociation: {
		Type: "AWS::EC2::SubnetNetworkAclAssociation"
		Properties: {
			NetworkAclId: string | fn.#Fn
			SubnetId:     string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubnetRouteTableAssociation: {
		Type: "AWS::EC2::SubnetRouteTableAssociation"
		Properties: {
			RouteTableId: string | fn.#Fn
			SubnetId:     string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TrafficMirrorFilter: {
		Type: "AWS::EC2::TrafficMirrorFilter"
		Properties: {
			Description?:     string | fn.#Fn
			NetworkServices?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:            [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TrafficMirrorFilterRule: {
		Type: "AWS::EC2::TrafficMirrorFilterRule"
		Properties: {
			Description?:          string | fn.#Fn
			DestinationCidrBlock:  (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			DestinationPortRange?: {
				FromPort: int | fn.#Fn
				ToPort:   int | fn.#Fn
			} | fn.If
			Protocol?:        int | fn.#Fn
			RuleAction:       string | fn.#Fn
			RuleNumber:       int | fn.#Fn
			SourceCidrBlock:  string | fn.#Fn
			SourcePortRange?: {
				FromPort: int | fn.#Fn
				ToPort:   int | fn.#Fn
			} | fn.If
			TrafficDirection:      string | fn.#Fn
			TrafficMirrorFilterId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TrafficMirrorSession: {
		Type: "AWS::EC2::TrafficMirrorSession"
		Properties: {
			Description?:       string | fn.#Fn
			NetworkInterfaceId: string | fn.#Fn
			PacketLength?:      int | fn.#Fn
			SessionNumber:      int | fn.#Fn
			Tags?:              [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			TrafficMirrorFilterId: string | fn.#Fn
			TrafficMirrorTargetId: string | fn.#Fn
			VirtualNetworkId?:     int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TrafficMirrorTarget: {
		Type: "AWS::EC2::TrafficMirrorTarget"
		Properties: {
			Description?:            string | fn.#Fn
			NetworkInterfaceId?:     string | fn.#Fn
			NetworkLoadBalancerArn?: string | fn.#Fn
			Tags?:                   [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TransitGateway: {
		Type: "AWS::EC2::TransitGateway"
		Properties: {
			AmazonSideAsn?:                int | fn.#Fn
			AutoAcceptSharedAttachments?:  ("disable" | "enable") | fn.#Fn
			DefaultRouteTableAssociation?: ("disable" | "enable") | fn.#Fn
			DefaultRouteTablePropagation?: ("disable" | "enable") | fn.#Fn
			Description?:                  string | fn.#Fn
			DnsSupport?:                   ("disable" | "enable") | fn.#Fn
			MulticastSupport?:             string | fn.#Fn
			Tags?:                         [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VpnEcmpSupport?: ("disable" | "enable") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TransitGatewayAttachment: {
		Type: "AWS::EC2::TransitGatewayAttachment"
		Properties: {
			SubnetIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			TransitGatewayId: string | fn.#Fn
			VpcId:            string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TransitGatewayRoute: {
		Type: "AWS::EC2::TransitGatewayRoute"
		Properties: {
			Blackhole?:                  bool | fn.#Fn
			DestinationCidrBlock?:       (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			TransitGatewayAttachmentId?: string | fn.#Fn
			TransitGatewayRouteTableId:  string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TransitGatewayRouteTable: {
		Type: "AWS::EC2::TransitGatewayRouteTable"
		Properties: {
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			TransitGatewayId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TransitGatewayRouteTableAssociation: {
		Type: "AWS::EC2::TransitGatewayRouteTableAssociation"
		Properties: {
			TransitGatewayAttachmentId: string | fn.#Fn
			TransitGatewayRouteTableId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#TransitGatewayRouteTablePropagation: {
		Type: "AWS::EC2::TransitGatewayRouteTablePropagation"
		Properties: {
			TransitGatewayAttachmentId: string | fn.#Fn
			TransitGatewayRouteTableId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPC: {
		Type: "AWS::EC2::VPC"
		Properties: {
			CidrBlock:           (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(1[6-9]|2[0-8]))$"#) | fn.#Fn
			EnableDnsHostnames?: bool | fn.#Fn
			EnableDnsSupport?:   bool | fn.#Fn
			InstanceTenancy?:    ("dedicated" | "default") | fn.#Fn
			Tags?:               [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCCidrBlock: {
		Type: "AWS::EC2::VPCCidrBlock"
		Properties: {
			AmazonProvidedIpv6CidrBlock?: bool | fn.#Fn
			CidrBlock?:                   (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(1[6-9]|2[0-8]))$"#) | fn.#Fn
			VpcId:                        string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCDHCPOptionsAssociation: {
		Type: "AWS::EC2::VPCDHCPOptionsAssociation"
		Properties: {
			DhcpOptionsId: string | fn.#Fn
			VpcId:         string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCEndpoint: {
		Type: "AWS::EC2::VPCEndpoint"
		Properties: {
			PolicyDocument?: {
				{
					[string]: _
				}
				Version: string | *"2012-10-17"
			} | fn.#Fn
			PrivateDnsEnabled?: bool | fn.#Fn
			RouteTableIds?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
			SecurityGroupIds?:  [...(string | fn.#Fn)] | (string | fn.#Fn)
			ServiceName:        string | fn.#Fn
			SubnetIds?:         [...(string | fn.#Fn)] | (string | fn.#Fn)
			VpcEndpointType?:   ("Gateway" | "GatewayLoadBalancer" | "Interface") | fn.#Fn
			VpcId:              string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCEndpointService: {
		Type: "AWS::EC2::VPCEndpointService"
		Properties: {
			AcceptanceRequired?:      bool | fn.#Fn
			GatewayLoadBalancerArns?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			NetworkLoadBalancerArns?: [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCEndpointServicePermissions: {
		Type: "AWS::EC2::VPCEndpointServicePermissions"
		Properties: {
			AllowedPrincipals?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			ServiceId:          string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCGatewayAttachment: {
		Type: "AWS::EC2::VPCGatewayAttachment"
		Properties: {
			InternetGatewayId?: string | fn.#Fn
			VpcId:              string | fn.#Fn
			VpnGatewayId?:      string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPCPeeringConnection: {
		Type: "AWS::EC2::VPCPeeringConnection"
		Properties: {
			PeerOwnerId?: string | fn.#Fn
			PeerRegion?:  string | fn.#Fn
			PeerRoleArn?: string | fn.#Fn
			PeerVpcId:    string | fn.#Fn
			Tags?:        [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VpcId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPNConnection: {
		Type: "AWS::EC2::VPNConnection"
		Properties: {
			CustomerGatewayId: string | fn.#Fn
			StaticRoutesOnly?: bool | fn.#Fn
			Tags?:             [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			TransitGatewayId?:               string | fn.#Fn
			Type:                            ("ipsec.1") | fn.#Fn
			VpnGatewayId?:                   string | fn.#Fn
			VpnTunnelOptionsSpecifications?: [...{
				PreSharedKey?:     string | fn.#Fn
				TunnelInsideCidr?: (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPNConnectionRoute: {
		Type: "AWS::EC2::VPNConnectionRoute"
		Properties: {
			DestinationCidrBlock: (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
			VpnConnectionId:      string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPNGateway: {
		Type: "AWS::EC2::VPNGateway"
		Properties: {
			AmazonSideAsn?: int | fn.#Fn
			Tags?:          [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			Type: ("ipsec.1") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VPNGatewayRoutePropagation: {
		Type: "AWS::EC2::VPNGatewayRoutePropagation"
		Properties: {
			RouteTableIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
			VpnGatewayId:  string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Volume: {
		Type: "AWS::EC2::Volume"
		Properties: {
			AutoEnableIO?:       bool | fn.#Fn
			AvailabilityZone:    string | fn.#Fn
			Encrypted?:          bool | fn.#Fn
			Iops?:               int | fn.#Fn
			KmsKeyId?:           string | fn.#Fn
			MultiAttachEnabled?: bool | fn.#Fn
			OutpostArn?:         string | fn.#Fn
			Size?:               int | fn.#Fn
			SnapshotId?:         string | fn.#Fn
			Tags?:               [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VolumeType?: ("gp2" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	#VolumeAttachment: {
		Type: "AWS::EC2::VolumeAttachment"
		Properties: {
			Device:     string | fn.#Fn
			InstanceId: string | fn.#Fn
			VolumeId:   string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

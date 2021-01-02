package uswest2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

#EC2: {
	#Instance: {
		Type:       "AWS::EC2::Instance"
		Properties: close({
			AdditionalInfo?:      string | fn.#Fn
			Affinity?:            ("default" | "host") | fn.#Fn
			AvailabilityZone?:    ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn
			BlockDeviceMappings?: [...close({
				DeviceName: string | fn.#Fn
				Ebs?:       close({
					DeleteOnTermination?: bool | fn.#Fn
					Encrypted?:           bool | fn.#Fn
					Iops?:                (>=100 & <=20000) | fn.#Fn
					KmsKeyId?:            string | fn.#Fn
					SnapshotId?:          string | fn.#Fn
					VolumeSize?:          int | fn.#Fn
					VolumeType?:          ("gp2" | "gp3" | "io1" | "io2" | "sc1" | "st1" | "standard") | fn.#Fn
				}) | fn.If
				NoDevice?:    string | fn.#Fn
				VirtualName?: string | fn.#Fn
			})] | fn.If
			CpuOptions?: close({
				CoreCount?:      int | fn.#Fn
				ThreadsPerCore?: int | fn.#Fn
			}) | fn.If
			CreditSpecification?: close({
				CPUCredits?: ("standard" | "unlimited") | fn.#Fn
			}) | fn.If
			DisableApiTermination?:    bool | fn.#Fn
			EbsOptimized?:             bool | fn.#Fn
			ElasticGpuSpecifications?: [...close({
				Type: string | fn.#Fn
			})] | fn.If
			ElasticInferenceAccelerators?: [...close({
				Count?: int | fn.#Fn
				Type:   ("eia1.large" | "eia1.medium" | "eia1.xlarge") | fn.#Fn
			})] | fn.If
			EnclaveOptions?: close({
				Enabled?: bool | fn.#Fn
			}) | fn.If
			HibernationOptions?: close({
				Configured?: bool | fn.#Fn
			}) | fn.If
			HostId?:                            string | fn.#Fn
			HostResourceGroupArn?:              string | fn.#Fn
			IamInstanceProfile?:                (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.#Fn
			ImageId?:                           string | fn.#Fn
			InstanceInitiatedShutdownBehavior?: string | fn.#Fn
			InstanceType?:                      ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "c5ad.12xlarge" | "c5ad.16xlarge" | "c5ad.24xlarge" | "c5ad.2xlarge" | "c5ad.4xlarge" | "c5ad.8xlarge" | "c5ad.large" | "c5ad.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "c6g.12xlarge" | "c6g.16xlarge" | "c6g.2xlarge" | "c6g.4xlarge" | "c6g.8xlarge" | "c6g.large" | "c6g.medium" | "c6g.metal" | "c6g.xlarge" | "c6gd.12xlarge" | "c6gd.16xlarge" | "c6gd.2xlarge" | "c6gd.4xlarge" | "c6gd.8xlarge" | "c6gd.large" | "c6gd.medium" | "c6gd.metal" | "c6gd.xlarge" | "c6gn.12xlarge" | "c6gn.16xlarge" | "c6gn.2xlarge" | "c6gn.4xlarge" | "c6gn.8xlarge" | "c6gn.large" | "c6gn.medium" | "c6gn.metal" | "c6gn.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "d3.2xlarge" | "d3.4xlarge" | "d3.8xlarge" | "d3.xlarge" | "d3en.12xlarge" | "d3en.2xlarge" | "d3en.4xlarge" | "d3en.6xlarge" | "d3en.8xlarge" | "d3en.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4ad.16xlarge" | "g4ad.4xlarge" | "g4ad.8xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.metal-2tb" | "i3en.xlarge" | "inf1.24xlarge" | "inf1.2xlarge" | "inf1.6xlarge" | "inf1.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "m5zn.12xlarge" | "m5zn.2xlarge" | "m5zn.3xlarge" | "m5zn.6xlarge" | "m5zn.large" | "m5zn.metal" | "m5zn.xlarge" | "m6g.12xlarge" | "m6g.16xlarge" | "m6g.2xlarge" | "m6g.4xlarge" | "m6g.8xlarge" | "m6g.large" | "m6g.medium" | "m6g.metal" | "m6g.xlarge" | "m6gd.12xlarge" | "m6gd.16xlarge" | "m6gd.2xlarge" | "m6gd.4xlarge" | "m6gd.8xlarge" | "m6gd.large" | "m6gd.medium" | "m6gd.metal" | "m6gd.xlarge" | "mac1.metal" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "p4d.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5b.12xlarge" | "r5b.16xlarge" | "r5b.24xlarge" | "r5b.2xlarge" | "r5b.4xlarge" | "r5b.8xlarge" | "r5b.large" | "r5b.metal" | "r5b.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "r6g.12xlarge" | "r6g.16xlarge" | "r6g.2xlarge" | "r6g.4xlarge" | "r6g.8xlarge" | "r6g.large" | "r6g.medium" | "r6g.metal" | "r6g.xlarge" | "r6gd.12xlarge" | "r6gd.16xlarge" | "r6gd.2xlarge" | "r6gd.4xlarge" | "r6gd.8xlarge" | "r6gd.large" | "r6gd.medium" | "r6gd.metal" | "r6gd.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "t4g.2xlarge" | "t4g.large" | "t4g.medium" | "t4g.micro" | "t4g.nano" | "t4g.small" | "t4g.xlarge" | "u-12tb1.metal" | "u-6tb1.metal" | "u-9tb1.metal" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge") | fn.#Fn
			Ipv6AddressCount?:                  int | fn.#Fn
			Ipv6Addresses?:                     [...close({
				Ipv6Address: string | fn.#Fn
			})] | fn.If
			KernelId?:       string | fn.#Fn
			KeyName?:        string | fn.#Fn
			LaunchTemplate?: close({
				LaunchTemplateId?:   string | fn.#Fn
				LaunchTemplateName?: string | fn.#Fn
				Version:             string | fn.#Fn
			}) | fn.If
			LicenseSpecifications?: [...close({
				LicenseConfigurationArn: string | fn.#Fn
			})] | fn.If
			Monitoring?:        bool | fn.#Fn
			NetworkInterfaces?: [...close({
				AssociatePublicIpAddress?: bool | fn.#Fn
				DeleteOnTermination?:      bool | fn.#Fn
				Description?:              string | fn.#Fn
				DeviceIndex:               string | fn.#Fn
				GroupSet?:                 [...(string | fn.#Fn)] | (string | fn.#Fn)
				Ipv6AddressCount?:         int | fn.#Fn
				Ipv6Addresses?:            [...close({
					Ipv6Address: string | fn.#Fn
				})] | fn.If
				NetworkInterfaceId?: string | fn.#Fn
				PrivateIpAddress?:   string | fn.#Fn
				PrivateIpAddresses?: [...close({
					Primary:          bool | fn.#Fn
					PrivateIpAddress: string | fn.#Fn
				})] | fn.If
				SecondaryPrivateIpAddressCount?: int | fn.#Fn
				SubnetId?:                       string | fn.#Fn
			})] | fn.If
			PlacementGroupName?: string | fn.#Fn
			PrivateIpAddress?:   string | fn.#Fn
			RamdiskId?:          string | fn.#Fn
			SecurityGroupIds?:   [...(string | fn.#Fn)] | (string | fn.#Fn)
			SecurityGroups?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
			SourceDestCheck?:    bool | fn.#Fn
			SsmAssociations?:    [...close({
				AssociationParameters?: [...close({
					Key:   string | fn.#Fn
					Value: [...(string | fn.#Fn)] | (string | fn.#Fn)
				})] | fn.If
				DocumentName: string | fn.#Fn
			})] | fn.If
			SubnetId?: string | fn.#Fn
			Tags?:     [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			Tenancy?:  ("dedicated" | "default" | "host") | fn.#Fn
			UserData?: string | fn.#Fn
			Volumes?:  [...close({
				Device:   string | fn.#Fn
				VolumeId: string | fn.#Fn
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
	#SecurityGroup: {
		Type:       "AWS::EC2::SecurityGroup"
		Properties: close({
			GroupDescription:     (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.#Fn
			GroupName?:           string | fn.#Fn
			SecurityGroupEgress?: [...close({
				CidrIp?:                     (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.#Fn
				CidrIpv6?:                   string | fn.#Fn
				Description?:                (strings.MinRunes(0) & strings.MaxRunes(255) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.#Fn
				DestinationPrefixListId?:    string | fn.#Fn
				DestinationSecurityGroupId?: string | fn.#Fn
				FromPort?:                   int | fn.#Fn
				IpProtocol:                  string | fn.#Fn
				ToPort?:                     int | fn.#Fn
			})] | fn.If
			SecurityGroupIngress?: [...close({
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
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			VpcId?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

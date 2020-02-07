package fn

// import "github.com/TangoGroup/aws/fn"

import aws "github.com/TangoGroup/aws/uswest2"

// Types:: [ resource.Type for resource in aws.ResourceTypes ] + [=~ "^Custom::[a-zA-Z0-9_@-]{1,60}$"]

template: aws.Template
template: {
	Description: "This is a template"
	// for resourceName, resource in Resources {
	// 	// Resources: "\(resourceName)": aws.ResourceTypesMap[resource.Type] // | aws.CloudFormation.CustomResource
	// 	if (resource.Type =~ "^Custom::[a-zA-Z0-9_@-]{1,60}$") {
	// 		Resources: "\(resourceName)": aws.CloudFormation.CustomResource
	// 	}
	// 	if (resource.Type !~ "^Custom::[a-zA-Z0-9_@-]{1,60}$") {
	// 		Resources: "\(resourceName)": aws.ResourceTypesMap[resource.Type]
	// 	}
	// }
	for resourceName, resource in Resources {if (resource.Type =~ "^Custom::[a-zA-Z0-9_@-]{1,60}$") { Resources: "\(resourceName)": aws.CloudFormation.CustomResource}, if (resource.Type !~ "^Custom::[a-zA-Z0-9_@-]{1,60}$") {Resources: "\(resourceName)": aws.ResourceTypesMap[resource.Type]}}
	// Resources: S3Bucket1: aws.S3.Bucket
	Resources: S3Bucket1: {
		Type: "AWS::S3::Bucket"
		Properties: AccessControl: Ref: "S3AccessControl"
	}
	// Resources: S3Bucket2: aws.S3.Bucket
	Resources: S3Bucket2: {
		Type: "AWS::S3::Bucket"
		Properties: AccessControl: "Fn::Sub":                                                                           "S3AccessControl${Stuff}"
		Properties: BucketEncryption: ServerSideEncryptionConfiguration: [{ServerSideEncryptionByDefault: SSEAlgorithm: "AES256"}]
	}

	// Resources: AMISearchCustomResource: aws.CloudFormation.CustomResource
	Resources: AMISearchCustomResource: {
		// Type: "AWS::CloudFormation::CustomResource"
		Type: "Custom::AMISearch"
		Properties: {
			ServiceToken: "Fn::ImportValue": "AMISearchARN"
			owners:  "self amazon"
			filters: "[{\"Name\":\"root-device-type\",\"Values\":[\"ebs\"]},{\"Name\":\"name\",\"Values\":[\"amzn-ami-hvm-????.??.?.*gp2\"]}]"
			region: "Fn::Sub": "${AWS::Region}"
			"executable-users": ""
		}
	}

	Resources: EmrCluster: aws.EMR.Cluster
	Resources: EmrCluster: {
		Properties: {
			Name:         "DataBeamEmr"
			ReleaseLabel: "emr-5.20.0"
			Applications: [{
				Name: "Ganglia"
			}, {
				Name: "Spark"
			}, {
				Name: "Hadoop"
			}]
			Configurations: [{
				Classification: "spark"
				ConfigurationProperties: maximizeResourceAllocation: "true"
			}]
			EbsRootVolumeSize: 16
			Instances: {
				MasterInstanceGroup: {
					Name:          "Master Instance Group"
					InstanceType:  "m4.large"
					InstanceCount: 1
					EbsConfiguration: EbsBlockDeviceConfigs: [{
						VolumeSpecification: {
							SizeInGB:   32
							VolumeType: "gp2"
						}
					}]
					Market: "ON_DEMAND"
				}
				CoreInstanceGroup: {
					Name:          "Core Instance Group"
					InstanceType:  "r4.xlarge"
					InstanceCount: 2
					EbsConfiguration: EbsBlockDeviceConfigs: [{
						VolumeSpecification: {
							SizeInGB:   32
							VolumeType: "gp2"
						}
					}]
					Market:   "SPOT"
					BidPrice: "0.13"
				}
			}
			JobFlowRole: "EMR_EC2_DefaultRole"
			ServiceRole: "EMR_DefaultRole"
			// LogUri: "s3n://example-bucket/logs/"
			ScaleDownBehavior: "TERMINATE_AT_TASK_COMPLETION"
			VisibleToAllUsers: true
		}
	}
	Resources: InstanceSecurityGroup: aws.EC2.SecurityGroup
	Resources: InstanceSecurityGroup: {
		Properties : {
			GroupDescription : "Allow http to client host"
			VpcId : Ref : "myVPC"
			SecurityGroupIngress : [{
				IpProtocol : "tcp"
				FromPort :   80
				ToPort :     80
				CidrIp :     "0.0.0.0/0"
			}]
			SecurityGroupEgress : [{
				IpProtocol : "tcp"
				FromPort :   80
				ToPort :     80
				CidrIp :     "0.0.0.0/0"
			}]
		}
	}
	// Resources: LaunchConfig: aws.AutoScaling.LaunchConfiguration
	Resources: LaunchConfig: {
		Type: "AWS::AutoScaling::LaunchConfiguration"
		Properties: {
			IamInstanceProfile: Ref: "InstanceProfile"
			// ImageId: "Fn::FindInMap": ["EC2RegionMap", {
			// 	Ref: "AWS::Region"
			// }, "64"]
			ImageId: "123455"
			// InstanceType: "a1.4xlarge"
			InstanceType: Ref: "InstanceType"
			KeyName: Ref:      "KeyName"
			SecurityGroups: [
				{"Fn::GetAtt": ["InstanceSecurityGroup", "GroupId"]},
				{"Fn::GetAtt": "InstanceSecurityGroup.GroupId"}
			]
			
			// UserData: "Fn::Base64": "Fn::Join": ["", ["""
			// 					#!/bin/bash -x
								
			// 					""", """
			// 					export LC_CTYPE=en_US.UTF-8
								
			// 					""", """
			// 					export LC_ALL=en_US.UTF-8
								
			// 					""", """
			// 					apt-get update
								
			// 					""", """
			// 					apt-get install -y curl nfs-common
								
			// 					""", "EC2_REGION=", {
			// 	Ref: "AWS::Region"
			// }, "\n", "DIR_TGT=/mnt/efs/", "\n", "EFS_FILE_SYSTEM_ID=", {
			// 	Ref: "EFSFileSystem"
			// }, "\n", """
			// 					mkdir -p $DIR_TGT
								
			// 					""", """
			// 					DIR_SRC=$EFS_FILE_SYSTEM_ID.efs.$EC2_REGION.amazonaws.com
								
			// 					""", "mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $DIR_SRC:/ $DIR_TGT"]]
			UserData: "Fn::Base64": "Fn::Sub": """
								#!/bin/bash -x
								export LC_CTYPE=en_US.UTF-8
								export LC_ALL=en_US.UTF-8
								apt-get update
								apt-get install -y curl nfs-common
								EC2_REGION="${AWS::Region}"
								DIR_TGT=/mnt/efs/
								EFS_FILE_SYSTEM_ID=${EFSFileSystem}
								mkdir -p $DIR_TGT
								DIR_SRC=$EFS_FILE_SYSTEM_ID.efs.$EC2_REGION.amazonaws.com
								mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $DIR_SRC:/ $DIR_TGT
								"""
		}
	}
}

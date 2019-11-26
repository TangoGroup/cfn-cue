package fn

import "github.com/TangoGroup/aws/fn"

// import aws "github.com/TangoGroup/aws/uswest2"

MyGetAZs1: fn.GetAZs & {"Fn::GetAZs" :          ""}
MyGetAZs2: fn.GetAZs & {"Fn::GetAZs" : {"Ref" : "AWS::Region"}}
MyGetAZs3: fn.GetAZs & {"Fn::GetAZs" :          "us-east-1"}
MyGetAZs4: fn.GetAZs & {"Fn::GetAZs" :          "ap-northeast-1"}

Ands: fn.And & {
	"Fn::And" : [{"Condition": "Hello"}, {"Condition": "Goodbye"}]
}
"MyAndCondition": fn.And & {
	"Fn::And": [
		{"Fn::Equals": ["sg-mysggroup", {"Ref": "ASecurityGroup"}]},
		{"Condition":                           "SomeOtherCondition"},
	]
}

MyNotCondition : fn.Not & {
	"Fn::Not" : [{
		"Fn::Equals" : [
			{"Ref" : "EnvironmentType"},
			"prod",
		]
	}]
}

Outputs2: {
	"SecurityGroupId" : {
		"Description" : "Group ID of the security group used."
		"Value" :       fn.If & {
			"Fn::If" : [
				"CreateNewSecurityGroup",
				{"Ref" : "NewSecurityGroup"},
				{"Ref" : "ExistingSecurityGroup"},
			]
		}
	}
}

Select1: fn.Select & {"Fn::Select" : [ 1, [ "apples", "grapes", "oranges", "mangoes"]]}
Select2: fn.Select & {
	"Fn::Select" : [1,
		{"Fn::GetAZs": "us-west-2"},
	]
}

MyOrCondition : fn.Or & {
	"Fn::Or": [
		{"Fn::Equals": ["sg-mysggroup", {"Ref": "ASecurityGroup"}]},
		{"Condition":                           "SomeOtherCondition"},
	]
}

Subs: fn.Sub & {
	"Fn::Sub" : ["${Shell}", {Shell: "zsh"}]
}

Joins: fn.Join & {
	"Fn::Join": [
		"", [
			"arn:",
			{
				"Ref": "Partition"
			},
			":s3:::elasticbeanstalk-*-",
			{
				"Ref": "AWS::AccountId"
			},
		],
	]
}

Splits: fn.Split & {
	"Fn::Split": [",", {"Fn::Sub": "This,is,something,to,split,${Dude}"}]
}

IV:      fn.ImportValue & {"Fn::ImportValue" : {"Fn::Sub": "${NetworkStackNameParameter}-SubnetID"}}
Outputs: fn.Sub & {
	"Fn::Sub": ["${Shell}", {
		Shell: {
			"Fn::ImportValue": {
				"Fn::Sub": [
					"String-from-somewhere-else-${MyRef}",
					{MyRef: {"Ref": "SomeItem"}},
				]
			}
		}
	}]
}

f1: (string & ("one" | "two" | "three")) | fn.Fn
// f1: {"Ref": "Stuff"}
f1: Subs
// f1: "three"

t1: fn.GetAtt & {
	"Fn::GetAtt": [
		"myELB",
		"SourceSecurityGroup.OwnerAlias",
	]
}

t2: fn.GetAtt & {
	"Fn::GetAtt": [
		"myELB",
		"SourceSecurityGroup.GroupName",
	]
}
t3: fn.GetAtt & {
	"Fn::GetAtt": [
		"myELB",
		{"Ref": "Keys"},
	]
}

t4: fn.Fn & {
	"Fn::Base64": "Fn::Join": ["",
		["#!/bin/bash -x",
			"export LC_CTYPE=en_US.UTF-8",
			"export LC_ALL=en_US.UTF-8",
			"apt-get update",
			"apt-get install -y curl nfs-common",
			"EC2_REGION=", {Ref: "AWS::Region"},
			"\n",
			"DIR_TGT=/mnt/efs/",
			"\n",
			"EFS_FILE_SYSTEM_ID=", {Ref: "EFSFileSystem"},
			"\n",
			"mkdir -p $DIR_TGT",
			"DIR_SRC=$EFS_FILE_SYSTEM_ID.efs.$EC2_REGION.amazonaws.com",
			"mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $DIR_SRC:/ $DIR_TGT"],
	]
}

UserData: fn.Fn & {
	"Fn::Base64": "Fn::Sub": """
						#!/bin/bash -x"
						export LC_CTYPE=en_US.UTF-8
						export LC_ALL=en_US.UTF-8
						apt-get update
						apt-get install -y curl nfs-common
						EC2_REGION="${AWS::Region}"
						DIR_TGT=/mnt/efs/
						EFS_FILE_SYSTEM_ID="${EFSFileSystem}"
						mkdir -p $DIR_TGT
						DIR_SRC=$EFS_FILE_SYSTEM_ID.efs.$EC2_REGION.amazonaws.com
						mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $DIR_SRC:/ $DIR_TGT
						"""
}

// template: aws.Template
// template: {
//  Description: "This is a template"
//  Resources: S3Bucket1: aws.S3.Bucket
//  Resources: S3Bucket1: {
//   Properties: AccessControl: Ref: "S3AccessControl"
//  }
//  Resources: S3Bucket2: aws.S3.Bucket
//  Resources: S3Bucket2: {
//   Properties: AccessControl: "Fn::Sub":                                                                           "S3AccessControl${Stuff}"
//   Properties: BucketEncryption: ServerSideEncryptionConfiguration: [{ServerSideEncryptionByDefault: SSEAlgorithm: "AES256"}]
//  }

//  Resources: EmrCluster: aws.EMR.Cluster
//  Resources: EmrCluster: {
//   Properties: {
//    Name:         "DataBeamEmr"
//    ReleaseLabel: "emr-5.20.0"
//    Applications: [{
//     Name: "Ganglia"
//    }, {
//     Name: "Spark"
//    }, {
//     Name: "Hadoop"
//    }]
//    Configurations: [{
//     Classification: "spark"
//     ConfigurationProperties: maximizeResourceAllocation: "true"
//    }]
//    EbsRootVolumeSize: 16
//    Instances: {
//     MasterInstanceGroup: {
//      Name:          "Master Instance Group"
//      InstanceType:  "m4.large"
//      InstanceCount: 1
//      EbsConfiguration: EbsBlockDeviceConfigs: [{
//       VolumeSpecification: {
//        SizeInGB:   32
//        VolumeType: "gp2"
//       }
//      }]
//      Market: "ON_DEMAND"
//     }
//     CoreInstanceGroup: {
//      Name:          "Core Instance Group"
//      InstanceType:  "r4.xlarge"
//      InstanceCount: 2
//      EbsConfiguration: EbsBlockDeviceConfigs: [{
//       VolumeSpecification: {
//        SizeInGB:   32
//        VolumeType: "gp2"
//       }
//      }]
//      Market:   "SPOT"
//      BidPrice: "0.13"
//     }
//    }
//    JobFlowRole: "EMR_EC2_DefaultRole"
//    ServiceRole: "EMR_DefaultRole"
//    // LogUri: "s3n://example-bucket/logs/"
//    ScaleDownBehavior: "TERMINATE_AT_TASK_COMPLETION"
//    VisibleToAllUsers: true
//   }
//  }
//  Resources: InstanceSecurityGroup: aws.EC2.SecurityGroup
//  Resources: InstanceSecurityGroup: {
//   Properties : {
//    GroupDescription : "Allow http to client host"
//    VpcId : Ref : "myVPC"
//    SecurityGroupIngress : [{
//     IpProtocol : "tcp"
//     FromPort :   80
//     ToPort :     80
//     CidrIp :     "0.0.0.0/0"
//    }]
//    SecurityGroupEgress : [{
//     IpProtocol : "tcp"
//     FromPort :   80
//     ToPort :     80
//     CidrIp :     "0.0.0.0/0"
//    }]
//   }
//  }
// }

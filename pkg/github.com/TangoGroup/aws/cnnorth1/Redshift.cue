package cnnorth1

import "github.com/TangoGroup/aws/fn"

Redshift :: {
	Cluster :: {
		Type: "AWS::Redshift::Cluster"
		Properties: {
			AllowVersionUpgrade?:              bool | fn.Fn
			AutomatedSnapshotRetentionPeriod?: int | fn.Fn
			AvailabilityZone?:                 string | fn.Fn
			ClusterIdentifier?:                string | fn.Fn
			ClusterParameterGroupName?:        string | fn.Fn
			ClusterSecurityGroups?:            [...(string | fn.Fn)] | (string | fn.Fn)
			ClusterSubnetGroupName?:           string | fn.Fn
			ClusterType:                       ("multi-node" | "single-node") | fn.Fn
			ClusterVersion?:                   ("1.0") | fn.Fn
			DBName:                            string | fn.Fn
			ElasticIp?:                        string | fn.Fn
			Encrypted?:                        bool | fn.Fn
			HsmClientCertificateIdentifier?:   string | fn.Fn
			HsmConfigurationIdentifier?:       string | fn.Fn
			IamRoles?:                         [...(string | fn.Fn)] | (string | fn.Fn)
			KmsKeyId?:                         string | fn.Fn
			LoggingProperties?: {
				BucketName:   string | fn.Fn
				S3KeyPrefix?: string | fn.Fn
			}
			MasterUserPassword:          string | fn.Fn
			MasterUsername:              string | fn.Fn
			NodeType:                    string | fn.Fn
			NumberOfNodes?:              (>=1 & <=100) | fn.Fn
			OwnerAccount?:               string | fn.Fn
			Port?:                       int | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			PubliclyAccessible?:         bool | fn.Fn
			SnapshotClusterIdentifier?:  string | fn.Fn
			SnapshotIdentifier?:         string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcSecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	ClusterParameterGroup :: {
		Type: "AWS::Redshift::ClusterParameterGroup"
		Properties: {
			Description:          string | fn.Fn
			ParameterGroupFamily: string | fn.Fn
			Parameters?: [...{
				ParameterName:  string | fn.Fn
				ParameterValue: string | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ClusterSecurityGroup :: {
		Type: "AWS::Redshift::ClusterSecurityGroup"
		Properties: {
			Description: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ClusterSecurityGroupIngress :: {
		Type: "AWS::Redshift::ClusterSecurityGroupIngress"
		Properties: {
			CIDRIP?:                  string | fn.Fn
			ClusterSecurityGroupName: string | fn.Fn
			EC2SecurityGroupName?:    string | fn.Fn
			EC2SecurityGroupOwnerId?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ClusterSubnetGroup :: {
		Type: "AWS::Redshift::ClusterSubnetGroup"
		Properties: {
			Description: string | fn.Fn
			SubnetIds:   [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

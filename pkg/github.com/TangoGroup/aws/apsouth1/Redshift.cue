package apsouth1

import "github.com/TangoGroup/aws/fn"

Redshift :: {
	Cluster :: {
		Type:       "AWS::Redshift::Cluster"
		Properties: close({
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
			LoggingProperties?:                close({
				BucketName:   string | fn.Fn
				S3KeyPrefix?: string | fn.Fn
			}) | fn.If
			MasterUserPassword:          string | fn.Fn
			MasterUsername:              string | fn.Fn
			NodeType:                    ("dc1.8xlarge" | "dc1.large" | "dc2.8xlarge" | "dc2.large" | "ds2.8xlarge" | "ds2.xlarge" | "ra3.16xlarge" | "ra3.4xlarge" | "ra3.xlplus") | fn.Fn
			NumberOfNodes?:              (>=1 & <=100) | fn.Fn
			OwnerAccount?:               string | fn.Fn
			Port?:                       int | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			PubliclyAccessible?:         bool | fn.Fn
			SnapshotClusterIdentifier?:  string | fn.Fn
			SnapshotIdentifier?:         string | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcSecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	ClusterParameterGroup :: {
		Type:       "AWS::Redshift::ClusterParameterGroup"
		Properties: close({
			Description:          string | fn.Fn
			ParameterGroupFamily: string | fn.Fn
			Parameters?:          [...close({
				ParameterName:  string | fn.Fn
				ParameterValue: string | fn.Fn
			})] | fn.If
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
	ClusterSecurityGroup :: {
		Type:       "AWS::Redshift::ClusterSecurityGroup"
		Properties: close({
			Description: string | fn.Fn
			Tags?:       [...close({
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
	ClusterSecurityGroupIngress :: {
		Type:       "AWS::Redshift::ClusterSecurityGroupIngress"
		Properties: close({
			CIDRIP?:                  (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
			ClusterSecurityGroupName: string | fn.Fn
			EC2SecurityGroupName?:    string | fn.Fn
			EC2SecurityGroupOwnerId?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ClusterSubnetGroup :: {
		Type:       "AWS::Redshift::ClusterSubnetGroup"
		Properties: close({
			Description: string | fn.Fn
			SubnetIds:   [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:       [...close({
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
}

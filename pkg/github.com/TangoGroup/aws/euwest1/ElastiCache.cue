package euwest1

import "github.com/TangoGroup/aws/fn"

ElastiCache :: {
	CacheCluster :: {
		Type: "AWS::ElastiCache::CacheCluster"
		Properties: {
			AZMode?:                     string | fn.Fn
			AutoMinorVersionUpgrade?:    bool | fn.Fn
			CacheNodeType:               string | fn.Fn
			CacheParameterGroupName?:    string | fn.Fn
			CacheSecurityGroupNames?:    [...(string | fn.Fn)] | fn.Fn
			CacheSubnetGroupName?:       string | fn.Fn
			ClusterName?:                string | fn.Fn
			Engine:                      string | fn.Fn
			EngineVersion?:              string | fn.Fn
			NotificationTopicArn?:       string | fn.Fn
			NumCacheNodes:               int | fn.Fn
			Port?:                       int | fn.Fn
			PreferredAvailabilityZone?:  string | fn.Fn
			PreferredAvailabilityZones?: [...(string | fn.Fn)] | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			SnapshotArns?:               [...(string | fn.Fn)] | fn.Fn
			SnapshotName?:               string | fn.Fn
			SnapshotRetentionLimit?:     int | fn.Fn
			SnapshotWindow?:             string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcSecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
	}
	ParameterGroup :: {
		Type: "AWS::ElastiCache::ParameterGroup"
		Properties: {
			CacheParameterGroupFamily: string | fn.Fn
			Description:               string | fn.Fn
			Properties?: [string]: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ReplicationGroup :: {
		Type: "AWS::ElastiCache::ReplicationGroup"
		Properties: {
			AtRestEncryptionEnabled?:  bool | fn.Fn
			AuthToken?:                string | fn.Fn
			AutoMinorVersionUpgrade?:  bool | fn.Fn
			AutomaticFailoverEnabled?: bool | fn.Fn
			CacheNodeType?:            string | fn.Fn
			CacheParameterGroupName?:  string | fn.Fn
			CacheSecurityGroupNames?:  [...(string | fn.Fn)] | fn.Fn
			CacheSubnetGroupName?:     string | fn.Fn
			Engine?:                   string | fn.Fn
			EngineVersion?:            string | fn.Fn
			KmsKeyId?:                 string | fn.Fn
			NodeGroupConfiguration?: [...{
				NodeGroupId?:              string | fn.Fn
				PrimaryAvailabilityZone?:  string | fn.Fn
				ReplicaAvailabilityZones?: [...(string | fn.Fn)] | fn.Fn
				ReplicaCount?:             int | fn.Fn
				Slots?:                    string | fn.Fn
			}]
			NotificationTopicArn?:       string | fn.Fn
			NumCacheClusters?:           (>=1 & <=6) | fn.Fn
			NumNodeGroups?:              int | fn.Fn
			Port?:                       int | fn.Fn
			PreferredCacheClusterAZs?:   [...(string | fn.Fn)] | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			PrimaryClusterId?:           string | fn.Fn
			ReplicasPerNodeGroup?:       (>=0 & <=5) | fn.Fn
			ReplicationGroupDescription: string | fn.Fn
			ReplicationGroupId?:         string | fn.Fn
			SecurityGroupIds?:           [...(string | fn.Fn)] | fn.Fn
			SnapshotArns?:               [...(string | fn.Fn)] | fn.Fn
			SnapshotName?:               string | fn.Fn
			SnapshotRetentionLimit?:     int | fn.Fn
			SnapshotWindow?:             string | fn.Fn
			SnapshottingClusterId?:      string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TransitEncryptionEnabled?: bool | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
	}
	SecurityGroup :: {
		Type: "AWS::ElastiCache::SecurityGroup"
		Properties: Description: string | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SecurityGroupIngress :: {
		Type: "AWS::ElastiCache::SecurityGroupIngress"
		Properties: {
			CacheSecurityGroupName:   string | fn.Fn
			EC2SecurityGroupName:     string | fn.Fn
			EC2SecurityGroupOwnerId?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SubnetGroup :: {
		Type: "AWS::ElastiCache::SubnetGroup"
		Properties: {
			CacheSubnetGroupName?: string | fn.Fn
			Description:           string | fn.Fn
			SubnetIds:             [...(string | fn.Fn)] | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

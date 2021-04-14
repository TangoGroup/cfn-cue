package usgovwest1

import "github.com/TangoGroup/aws/fn"

ElastiCache :: {
	CacheCluster :: {
		Type:       "AWS::ElastiCache::CacheCluster"
		Properties: close({
			AZMode?:                     string | fn.Fn
			AutoMinorVersionUpgrade?:    bool | fn.Fn
			CacheNodeType:               ("cache.m3.2xlarge" | "cache.m3.large" | "cache.m3.medium" | "cache.m3.xlarge" | "cache.m5.12xlarge" | "cache.m5.24xlarge" | "cache.m5.2xlarge" | "cache.m5.4xlarge" | "cache.m5.large" | "cache.m5.xlarge" | "cache.r3.2xlarge" | "cache.r3.4xlarge" | "cache.r3.8xlarge" | "cache.r3.large" | "cache.r3.xlarge" | "cache.r4.16xlarge" | "cache.r4.2xlarge" | "cache.r4.4xlarge" | "cache.r4.8xlarge" | "cache.r4.large" | "cache.r4.xlarge" | "cache.r5.12xlarge" | "cache.r5.24xlarge" | "cache.r5.2xlarge" | "cache.r5.4xlarge" | "cache.r5.large" | "cache.r5.xlarge" | "cache.t2.medium" | "cache.t2.micro" | "cache.t2.small" | "cache.t3.medium" | "cache.t3.micro" | "cache.t3.small") | fn.Fn
			CacheParameterGroupName?:    string | fn.Fn
			CacheSecurityGroupNames?:    [...(string | fn.Fn)] | (string | fn.Fn)
			CacheSubnetGroupName?:       string | fn.Fn
			ClusterName?:                string | fn.Fn
			Engine:                      string | fn.Fn
			EngineVersion?:              string | fn.Fn
			NotificationTopicArn?:       string | fn.Fn
			NumCacheNodes:               int | fn.Fn
			Port?:                       int | fn.Fn
			PreferredAvailabilityZone?:  string | fn.Fn
			PreferredAvailabilityZones?: [...(string | fn.Fn)] | (string | fn.Fn)
			PreferredMaintenanceWindow?: string | fn.Fn
			SnapshotArns?:               [...(string | fn.Fn)] | (string | fn.Fn)
			SnapshotName?:               string | fn.Fn
			SnapshotRetentionLimit?:     int | fn.Fn
			SnapshotWindow?:             string | fn.Fn
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
	GlobalReplicationGroup :: {
		Type:       "AWS::ElastiCache::GlobalReplicationGroup"
		Properties: close({
			AutomaticFailoverEnabled?:          bool | fn.Fn
			CacheNodeType?:                     string | fn.Fn
			CacheParameterGroupName?:           string | fn.Fn
			EngineVersion?:                     string | fn.Fn
			GlobalNodeGroupCount?:              int | fn.Fn
			GlobalReplicationGroupDescription?: string | fn.Fn
			GlobalReplicationGroupIdSuffix?:    string | fn.Fn
			Members:                            [...close({
				ReplicationGroupId?:     string | fn.Fn
				ReplicationGroupRegion?: string | fn.Fn
				Role?:                   ("PRIMARY" | "SECONDARY") | fn.Fn
			})] | fn.If
			RegionalConfigurations?: [...close({
				ReplicationGroupId?:       string | fn.Fn
				ReplicationGroupRegion?:   string | fn.Fn
				ReshardingConfigurations?: [...close({
					NodeGroupId?:                string | fn.Fn
					PreferredAvailabilityZones?: [...(string | fn.Fn)] | (string | fn.Fn)
				})] | fn.If
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ParameterGroup :: {
		Type:       "AWS::ElastiCache::ParameterGroup"
		Properties: close({
			CacheParameterGroupFamily: string | fn.Fn
			Description:               string | fn.Fn
			Properties?:               {
				[string]: string | fn.Fn
			} | fn.If
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
	ReplicationGroup :: {
		Type:       "AWS::ElastiCache::ReplicationGroup"
		Properties: close({
			AtRestEncryptionEnabled?:  bool | fn.Fn
			AuthToken?:                string | fn.Fn
			AutoMinorVersionUpgrade?:  bool | fn.Fn
			AutomaticFailoverEnabled?: bool | fn.Fn
			CacheNodeType?:            ("cache.m3.2xlarge" | "cache.m3.large" | "cache.m3.medium" | "cache.m3.xlarge" | "cache.m5.12xlarge" | "cache.m5.24xlarge" | "cache.m5.2xlarge" | "cache.m5.4xlarge" | "cache.m5.large" | "cache.m5.xlarge" | "cache.r3.2xlarge" | "cache.r3.4xlarge" | "cache.r3.8xlarge" | "cache.r3.large" | "cache.r3.xlarge" | "cache.r4.16xlarge" | "cache.r4.2xlarge" | "cache.r4.4xlarge" | "cache.r4.8xlarge" | "cache.r4.large" | "cache.r4.xlarge" | "cache.r5.12xlarge" | "cache.r5.24xlarge" | "cache.r5.2xlarge" | "cache.r5.4xlarge" | "cache.r5.large" | "cache.r5.xlarge" | "cache.t2.medium" | "cache.t2.micro" | "cache.t2.small" | "cache.t3.medium" | "cache.t3.micro" | "cache.t3.small") | fn.Fn
			CacheParameterGroupName?:  string | fn.Fn
			CacheSecurityGroupNames?:  [...(string | fn.Fn)] | (string | fn.Fn)
			CacheSubnetGroupName?:     string | fn.Fn
			Engine?:                   string | fn.Fn
			EngineVersion?:            string | fn.Fn
			GlobalReplicationGroupId?: string | fn.Fn
			KmsKeyId?:                 string | fn.Fn
			MultiAZEnabled?:           bool | fn.Fn
			NodeGroupConfiguration?:   [...close({
				NodeGroupId?:              string | fn.Fn
				PrimaryAvailabilityZone?:  string | fn.Fn
				ReplicaAvailabilityZones?: [...(string | fn.Fn)] | (string | fn.Fn)
				ReplicaCount?:             int | fn.Fn
				Slots?:                    string | fn.Fn
			})] | fn.If
			NotificationTopicArn?:       string | fn.Fn
			NumCacheClusters?:           (>=1 & <=6) | fn.Fn
			NumNodeGroups?:              int | fn.Fn
			Port?:                       int | fn.Fn
			PreferredCacheClusterAZs?:   [...(string | fn.Fn)] | (string | fn.Fn)
			PreferredMaintenanceWindow?: string | fn.Fn
			PrimaryClusterId?:           string | fn.Fn
			ReplicasPerNodeGroup?:       (>=0 & <=5) | fn.Fn
			ReplicationGroupDescription: string | fn.Fn
			ReplicationGroupId?:         string | fn.Fn
			SecurityGroupIds?:           [...(string | fn.Fn)] | (string | fn.Fn)
			SnapshotArns?:               [...(string | fn.Fn)] | (string | fn.Fn)
			SnapshotName?:               string | fn.Fn
			SnapshotRetentionLimit?:     int | fn.Fn
			SnapshotWindow?:             string | fn.Fn
			SnapshottingClusterId?:      string | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TransitEncryptionEnabled?: bool | fn.Fn
			UserGroupIds?:             [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		UpdatePolicy?: [string]: _
		Metadata?: [string]:     _
		Condition?: string
	}
	SecurityGroup :: {
		Type:       "AWS::ElastiCache::SecurityGroup"
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
	SecurityGroupIngress :: {
		Type:       "AWS::ElastiCache::SecurityGroupIngress"
		Properties: close({
			CacheSecurityGroupName:   string | fn.Fn
			EC2SecurityGroupName:     string | fn.Fn
			EC2SecurityGroupOwnerId?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SubnetGroup :: {
		Type:       "AWS::ElastiCache::SubnetGroup"
		Properties: close({
			CacheSubnetGroupName?: string | fn.Fn
			Description:           string | fn.Fn
			SubnetIds:             [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                 [...close({
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
	User :: {
		Type:       "AWS::ElastiCache::User"
		Properties: close({
			AccessString?:       string | fn.Fn
			Engine:              ("redis") | fn.Fn
			NoPasswordRequired?: bool | fn.Fn
			Passwords?:          [...(string | fn.Fn)] | (string | fn.Fn)
			UserId:              (=~#"[a-z][a-z0-9\\-]*"#) | fn.Fn
			UserName:            string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UserGroup :: {
		Type:       "AWS::ElastiCache::UserGroup"
		Properties: close({
			Engine:      ("redis") | fn.Fn
			UserGroupId: (=~#"[a-z][a-z0-9\\-]*"#) | fn.Fn
			UserIds?:    [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package ElastiCache

CacheCluster :: {
  Type: "AWS::ElastiCache::CacheCluster"
  Properties: {
    AZMode?:                  string
    AutoMinorVersionUpgrade?: bool
    CacheNodeType:            string
    CacheParameterGroupName?: string
    CacheSecurityGroupNames?: [...string]
    CacheSubnetGroupName?:      string
    ClusterName?:               string
    Engine:                     string
    EngineVersion?:             string
    NotificationTopicArn?:      string
    NumCacheNodes:              int
    Port?:                      int
    PreferredAvailabilityZone?: string
    PreferredAvailabilityZones?: [...string]
    PreferredMaintenanceWindow?: string
    SnapshotArns?: [...string]
    SnapshotName?:           string
    SnapshotRetentionLimit?: int
    SnapshotWindow?:         string
    Tags?: [...__Tag]
    VpcSecurityGroupIds?: [...string]
  }
}
ParameterGroup :: {
  Type: "AWS::ElastiCache::ParameterGroup"
  Properties: {
    CacheParameterGroupFamily: string
    Description:               string
    Properties?: {
    }
  }
}
ReplicationGroup :: {
  Type: "AWS::ElastiCache::ReplicationGroup"
  Properties: {
    AtRestEncryptionEnabled?:  bool
    AuthToken?:                string
    AutoMinorVersionUpgrade?:  bool
    AutomaticFailoverEnabled?: bool
    CacheNodeType?:            string
    CacheParameterGroupName?:  string
    CacheSecurityGroupNames?: [...string]
    CacheSubnetGroupName?: string
    Engine?:               string
    EngineVersion?:        string
    KmsKeyId?:             string
    NodeGroupConfiguration?: [...__NodeGroupConfiguration]
    NotificationTopicArn?: string
    NumCacheClusters?:     >=1 & <=6
    NumCacheClusters?:     int
    NumNodeGroups?:        int
    Port?:                 int
    PreferredCacheClusterAZs?: [...string]
    PreferredMaintenanceWindow?: string
    PrimaryClusterId?:           string
    ReplicasPerNodeGroup?:       >=0 & <=5
    ReplicasPerNodeGroup?:       int
    ReplicationGroupDescription: string
    ReplicationGroupId?:         string
    SecurityGroupIds?: [...string]
    SnapshotArns?: [...string]
    SnapshotName?:           string
    SnapshotRetentionLimit?: int
    SnapshotWindow?:         string
    SnapshottingClusterId?:  string
    Tags?: [...__Tag]
    TransitEncryptionEnabled?: bool
  }
  __NodeGroupConfiguration = {
    NodeGroupId?:             string
    PrimaryAvailabilityZone?: string
    ReplicaAvailabilityZones?: [...string]
    ReplicaCount?: int
    Slots?:        string
  }
}
SecurityGroup :: {
  Type: "AWS::ElastiCache::SecurityGroup"
  Properties: {
    Description: string
  }
}
SecurityGroupIngress :: {
  Type: "AWS::ElastiCache::SecurityGroupIngress"
  Properties: {
    CacheSecurityGroupName:   string
    EC2SecurityGroupName:     string
    EC2SecurityGroupOwnerId?: string
  }
}
SubnetGroup :: {
  Type: "AWS::ElastiCache::SubnetGroup"
  Properties: {
    CacheSubnetGroupName?: string
    Description:           string
    SubnetIds: [...string]
  }
}

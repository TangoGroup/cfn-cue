package Redshift

Cluster :: {
  Type: "AWS::Redshift::Cluster"
  Properties: {
    AllowVersionUpgrade?:              bool
    AutomatedSnapshotRetentionPeriod?: int
    AvailabilityZone?:                 string
    ClusterIdentifier?:                string
    ClusterParameterGroupName?:        string
    ClusterSecurityGroups?: [...string]
    ClusterSubnetGroupName?:         string
    ClusterType:                     "multi-node" | "single-node"
    ClusterType:                     string
    ClusterVersion?:                 "1.0"
    ClusterVersion?:                 string
    DBName:                          string
    ElasticIp?:                      string
    Encrypted?:                      bool
    HsmClientCertificateIdentifier?: string
    HsmConfigurationIdentifier?:     string
    IamRoles?: [...string]
    KmsKeyId?:                   string
    LoggingProperties?:          __LoggingProperties
    MasterUserPassword:          string
    MasterUsername:              string
    NodeType:                    "dc1.8xlarge" | "dc1.large" | "dc2.8xlarge" | "dc2.large" | "ds1.8xlarge" | "ds1.xlarge" | "ds2.8xlarge" | "ds2.xlarge"
    NodeType:                    string
    NumberOfNodes?:              int
    OwnerAccount?:               string
    Port?:                       int
    PreferredMaintenanceWindow?: string
    PubliclyAccessible?:         bool
    SnapshotClusterIdentifier?:  string
    SnapshotIdentifier?:         string
    Tags?: [...__Tag]
    VpcSecurityGroupIds?: [...string]
  }
  __LoggingProperties = {
    BucketName:   string
    S3KeyPrefix?: string
  }
}
ClusterParameterGroup :: {
  Type: "AWS::Redshift::ClusterParameterGroup"
  Properties: {
    Description:          string
    ParameterGroupFamily: string
    Parameters?: [...__Parameter]
    Tags?: [...__Tag]
  }
  __Parameter = {
    ParameterName:  string
    ParameterValue: string
  }
}
ClusterSecurityGroup :: {
  Type: "AWS::Redshift::ClusterSecurityGroup"
  Properties: {
    Description: string
    Tags?: [...__Tag]
  }
}
ClusterSecurityGroupIngress :: {
  Type: "AWS::Redshift::ClusterSecurityGroupIngress"
  Properties: {
    CIDRIP?:                  string
    ClusterSecurityGroupName: string
    EC2SecurityGroupName?:    string
    EC2SecurityGroupOwnerId?: string
  }
}
ClusterSubnetGroup :: {
  Type: "AWS::Redshift::ClusterSubnetGroup"
  Properties: {
    Description: string
    SubnetIds: [...string]
    Tags?: [...__Tag]
  }
}

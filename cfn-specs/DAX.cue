package DAX

Cluster :: {
  Type: "AWS::DAX::Cluster"
  Properties: {
    AvailabilityZones?: [...string]
    ClusterName?:                string
    Description?:                string
    IAMRoleARN:                  string
    NodeType:                    "dax.r3.2xlarge" | "dax.r3.4xlarge" | "dax.r3.8xlarge" | "dax.r3.large" | "dax.r3.xlarge" | "dax.r4.16xlarge" | "dax.r4.2xlarge" | "dax.r4.4xlarge" | "dax.r4.8xlarge" | "dax.r4.large" | "dax.r4.xlarge" | "dax.t2.medium" | "dax.t2.small"
    NodeType:                    string
    NotificationTopicARN?:       string
    ParameterGroupName?:         string
    PreferredMaintenanceWindow?: string
    ReplicationFactor:           int
    SSESpecification?:           __SSESpecification
    SecurityGroupIds?: [...string]
    SubnetGroupName?: string
    Tags?: {
    }
  }
  __SSESpecification = {
    SSEEnabled?: bool
  }
}
ParameterGroup :: {
  Type: "AWS::DAX::ParameterGroup"
  Properties: {
    Description?:        string
    ParameterGroupName?: string
    ParameterNameValues?: {
    }
  }
}
SubnetGroup :: {
  Type: "AWS::DAX::SubnetGroup"
  Properties: {
    Description?:     string
    SubnetGroupName?: string
    SubnetIds: [...string]
  }
}

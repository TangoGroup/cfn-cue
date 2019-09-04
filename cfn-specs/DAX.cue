package DAX

Cluster :: {
  Type: "AWS::DAX::Cluster"
  Properties: {
    AvailabilityZones?: [...string]
    ClusterName?:                string
    Description?:                string
    IAMRoleARN:                  string
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

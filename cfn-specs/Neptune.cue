package Neptune

DBCluster :: {
  Type: "AWS::Neptune::DBCluster"
  Properties: {
    AvailabilityZones?: [...string]
    BackupRetentionPeriod?:       int
    DBClusterIdentifier?:         string
    DBClusterParameterGroupName?: string
    DBSubnetGroupName?:           string
    EnableCloudwatchLogsExports?: [...string]
    IamAuthEnabled?:             bool
    KmsKeyId?:                   string
    Port?:                       int
    PreferredBackupWindow?:      string
    PreferredMaintenanceWindow?: string
    SnapshotIdentifier?:         string
    StorageEncrypted?:           bool
    Tags?: [...__Tag]
    VpcSecurityGroupIds?: [...string]
  }
}
DBClusterParameterGroup :: {
  Type: "AWS::Neptune::DBClusterParameterGroup"
  Properties: {
    Description: string
    Family:      string
    Name?:       string
    Parameters: {
    }
    Tags?: [...__Tag]
  }
}
DBInstance :: {
  Type: "AWS::Neptune::DBInstance"
  Properties: {
    AllowMajorVersionUpgrade?:   bool
    AutoMinorVersionUpgrade?:    bool
    AvailabilityZone?:           string
    DBClusterIdentifier?:        string
    DBInstanceClass:             string
    DBInstanceIdentifier?:       string
    DBParameterGroupName?:       string
    DBSnapshotIdentifier?:       string
    DBSubnetGroupName?:          string
    PreferredMaintenanceWindow?: string
    Tags?: [...__Tag]
  }
}
DBParameterGroup :: {
  Type: "AWS::Neptune::DBParameterGroup"
  Properties: {
    Description: string
    Family:      string
    Name?:       string
    Parameters: {
    }
    Tags?: [...__Tag]
  }
}
DBSubnetGroup :: {
  Type: "AWS::Neptune::DBSubnetGroup"
  Properties: {
    DBSubnetGroupDescription: string
    DBSubnetGroupName?:       string
    SubnetIds: [...string]
    Tags?: [...__Tag]
  }
}

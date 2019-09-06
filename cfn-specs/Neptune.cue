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
    DBInstanceClass:             "db.r4.2xlarge" | "db.r4.4xlarge" | "db.r4.8xlarge" | "db.r4.large" | "db.r4.xlarge" | "db.r5.12xl" | "db.r5.2xl" | "db.r5.4xl" | "db.r5.large" | "db.r5.xl"
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

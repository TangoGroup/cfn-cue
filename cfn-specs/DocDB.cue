package DocDB

DBCluster :: {
  Type: "AWS::DocDB::DBCluster"
  Properties: {
    AvailabilityZones?: [...string]
    BackupRetentionPeriod?:       int
    DBClusterIdentifier?:         string
    DBClusterParameterGroupName?: string
    DBSubnetGroupName?:           string
    EngineVersion?:               string
    KmsKeyId?:                    string
    MasterUserPassword?:          string
    MasterUsername?:              string
    Port?:                        int
    PreferredBackupWindow?:       string
    PreferredMaintenanceWindow?:  string
    SnapshotIdentifier?:          string
    StorageEncrypted?:            bool
    Tags?: [...__Tag]
    VpcSecurityGroupIds?: [...string]
  }
}
DBClusterParameterGroup :: {
  Type: "AWS::DocDB::DBClusterParameterGroup"
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
  Type: "AWS::DocDB::DBInstance"
  Properties: {
    AutoMinorVersionUpgrade?:    bool
    AvailabilityZone?:           string
    DBClusterIdentifier:         string
    DBInstanceClass:             string
    DBInstanceIdentifier?:       string
    PreferredMaintenanceWindow?: string
    Tags?: [...__Tag]
  }
}
DBSubnetGroup :: {
  Type: "AWS::DocDB::DBSubnetGroup"
  Properties: {
    DBSubnetGroupDescription: string
    DBSubnetGroupName?:       string
    SubnetIds: [...string]
    Tags?: [...__Tag]
  }
}

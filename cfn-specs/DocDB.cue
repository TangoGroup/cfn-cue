package DocDB

DBCluster :: {
	Type: "AWS::DocDB::DBCluster"
	Properties: {
		AvailabilityZones?: [...string]
		BackupRetentionPeriod?:       >=1 & <=35
		BackupRetentionPeriod?:       int
		DBClusterIdentifier?:         string
		DBClusterParameterGroupName?: string
		DBSubnetGroupName?:           string
		EngineVersion?:               "docdb"
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
		DBInstanceClass:             "db.r4.16xlarge" | "db.r4.2xlarge" | "db.r4.4xlarge" | "db.r4.8xlarge" | "db.r4.large" | "db.r4.xlarge" | "db.r5.12xlarge" | "db.r5.24xlarge" | "db.r5.2xlarge" | "db.r5.4xlarge" | "db.r5.large" | "db.r5.xlarge"
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

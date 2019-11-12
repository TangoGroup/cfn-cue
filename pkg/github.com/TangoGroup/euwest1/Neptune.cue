package euwest1

import "github.com/TangoGroup/fn"

Neptune :: {
	DBCluster :: {
		Type: "AWS::Neptune::DBCluster"
		Properties: {
			AvailabilityZones?: [...(string | fn.Fn)]
			BackupRetentionPeriod?:       int | fn.Fn
			DBClusterIdentifier?:         string | fn.Fn
			DBClusterParameterGroupName?: string | fn.Fn
			DBSubnetGroupName?:           string | fn.Fn
			EnableCloudwatchLogsExports?: [...(string | fn.Fn)]
			IamAuthEnabled?:             bool | fn.Fn
			KmsKeyId?:                   string | fn.Fn
			Port?:                       int | fn.Fn
			PreferredBackupWindow?:      string | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			SnapshotIdentifier?:         string | fn.Fn
			StorageEncrypted?:           bool | fn.Fn
			Tags?: [...{
			}]
			VpcSecurityGroupIds?: [...(string | fn.Fn)]
		}
	}
	DBClusterParameterGroup :: {
		Type: "AWS::Neptune::DBClusterParameterGroup"
		Properties: {
			Description: string | fn.Fn
			Family:      string | fn.Fn
			Name?:       string | fn.Fn
			Parameters:  {
				[string]: _
			} | fn.Fn
			Tags?: [...{
			}]
		}
	}
	DBInstance :: {
		Type: "AWS::Neptune::DBInstance"
		Properties: {
			AllowMajorVersionUpgrade?:   bool | fn.Fn
			AutoMinorVersionUpgrade?:    bool | fn.Fn
			AvailabilityZone?:           string | fn.Fn
			DBClusterIdentifier?:        string | fn.Fn
			DBInstanceClass:             (string & ("db.r4.2xlarge" | "db.r4.4xlarge" | "db.r4.8xlarge" | "db.r4.large" | "db.r4.xlarge" | "db.r5.12xl" | "db.r5.2xl" | "db.r5.4xl" | "db.r5.large" | "db.r5.xl")) | fn.Fn
			DBInstanceIdentifier?:       string | fn.Fn
			DBParameterGroupName?:       string | fn.Fn
			DBSnapshotIdentifier?:       string | fn.Fn
			DBSubnetGroupName?:          string | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			Tags?: [...{
			}]
		}
	}
	DBParameterGroup :: {
		Type: "AWS::Neptune::DBParameterGroup"
		Properties: {
			Description: string | fn.Fn
			Family:      string | fn.Fn
			Name?:       string | fn.Fn
			Parameters:  {
				[string]: _
			} | fn.Fn
			Tags?: [...{
			}]
		}
	}
	DBSubnetGroup :: {
		Type: "AWS::Neptune::DBSubnetGroup"
		Properties: {
			DBSubnetGroupDescription: string | fn.Fn
			DBSubnetGroupName?:       string | fn.Fn
			SubnetIds: [...(string | fn.Fn)]
			Tags?: [...{
			}]
		}
	}
}

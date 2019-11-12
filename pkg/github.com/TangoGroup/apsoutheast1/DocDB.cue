package apsoutheast1

import "github.com/TangoGroup/fn"

DocDB :: {
	DBCluster :: {
		Type: "AWS::DocDB::DBCluster"
		Properties: {
			AvailabilityZones?: [...(string | fn.Fn)]
			BackupRetentionPeriod?:       int | fn.Fn
			DBClusterIdentifier?:         string | fn.Fn
			DBClusterParameterGroupName?: string | fn.Fn
			DBSubnetGroupName?:           string | fn.Fn
			EnableCloudwatchLogsExports?: [...(string | fn.Fn)]
			EngineVersion?:              string | fn.Fn
			KmsKeyId?:                   string | fn.Fn
			MasterUserPassword?:         string | fn.Fn
			MasterUsername?:             string | fn.Fn
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
		Type: "AWS::DocDB::DBClusterParameterGroup"
		Properties: {
			Description: string | fn.Fn
			Family:      string | fn.Fn
			Name?:       string | fn.Fn
			Parameters:  {
			} | fn.Fn
			Tags?: [...{
			}]
		}
	}
	DBInstance :: {
		Type: "AWS::DocDB::DBInstance"
		Properties: {
			AutoMinorVersionUpgrade?:    bool | fn.Fn
			AvailabilityZone?:           string | fn.Fn
			DBClusterIdentifier:         string | fn.Fn
			DBInstanceClass:             string | fn.Fn
			DBInstanceIdentifier?:       string | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			Tags?: [...{
			}]
		}
	}
	DBSubnetGroup :: {
		Type: "AWS::DocDB::DBSubnetGroup"
		Properties: {
			DBSubnetGroupDescription: string | fn.Fn
			DBSubnetGroupName?:       string | fn.Fn
			SubnetIds: [...(string | fn.Fn)]
			Tags?: [...{
			}]
		}
	}
}

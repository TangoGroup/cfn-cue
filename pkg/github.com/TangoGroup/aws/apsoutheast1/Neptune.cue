package apsoutheast1

import "github.com/TangoGroup/aws/fn"

Neptune :: {
	DBCluster :: {
		Type: "AWS::Neptune::DBCluster"
		Properties: {
			AvailabilityZones?:           [...(string | fn.Fn)] | (string | fn.Fn)
			BackupRetentionPeriod?:       int | fn.Fn
			DBClusterIdentifier?:         string | fn.Fn
			DBClusterParameterGroupName?: string | fn.Fn
			DBSubnetGroupName?:           string | fn.Fn
			EnableCloudwatchLogsExports?: [...(string | fn.Fn)] | (string | fn.Fn)
			IamAuthEnabled?:              bool | fn.Fn
			KmsKeyId?:                    string | fn.Fn
			Port?:                        int | fn.Fn
			PreferredBackupWindow?:       string | fn.Fn
			PreferredMaintenanceWindow?:  string | fn.Fn
			SnapshotIdentifier?:          string | fn.Fn
			StorageEncrypted?:            bool | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcSecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
}

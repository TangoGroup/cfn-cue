package apsoutheast1

import "github.com/TangoGroup/aws/fn"

DocDB :: {
	DBCluster :: {
		Type:       "AWS::DocDB::DBCluster"
		Properties: close({
			AvailabilityZones?:           [...(string | fn.Fn)] | (string | fn.Fn)
			BackupRetentionPeriod?:       int | fn.Fn
			DBClusterIdentifier?:         string | fn.Fn
			DBClusterParameterGroupName?: string | fn.Fn
			DBSubnetGroupName?:           string | fn.Fn
			EnableCloudwatchLogsExports?: [...(string | fn.Fn)] | (string | fn.Fn)
			EngineVersion?:               string | fn.Fn
			KmsKeyId?:                    string | fn.Fn
			MasterUserPassword:           string | fn.Fn
			MasterUsername:               string | fn.Fn
			Port?:                        int | fn.Fn
			PreferredBackupWindow?:       string | fn.Fn
			PreferredMaintenanceWindow?:  string | fn.Fn
			SnapshotIdentifier?:          string | fn.Fn
			StorageEncrypted?:            bool | fn.Fn
			Tags?:                        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcSecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DBClusterParameterGroup :: {
		Type:       "AWS::DocDB::DBClusterParameterGroup"
		Properties: close({
			Description: string | fn.Fn
			Family:      string | fn.Fn
			Name?:       string | fn.Fn
			Parameters:  {
				[string]: _
			} | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DBInstance :: {
		Type:       "AWS::DocDB::DBInstance"
		Properties: close({
			AutoMinorVersionUpgrade?:    bool | fn.Fn
			AvailabilityZone?:           string | fn.Fn
			DBClusterIdentifier:         string | fn.Fn
			DBInstanceClass:             string | fn.Fn
			DBInstanceIdentifier?:       string | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DBSubnetGroup :: {
		Type:       "AWS::DocDB::DBSubnetGroup"
		Properties: close({
			DBSubnetGroupDescription: string | fn.Fn
			DBSubnetGroupName?:       string | fn.Fn
			SubnetIds:                [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                    [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

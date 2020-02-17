package apnortheast1

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
			DeletionProtection?:          bool | fn.Fn
			EnableCloudwatchLogsExports?: [...(string | fn.Fn)] | (string | fn.Fn)
			EngineVersion?:               string | fn.Fn
			IamAuthEnabled?:              bool | fn.Fn
			KmsKeyId?:                    string | fn.Fn
			Port?:                        int | fn.Fn
			PreferredBackupWindow?:       string | fn.Fn
			PreferredMaintenanceWindow?:  string | fn.Fn
			SnapshotIdentifier?:          string | fn.Fn
			StorageEncrypted?:            bool | fn.Fn
			Tags?:                        [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VpcSecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
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
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DBInstance :: {
		Type: "AWS::Neptune::DBInstance"
		Properties: {
			AllowMajorVersionUpgrade?:   bool | fn.Fn
			AutoMinorVersionUpgrade?:    bool | fn.Fn
			AvailabilityZone?:           string | fn.Fn
			DBClusterIdentifier?:        string | fn.Fn
			DBInstanceClass:             string | fn.Fn
			DBInstanceIdentifier?:       string | fn.Fn
			DBParameterGroupName?:       string | fn.Fn
			DBSnapshotIdentifier?:       string | fn.Fn
			DBSubnetGroupName?:          string | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			Tags?:                       [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DBSubnetGroup :: {
		Type: "AWS::Neptune::DBSubnetGroup"
		Properties: {
			DBSubnetGroupDescription: string | fn.Fn
			DBSubnetGroupName?:       string | fn.Fn
			SubnetIds:                [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                    [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

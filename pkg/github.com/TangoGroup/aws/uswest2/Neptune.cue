package uswest2

import "github.com/TangoGroup/aws/fn"

#Neptune: {
	#DBCluster: {
		Type:       "AWS::Neptune::DBCluster"
		Properties: close({
			AssociatedRoles?: [...close({
				FeatureName?: string | fn.#Fn
				RoleArn:      string | fn.#Fn
			})] | fn.If
			AvailabilityZones?:           [...(string | fn.#Fn)] | (string | fn.#Fn)
			BackupRetentionPeriod?:       int | fn.#Fn
			DBClusterIdentifier?:         string | fn.#Fn
			DBClusterParameterGroupName?: string | fn.#Fn
			DBSubnetGroupName?:           string | fn.#Fn
			DeletionProtection?:          bool | fn.#Fn
			EnableCloudwatchLogsExports?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			EngineVersion?:               string | fn.#Fn
			IamAuthEnabled?:              bool | fn.#Fn
			KmsKeyId?:                    string | fn.#Fn
			Port?:                        int | fn.#Fn
			PreferredBackupWindow?:       string | fn.#Fn
			PreferredMaintenanceWindow?:  string | fn.#Fn
			RestoreToTime?:               string | fn.#Fn
			RestoreType?:                 string | fn.#Fn
			SnapshotIdentifier?:          string | fn.#Fn
			SourceDBClusterIdentifier?:   string | fn.#Fn
			StorageEncrypted?:            bool | fn.#Fn
			Tags?:                        [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			UseLatestRestorableTime?: bool | fn.#Fn
			VpcSecurityGroupIds?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBClusterParameterGroup: {
		Type:       "AWS::Neptune::DBClusterParameterGroup"
		Properties: close({
			Description: string | fn.#Fn
			Family:      string | fn.#Fn
			Name?:       string | fn.#Fn
			Parameters:  {
				[string]: _
			} | fn.#Fn
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBInstance: {
		Type:       "AWS::Neptune::DBInstance"
		Properties: close({
			AllowMajorVersionUpgrade?:   bool | fn.#Fn
			AutoMinorVersionUpgrade?:    bool | fn.#Fn
			AvailabilityZone?:           string | fn.#Fn
			DBClusterIdentifier?:        string | fn.#Fn
			DBInstanceClass:             ("db.r4.2xlarge" | "db.r4.4xlarge" | "db.r4.8xlarge" | "db.r4.large" | "db.r4.xlarge" | "db.r5.12xlarge" | "db.r5.24xlarge" | "db.r5.2xlarge" | "db.r5.4xlarge" | "db.r5.8xlarge" | "db.r5.large" | "db.r5.xlarge" | "db.t3.medium") | fn.#Fn
			DBInstanceIdentifier?:       string | fn.#Fn
			DBParameterGroupName?:       string | fn.#Fn
			DBSnapshotIdentifier?:       string | fn.#Fn
			DBSubnetGroupName?:          string | fn.#Fn
			PreferredMaintenanceWindow?: string | fn.#Fn
			Tags?:                       [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBParameterGroup: {
		Type:       "AWS::Neptune::DBParameterGroup"
		Properties: close({
			Description: string | fn.#Fn
			Family:      string | fn.#Fn
			Name?:       string | fn.#Fn
			Parameters:  {
				[string]: _
			} | fn.#Fn
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBSubnetGroup: {
		Type:       "AWS::Neptune::DBSubnetGroup"
		Properties: close({
			DBSubnetGroupDescription: string | fn.#Fn
			DBSubnetGroupName?:       string | fn.#Fn
			SubnetIds:                [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:                    [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

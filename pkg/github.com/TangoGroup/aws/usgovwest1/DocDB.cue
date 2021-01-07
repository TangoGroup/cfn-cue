package usgovwest1

import "github.com/TangoGroup/aws/fn"

#DocDB: {
	#DBCluster: {
		Type: "AWS::DocDB::DBCluster"
		Properties: {
			AvailabilityZones?:           [...(string | fn.#Fn)] | (string | fn.#Fn)
			BackupRetentionPeriod?:       (>=1 & <=35) | fn.#Fn
			DBClusterIdentifier?:         string | fn.#Fn
			DBClusterParameterGroupName?: string | fn.#Fn
			DBSubnetGroupName?:           string | fn.#Fn
			DeletionProtection?:          bool | fn.#Fn
			EnableCloudwatchLogsExports?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			EngineVersion?:               ("3.6.0" | "4.0" | "4.0.0") | fn.#Fn
			KmsKeyId?:                    string | fn.#Fn
			MasterUserPassword:           string | fn.#Fn
			MasterUsername:               string | fn.#Fn
			Port?:                        int | fn.#Fn
			PreferredBackupWindow?:       string | fn.#Fn
			PreferredMaintenanceWindow?:  string | fn.#Fn
			SnapshotIdentifier?:          string | fn.#Fn
			StorageEncrypted?:            bool | fn.#Fn
			Tags?:                        [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			VpcSecurityGroupIds?: [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBClusterParameterGroup: {
		Type: "AWS::DocDB::DBClusterParameterGroup"
		Properties: {
			Description: string | fn.#Fn
			Family:      string | fn.#Fn
			Name?:       string | fn.#Fn
			Parameters:  {
				[string]: _
			} | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBInstance: {
		Type: "AWS::DocDB::DBInstance"
		Properties: {
			AutoMinorVersionUpgrade?:    bool | fn.#Fn
			AvailabilityZone?:           string | fn.#Fn
			DBClusterIdentifier:         string | fn.#Fn
			DBInstanceClass:             ("db.r5.12xlarge" | "db.r5.24xlarge" | "db.r5.2xlarge" | "db.r5.4xlarge" | "db.r5.large" | "db.r5.xlarge" | "db.t3.medium") | fn.#Fn
			DBInstanceIdentifier?:       string | fn.#Fn
			PreferredMaintenanceWindow?: string | fn.#Fn
			Tags?:                       [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DBSubnetGroup: {
		Type: "AWS::DocDB::DBSubnetGroup"
		Properties: {
			DBSubnetGroupDescription: string | fn.#Fn
			DBSubnetGroupName?:       string | fn.#Fn
			SubnetIds:                [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:                    [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package usgovwest1

import "github.com/TangoGroup/aws/fn"

RDS :: {
	DBCluster :: {
		Type:       "AWS::RDS::DBCluster"
		Properties: close({
			AssociatedRoles?: [...close({
				FeatureName?: string | fn.Fn
				RoleArn:      string | fn.Fn
			})] | fn.If
			AvailabilityZones?:               [...(("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.Fn)] | (("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.Fn)
			BacktrackWindow?:                 int | fn.Fn
			BackupRetentionPeriod?:           (>=1 & <=35) | fn.Fn
			DBClusterIdentifier?:             string | fn.Fn
			DBClusterParameterGroupName?:     string | fn.Fn
			DBSubnetGroupName?:               string | fn.Fn
			DatabaseName?:                    string | fn.Fn
			DeletionProtection?:              bool | fn.Fn
			EnableCloudwatchLogsExports?:     [...(string | fn.Fn)] | (string | fn.Fn)
			EnableHttpEndpoint?:              bool | fn.Fn
			EnableIAMDatabaseAuthentication?: bool | fn.Fn
			Engine:                           string | fn.Fn
			EngineMode?:                      string | fn.Fn
			EngineVersion?:                   string | fn.Fn
			GlobalClusterIdentifier?:         string | fn.Fn
			KmsKeyId?:                        string | fn.Fn
			MasterUserPassword?:              string | fn.Fn
			MasterUsername?:                  string | fn.Fn
			Port?:                            int | fn.Fn
			PreferredBackupWindow?:           string | fn.Fn
			PreferredMaintenanceWindow?:      string | fn.Fn
			ReplicationSourceIdentifier?:     string | fn.Fn
			RestoreType?:                     string | fn.Fn
			ScalingConfiguration?:            close({
				AutoPause?:             bool | fn.Fn
				MaxCapacity?:           int | fn.Fn
				MinCapacity?:           int | fn.Fn
				SecondsUntilAutoPause?: int | fn.Fn
			}) | fn.If
			SnapshotIdentifier?:        string | fn.Fn
			SourceDBClusterIdentifier?: string | fn.Fn
			SourceRegion?:              string | fn.Fn
			StorageEncrypted?:          bool | fn.Fn
			Tags?:                      [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			UseLatestRestorableTime?: bool | fn.Fn
			VpcSecurityGroupIds?:     [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	DBClusterParameterGroup :: {
		Type:       "AWS::RDS::DBClusterParameterGroup"
		Properties: close({
			Description: string | fn.Fn
			Family:      string | fn.Fn
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
		Type:       "AWS::RDS::DBInstance"
		Properties: close({
			AllocatedStorage?:         string | fn.Fn
			AllowMajorVersionUpgrade?: bool | fn.Fn
			AssociatedRoles?:          [...close({
				FeatureName: string | fn.Fn
				RoleArn:     string | fn.Fn
			})] | fn.If
			AutoMinorVersionUpgrade?:            bool | fn.Fn
			AvailabilityZone?:                   ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.Fn
			BackupRetentionPeriod?:              (>=0 & <=35) | fn.Fn
			CACertificateIdentifier?:            string | fn.Fn
			CharacterSetName?:                   string | fn.Fn
			CopyTagsToSnapshot?:                 bool | fn.Fn
			DBClusterIdentifier?:                string | fn.Fn
			DBInstanceClass:                     string | fn.Fn
			DBInstanceIdentifier?:               string | fn.Fn
			DBName?:                             string | fn.Fn
			DBParameterGroupName?:               string | fn.Fn
			DBSecurityGroups?:                   [...(string | fn.Fn)] | (string | fn.Fn)
			DBSnapshotIdentifier?:               string | fn.Fn
			DBSubnetGroupName?:                  string | fn.Fn
			DeleteAutomatedBackups?:             bool | fn.Fn
			DeletionProtection?:                 bool | fn.Fn
			Domain?:                             string | fn.Fn
			DomainIAMRoleName?:                  string | fn.Fn
			EnableCloudwatchLogsExports?:        [...(string | fn.Fn)] | (string | fn.Fn)
			EnableIAMDatabaseAuthentication?:    bool | fn.Fn
			EnablePerformanceInsights?:          bool | fn.Fn
			Engine?:                             (=~#"(?i)(aurora|aurora-mysql|aurora-postgresql|mariadb|mysql|oracle-ee|oracle-se2|oracle-se1|oracle-se|postgres|sqlserver-ee|sqlserver-se|sqlserver-ex|sqlserver-web)$"#) | fn.Fn
			EngineVersion?:                      string | fn.Fn
			Iops?:                               int | fn.Fn
			KmsKeyId?:                           string | fn.Fn
			LicenseModel?:                       string | fn.Fn
			MasterUserPassword?:                 string | fn.Fn
			MasterUsername?:                     string | fn.Fn
			MaxAllocatedStorage?:                int | fn.Fn
			MonitoringInterval?:                 (0 | 1 | 5 | 10 | 15 | 30 | 60) | fn.Fn
			MonitoringRoleArn?:                  string | fn.Fn
			MultiAZ?:                            bool | fn.Fn
			OptionGroupName?:                    string | fn.Fn
			PerformanceInsightsKMSKeyId?:        string | fn.Fn
			PerformanceInsightsRetentionPeriod?: (7 | 731) | fn.Fn
			Port?:                               string | fn.Fn
			PreferredBackupWindow?:              string | fn.Fn
			PreferredMaintenanceWindow?:         string | fn.Fn
			ProcessorFeatures?:                  [...close({
				Name?:  string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
			PromotionTier?:              (>=0 & <=15) | fn.Fn
			PubliclyAccessible?:         bool | fn.Fn
			SourceDBInstanceIdentifier?: string | fn.Fn
			SourceRegion?:               string | fn.Fn
			StorageEncrypted?:           bool | fn.Fn
			StorageType?:                string | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Timezone?:                    string | fn.Fn
			UseDefaultProcessorFeatures?: bool | fn.Fn
			VPCSecurityGroups?:           [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
		Condition?: string
	}
	DBParameterGroup :: {
		Type:       "AWS::RDS::DBParameterGroup"
		Properties: close({
			Description: string | fn.Fn
			Family:      string | fn.Fn
			Parameters?: {
				[string]: string | fn.Fn
			} | fn.If
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
	DBSecurityGroup :: {
		Type:       "AWS::RDS::DBSecurityGroup"
		Properties: close({
			DBSecurityGroupIngress: [...close({
				CIDRIP?:                  (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
				EC2SecurityGroupId?:      string | fn.Fn
				EC2SecurityGroupName?:    string | fn.Fn
				EC2SecurityGroupOwnerId?: string | fn.Fn
			})] | fn.If
			EC2VpcId?:        string | fn.Fn
			GroupDescription: string | fn.Fn
			Tags?:            [...close({
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
	DBSecurityGroupIngress :: {
		Type:       "AWS::RDS::DBSecurityGroupIngress"
		Properties: close({
			CIDRIP?:                  (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
			DBSecurityGroupName:      string | fn.Fn
			EC2SecurityGroupId?:      string | fn.Fn
			EC2SecurityGroupName?:    string | fn.Fn
			EC2SecurityGroupOwnerId?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DBSubnetGroup :: {
		Type:       "AWS::RDS::DBSubnetGroup"
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
	EventSubscription :: {
		Type:       "AWS::RDS::EventSubscription"
		Properties: close({
			Enabled?:         bool | fn.Fn
			EventCategories?: [...(string | fn.Fn)] | (string | fn.Fn)
			SnsTopicArn:      string | fn.Fn
			SourceIds?:       [...(string | fn.Fn)] | (string | fn.Fn)
			SourceType?:      string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	OptionGroup :: {
		Type:       "AWS::RDS::OptionGroup"
		Properties: close({
			EngineName:           string | fn.Fn
			MajorEngineVersion:   string | fn.Fn
			OptionConfigurations: [...close({
				DBSecurityGroupMemberships?: [...(string | fn.Fn)] | (string | fn.Fn)
				OptionName:                  string | fn.Fn
				OptionSettings?:             [...close({
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				})] | fn.If
				OptionVersion?:               string | fn.Fn
				Port?:                        int | fn.Fn
				VpcSecurityGroupMemberships?: [...(string | fn.Fn)] | (string | fn.Fn)
			})] | fn.If
			OptionGroupDescription: string | fn.Fn
			Tags?:                  [...close({
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

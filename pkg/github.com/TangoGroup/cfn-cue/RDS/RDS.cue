package RDS

import "github.com/TangoGroup/fn"

DBCluster :: {
	Type: "AWS::RDS::DBCluster"
	Properties: {
		AssociatedRoles?: [...__DBClusterRole]
		AvailabilityZones?:               [...string] | fn.Fn
		BacktrackWindow?:                 int | fn.Fn
		BackupRetentionPeriod?:           (int & (>=1 & <=35)) | fn.Fn
		DBClusterIdentifier?:             string | fn.Fn
		DBClusterParameterGroupName?:     string | fn.Fn
		DBSubnetGroupName?:               string | fn.Fn
		DatabaseName?:                    string | fn.Fn
		DeletionProtection?:              bool | fn.Fn
		EnableCloudwatchLogsExports?:     [...string] | fn.Fn
		EnableIAMDatabaseAuthentication?: bool | fn.Fn
		Engine:                           string | fn.Fn
		EngineMode?:                      string | fn.Fn
		EngineVersion?:                   string | fn.Fn
		KmsKeyId?:                        string | fn.Fn
		MasterUserPassword?:              string | fn.Fn
		MasterUsername?:                  string | fn.Fn
		Port?:                            int | fn.Fn
		PreferredBackupWindow?:           string | fn.Fn
		PreferredMaintenanceWindow?:      string | fn.Fn
		ReplicationSourceIdentifier?:     string | fn.Fn
		RestoreType?:                     string | fn.Fn
		ScalingConfiguration?:            __ScalingConfiguration
		SnapshotIdentifier?:              string | fn.Fn
		SourceDBClusterIdentifier?:       string | fn.Fn
		SourceRegion?:                    string | fn.Fn
		StorageEncrypted?:                bool | fn.Fn
		Tags?: [...__Tag]
		UseLatestRestorableTime?: bool | fn.Fn
		VpcSecurityGroupIds?:     [...string] | fn.Fn
	}
	__DBClusterRole :: {
		FeatureName?: string | fn.Fn
		RoleArn:      string | fn.Fn
		Status?:      string | fn.Fn
	}
	__ScalingConfiguration :: {
		AutoPause?:             bool | fn.Fn
		MaxCapacity?:           int | fn.Fn
		MinCapacity?:           int | fn.Fn
		SecondsUntilAutoPause?: int | fn.Fn
	}
}
DBClusterParameterGroup :: {
	Type: "AWS::RDS::DBClusterParameterGroup"
	Properties: {
		Description: string | fn.Fn
		Family:      string | fn.Fn
		Parameters:  {
		} | fn.Fn
		Tags?: [...__Tag]
	}
}
DBInstance :: {
	Type: "AWS::RDS::DBInstance"
	Properties: {
		AllocatedStorage?:         string | fn.Fn
		AllowMajorVersionUpgrade?: bool | fn.Fn
		AssociatedRoles?: [...__DBInstanceRole]
		AutoMinorVersionUpgrade?:            bool | fn.Fn
		AvailabilityZone?:                   string | fn.Fn
		BackupRetentionPeriod?:              (int & (>=0 & <=35)) | fn.Fn
		CharacterSetName?:                   string | fn.Fn
		CopyTagsToSnapshot?:                 bool | fn.Fn
		DBClusterIdentifier?:                string | fn.Fn
		DBInstanceClass:                     string | fn.Fn
		DBInstanceIdentifier?:               string | fn.Fn
		DBName?:                             string | fn.Fn
		DBParameterGroupName?:               string | fn.Fn
		DBSecurityGroups?:                   [...string] | fn.Fn
		DBSnapshotIdentifier?:               string | fn.Fn
		DBSubnetGroupName?:                  string | fn.Fn
		DeleteAutomatedBackups?:             bool | fn.Fn
		DeletionProtection?:                 bool | fn.Fn
		Domain?:                             string | fn.Fn
		DomainIAMRoleName?:                  string | fn.Fn
		EnableCloudwatchLogsExports?:        [...string] | fn.Fn
		EnableIAMDatabaseAuthentication?:    bool | fn.Fn
		EnablePerformanceInsights?:          bool | fn.Fn
		Engine?:                             string | fn.Fn
		EngineVersion?:                      string | fn.Fn
		Iops?:                               int | fn.Fn
		KmsKeyId?:                           string | fn.Fn
		LicenseModel?:                       string | fn.Fn
		MasterUserPassword?:                 string | fn.Fn
		MasterUsername?:                     string | fn.Fn
		MonitoringInterval?:                 int | fn.Fn
		MonitoringRoleArn?:                  string | fn.Fn
		MultiAZ?:                            bool | fn.Fn
		OptionGroupName?:                    string | fn.Fn
		PerformanceInsightsKMSKeyId?:        string | fn.Fn
		PerformanceInsightsRetentionPeriod?: int | fn.Fn
		Port?:                               string | fn.Fn
		PreferredBackupWindow?:              string | fn.Fn
		PreferredMaintenanceWindow?:         string | fn.Fn
		ProcessorFeatures?: [...__ProcessorFeature]
		PromotionTier?:              (int & (>=0 & <=15)) | fn.Fn
		PubliclyAccessible?:         bool | fn.Fn
		SourceDBInstanceIdentifier?: string | fn.Fn
		SourceRegion?:               string | fn.Fn
		StorageEncrypted?:           bool | fn.Fn
		StorageType?:                string | fn.Fn
		Tags?: [...__Tag]
		Timezone?:                    string | fn.Fn
		UseDefaultProcessorFeatures?: bool | fn.Fn
		VPCSecurityGroups?:           [...string] | fn.Fn
	}
	__DBInstanceRole :: {
		FeatureName: string | fn.Fn
		RoleArn:     string | fn.Fn
		Status?:     string | fn.Fn
	}
	__ProcessorFeature :: {
		Name?:  string | fn.Fn
		Value?: string | fn.Fn
	}
}
DBParameterGroup :: {
	Type: "AWS::RDS::DBParameterGroup"
	Properties: {
		Description: string | fn.Fn
		Family:      string | fn.Fn
		Parameters?: {
		}
		Tags?: [...__Tag]
	}
}
DBSecurityGroup :: {
	Type: "AWS::RDS::DBSecurityGroup"
	Properties: {
		DBSecurityGroupIngress: [...__Ingress]
		EC2VpcId?:        string | fn.Fn
		GroupDescription: string | fn.Fn
		Tags?: [...__Tag]
	}
	__Ingress :: {
		CIDRIP?:                  string | fn.Fn
		EC2SecurityGroupId?:      string | fn.Fn
		EC2SecurityGroupName?:    string | fn.Fn
		EC2SecurityGroupOwnerId?: string | fn.Fn
	}
}
DBSecurityGroupIngress :: {
	Type: "AWS::RDS::DBSecurityGroupIngress"
	Properties: {
		CIDRIP?:                  string | fn.Fn
		DBSecurityGroupName:      string | fn.Fn
		EC2SecurityGroupId?:      string | fn.Fn
		EC2SecurityGroupName?:    string | fn.Fn
		EC2SecurityGroupOwnerId?: string | fn.Fn
	}
}
DBSubnetGroup :: {
	Type: "AWS::RDS::DBSubnetGroup"
	Properties: {
		DBSubnetGroupDescription: string | fn.Fn
		DBSubnetGroupName?:       string | fn.Fn
		SubnetIds:                [...string] | fn.Fn
		Tags?: [...__Tag]
	}
}
EventSubscription :: {
	Type: "AWS::RDS::EventSubscription"
	Properties: {
		Enabled?:         bool | fn.Fn
		EventCategories?: [...string] | fn.Fn
		SnsTopicArn:      string | fn.Fn
		SourceIds?:       [...string] | fn.Fn
		SourceType?:      string | fn.Fn
	}
}
OptionGroup :: {
	Type: "AWS::RDS::OptionGroup"
	Properties: {
		EngineName:         string | fn.Fn
		MajorEngineVersion: string | fn.Fn
		OptionConfigurations: [...__OptionConfiguration]
		OptionGroupDescription: string | fn.Fn
		Tags?: [...__Tag]
	}
	__OptionConfiguration :: {
		DBSecurityGroupMemberships?: [...string] | fn.Fn
		OptionName:                  string | fn.Fn
		OptionSettings?: [...__OptionSetting]
		OptionVersion?:               string | fn.Fn
		Port?:                        int | fn.Fn
		VpcSecurityGroupMemberships?: [...string] | fn.Fn
	}
	__OptionSetting :: {
		Name?:  string | fn.Fn
		Value?: string | fn.Fn
	}
}

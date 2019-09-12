package RDS

DBCluster :: {
	Type: "AWS::RDS::DBCluster"
	Properties: {
		AssociatedRoles?: [...__DBClusterRole]
		AvailabilityZones?: [...string]
		BacktrackWindow?:             int
		BackupRetentionPeriod?:       >=1 & <=35
		BackupRetentionPeriod?:       int
		DBClusterIdentifier?:         string
		DBClusterParameterGroupName?: string
		DBSubnetGroupName?:           string
		DatabaseName?:                string
		DeletionProtection?:          bool
		EnableCloudwatchLogsExports?: [...string]
		EnableIAMDatabaseAuthentication?: bool
		Engine:                           string
		EngineMode?:                      string
		EngineVersion?:                   string
		KmsKeyId?:                        string
		MasterUserPassword?:              string
		MasterUsername?:                  string
		Port?:                            int
		PreferredBackupWindow?:           string
		PreferredMaintenanceWindow?:      string
		ReplicationSourceIdentifier?:     string
		RestoreType?:                     string
		ScalingConfiguration?:            __ScalingConfiguration
		SnapshotIdentifier?:              string
		SourceDBClusterIdentifier?:       string
		SourceRegion?:                    string
		StorageEncrypted?:                bool
		Tags?: [...__Tag]
		UseLatestRestorableTime?: bool
		VpcSecurityGroupIds?: [...string]
	}
	__DBClusterRole = {
		FeatureName?: string
		RoleArn:      string
		Status?:      string
	}
	__ScalingConfiguration = {
		AutoPause?:             bool
		MaxCapacity?:           int
		MinCapacity?:           int
		SecondsUntilAutoPause?: int
	}
}
DBClusterParameterGroup :: {
	Type: "AWS::RDS::DBClusterParameterGroup"
	Properties: {
		Description: string
		Family:      string
		Parameters: {
		}
		Tags?: [...__Tag]
	}
}
DBInstance :: {
	Type: "AWS::RDS::DBInstance"
	Properties: {
		AllocatedStorage?:         string
		AllowMajorVersionUpgrade?: bool
		AssociatedRoles?: [...__DBInstanceRole]
		AutoMinorVersionUpgrade?: bool
		AvailabilityZone?:        string
		BackupRetentionPeriod?:   >=0 & <=35
		BackupRetentionPeriod?:   int
		CharacterSetName?:        string
		CopyTagsToSnapshot?:      bool
		DBClusterIdentifier?:     string
		DBInstanceClass:          string
		DBInstanceIdentifier?:    string
		DBName?:                  string
		DBParameterGroupName?:    string
		DBSecurityGroups?: [...string]
		DBSnapshotIdentifier?:   string
		DBSubnetGroupName?:      string
		DeleteAutomatedBackups?: bool
		DeletionProtection?:     bool
		Domain?:                 string
		DomainIAMRoleName?:      string
		EnableCloudwatchLogsExports?: [...string]
		EnableIAMDatabaseAuthentication?:    bool
		EnablePerformanceInsights?:          bool
		Engine?:                             string
		EngineVersion?:                      string
		Iops?:                               int
		KmsKeyId?:                           string
		LicenseModel?:                       string
		MasterUserPassword?:                 string
		MasterUsername?:                     string
		MonitoringInterval?:                 int
		MonitoringRoleArn?:                  string
		MultiAZ?:                            bool
		OptionGroupName?:                    string
		PerformanceInsightsKMSKeyId?:        string
		PerformanceInsightsRetentionPeriod?: int
		Port?:                               string
		PreferredBackupWindow?:              string
		PreferredMaintenanceWindow?:         string
		ProcessorFeatures?: [...__ProcessorFeature]
		PromotionTier?:              >=0 & <=15
		PromotionTier?:              int
		PubliclyAccessible?:         bool
		SourceDBInstanceIdentifier?: string
		SourceRegion?:               string
		StorageEncrypted?:           bool
		StorageType?:                string
		Tags?: [...__Tag]
		Timezone?:                    string
		UseDefaultProcessorFeatures?: bool
		VPCSecurityGroups?: [...string]
	}
	__DBInstanceRole = {
		FeatureName: string
		RoleArn:     string
		Status?:     string
	}
	__ProcessorFeature = {
		Name?:  string
		Value?: string
	}
}
DBParameterGroup :: {
	Type: "AWS::RDS::DBParameterGroup"
	Properties: {
		Description: string
		Family:      string
		Parameters?: {
		}
		Tags?: [...__Tag]
	}
}
DBSecurityGroup :: {
	Type: "AWS::RDS::DBSecurityGroup"
	Properties: {
		DBSecurityGroupIngress: [...__Ingress]
		EC2VpcId?:        string
		GroupDescription: string
		Tags?: [...__Tag]
	}
	__Ingress = {
		CIDRIP?:                  string
		EC2SecurityGroupId?:      string
		EC2SecurityGroupName?:    string
		EC2SecurityGroupOwnerId?: string
	}
}
DBSecurityGroupIngress :: {
	Type: "AWS::RDS::DBSecurityGroupIngress"
	Properties: {
		CIDRIP?:                  string
		DBSecurityGroupName:      string
		EC2SecurityGroupId?:      string
		EC2SecurityGroupName?:    string
		EC2SecurityGroupOwnerId?: string
	}
}
DBSubnetGroup :: {
	Type: "AWS::RDS::DBSubnetGroup"
	Properties: {
		DBSubnetGroupDescription: string
		DBSubnetGroupName?:       string
		SubnetIds: [...string]
		Tags?: [...__Tag]
	}
}
EventSubscription :: {
	Type: "AWS::RDS::EventSubscription"
	Properties: {
		Enabled?: bool
		EventCategories?: [...string]
		SnsTopicArn: string
		SourceIds?: [...string]
		SourceType?: string
	}
}
OptionGroup :: {
	Type: "AWS::RDS::OptionGroup"
	Properties: {
		EngineName:         string
		MajorEngineVersion: string
		OptionConfigurations: [...__OptionConfiguration]
		OptionGroupDescription: string
		Tags?: [...__Tag]
	}
	__OptionConfiguration = {
		DBSecurityGroupMemberships?: [...string]
		OptionName: string
		OptionSettings?: [...__OptionSetting]
		OptionVersion?: string
		Port?:          int
		VpcSecurityGroupMemberships?: [...string]
	}
	__OptionSetting = {
		Name?:  string
		Value?: string
	}
}

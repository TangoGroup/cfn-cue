package OpsWorksCM

Server :: {
	Type: "AWS::OpsWorksCM::Server"
	Properties: {
		AssociatePublicIpAddress?: bool
		BackupId?:                 string
		BackupRetentionCount?:     int
		DisableAutomatedBackup?:   bool
		Engine?:                   string
		EngineAttributes?: [...__EngineAttribute]
		EngineModel?:                string
		EngineVersion?:              string
		InstanceProfileArn:          string
		InstanceType:                string
		KeyPair?:                    string
		PreferredBackupWindow?:      string
		PreferredMaintenanceWindow?: string
		SecurityGroupIds?: [...string]
		ServerName?:    string
		ServiceRoleArn: string
		SubnetIds?: [...string]
	}
	__EngineAttribute :: {
		Name?:  string
		Value?: string
	}
}

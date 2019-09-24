package AmazonMQ

Broker :: {
	Type: "AWS::AmazonMQ::Broker"
	Properties: {
		AutoMinorVersionUpgrade:     bool
		BrokerName:                  string
		Configuration?:              __ConfigurationId
		DeploymentMode:              "ACTIVE_STANDBY_MULTI_AZ" | "SINGLE_INSTANCE"
		DeploymentMode:              string
		EncryptionOptions?:          __EncryptionOptions
		EngineType:                  "ACTIVEMQ"
		EngineType:                  string
		EngineVersion:               "5.15.0" | "5.15.6" | "5.15.8" | "5.15.9"
		EngineVersion:               string
		HostInstanceType:            "mq.m4.large" | "mq.m5.2xlarge" | "mq.m5.4xlarge" | "mq.m5.large" | "mq.m5.xlarge" | "mq.t2.micro"
		HostInstanceType:            string
		Logs?:                       __LogList
		MaintenanceWindowStartTime?: __MaintenanceWindow
		PubliclyAccessible:          bool
		SecurityGroups?: [...string]
		SubnetIds?: [...string]
		Tags?: [...__TagsEntry]
		Users: [...__User]
	}
	__ConfigurationId :: {
		Id:       string
		Revision: int
	}
	__EncryptionOptions :: {
		KmsKeyId?:      string
		UseAwsOwnedKey: bool
	}
	__LogList :: {
		Audit?:   bool
		General?: bool
	}
	__MaintenanceWindow :: {
		DayOfWeek: string
		TimeOfDay: string
		TimeZone:  string
	}
	__TagsEntry :: {
		Key:   string
		Value: string
	}
	__User :: {
		ConsoleAccess?: bool
		Groups?: [...string]
		Password: string
		Username: string
	}
}
Configuration :: {
	Type: "AWS::AmazonMQ::Configuration"
	Properties: {
		Data:          string
		Description?:  string
		EngineType:    "ACTIVEMQ"
		EngineType:    string
		EngineVersion: "5.15.0" | "5.15.6" | "5.15.8" | "5.15.9"
		EngineVersion: string
		Name:          string
		Tags?: [...__TagsEntry]
	}
	__TagsEntry :: {
		Key:   string
		Value: string
	}
}
ConfigurationAssociation :: {
	Type: "AWS::AmazonMQ::ConfigurationAssociation"
	Properties: {
		Broker:        string
		Configuration: __ConfigurationId
	}
	__ConfigurationId :: {
		Id:       string
		Revision: int
	}
}

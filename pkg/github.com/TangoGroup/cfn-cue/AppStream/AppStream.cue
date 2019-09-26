package AppStream

DirectoryConfig :: {
	Type: "AWS::AppStream::DirectoryConfig"
	Properties: {
		DirectoryName: string
		OrganizationalUnitDistinguishedNames: [...string]
		ServiceAccountCredentials: __ServiceAccountCredentials
	}
	__ServiceAccountCredentials :: {
		AccountName:     string
		AccountPassword: string
	}
}
Fleet :: {
	Type: "AWS::AppStream::Fleet"
	Properties: {
		ComputeCapacity:                 __ComputeCapacity
		Description?:                    string
		DisconnectTimeoutInSeconds?:     >=60 & <=360000
		DisconnectTimeoutInSeconds?:     int
		DisplayName?:                    string
		DomainJoinInfo?:                 __DomainJoinInfo
		EnableDefaultInternetAccess?:    bool
		FleetType?:                      string
		IdleDisconnectTimeoutInSeconds?: >=0 & <=3600
		IdleDisconnectTimeoutInSeconds?: int
		ImageArn?:                       string
		ImageName?:                      string
		InstanceType:                    string
		MaxUserDurationInSeconds?:       >=600 & <=360000
		MaxUserDurationInSeconds?:       int
		Name?:                           string
		Tags?: [...__Tag]
		VpcConfig?: __VpcConfig
	}
	__ComputeCapacity :: {
		DesiredInstances: int
	}
	__DomainJoinInfo :: {
		DirectoryName?:                       string
		OrganizationalUnitDistinguishedName?: string
	}
	__VpcConfig :: {
		SecurityGroupIds?: [...string]
		SubnetIds?: [...string]
	}
}
ImageBuilder :: {
	Type: "AWS::AppStream::ImageBuilder"
	Properties: {
		AppstreamAgentVersion?:       string
		Description?:                 string
		DisplayName?:                 string
		DomainJoinInfo?:              __DomainJoinInfo
		EnableDefaultInternetAccess?: bool
		ImageArn?:                    string
		ImageName?:                   string
		InstanceType:                 string
		Name?:                        string
		Tags?: [...__Tag]
		VpcConfig?: __VpcConfig
	}
	__DomainJoinInfo :: {
		DirectoryName?:                       string
		OrganizationalUnitDistinguishedName?: string
	}
	__VpcConfig :: {
		SecurityGroupIds?: [...string]
		SubnetIds?: [...string]
	}
}
Stack :: {
	Type: "AWS::AppStream::Stack"
	Properties: {
		ApplicationSettings?: __ApplicationSettings
		AttributesToDelete?: [...string]
		DeleteStorageConnectors?: bool
		Description?:             string
		DisplayName?:             string
		FeedbackURL?:             string
		Name?:                    string
		RedirectURL?:             string
		StorageConnectors?: [...__StorageConnector]
		Tags?: [...__Tag]
		UserSettings?: [...__UserSetting]
	}
	__ApplicationSettings :: {
		Enabled:        bool
		SettingsGroup?: string
	}
	__StorageConnector :: {
		ConnectorType: string
		Domains?: [...string]
		ResourceIdentifier?: string
	}
	__UserSetting :: {
		Action:     string
		Permission: string
	}
}
StackFleetAssociation :: {
	Type: "AWS::AppStream::StackFleetAssociation"
	Properties: {
		FleetName: string
		StackName: string
	}
}
StackUserAssociation :: {
	Type: "AWS::AppStream::StackUserAssociation"
	Properties: {
		AuthenticationType:     string
		SendEmailNotification?: bool
		StackName:              string
		UserName:               string
	}
}
User :: {
	Type: "AWS::AppStream::User"
	Properties: {
		AuthenticationType: string
		FirstName?:         string
		LastName?:          string
		MessageAction?:     string
		UserName:           string
	}
}

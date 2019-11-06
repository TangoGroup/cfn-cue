package AppStream

import "github.com/TangoGroup/fn"

DirectoryConfig :: {
	Type: "AWS::AppStream::DirectoryConfig"
	Properties: {
		DirectoryName:                        string | fn.Fn
		OrganizationalUnitDistinguishedNames: [...string] | fn.Fn
		ServiceAccountCredentials:            propServiceAccountCredentials
	}
	propServiceAccountCredentials :: {
		AccountName:     string | fn.Fn
		AccountPassword: string | fn.Fn
	}
}
Fleet :: {
	Type: "AWS::AppStream::Fleet"
	Properties: {
		ComputeCapacity:                 propComputeCapacity
		Description?:                    string | fn.Fn
		DisconnectTimeoutInSeconds?:     (int & (>=60 & <=360000)) | fn.Fn
		DisplayName?:                    string | fn.Fn
		DomainJoinInfo?:                 propDomainJoinInfo
		EnableDefaultInternetAccess?:    bool | fn.Fn
		FleetType?:                      string | fn.Fn
		IdleDisconnectTimeoutInSeconds?: (int & (>=0 & <=3600)) | fn.Fn
		ImageArn?:                       string | fn.Fn
		ImageName?:                      string | fn.Fn
		InstanceType:                    string | fn.Fn
		MaxUserDurationInSeconds?:       (int & (>=600 & <=360000)) | fn.Fn
		Name?:                           string | fn.Fn
		Tags?: [...propTag]
		VpcConfig?: propVpcConfig
	}
	propComputeCapacity :: {
		DesiredInstances: int | fn.Fn
	}
	propDomainJoinInfo :: {
		DirectoryName?:                       string | fn.Fn
		OrganizationalUnitDistinguishedName?: string | fn.Fn
	}
	propVpcConfig :: {
		SecurityGroupIds?: [...string] | fn.Fn
		SubnetIds?:        [...string] | fn.Fn
	}
}
ImageBuilder :: {
	Type: "AWS::AppStream::ImageBuilder"
	Properties: {
		AccessEndpoints?: [...propAccessEndpoint]
		AppstreamAgentVersion?:       string | fn.Fn
		Description?:                 string | fn.Fn
		DisplayName?:                 string | fn.Fn
		DomainJoinInfo?:              propDomainJoinInfo
		EnableDefaultInternetAccess?: bool | fn.Fn
		ImageArn?:                    string | fn.Fn
		ImageName?:                   string | fn.Fn
		InstanceType:                 string | fn.Fn
		Name?:                        string | fn.Fn
		Tags?: [...propTag]
		VpcConfig?: propVpcConfig
	}
	propAccessEndpoint :: {
		EndpointType: string | fn.Fn
		VpceId:       string | fn.Fn
	}
	propDomainJoinInfo :: {
		DirectoryName?:                       string | fn.Fn
		OrganizationalUnitDistinguishedName?: string | fn.Fn
	}
	propVpcConfig :: {
		SecurityGroupIds?: [...string] | fn.Fn
		SubnetIds?:        [...string] | fn.Fn
	}
}
Stack :: {
	Type: "AWS::AppStream::Stack"
	Properties: {
		AccessEndpoints?: [...propAccessEndpoint]
		ApplicationSettings?:     propApplicationSettings
		AttributesToDelete?:      [...string] | fn.Fn
		DeleteStorageConnectors?: bool | fn.Fn
		Description?:             string | fn.Fn
		DisplayName?:             string | fn.Fn
		EmbedHostDomains?:        [...string] | fn.Fn
		FeedbackURL?:             string | fn.Fn
		Name?:                    string | fn.Fn
		RedirectURL?:             string | fn.Fn
		StorageConnectors?: [...propStorageConnector]
		Tags?: [...propTag]
		UserSettings?: [...propUserSetting]
	}
	propAccessEndpoint :: {
		EndpointType: string | fn.Fn
		VpceId:       string | fn.Fn
	}
	propApplicationSettings :: {
		Enabled:        bool | fn.Fn
		SettingsGroup?: string | fn.Fn
	}
	propStorageConnector :: {
		ConnectorType:       string | fn.Fn
		Domains?:            [...string] | fn.Fn
		ResourceIdentifier?: string | fn.Fn
	}
	propUserSetting :: {
		Action:     string | fn.Fn
		Permission: string | fn.Fn
	}
}
StackFleetAssociation :: {
	Type: "AWS::AppStream::StackFleetAssociation"
	Properties: {
		FleetName: string | fn.Fn
		StackName: string | fn.Fn
	}
}
StackUserAssociation :: {
	Type: "AWS::AppStream::StackUserAssociation"
	Properties: {
		AuthenticationType:     string | fn.Fn
		SendEmailNotification?: bool | fn.Fn
		StackName:              string | fn.Fn
		UserName:               string | fn.Fn
	}
}
User :: {
	Type: "AWS::AppStream::User"
	Properties: {
		AuthenticationType: string | fn.Fn
		FirstName?:         string | fn.Fn
		LastName?:          string | fn.Fn
		MessageAction?:     string | fn.Fn
		UserName:           string | fn.Fn
	}
}

package euwest1

import "github.com/TangoGroup/fn"

AppStream :: {
	DirectoryConfig :: {
		Type: "AWS::AppStream::DirectoryConfig"
		Properties: {
			DirectoryName: string | fn.Fn
			OrganizationalUnitDistinguishedNames: [...(string | fn.Fn)]
			ServiceAccountCredentials: {
				AccountName:     string | fn.Fn
				AccountPassword: string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Fleet :: {
		Type: "AWS::AppStream::Fleet"
		Properties: {
			ComputeCapacity: DesiredInstances: int | fn.Fn
			Description?:                string | fn.Fn
			DisconnectTimeoutInSeconds?: (int & (>=60 & <=360000)) | fn.Fn
			DisplayName?:                string | fn.Fn
			DomainJoinInfo?: {
				DirectoryName?:                       string | fn.Fn
				OrganizationalUnitDistinguishedName?: string | fn.Fn
			}
			EnableDefaultInternetAccess?:    bool | fn.Fn
			FleetType?:                      string | fn.Fn
			IdleDisconnectTimeoutInSeconds?: (int & (>=0 & <=3600)) | fn.Fn
			ImageArn?:                       string | fn.Fn
			ImageName?:                      string | fn.Fn
			InstanceType:                    string | fn.Fn
			MaxUserDurationInSeconds?:       (int & (>=600 & <=360000)) | fn.Fn
			Name?:                           string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcConfig?: {
				SecurityGroupIds?: [...(string | fn.Fn)]
				SubnetIds?: [...(string | fn.Fn)]
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ImageBuilder :: {
		Type: "AWS::AppStream::ImageBuilder"
		Properties: {
			AccessEndpoints?: [...{
				EndpointType: string | fn.Fn
				VpceId:       string | fn.Fn
			}]
			AppstreamAgentVersion?: string | fn.Fn
			Description?:           string | fn.Fn
			DisplayName?:           string | fn.Fn
			DomainJoinInfo?: {
				DirectoryName?:                       string | fn.Fn
				OrganizationalUnitDistinguishedName?: string | fn.Fn
			}
			EnableDefaultInternetAccess?: bool | fn.Fn
			ImageArn?:                    string | fn.Fn
			ImageName?:                   string | fn.Fn
			InstanceType:                 string | fn.Fn
			Name?:                        string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcConfig?: {
				SecurityGroupIds?: [...(string | fn.Fn)]
				SubnetIds?: [...(string | fn.Fn)]
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Stack :: {
		Type: "AWS::AppStream::Stack"
		Properties: {
			AccessEndpoints?: [...{
				EndpointType: string | fn.Fn
				VpceId:       string | fn.Fn
			}]
			ApplicationSettings?: {
				Enabled:        bool | fn.Fn
				SettingsGroup?: string | fn.Fn
			}
			AttributesToDelete?: [...(string | fn.Fn)]
			DeleteStorageConnectors?: bool | fn.Fn
			Description?:             string | fn.Fn
			DisplayName?:             string | fn.Fn
			EmbedHostDomains?: [...(string | fn.Fn)]
			FeedbackURL?: string | fn.Fn
			Name?:        string | fn.Fn
			RedirectURL?: string | fn.Fn
			StorageConnectors?: [...{
				ConnectorType: string | fn.Fn
				Domains?: [...(string | fn.Fn)]
				ResourceIdentifier?: string | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			UserSettings?: [...{
				Action:     string | fn.Fn
				Permission: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	StackFleetAssociation :: {
		Type: "AWS::AppStream::StackFleetAssociation"
		Properties: {
			FleetName: string | fn.Fn
			StackName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	StackUserAssociation :: {
		Type: "AWS::AppStream::StackUserAssociation"
		Properties: {
			AuthenticationType:     string | fn.Fn
			SendEmailNotification?: bool | fn.Fn
			StackName:              string | fn.Fn
			UserName:               string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

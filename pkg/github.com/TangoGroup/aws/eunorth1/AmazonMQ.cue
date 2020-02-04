package eunorth1

import "github.com/TangoGroup/aws/fn"

AmazonMQ :: {
	Broker :: {
		Type: "AWS::AmazonMQ::Broker"
		Properties: {
			AutoMinorVersionUpgrade: bool | fn.Fn
			BrokerName:              string | fn.Fn
			Configuration?: {
				Id:       string | fn.Fn
				Revision: int | fn.Fn
			}
			DeploymentMode: string | fn.Fn
			EncryptionOptions?: {
				KmsKeyId?:      string | fn.Fn
				UseAwsOwnedKey: bool | fn.Fn
			}
			EngineType:       string | fn.Fn
			EngineVersion:    string | fn.Fn
			HostInstanceType: string | fn.Fn
			Logs?: {
				Audit?:   bool | fn.Fn
				General?: bool | fn.Fn
			}
			MaintenanceWindowStartTime?: {
				DayOfWeek: string | fn.Fn
				TimeOfDay: string | fn.Fn
				TimeZone:  string | fn.Fn
			}
			PubliclyAccessible: bool | fn.Fn
			SecurityGroups?:    [...(string | fn.Fn)] | fn.Fn
			StorageType?:       string | fn.Fn
			SubnetIds?:         [...(string | fn.Fn)] | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Users: [...{
				ConsoleAccess?: bool | fn.Fn
				Groups?:        [...(string | fn.Fn)] | fn.Fn
				Password:       string | fn.Fn
				Username:       string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Configuration :: {
		Type: "AWS::AmazonMQ::Configuration"
		Properties: {
			Data:          string | fn.Fn
			Description?:  string | fn.Fn
			EngineType:    string | fn.Fn
			EngineVersion: string | fn.Fn
			Name:          string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ConfigurationAssociation :: {
		Type: "AWS::AmazonMQ::ConfigurationAssociation"
		Properties: {
			Broker: string | fn.Fn
			Configuration: {
				Id:       string | fn.Fn
				Revision: int | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

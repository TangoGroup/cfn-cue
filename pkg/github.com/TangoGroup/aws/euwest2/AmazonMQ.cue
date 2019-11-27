package euwest2

import "github.com/TangoGroup/aws/fn"

AmazonMQ :: {
	Broker :: {
		Type: "AWS::AmazonMQ::Broker"
		Properties: {
			AutoMinorVersionUpgrade: bool | fn.Fn
			BrokerName:              string | fn.Fn
			Configuration?: {
			}
			DeploymentMode: string | fn.Fn
			EncryptionOptions?: {
			}
			EngineType:       string | fn.Fn
			EngineVersion:    string | fn.Fn
			HostInstanceType: string | fn.Fn
			Logs?: {
			}
			MaintenanceWindowStartTime?: {
			}
			PubliclyAccessible: bool | fn.Fn
			SecurityGroups?:    [...(string | fn.Fn)] | fn.Fn
			SubnetIds?:         [...(string | fn.Fn)] | fn.Fn
			Tags?: [...{
			}]
			Users: [...{
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
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

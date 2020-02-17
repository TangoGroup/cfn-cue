package mesouth1

import "github.com/TangoGroup/aws/fn"

AmazonMQ :: {
	Broker :: {
		Type: "AWS::AmazonMQ::Broker"
		Properties: {
			AutoMinorVersionUpgrade: bool | fn.Fn
			BrokerName:              string | fn.Fn
			Configuration?:          {
			} | fn.If
			DeploymentMode:     string | fn.Fn
			EncryptionOptions?: {
			} | fn.If
			EngineType:       string | fn.Fn
			EngineVersion:    string | fn.Fn
			HostInstanceType: string | fn.Fn
			Logs?:            {
			} | fn.If
			MaintenanceWindowStartTime?: {
			} | fn.If
			PubliclyAccessible: bool | fn.Fn
			SecurityGroups?:    [...(string | fn.Fn)] | (string | fn.Fn)
			StorageType?:       string | fn.Fn
			SubnetIds?:         [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:              [...{
			}] | fn.If
			Users: [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Configuration :: {
		Type: "AWS::AmazonMQ::Configuration"
		Properties: {
			Data:          string | fn.Fn
			Description?:  string | fn.Fn
			EngineType:    string | fn.Fn
			EngineVersion: string | fn.Fn
			Name:          string | fn.Fn
			Tags?:         [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ConfigurationAssociation :: {
		Type: "AWS::AmazonMQ::ConfigurationAssociation"
		Properties: {
			Broker:        string | fn.Fn
			Configuration: {
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

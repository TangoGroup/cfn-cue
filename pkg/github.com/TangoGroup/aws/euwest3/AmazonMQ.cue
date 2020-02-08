package euwest3

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
			DeploymentMode: ("ACTIVE_STANDBY_MULTI_AZ" | "SINGLE_INSTANCE") | fn.Fn
			EncryptionOptions?: {
				KmsKeyId?:      string | fn.Fn
				UseAwsOwnedKey: bool | fn.Fn
			}
			EngineType:       ("ACTIVEMQ") | fn.Fn
			EngineVersion:    ("5.15.0" | "5.15.6" | "5.15.8" | "5.15.9") | fn.Fn
			HostInstanceType: ("mq.m5.2xlarge" | "mq.m5.4xlarge" | "mq.m5.large" | "mq.m5.xlarge" | "mq.t2.micro") | fn.Fn
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
			SecurityGroups?:    [...(string | fn.Fn)] | (string | fn.Fn)
			StorageType?:       string | fn.Fn
			SubnetIds?:         [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Users: [...{
				ConsoleAccess?: bool | fn.Fn
				Groups?:        [...(string | fn.Fn)] | (string | fn.Fn)
				Password:       string | fn.Fn
				Username:       string | fn.Fn
			}]
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
			EngineType:    ("ACTIVEMQ") | fn.Fn
			EngineVersion: ("5.15.0" | "5.15.6" | "5.15.8" | "5.15.9") | fn.Fn
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
		Condition?: string
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
		Condition?: string
	}
}

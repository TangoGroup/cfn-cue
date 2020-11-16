package apsoutheast1

import "github.com/TangoGroup/aws/fn"

AmazonMQ :: {
	Broker :: {
		Type:       "AWS::AmazonMQ::Broker"
		Properties: close({
			AuthenticationStrategy?: string | fn.Fn
			AutoMinorVersionUpgrade: bool | fn.Fn
			BrokerName:              string | fn.Fn
			Configuration?:          close({
				Id:       string | fn.Fn
				Revision: int | fn.Fn
			}) | fn.If
			DeploymentMode:     ("ACTIVE_STANDBY_MULTI_AZ" | "CLUSTER_MULTI_AZ" | "SINGLE_INSTANCE") | fn.Fn
			EncryptionOptions?: close({
				KmsKeyId?:      string | fn.Fn
				UseAwsOwnedKey: bool | fn.Fn
			}) | fn.If
			EngineType:          ("ACTIVEMQ" | "RABBITMQ") | fn.Fn
			EngineVersion:       ("3.8.6" | "5.15.0" | "5.15.6" | "5.15.8" | "5.15.9" | "5.15.10" | "5.15.12" | "5.15.13") | fn.Fn
			HostInstanceType:    ("mq.m4.large" | "mq.m5.2xlarge" | "mq.m5.4xlarge" | "mq.m5.large" | "mq.m5.xlarge" | "mq.t2.micro" | "mq.t3.micro") | fn.Fn
			LdapServerMetadata?: close({
				Hosts:                  [...(string | fn.Fn)] | (string | fn.Fn)
				RoleBase:               string | fn.Fn
				RoleName?:              string | fn.Fn
				RoleSearchMatching:     string | fn.Fn
				RoleSearchSubtree?:     bool | fn.Fn
				ServiceAccountPassword: string | fn.Fn
				ServiceAccountUsername: string | fn.Fn
				UserBase:               string | fn.Fn
				UserRoleName?:          string | fn.Fn
				UserSearchMatching:     string | fn.Fn
				UserSearchSubtree?:     bool | fn.Fn
			}) | fn.If
			Logs?: close({
				Audit?:   bool | fn.Fn
				General?: bool | fn.Fn
			}) | fn.If
			MaintenanceWindowStartTime?: close({
				DayOfWeek: string | fn.Fn
				TimeOfDay: string | fn.Fn
				TimeZone:  string | fn.Fn
			}) | fn.If
			PubliclyAccessible: bool | fn.Fn
			SecurityGroups?:    [...(string | fn.Fn)] | (string | fn.Fn)
			StorageType?:       string | fn.Fn
			SubnetIds?:         [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:              [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Users: [...close({
				ConsoleAccess?: bool | fn.Fn
				Groups?:        [...(string | fn.Fn)] | (string | fn.Fn)
				Password:       string | fn.Fn
				Username:       string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Configuration :: {
		Type:       "AWS::AmazonMQ::Configuration"
		Properties: close({
			Data:          string | fn.Fn
			Description?:  string | fn.Fn
			EngineType:    ("ACTIVEMQ" | "RABBITMQ") | fn.Fn
			EngineVersion: ("3.8.6" | "5.15.0" | "5.15.6" | "5.15.8" | "5.15.9" | "5.15.10" | "5.15.12" | "5.15.13") | fn.Fn
			Name:          string | fn.Fn
			Tags?:         [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ConfigurationAssociation :: {
		Type:       "AWS::AmazonMQ::ConfigurationAssociation"
		Properties: close({
			Broker:        string | fn.Fn
			Configuration: close({
				Id:       string | fn.Fn
				Revision: int | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

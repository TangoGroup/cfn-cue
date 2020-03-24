package apsoutheast1

import "github.com/TangoGroup/aws/fn"

DMS :: {
	Certificate :: {
		Type: "AWS::DMS::Certificate"
		Properties: {
			CertificateIdentifier?: string | fn.Fn
			CertificatePem?:        string | fn.Fn
			CertificateWallet?:     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Endpoint :: {
		Type: "AWS::DMS::Endpoint"
		Properties: {
			CertificateArn?:   string | fn.Fn
			DatabaseName?:     string | fn.Fn
			DynamoDbSettings?: close({
				ServiceAccessRoleArn?: string | fn.Fn
			}) | fn.If
			ElasticsearchSettings?: close({
				EndpointUri?:             string | fn.Fn
				ErrorRetryDuration?:      int | fn.Fn
				FullLoadErrorPercentage?: int | fn.Fn
				ServiceAccessRoleArn?:    string | fn.Fn
			}) | fn.If
			EndpointIdentifier?:        string | fn.Fn
			EndpointType:               ("source" | "target") | fn.Fn
			EngineName:                 ("aurora-postgresql" | "aurora" | "azuredb" | "db2" | "dynamodb" | "mariadb" | "mongodb" | "mysql" | "oracle" | "postgres" | "redshift" | "s3" | "sqlserver" | "sybase") | fn.Fn
			ExtraConnectionAttributes?: string | fn.Fn
			KafkaSettings?:             close({
				Broker?: string | fn.Fn
				Topic?:  string | fn.Fn
			}) | fn.If
			KinesisSettings?: close({
				MessageFormat?:        string | fn.Fn
				ServiceAccessRoleArn?: string | fn.Fn
				StreamArn?:            string | fn.Fn
			}) | fn.If
			KmsKeyId?:        string | fn.Fn
			MongoDbSettings?: close({
				AuthMechanism?:     string | fn.Fn
				AuthSource?:        string | fn.Fn
				AuthType?:          string | fn.Fn
				DatabaseName?:      string | fn.Fn
				DocsToInvestigate?: string | fn.Fn
				ExtractDocId?:      string | fn.Fn
				NestingLevel?:      string | fn.Fn
				Password?:          string | fn.Fn
				Port?:              int | fn.Fn
				ServerName?:        string | fn.Fn
				Username?:          string | fn.Fn
			}) | fn.If
			Password?:   string | fn.Fn
			Port?:       int | fn.Fn
			S3Settings?: close({
				BucketFolder?:            string | fn.Fn
				BucketName?:              string | fn.Fn
				CompressionType?:         string | fn.Fn
				CsvDelimiter?:            string | fn.Fn
				CsvRowDelimiter?:         string | fn.Fn
				ExternalTableDefinition?: string | fn.Fn
				ServiceAccessRoleArn?:    string | fn.Fn
			}) | fn.If
			ServerName?: string | fn.Fn
			SslMode?:    ("none" | "require" | "verify-ca" | "verify-full") | fn.Fn
			Tags?:       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Username?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EventSubscription :: {
		Type: "AWS::DMS::EventSubscription"
		Properties: {
			Enabled?:          bool | fn.Fn
			EventCategories?:  [...(string | fn.Fn)] | (string | fn.Fn)
			SnsTopicArn:       string | fn.Fn
			SourceIds?:        [...(string | fn.Fn)] | (string | fn.Fn)
			SourceType?:       string | fn.Fn
			SubscriptionName?: string | fn.Fn
			Tags?:             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReplicationInstance :: {
		Type: "AWS::DMS::ReplicationInstance"
		Properties: {
			AllocatedStorage?:                 int | fn.Fn
			AllowMajorVersionUpgrade?:         bool | fn.Fn
			AutoMinorVersionUpgrade?:          bool | fn.Fn
			AvailabilityZone?:                 string | fn.Fn
			EngineVersion?:                    string | fn.Fn
			KmsKeyId?:                         string | fn.Fn
			MultiAZ?:                          bool | fn.Fn
			PreferredMaintenanceWindow?:       string | fn.Fn
			PubliclyAccessible?:               bool | fn.Fn
			ReplicationInstanceClass:          string | fn.Fn
			ReplicationInstanceIdentifier?:    string | fn.Fn
			ReplicationSubnetGroupIdentifier?: string | fn.Fn
			Tags?:                             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcSecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReplicationSubnetGroup :: {
		Type: "AWS::DMS::ReplicationSubnetGroup"
		Properties: {
			ReplicationSubnetGroupDescription: string | fn.Fn
			ReplicationSubnetGroupIdentifier?: string | fn.Fn
			SubnetIds:                         [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReplicationTask :: {
		Type: "AWS::DMS::ReplicationTask"
		Properties: {
			CdcStartPosition?:          string | fn.Fn
			CdcStartTime?:              number | fn.Fn
			CdcStopPosition?:           string | fn.Fn
			MigrationType:              string | fn.Fn
			ReplicationInstanceArn:     string | fn.Fn
			ReplicationTaskIdentifier?: string | fn.Fn
			ReplicationTaskSettings?:   string | fn.Fn
			SourceEndpointArn:          string | fn.Fn
			TableMappings:              string | fn.Fn
			Tags?:                      [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TargetEndpointArn: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

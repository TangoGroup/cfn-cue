package uswest1

import "github.com/TangoGroup/aws/fn"

DMS :: {
	Certificate :: {
		Type:       "AWS::DMS::Certificate"
		Properties: close({
			CertificateIdentifier?: string | fn.Fn
			CertificatePem?:        string | fn.Fn
			CertificateWallet?:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Endpoint :: {
		Type:       "AWS::DMS::Endpoint"
		Properties: close({
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
			EngineName:                 ("aurora-postgresql" | "aurora" | "azuredb" | "db2" | "documentdb" | "dynamodb" | "elasticsearch" | "kafka" | "kinesis" | "mariadb" | "mongodb" | "mysql" | "neptune" | "oracle" | "postgres" | "redshift" | "s3" | "sqlserver" | "sybase") | fn.Fn
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
			NeptuneSettings?: close({
				ErrorRetryDuration?:   int | fn.Fn
				IamAuthEnabled?:       bool | fn.Fn
				MaxFileSize?:          int | fn.Fn
				MaxRetryCount?:        int | fn.Fn
				S3BucketFolder?:       string | fn.Fn
				S3BucketName?:         string | fn.Fn
				ServiceAccessRoleArn?: string | fn.Fn
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
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EventSubscription :: {
		Type:       "AWS::DMS::EventSubscription"
		Properties: close({
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
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReplicationInstance :: {
		Type:       "AWS::DMS::ReplicationInstance"
		Properties: close({
			AllocatedStorage?:                 int | fn.Fn
			AllowMajorVersionUpgrade?:         bool | fn.Fn
			AutoMinorVersionUpgrade?:          bool | fn.Fn
			AvailabilityZone?:                 ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.Fn
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
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReplicationSubnetGroup :: {
		Type:       "AWS::DMS::ReplicationSubnetGroup"
		Properties: close({
			ReplicationSubnetGroupDescription: string | fn.Fn
			ReplicationSubnetGroupIdentifier?: string | fn.Fn
			SubnetIds:                         [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                             [...close({
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
	ReplicationTask :: {
		Type:       "AWS::DMS::ReplicationTask"
		Properties: close({
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
			TaskData?:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

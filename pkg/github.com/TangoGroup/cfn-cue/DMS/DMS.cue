package DMS

import "github.com/TangoGroup/fn"

Certificate :: {
	Type: "AWS::DMS::Certificate"
	Properties: {
		CertificateIdentifier?: string | fn.Fn
		CertificatePem?:        string | fn.Fn
		CertificateWallet?:     string | fn.Fn
	}
}
Endpoint :: {
	Type: "AWS::DMS::Endpoint"
	Properties: {
		CertificateArn?:            string | fn.Fn
		DatabaseName?:              string | fn.Fn
		DynamoDbSettings?:          __DynamoDbSettings
		ElasticsearchSettings?:     __ElasticsearchSettings
		EndpointIdentifier?:        string | fn.Fn
		EndpointType:               (string & ("source" | "target")) | fn.Fn
		EngineName:                 (string & ("aurora-postgresql" | "aurora" | "azuredb" | "db2" | "dynamodb" | "mariadb" | "mongodb" | "mysql" | "oracle" | "postgres" | "redshift" | "s3" | "sqlserver" | "sybase")) | fn.Fn
		ExtraConnectionAttributes?: string | fn.Fn
		KinesisSettings?:           __KinesisSettings
		KmsKeyId?:                  string | fn.Fn
		MongoDbSettings?:           __MongoDbSettings
		Password?:                  string | fn.Fn
		Port?:                      int | fn.Fn
		S3Settings?:                __S3Settings
		ServerName?:                string | fn.Fn
		SslMode?:                   (string & ("none" | "require" | "verify-ca" | "verify-full")) | fn.Fn
		Tags?: [...__Tag]
		Username?: string | fn.Fn
	}
	__DynamoDbSettings :: {
		ServiceAccessRoleArn?: string | fn.Fn
	}
	__ElasticsearchSettings :: {
		EndpointUri?:             string | fn.Fn
		ErrorRetryDuration?:      int | fn.Fn
		FullLoadErrorPercentage?: int | fn.Fn
		ServiceAccessRoleArn?:    string | fn.Fn
	}
	__KinesisSettings :: {
		MessageFormat?:        string | fn.Fn
		ServiceAccessRoleArn?: string | fn.Fn
		StreamArn?:            string | fn.Fn
	}
	__MongoDbSettings :: {
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
	}
	__S3Settings :: {
		BucketFolder?:            string | fn.Fn
		BucketName?:              string | fn.Fn
		CompressionType?:         string | fn.Fn
		CsvDelimiter?:            string | fn.Fn
		CsvRowDelimiter?:         string | fn.Fn
		ExternalTableDefinition?: string | fn.Fn
		ServiceAccessRoleArn?:    string | fn.Fn
	}
}
EventSubscription :: {
	Type: "AWS::DMS::EventSubscription"
	Properties: {
		Enabled?:          bool | fn.Fn
		EventCategories?:  [...string] | fn.Fn
		SnsTopicArn:       string | fn.Fn
		SourceIds?:        [...string] | fn.Fn
		SourceType?:       string | fn.Fn
		SubscriptionName?: string | fn.Fn
		Tags?: [...__Tag]
	}
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
		Tags?: [...__Tag]
		VpcSecurityGroupIds?: [...string] | fn.Fn
	}
}
ReplicationSubnetGroup :: {
	Type: "AWS::DMS::ReplicationSubnetGroup"
	Properties: {
		ReplicationSubnetGroupDescription: string | fn.Fn
		ReplicationSubnetGroupIdentifier?: string | fn.Fn
		SubnetIds:                         [...string] | fn.Fn
		Tags?: [...__Tag]
	}
}
ReplicationTask :: {
	Type: "AWS::DMS::ReplicationTask"
	Properties: {
		CdcStartPosition?:          string | fn.Fn
		CdcStartTime?:              float | fn.Fn
		CdcStopPosition?:           string | fn.Fn
		MigrationType:              string | fn.Fn
		ReplicationInstanceArn:     string | fn.Fn
		ReplicationTaskIdentifier?: string | fn.Fn
		ReplicationTaskSettings?:   string | fn.Fn
		SourceEndpointArn:          string | fn.Fn
		TableMappings:              string | fn.Fn
		Tags?: [...__Tag]
		TargetEndpointArn: string | fn.Fn
	}
}

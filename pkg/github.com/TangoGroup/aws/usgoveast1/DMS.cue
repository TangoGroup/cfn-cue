package usgoveast1

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
			CertificateArn?:            string | fn.Fn
			DatabaseName?:              string | fn.Fn
			DynamoDbSettings?:          close({}) | fn.If
			ElasticsearchSettings?:     close({}) | fn.If
			EndpointIdentifier?:        string | fn.Fn
			EndpointType:               string | fn.Fn
			EngineName:                 string | fn.Fn
			ExtraConnectionAttributes?: string | fn.Fn
			KafkaSettings?:             close({}) | fn.If
			KinesisSettings?:           close({}) | fn.If
			KmsKeyId?:                  string | fn.Fn
			MongoDbSettings?:           close({}) | fn.If
			NeptuneSettings?:           close({}) | fn.If
			Password?:                  string | fn.Fn
			Port?:                      int | fn.Fn
			S3Settings?:                close({}) | fn.If
			ServerName?:                string | fn.Fn
			SslMode?:                   string | fn.Fn
			Tags?:                      [...close({
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

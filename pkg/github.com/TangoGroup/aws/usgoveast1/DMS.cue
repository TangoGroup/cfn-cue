package usgoveast1

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
			CertificateArn?: string | fn.Fn
			DatabaseName?:   string | fn.Fn
			DynamoDbSettings?: {
			}
			ElasticsearchSettings?: {
			}
			EndpointIdentifier?:        string | fn.Fn
			EndpointType:               string | fn.Fn
			EngineName:                 string | fn.Fn
			ExtraConnectionAttributes?: string | fn.Fn
			KinesisSettings?: {
			}
			KmsKeyId?: string | fn.Fn
			MongoDbSettings?: {
			}
			Password?: string | fn.Fn
			Port?:     int | fn.Fn
			S3Settings?: {
			}
			ServerName?: string | fn.Fn
			SslMode?:    string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
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
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
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
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TargetEndpointArn: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

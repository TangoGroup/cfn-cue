package euwest3

import "github.com/TangoGroup/fn"

DynamoDB :: {
	Table :: {
		Type: "AWS::DynamoDB::Table"
		Properties: {
			AttributeDefinitions: [...{
				AttributeName: string | fn.Fn
				AttributeType: (string & ("B" | "N" | "S")) | fn.Fn
			}]
			BillingMode?: (string & ("PAY_PER_REQUEST" | "PROVISIONED")) | fn.Fn
			GlobalSecondaryIndexes?: [...{
				IndexName: string | fn.Fn
				KeySchema: [...{
					AttributeName: string | fn.Fn
					KeyType:       (string & ("HASH" | "RANGE")) | fn.Fn
				}]
				Projection: {
					NonKeyAttributes?: [...(string | fn.Fn)]
					ProjectionType?: (string & ("ALL" | "INCLUDE" | "KEYS_ONLY")) | fn.Fn
				}
				ProvisionedThroughput?: {
					ReadCapacityUnits:  int | fn.Fn
					WriteCapacityUnits: int | fn.Fn
				}
			}]
			KeySchema: [...{
				AttributeName: string | fn.Fn
				KeyType:       (string & ("HASH" | "RANGE")) | fn.Fn
			}]
			LocalSecondaryIndexes?: [...{
				IndexName: string | fn.Fn
				KeySchema: [...{
					AttributeName: string | fn.Fn
					KeyType:       (string & ("HASH" | "RANGE")) | fn.Fn
				}]
				Projection: {
					NonKeyAttributes?: [...(string | fn.Fn)]
					ProjectionType?: (string & ("ALL" | "INCLUDE" | "KEYS_ONLY")) | fn.Fn
				}
			}]
			PointInTimeRecoverySpecification?: PointInTimeRecoveryEnabled?: bool | fn.Fn
			ProvisionedThroughput?: {
				ReadCapacityUnits:  int | fn.Fn
				WriteCapacityUnits: int | fn.Fn
			}
			SSESpecification?: {
				KMSMasterKeyId?: string | fn.Fn
				SSEEnabled:      bool | fn.Fn
				SSEType?:        string | fn.Fn
			}
			StreamSpecification?: StreamViewType: (string & ("KEYS_ONLY" | "NEW_AND_OLD_IMAGES" | "NEW_IMAGE" | "OLD_IMAGE")) | fn.Fn
			TableName?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TimeToLiveSpecification?: {
				AttributeName: string | fn.Fn
				Enabled:       bool | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

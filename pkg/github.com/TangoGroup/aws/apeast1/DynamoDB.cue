package apeast1

import "github.com/TangoGroup/aws/fn"

DynamoDB :: {
	Table :: {
		Type:       "AWS::DynamoDB::Table"
		Properties: close({
			AttributeDefinitions: [...close({
				AttributeName: string | fn.Fn
				AttributeType: ("B" | "N" | "S") | fn.Fn
			})] | fn.If
			BillingMode?:                      ("PAY_PER_REQUEST" | "PROVISIONED") | fn.Fn
			ContributorInsightsSpecification?: close({
				Enabled: bool | fn.Fn
			}) | fn.If
			GlobalSecondaryIndexes?: [...close({
				ContributorInsightsSpecification?: close({
					Enabled: bool | fn.Fn
				}) | fn.If
				IndexName: string | fn.Fn
				KeySchema: [...close({
					AttributeName: string | fn.Fn
					KeyType:       ("HASH" | "RANGE") | fn.Fn
				})] | fn.If
				Projection: close({
					NonKeyAttributes?: [...(string | fn.Fn)] | (string | fn.Fn)
					ProjectionType?:   ("ALL" | "INCLUDE" | "KEYS_ONLY") | fn.Fn
				}) | fn.If
				ProvisionedThroughput?: close({
					ReadCapacityUnits:  int | fn.Fn
					WriteCapacityUnits: int | fn.Fn
				}) | fn.If
			})] | fn.If
			KeySchema: [...close({
				AttributeName: string | fn.Fn
				KeyType:       ("HASH" | "RANGE") | fn.Fn
			})] | fn.If
			LocalSecondaryIndexes?: [...close({
				IndexName: string | fn.Fn
				KeySchema: [...close({
					AttributeName: string | fn.Fn
					KeyType:       ("HASH" | "RANGE") | fn.Fn
				})] | fn.If
				Projection: close({
					NonKeyAttributes?: [...(string | fn.Fn)] | (string | fn.Fn)
					ProjectionType?:   ("ALL" | "INCLUDE" | "KEYS_ONLY") | fn.Fn
				}) | fn.If
			})] | fn.If
			PointInTimeRecoverySpecification?: close({
				PointInTimeRecoveryEnabled?: bool | fn.Fn
			}) | fn.If
			ProvisionedThroughput?: close({
				ReadCapacityUnits:  int | fn.Fn
				WriteCapacityUnits: int | fn.Fn
			}) | fn.If
			SSESpecification?: close({
				KMSMasterKeyId?: string | fn.Fn
				SSEEnabled:      bool | fn.Fn
				SSEType?:        string | fn.Fn
			}) | fn.If
			StreamSpecification?: close({
				StreamViewType: ("KEYS_ONLY" | "NEW_AND_OLD_IMAGES" | "NEW_IMAGE" | "OLD_IMAGE") | fn.Fn
			}) | fn.If
			TableName?: string | fn.Fn
			Tags?:      [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TimeToLiveSpecification?: close({
				AttributeName: string | fn.Fn
				Enabled:       bool | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

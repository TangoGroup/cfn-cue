package cnnorth1

import "github.com/TangoGroup/aws/fn"

#DynamoDB: {
	#Table: {
		Type: "AWS::DynamoDB::Table"
		Properties: {
			AttributeDefinitions: [...{
				AttributeName: string | fn.#Fn
				AttributeType: ("B" | "N" | "S") | fn.#Fn
			}] | fn.If
			BillingMode?:            ("PAY_PER_REQUEST" | "PROVISIONED") | fn.#Fn
			GlobalSecondaryIndexes?: [...{
				IndexName: string | fn.#Fn
				KeySchema: [...{
					AttributeName: string | fn.#Fn
					KeyType:       ("HASH" | "RANGE") | fn.#Fn
				}] | fn.If
				Projection: {
					NonKeyAttributes?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					ProjectionType?:   ("ALL" | "INCLUDE" | "KEYS_ONLY") | fn.#Fn
				} | fn.If
				ProvisionedThroughput?: {
					ReadCapacityUnits:  int | fn.#Fn
					WriteCapacityUnits: int | fn.#Fn
				} | fn.If
			}] | fn.If
			KeySchema: [...{
				AttributeName: string | fn.#Fn
				KeyType:       ("HASH" | "RANGE") | fn.#Fn
			}] | fn.If
			LocalSecondaryIndexes?: [...{
				IndexName: string | fn.#Fn
				KeySchema: [...{
					AttributeName: string | fn.#Fn
					KeyType:       ("HASH" | "RANGE") | fn.#Fn
				}] | fn.If
				Projection: {
					NonKeyAttributes?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					ProjectionType?:   ("ALL" | "INCLUDE" | "KEYS_ONLY") | fn.#Fn
				} | fn.If
			}] | fn.If
			PointInTimeRecoverySpecification?: {
				PointInTimeRecoveryEnabled?: bool | fn.#Fn
			} | fn.If
			ProvisionedThroughput?: {
				ReadCapacityUnits:  int | fn.#Fn
				WriteCapacityUnits: int | fn.#Fn
			} | fn.If
			SSESpecification?: {
				KMSMasterKeyId?: string | fn.#Fn
				SSEEnabled:      bool | fn.#Fn
				SSEType?:        string | fn.#Fn
			} | fn.If
			StreamSpecification?: {
				StreamViewType: ("KEYS_ONLY" | "NEW_AND_OLD_IMAGES" | "NEW_IMAGE" | "OLD_IMAGE") | fn.#Fn
			} | fn.If
			TableName?: string | fn.#Fn
			Tags?:      [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			TimeToLiveSpecification?: {
				AttributeName: string | fn.#Fn
				Enabled:       bool | fn.#Fn
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

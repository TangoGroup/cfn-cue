package DynamoDB

import "github.com/TangoGroup/fn"

Table :: {
	Type: "AWS::DynamoDB::Table"
	Properties: {
		AttributeDefinitions: [...propAttributeDefinition]
		BillingMode?: (string & ("PAY_PER_REQUEST" | "PROVISIONED")) | fn.Fn
		GlobalSecondaryIndexes?: [...propGlobalSecondaryIndex]
		KeySchema: [...propKeySchema]
		LocalSecondaryIndexes?: [...propLocalSecondaryIndex]
		PointInTimeRecoverySpecification?: propPointInTimeRecoverySpecification
		ProvisionedThroughput?:            propProvisionedThroughput
		SSESpecification?:                 propSSESpecification
		StreamSpecification?:              propStreamSpecification
		TableName?:                        string | fn.Fn
		Tags?: [...propTag]
		TimeToLiveSpecification?: propTimeToLiveSpecification
	}
	propAttributeDefinition :: {
		AttributeName: string | fn.Fn
		AttributeType: (string & ("B" | "N" | "S")) | fn.Fn
	}
	propGlobalSecondaryIndex :: {
		IndexName: string | fn.Fn
		KeySchema: [...propKeySchema]
		Projection:             propProjection
		ProvisionedThroughput?: propProvisionedThroughput
	}
	propKeySchema :: {
		AttributeName: string | fn.Fn
		KeyType:       (string & ("HASH" | "RANGE")) | fn.Fn
	}
	propLocalSecondaryIndex :: {
		IndexName: string | fn.Fn
		KeySchema: [...propKeySchema]
		Projection: propProjection
	}
	propPointInTimeRecoverySpecification :: {
		PointInTimeRecoveryEnabled?: bool | fn.Fn
	}
	propProjection :: {
		NonKeyAttributes?: [...(string | fn.Fn)]
		ProjectionType?: (string & ("ALL" | "INCLUDE" | "KEYS_ONLY")) | fn.Fn
	}
	propProvisionedThroughput :: {
		ReadCapacityUnits:  int | fn.Fn
		WriteCapacityUnits: int | fn.Fn
	}
	propSSESpecification :: {
		KMSMasterKeyId?: string | fn.Fn
		SSEEnabled:      bool | fn.Fn
		SSEType?:        string | fn.Fn
	}
	propStreamSpecification :: {
		StreamViewType: (string & ("KEYS_ONLY" | "NEW_AND_OLD_IMAGES" | "NEW_IMAGE" | "OLD_IMAGE")) | fn.Fn
	}
	propTimeToLiveSpecification :: {
		AttributeName: string | fn.Fn
		Enabled:       bool | fn.Fn
	}
}

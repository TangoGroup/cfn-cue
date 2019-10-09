package DynamoDB

import "github.com/TangoGroup/fn"

Table :: {
	Type: "AWS::DynamoDB::Table"
	Properties: {
		AttributeDefinitions: [...__AttributeDefinition]
		BillingMode?: (string & ("PAY_PER_REQUEST" | "PROVISIONED")) | fn.Fn
		GlobalSecondaryIndexes?: [...__GlobalSecondaryIndex]
		KeySchema: [...__KeySchema]
		LocalSecondaryIndexes?: [...__LocalSecondaryIndex]
		PointInTimeRecoverySpecification?: __PointInTimeRecoverySpecification
		ProvisionedThroughput?:            __ProvisionedThroughput
		SSESpecification?:                 __SSESpecification
		StreamSpecification?:              __StreamSpecification
		TableName?:                        string | fn.Fn
		Tags?: [...__Tag]
		TimeToLiveSpecification?: __TimeToLiveSpecification
	}
	__AttributeDefinition :: {
		AttributeName: string | fn.Fn
		AttributeType: (string & ("B" | "N" | "S")) | fn.Fn
	}
	__GlobalSecondaryIndex :: {
		IndexName: string | fn.Fn
		KeySchema: [...__KeySchema]
		Projection:             __Projection
		ProvisionedThroughput?: __ProvisionedThroughput
	}
	__KeySchema :: {
		AttributeName: string | fn.Fn
		KeyType:       (string & ("HASH" | "RANGE")) | fn.Fn
	}
	__LocalSecondaryIndex :: {
		IndexName: string | fn.Fn
		KeySchema: [...__KeySchema]
		Projection: __Projection
	}
	__PointInTimeRecoverySpecification :: {
		PointInTimeRecoveryEnabled?: bool | fn.Fn
	}
	__Projection :: {
		NonKeyAttributes?: [...string] | fn.Fn
		ProjectionType?:   (string & ("ALL" | "INCLUDE" | "KEYS_ONLY")) | fn.Fn
	}
	__ProvisionedThroughput :: {
		ReadCapacityUnits:  int | fn.Fn
		WriteCapacityUnits: int | fn.Fn
	}
	__SSESpecification :: {
		KMSMasterKeyId?: string | fn.Fn
		SSEEnabled:      bool | fn.Fn
		SSEType?:        string | fn.Fn
	}
	__StreamSpecification :: {
		StreamViewType: (string & ("KEYS_ONLY" | "NEW_AND_OLD_IMAGES" | "NEW_IMAGE" | "OLD_IMAGE")) | fn.Fn
	}
	__TimeToLiveSpecification :: {
		AttributeName: string | fn.Fn
		Enabled:       bool | fn.Fn
	}
}

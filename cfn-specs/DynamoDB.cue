package DynamoDB

Table :: {
	Type: "AWS::DynamoDB::Table"
	Properties: {
		AttributeDefinitions: [...__AttributeDefinition]
		BillingMode?: "PAY_PER_REQUEST" | "PROVISIONED"
		BillingMode?: string
		GlobalSecondaryIndexes?: [...__GlobalSecondaryIndex]
		KeySchema: [...__KeySchema]
		LocalSecondaryIndexes?: [...__LocalSecondaryIndex]
		PointInTimeRecoverySpecification?: __PointInTimeRecoverySpecification
		ProvisionedThroughput?:            __ProvisionedThroughput
		SSESpecification?:                 __SSESpecification
		StreamSpecification?:              __StreamSpecification
		TableName?:                        string
		Tags?: [...__Tag]
		TimeToLiveSpecification?: __TimeToLiveSpecification
	}
	__AttributeDefinition = {
		AttributeName: string
		AttributeType: "B" | "N" | "S"
		AttributeType: string
	}
	__GlobalSecondaryIndex = {
		IndexName: string
		KeySchema: [...__KeySchema]
		Projection:             __Projection
		ProvisionedThroughput?: __ProvisionedThroughput
	}
	__KeySchema = {
		AttributeName: string
		KeyType:       "HASH" | "RANGE"
		KeyType:       string
	}
	__LocalSecondaryIndex = {
		IndexName: string
		KeySchema: [...__KeySchema]
		Projection: __Projection
	}
	__PointInTimeRecoverySpecification = {
		PointInTimeRecoveryEnabled?: bool
	}
	__Projection = {
		NonKeyAttributes?: [...string]
		ProjectionType?: "ALL" | "INCLUDE" | "KEYS_ONLY"
		ProjectionType?: string
	}
	__ProvisionedThroughput = {
		ReadCapacityUnits:  int
		WriteCapacityUnits: int
	}
	__SSESpecification = {
		KMSMasterKeyId?: string
		SSEEnabled:      bool
		SSEType?:        string
	}
	__StreamSpecification = {
		StreamViewType: "KEYS_ONLY" | "NEW_AND_OLD_IMAGES" | "NEW_IMAGE" | "OLD_IMAGE"
		StreamViewType: string
	}
	__TimeToLiveSpecification = {
		AttributeName: string
		Enabled:       bool
	}
}

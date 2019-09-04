package DynamoDB

Table :: {
  Type: "AWS::DynamoDB::Table"
  Properties: {
    AttributeDefinitions: [...__AttributeDefinition]
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
    StreamViewType: string
  }
  __TimeToLiveSpecification = {
    AttributeName: string
    Enabled:       bool
  }
}

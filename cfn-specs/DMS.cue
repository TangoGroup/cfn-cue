package DMS

Certificate :: {
  Type: "AWS::DMS::Certificate"
  Properties: {
    CertificateIdentifier?: string
    CertificatePem?:        string
    CertificateWallet?:     string
  }
}
Endpoint :: {
  Type: "AWS::DMS::Endpoint"
  Properties: {
    CertificateArn?:            string
    DatabaseName?:              string
    DynamoDbSettings?:          __DynamoDbSettings
    ElasticsearchSettings?:     __ElasticsearchSettings
    EndpointIdentifier?:        string
    EndpointType:               string
    EngineName:                 string
    ExtraConnectionAttributes?: string
    KinesisSettings?:           __KinesisSettings
    KmsKeyId?:                  string
    MongoDbSettings?:           __MongoDbSettings
    Password?:                  string
    Port?:                      int
    S3Settings?:                __S3Settings
    ServerName?:                string
    SslMode?:                   string
    Tags?: [...__Tag]
    Username?: string
  }
  __DynamoDbSettings = {
    ServiceAccessRoleArn?: string
  }
  __ElasticsearchSettings = {
    EndpointUri?:             string
    ErrorRetryDuration?:      int
    FullLoadErrorPercentage?: int
    ServiceAccessRoleArn?:    string
  }
  __KinesisSettings = {
    MessageFormat?:        string
    ServiceAccessRoleArn?: string
    StreamArn?:            string
  }
  __MongoDbSettings = {
    AuthMechanism?:     string
    AuthSource?:        string
    AuthType?:          string
    DatabaseName?:      string
    DocsToInvestigate?: string
    ExtractDocId?:      string
    NestingLevel?:      string
    Password?:          string
    Port?:              int
    ServerName?:        string
    Username?:          string
  }
  __S3Settings = {
    BucketFolder?:            string
    BucketName?:              string
    CompressionType?:         string
    CsvDelimiter?:            string
    CsvRowDelimiter?:         string
    ExternalTableDefinition?: string
    ServiceAccessRoleArn?:    string
  }
}
EventSubscription :: {
  Type: "AWS::DMS::EventSubscription"
  Properties: {
    Enabled?: bool
    EventCategories?: [...string]
    SnsTopicArn: string
    SourceIds?: [...string]
    SourceType?:       string
    SubscriptionName?: string
    Tags?: [...__Tag]
  }
}
ReplicationInstance :: {
  Type: "AWS::DMS::ReplicationInstance"
  Properties: {
    AllocatedStorage?:                 int
    AllowMajorVersionUpgrade?:         bool
    AutoMinorVersionUpgrade?:          bool
    AvailabilityZone?:                 string
    EngineVersion?:                    string
    KmsKeyId?:                         string
    MultiAZ?:                          bool
    PreferredMaintenanceWindow?:       string
    PubliclyAccessible?:               bool
    ReplicationInstanceClass:          string
    ReplicationInstanceIdentifier?:    string
    ReplicationSubnetGroupIdentifier?: string
    Tags?: [...__Tag]
    VpcSecurityGroupIds?: [...string]
  }
}
ReplicationSubnetGroup :: {
  Type: "AWS::DMS::ReplicationSubnetGroup"
  Properties: {
    ReplicationSubnetGroupDescription: string
    ReplicationSubnetGroupIdentifier?: string
    SubnetIds: [...string]
    Tags?: [...__Tag]
  }
}
ReplicationTask :: {
  Type: "AWS::DMS::ReplicationTask"
  Properties: {
    CdcStartPosition?:          string
    CdcStartTime?:              float
    CdcStopPosition?:           string
    MigrationType:              string
    ReplicationInstanceArn:     string
    ReplicationTaskIdentifier?: string
    ReplicationTaskSettings?:   string
    SourceEndpointArn:          string
    TableMappings:              string
    Tags?: [...__Tag]
    TargetEndpointArn: string
  }
}

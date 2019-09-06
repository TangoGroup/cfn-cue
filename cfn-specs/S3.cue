package S3

Bucket :: {
  Type: "AWS::S3::Bucket"
  Properties: {
    AccelerateConfiguration?: __AccelerateConfiguration
    AccessControl?:           "AuthenticatedRead" | "AwsExecRead" | "BucketOwnerFullControl" | "BucketOwnerRead" | "LogDeliveryWrite" | "Private" | "PublicRead" | "PublicReadWrite"
    AccessControl?:           string
    AnalyticsConfigurations?: [...__AnalyticsConfiguration]
    BucketEncryption?:  __BucketEncryption
    BucketName?:        string
    CorsConfiguration?: __CorsConfiguration
    InventoryConfigurations?: [...__InventoryConfiguration]
    LifecycleConfiguration?: __LifecycleConfiguration
    LoggingConfiguration?:   __LoggingConfiguration
    MetricsConfigurations?: [...__MetricsConfiguration]
    NotificationConfiguration?:      __NotificationConfiguration
    ObjectLockConfiguration?:        __ObjectLockConfiguration
    ObjectLockEnabled?:              bool
    PublicAccessBlockConfiguration?: __PublicAccessBlockConfiguration
    ReplicationConfiguration?:       __ReplicationConfiguration
    Tags?: [...__Tag]
    VersioningConfiguration?: __VersioningConfiguration
    WebsiteConfiguration?:    __WebsiteConfiguration
  }
  __AbortIncompleteMultipartUpload = {
    DaysAfterInitiation: int
  }
  __AccelerateConfiguration = {
    AccelerationStatus: "Enabled" | "Suspended"
    AccelerationStatus: string
  }
  __AccessControlTranslation = {
    Owner: string
  }
  __AnalyticsConfiguration = {
    Id:                   string
    Prefix?:              string
    StorageClassAnalysis: __StorageClassAnalysis
    TagFilters?: [...__TagFilter]
  }
  __BucketEncryption = {
    ServerSideEncryptionConfiguration: [...__ServerSideEncryptionRule]
  }
  __CorsConfiguration = {
    CorsRules: [...__CorsRule]
  }
  __CorsRule = {
    AllowedHeaders?: [...string]
    AllowedMethods: [...string]
    AllowedOrigins: [...string]
    ExposedHeaders?: [...string]
    Id?:     string
    MaxAge?: int
  }
  __DataExport = {
    Destination:         __Destination
    OutputSchemaVersion: string
  }
  __DefaultRetention = {
    Days?:  int
    Mode?:  string
    Years?: int
  }
  __Destination = {
    BucketAccountId?: string
    BucketArn:        string
    Format:           string
    Prefix?:          string
  }
  __EncryptionConfiguration = {
    ReplicaKmsKeyID: string
  }
  __FilterRule = {
    Name:  string
    Value: string
  }
  __InventoryConfiguration = {
    Destination:            __Destination
    Enabled:                bool
    Id:                     string
    IncludedObjectVersions: string
    OptionalFields?: [...string]
    Prefix?:           string
    ScheduleFrequency: string
  }
  __LambdaConfiguration = {
    Event:    string
    Filter?:  __NotificationFilter
    Function: string
  }
  __LifecycleConfiguration = {
    Rules: [...__Rule]
  }
  __LoggingConfiguration = {
    DestinationBucketName?: string
    LogFilePrefix?:         string
  }
  __MetricsConfiguration = {
    Id:      string
    Prefix?: string
    TagFilters?: [...__TagFilter]
  }
  __NoncurrentVersionTransition = {
    StorageClass:     string
    TransitionInDays: int
  }
  __NotificationConfiguration = {
    LambdaConfigurations?: [...__LambdaConfiguration]
    QueueConfigurations?: [...__QueueConfiguration]
    TopicConfigurations?: [...__TopicConfiguration]
  }
  __NotificationFilter = {
    S3Key: __S3KeyFilter
  }
  __ObjectLockConfiguration = {
    ObjectLockEnabled?: string
    Rule?:              __ObjectLockRule
  }
  __ObjectLockRule = {
    DefaultRetention?: __DefaultRetention
  }
  __PublicAccessBlockConfiguration = {
    BlockPublicAcls?:       bool
    BlockPublicPolicy?:     bool
    IgnorePublicAcls?:      bool
    RestrictPublicBuckets?: bool
  }
  __QueueConfiguration = {
    Event:   string
    Filter?: __NotificationFilter
    Queue:   string
  }
  __RedirectAllRequestsTo = {
    HostName:  string
    Protocol?: "http" | "https"
    Protocol?: string
  }
  __RedirectRule = {
    HostName?:             string
    HttpRedirectCode?:     string
    Protocol?:             string
    ReplaceKeyPrefixWith?: string
    ReplaceKeyWith?:       string
  }
  __ReplicationConfiguration = {
    Role: string
    Rules: [...__ReplicationRule]
  }
  __ReplicationDestination = {
    AccessControlTranslation?: __AccessControlTranslation
    Account?:                  string
    Bucket:                    string
    EncryptionConfiguration?:  __EncryptionConfiguration
    StorageClass?:             string
  }
  __ReplicationRule = {
    Destination:              __ReplicationDestination
    Id?:                      string
    Prefix:                   string
    SourceSelectionCriteria?: __SourceSelectionCriteria
    Status:                   string
  }
  __RoutingRule = {
    RedirectRule:          __RedirectRule
    RoutingRuleCondition?: __RoutingRuleCondition
  }
  __RoutingRuleCondition = {
    HttpErrorCodeReturnedEquals?: string
    KeyPrefixEquals?:             string
  }
  __Rule = {
    AbortIncompleteMultipartUpload?:    __AbortIncompleteMultipartUpload
    ExpirationDate?:                    time.Time
    ExpirationInDays?:                  int
    Id?:                                string
    NoncurrentVersionExpirationInDays?: int
    NoncurrentVersionTransition?:       __NoncurrentVersionTransition
    NoncurrentVersionTransitions?: [...__NoncurrentVersionTransition]
    Prefix?: string
    Status:  string
    TagFilters?: [...__TagFilter]
    Transition?: __Transition
    Transitions?: [...__Transition]
  }
  __S3KeyFilter = {
    Rules: [...__FilterRule]
  }
  __ServerSideEncryptionByDefault = {
    KMSMasterKeyID?: string
    SSEAlgorithm:    "AES256" | "aws:kms"
    SSEAlgorithm:    string
  }
  __ServerSideEncryptionRule = {
    ServerSideEncryptionByDefault?: __ServerSideEncryptionByDefault
  }
  __SourceSelectionCriteria = {
    SseKmsEncryptedObjects: __SseKmsEncryptedObjects
  }
  __SseKmsEncryptedObjects = {
    Status: string
  }
  __StorageClassAnalysis = {
    DataExport?: __DataExport
  }
  __TagFilter = {
    Key:   string
    Value: string
  }
  __TopicConfiguration = {
    Event:   "s3:ObjectCreated:*" | "s3:ObjectCreated:CompleteMultipartUpload" | "s3:ObjectCreated:Copy" | "s3:ObjectCreated:Post" | "s3:ObjectCreated:Put" | "s3:ObjectRemoved:*" | "s3:ObjectRemoved:Delete" | "s3:ObjectRemoved:DeleteMarkerCreated" | "s3:ObjectRestore:Completed" | "s3:ObjectRestore:Post" | "s3:ReducedRedundancyLostObject"
    Event:   string
    Filter?: __NotificationFilter
    Topic:   string
  }
  __Transition = {
    StorageClass:      string
    TransitionDate?:   time.Time
    TransitionInDays?: int
  }
  __VersioningConfiguration = {
    Status: "Enabled" | "Suspended"
    Status: string
  }
  __WebsiteConfiguration = {
    ErrorDocument?:         string
    IndexDocument?:         string
    RedirectAllRequestsTo?: __RedirectAllRequestsTo
    RoutingRules?: [...__RoutingRule]
  }
}
BucketPolicy :: {
  Type: "AWS::S3::BucketPolicy"
  Properties: {
    Bucket: string
    PolicyDocument: {
    }
  }
}

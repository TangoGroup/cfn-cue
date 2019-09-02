package S3

Bucket :: {
  Type: "AWS::S3::Bucket"
  Properties: {
    InventoryConfigurations?: [...InventoryConfiguration]
    CorsConfiguration?:              CorsConfiguration
    NotificationConfiguration?:      NotificationConfiguration
    PublicAccessBlockConfiguration?: PublicAccessBlockConfiguration
    Tags?: [...Tag]
    WebsiteConfiguration?:    WebsiteConfiguration
    AccelerateConfiguration?: AccelerateConfiguration
    AccessControl?:           string
    LoggingConfiguration?:    LoggingConfiguration
    MetricsConfigurations?: [...MetricsConfiguration]
    ObjectLockEnabled?:        float
    ReplicationConfiguration?: ReplicationConfiguration
    VersioningConfiguration?:  VersioningConfiguration
    AnalyticsConfigurations?: [...AnalyticsConfiguration]
    BucketEncryption?:        BucketEncryption
    BucketName?:              string
    LifecycleConfiguration?:  LifecycleConfiguration
    ObjectLockConfiguration?: ObjectLockConfiguration
  }
}


MyBucket: Bucket & {
  Properties BucketName: "stuff"
}
  

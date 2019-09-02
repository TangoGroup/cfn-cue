package S3

Bucket :: {
	Type: "AWS::S3::Bucket"
	Properties: {
		AccelerateConfiguration?: __AccelerateConfiguration
		AccessControl?:           string
		AnalyticsConfigurations?: [...__AnalyticsConfiguration]
		BucketName?:                string
		CorsConfiguration?:         __CorsConfiguration
		NotificationConfiguration?: __NotificationConfiguration
		MetricsConfigurations?: [...__MetricsConfiguration]
		ObjectLockConfiguration?:        __ObjectLockConfiguration
		WebsiteConfiguration?:           __WebsiteConfiguration
		BucketEncryption?:               __BucketEncryption
		LifecycleConfiguration?:         __LifecycleConfiguration
		ObjectLockEnabled?:              float
		PublicAccessBlockConfiguration?: __PublicAccessBlockConfiguration
		ReplicationConfiguration?:       __ReplicationConfiguration
		Tags?: [...__Tag]
		InventoryConfigurations?: [...__InventoryConfiguration]
		LoggingConfiguration?:    __LoggingConfiguration
		VersioningConfiguration?: __VersioningConfiguration
	}
	__ObjectLockRule = {
		DefaultRetention?: __DefaultRetention
	}
	__QueueConfiguration = {
		Queue:   string
		Event:   string
		Filter?: __NotificationFilter
	}
	__AnalyticsConfiguration = {
		TagFilters?: [...__TagFilter]
		Id:                   string
		Prefix?:              string
		StorageClassAnalysis: __StorageClassAnalysis
	}
	__VersioningConfiguration = {
		Status: string
	}
	__FilterRule = {
		Name:  string
		Value: string
	}
	__ObjectLockConfiguration = {
		ObjectLockEnabled?: string
		Rule?:              __ObjectLockRule
	}
	__DefaultRetention = {
		Days?:  int
		Mode?:  string
		Years?: int
	}
	__NotificationFilter = {
		S3Key: __S3KeyFilter
	}
	__SourceSelectionCriteria = {
		SseKmsEncryptedObjects: __SseKmsEncryptedObjects
	}
	__TagFilter = {
		Key:   string
		Value: string
	}
	__TopicConfiguration = {
		Topic:   string
		Event:   string
		Filter?: __NotificationFilter
	}
	__AbortIncompleteMultipartUpload = {
		DaysAfterInitiation: int
	}
	__RoutingRule = {
		RoutingRuleCondition?: __RoutingRuleCondition
		RedirectRule:          __RedirectRule
	}
	__NotificationConfiguration = {
		LambdaConfigurations?: [...__LambdaConfiguration]
		QueueConfigurations?: [...__QueueConfiguration]
		TopicConfigurations?: [...__TopicConfiguration]
	}
	__RoutingRuleCondition = {
		HttpErrorCodeReturnedEquals?: string
		KeyPrefixEquals?:             string
	}
	__ServerSideEncryptionRule = {
		ServerSideEncryptionByDefault?: __ServerSideEncryptionByDefault
	}
	__StorageClassAnalysis = {
		DataExport?: __DataExport
	}
	__LambdaConfiguration = {
		Event:    string
		Filter?:  __NotificationFilter
		Function: string
	}
	__EncryptionConfiguration = {
		ReplicaKmsKeyID: string
	}
	__ReplicationRule = {
		Destination:              __ReplicationDestination
		Id?:                      string
		Prefix:                   string
		SourceSelectionCriteria?: __SourceSelectionCriteria
		Status:                   string
	}
	__ReplicationConfiguration = {
		Role: string
		Rules: [...__ReplicationRule]
	}
	__BucketEncryption = {
		ServerSideEncryptionConfiguration: [...__ServerSideEncryptionRule]
	}
	__Transition = {
		StorageClass:      string
		TransitionDate?:   time.Time
		TransitionInDays?: int
	}
	__ReplicationDestination = {
		Account?:                  string
		Bucket:                    string
		EncryptionConfiguration?:  __EncryptionConfiguration
		StorageClass?:             string
		AccessControlTranslation?: __AccessControlTranslation
	}
	__S3KeyFilter = {
		Rules: [...__FilterRule]
	}
	__CorsRule = {
		AllowedHeaders?: [...string]
		AllowedMethods: [...string]
		AllowedOrigins: [...string]
		ExposedHeaders?: [...string]
		Id?:     string
		MaxAge?: int
	}
	__InventoryConfiguration = {
		IncludedObjectVersions: string
		OptionalFields?: [...string]
		Prefix?:           string
		ScheduleFrequency: string
		Destination:       __Destination
		Enabled:           float
		Id:                string
	}
	__ServerSideEncryptionByDefault = {
		SSEAlgorithm:    string
		KMSMasterKeyID?: string
	}
	__RedirectRule = {
		ReplaceKeyPrefixWith?: string
		ReplaceKeyWith?:       string
		HostName?:             string
		HttpRedirectCode?:     string
		Protocol?:             string
	}
	__MetricsConfiguration = {
		Prefix?: string
		TagFilters?: [...__TagFilter]
		Id: string
	}
	__RedirectAllRequestsTo = {
		HostName:  string
		Protocol?: string
	}
	__LoggingConfiguration = {
		DestinationBucketName?: string
		LogFilePrefix?:         string
	}
	__PublicAccessBlockConfiguration = {
		RestrictPublicBuckets?: float
		BlockPublicAcls?:       float
		BlockPublicPolicy?:     float
		IgnorePublicAcls?:      float
	}
	__LifecycleConfiguration = {
		Rules: [...__Rule]
	}
	__AccelerateConfiguration = {
		AccelerationStatus: string
	}
	__WebsiteConfiguration = {
		ErrorDocument?:         string
		IndexDocument?:         string
		RedirectAllRequestsTo?: __RedirectAllRequestsTo
		RoutingRules?: [...__RoutingRule]
	}
	__SseKmsEncryptedObjects = {
		Status: string
	}
	__DataExport = {
		Destination:         __Destination
		OutputSchemaVersion: string
	}
	__Destination = {
		BucketAccountId?: string
		BucketArn:        string
		Format:           string
		Prefix?:          string
	}
	__NoncurrentVersionTransition = {
		StorageClass:     string
		TransitionInDays: int
	}
	__Rule = {
		ExpirationInDays?: int
		Id?:               string
		NoncurrentVersionTransitions?: [...__NoncurrentVersionTransition]
		Prefix?: string
		Status:  string
		TagFilters?: [...__TagFilter]
		Transition?:                        __Transition
		AbortIncompleteMultipartUpload?:    __AbortIncompleteMultipartUpload
		NoncurrentVersionExpirationInDays?: int
		NoncurrentVersionTransition?:       __NoncurrentVersionTransition
		Transitions?: [...__Transition]
		ExpirationDate?: time.Time
	}
	__CorsConfiguration = {
		CorsRules: [...__CorsRule]
	}
	__AccessControlTranslation = {
		Owner: string
	}
}

MyBucket: Bucket & {
	Properties BucketName: "stuff"
	Properties BucketEncryption ServerSideEncryptionConfiguration: [{
		ServerSideEncryptionByDefault SSEAlgorithm: "AES256"
	}]
}

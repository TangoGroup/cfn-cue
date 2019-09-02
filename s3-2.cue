package S3

Bucket :: {
	Type: "AWS::S3::Bucket"
	Properties: {
		LifecycleConfiguration?:   LifecycleConfiguration
		ReplicationConfiguration?: ReplicationConfiguration
		VersioningConfiguration?:  VersioningConfiguration
		WebsiteConfiguration?:     WebsiteConfiguration
		AccessControl?:            string
		AnalyticsConfigurations?: [...AnalyticsConfiguration]
		InventoryConfigurations?: [...InventoryConfiguration]
		NotificationConfiguration?: NotificationConfiguration
		AccelerateConfiguration?:   AccelerateConfiguration
		BucketEncryption?: {
			ServerSideEncryptionConfiguration: [...{
				ServerSideEncryptionByDefault?: {
					SSEAlgorithm:    string
					KMSMasterKeyID?: string
				}
			}]
		}
		CorsConfiguration?:    CorsConfiguration
		LoggingConfiguration?: LoggingConfiguration
		MetricsConfigurations?: [...MetricsConfiguration]
		PublicAccessBlockConfiguration?: PublicAccessBlockConfiguration
		BucketName?:                     string
		ObjectLockConfiguration?:        ObjectLockConfiguration
		ObjectLockEnabled?:              float
		Tags?: [...Tag]
	}
	StorageClassAnalysis :: {
		DataExport?: DataExport
	}
	CorsRule :: {
		MaxAge?: int
		AllowedHeaders?: [...string]
		AllowedMethods: [...string]
		AllowedOrigins: [...string]
		ExposedHeaders?: [...string]
		Id?: string
	}
	CorsConfiguration :: {
		CorsRules: [...CorsRule]
	}
	ObjectLockConfiguration :: {
		ObjectLockEnabled?: string
		Rule?:              ObjectLockRule
	}
	ObjectLockRule :: {
		DefaultRetention?: DefaultRetention
	}
	VersioningConfiguration :: {
		Status: string
	}
	SseKmsEncryptedObjects :: {
		Status: string
	}
	RedirectAllRequestsTo :: {
		HostName:  string
		Protocol?: string
	}
	S3KeyFilter :: {
		Rules: [...FilterRule]
	}
	LoggingConfiguration :: {
		DestinationBucketName?: string
		LogFilePrefix?:         string
	}
	NotificationFilter :: {
		S3Key: S3KeyFilter
	}
	RoutingRuleCondition :: {
		HttpErrorCodeReturnedEquals?: string
		KeyPrefixEquals?:             string
	}
	NotificationConfiguration :: {
		LambdaConfigurations?: [...LambdaConfiguration]
		QueueConfigurations?: [...QueueConfiguration]
		TopicConfigurations?: [...TopicConfiguration]
	}
	RoutingRule :: {
		RedirectRule:          RedirectRule
		RoutingRuleCondition?: RoutingRuleCondition
	}
	MetricsConfiguration :: {
		Prefix?: string
		TagFilters?: [...TagFilter]
		Id: string
	}
	AbortIncompleteMultipartUpload :: {
		DaysAfterInitiation: int
	}
	ReplicationConfiguration :: {
		Rules: [...ReplicationRule]
		Role: string
	}
	PublicAccessBlockConfiguration :: {
		RestrictPublicBuckets?: float
		BlockPublicAcls?:       float
		BlockPublicPolicy?:     float
		IgnorePublicAcls?:      float
	}
	SourceSelectionCriteria :: {
		SseKmsEncryptedObjects: SseKmsEncryptedObjects
	}
	DataExport :: {
		Destination:         Destination
		OutputSchemaVersion: string
	}
	EncryptionConfiguration :: {
		ReplicaKmsKeyID: string
	}
	AccessControlTranslation :: {
		Owner: string
	}
	AnalyticsConfiguration :: {
		Id:                   string
		Prefix?:              string
		StorageClassAnalysis: StorageClassAnalysis
		TagFilters?: [...TagFilter]
	}
	AccelerateConfiguration :: {
		AccelerationStatus: string
	}

	QueueConfiguration :: {
		Event:   string
		Filter?: NotificationFilter
		Queue:   string
	}
	InventoryConfiguration :: {
		IncludedObjectVersions: string
		OptionalFields?: [...string]
		Prefix?:           string
		ScheduleFrequency: string
		Destination:       Destination
		Enabled:           float
		Id:                string
	}
	NoncurrentVersionTransition :: {
		TransitionInDays: int
		StorageClass:     string
	}
	ReplicationRule :: {
		SourceSelectionCriteria?: SourceSelectionCriteria
		Status:                   string
		Destination:              ReplicationDestination
		Id?:                      string
		Prefix:                   string
	}
	DefaultRetention :: {
		Mode?:  string
		Years?: int
		Days?:  int
	}
	LifecycleConfiguration :: {
		Rules: [...Rule]
	}
	WebsiteConfiguration :: {
		RedirectAllRequestsTo?: RedirectAllRequestsTo
		RoutingRules?: [...RoutingRule]
		ErrorDocument?: string
		IndexDocument?: string
	}
	Rule :: {
		NoncurrentVersionExpirationInDays?: int
		NoncurrentVersionTransition?:       NoncurrentVersionTransition
		Status:                             string
		Transitions?: [...Transition]
		TagFilters?: [...TagFilter]
		Transition?:                     Transition
		AbortIncompleteMultipartUpload?: AbortIncompleteMultipartUpload
		ExpirationDate?:                 time.Time
		ExpirationInDays?:               int
		Id?:                             string
		NoncurrentVersionTransitions?: [...NoncurrentVersionTransition]
		Prefix?: string
	}
	Transition :: {
		StorageClass:      string
		TransitionDate?:   time.Time
		TransitionInDays?: int
	}
	Destination :: {
		BucketAccountId?: string
		BucketArn:        string
		Format:           string
		Prefix?:          string
	}
	ReplicationDestination :: {
		AccessControlTranslation?: AccessControlTranslation
		Account?:                  string
		Bucket:                    string
		EncryptionConfiguration?:  EncryptionConfiguration
		StorageClass?:             string
	}
	TopicConfiguration :: {
		Event:   string
		Filter?: NotificationFilter
		Topic:   string
	}
	RedirectRule :: {
		HostName?:             string
		HttpRedirectCode?:     string
		Protocol?:             string
		ReplaceKeyPrefixWith?: string
		ReplaceKeyWith?:       string
	}
	FilterRule :: {
		Name:  string
		Value: string
	}
	TagFilter :: {
		Key:   string
		Value: string
	}
	LambdaConfiguration :: {
		Function: string
		Event:    string
		Filter?:  NotificationFilter
	}
}

MyBucket: Bucket & {
	Properties BucketName: "stuff"
	Properties BucketEncryption ServerSideEncryptionConfiguration: [{
		ServerSideEncryptionByDefault SSEAlgorithm: "AES256"
	}]
}

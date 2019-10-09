package S3

import "github.com/TangoGroup/fn"

Bucket :: {
	Type: "AWS::S3::Bucket"
	Properties: {
		AccelerateConfiguration?: __AccelerateConfiguration
		AccessControl?:           (string & ("AuthenticatedRead" | "AwsExecRead" | "BucketOwnerFullControl" | "BucketOwnerRead" | "LogDeliveryWrite" | "Private" | "PublicRead" | "PublicReadWrite")) | fn.Fn
		AnalyticsConfigurations?: [...__AnalyticsConfiguration]
		BucketEncryption?:  __BucketEncryption
		BucketName?:        string | fn.Fn
		CorsConfiguration?: __CorsConfiguration
		InventoryConfigurations?: [...__InventoryConfiguration]
		LifecycleConfiguration?: __LifecycleConfiguration
		LoggingConfiguration?:   __LoggingConfiguration
		MetricsConfigurations?: [...__MetricsConfiguration]
		NotificationConfiguration?:      __NotificationConfiguration
		ObjectLockConfiguration?:        __ObjectLockConfiguration
		ObjectLockEnabled?:              bool | fn.Fn
		PublicAccessBlockConfiguration?: __PublicAccessBlockConfiguration
		ReplicationConfiguration?:       __ReplicationConfiguration
		Tags?: [...__Tag]
		VersioningConfiguration?: __VersioningConfiguration
		WebsiteConfiguration?:    __WebsiteConfiguration
	}
	__AbortIncompleteMultipartUpload :: {
		DaysAfterInitiation: int | fn.Fn
	}
	__AccelerateConfiguration :: {
		AccelerationStatus: (string & ("Enabled" | "Suspended")) | fn.Fn
	}
	__AccessControlTranslation :: {
		Owner: string | fn.Fn
	}
	__AnalyticsConfiguration :: {
		Id:                   string | fn.Fn
		Prefix?:              string | fn.Fn
		StorageClassAnalysis: __StorageClassAnalysis
		TagFilters?: [...__TagFilter]
	}
	__BucketEncryption :: {
		ServerSideEncryptionConfiguration: [...__ServerSideEncryptionRule]
	}
	__CorsConfiguration :: {
		CorsRules: [...__CorsRule]
	}
	__CorsRule :: {
		AllowedHeaders?: [...string] | fn.Fn
		AllowedMethods:  [...string] | fn.Fn
		AllowedOrigins:  [...string] | fn.Fn
		ExposedHeaders?: [...string] | fn.Fn
		Id?:             string | fn.Fn
		MaxAge?:         int | fn.Fn
	}
	__DataExport :: {
		Destination:         __Destination
		OutputSchemaVersion: string | fn.Fn
	}
	__DefaultRetention :: {
		Days?:  int | fn.Fn
		Mode?:  string | fn.Fn
		Years?: int | fn.Fn
	}
	__Destination :: {
		BucketAccountId?: string | fn.Fn
		BucketArn:        string | fn.Fn
		Format:           string | fn.Fn
		Prefix?:          string | fn.Fn
	}
	__EncryptionConfiguration :: {
		ReplicaKmsKeyID: string | fn.Fn
	}
	__FilterRule :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
	__InventoryConfiguration :: {
		Destination:            __Destination
		Enabled:                bool | fn.Fn
		Id:                     string | fn.Fn
		IncludedObjectVersions: string | fn.Fn
		OptionalFields?:        [...string] | fn.Fn
		Prefix?:                string | fn.Fn
		ScheduleFrequency:      string | fn.Fn
	}
	__LambdaConfiguration :: {
		Event:    string | fn.Fn
		Filter?:  __NotificationFilter
		Function: string | fn.Fn
	}
	__LifecycleConfiguration :: {
		Rules: [...__Rule]
	}
	__LoggingConfiguration :: {
		DestinationBucketName?: string | fn.Fn
		LogFilePrefix?:         string | fn.Fn
	}
	__MetricsConfiguration :: {
		Id:      string | fn.Fn
		Prefix?: string | fn.Fn
		TagFilters?: [...__TagFilter]
	}
	__NoncurrentVersionTransition :: {
		StorageClass:     string | fn.Fn
		TransitionInDays: int | fn.Fn
	}
	__NotificationConfiguration :: {
		LambdaConfigurations?: [...__LambdaConfiguration]
		QueueConfigurations?: [...__QueueConfiguration]
		TopicConfigurations?: [...__TopicConfiguration]
	}
	__NotificationFilter :: {
		S3Key: __S3KeyFilter
	}
	__ObjectLockConfiguration :: {
		ObjectLockEnabled?: string | fn.Fn
		Rule?:              __ObjectLockRule
	}
	__ObjectLockRule :: {
		DefaultRetention?: __DefaultRetention
	}
	__PublicAccessBlockConfiguration :: {
		BlockPublicAcls?:       bool | fn.Fn
		BlockPublicPolicy?:     bool | fn.Fn
		IgnorePublicAcls?:      bool | fn.Fn
		RestrictPublicBuckets?: bool | fn.Fn
	}
	__QueueConfiguration :: {
		Event:   string | fn.Fn
		Filter?: __NotificationFilter
		Queue:   string | fn.Fn
	}
	__RedirectAllRequestsTo :: {
		HostName:  string | fn.Fn
		Protocol?: (string & ("http" | "https")) | fn.Fn
	}
	__RedirectRule :: {
		HostName?:             string | fn.Fn
		HttpRedirectCode?:     string | fn.Fn
		Protocol?:             string | fn.Fn
		ReplaceKeyPrefixWith?: string | fn.Fn
		ReplaceKeyWith?:       string | fn.Fn
	}
	__ReplicationConfiguration :: {
		Role: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		Rules: [...__ReplicationRule]
	}
	__ReplicationDestination :: {
		AccessControlTranslation?: __AccessControlTranslation
		Account?:                  string | fn.Fn
		Bucket:                    string | fn.Fn
		EncryptionConfiguration?:  __EncryptionConfiguration
		StorageClass?:             string | fn.Fn
	}
	__ReplicationRule :: {
		Destination:              __ReplicationDestination
		Id?:                      string | fn.Fn
		Prefix:                   string | fn.Fn
		SourceSelectionCriteria?: __SourceSelectionCriteria
		Status:                   string | fn.Fn
	}
	__RoutingRule :: {
		RedirectRule:          __RedirectRule
		RoutingRuleCondition?: __RoutingRuleCondition
	}
	__RoutingRuleCondition :: {
		HttpErrorCodeReturnedEquals?: string | fn.Fn
		KeyPrefixEquals?:             string | fn.Fn
	}
	__Rule :: {
		AbortIncompleteMultipartUpload?:    __AbortIncompleteMultipartUpload
		ExpirationDate?:                    time.Time | fn.Fn
		ExpirationInDays?:                  int | fn.Fn
		Id?:                                string | fn.Fn
		NoncurrentVersionExpirationInDays?: int | fn.Fn
		NoncurrentVersionTransition?:       __NoncurrentVersionTransition
		NoncurrentVersionTransitions?: [...__NoncurrentVersionTransition]
		Prefix?: string | fn.Fn
		Status:  string | fn.Fn
		TagFilters?: [...__TagFilter]
		Transition?: __Transition
		Transitions?: [...__Transition]
	}
	__S3KeyFilter :: {
		Rules: [...__FilterRule]
	}
	__ServerSideEncryptionByDefault :: {
		KMSMasterKeyID?: string | fn.Fn
		SSEAlgorithm:    (string & ("AES256" | "aws:kms")) | fn.Fn
	}
	__ServerSideEncryptionRule :: {
		ServerSideEncryptionByDefault?: __ServerSideEncryptionByDefault
	}
	__SourceSelectionCriteria :: {
		SseKmsEncryptedObjects: __SseKmsEncryptedObjects
	}
	__SseKmsEncryptedObjects :: {
		Status: string | fn.Fn
	}
	__StorageClassAnalysis :: {
		DataExport?: __DataExport
	}
	__TagFilter :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	__TopicConfiguration :: {
		Event:   (string & ("s3:ObjectCreated:*" | "s3:ObjectCreated:CompleteMultipartUpload" | "s3:ObjectCreated:Copy" | "s3:ObjectCreated:Post" | "s3:ObjectCreated:Put" | "s3:ObjectRemoved:*" | "s3:ObjectRemoved:Delete" | "s3:ObjectRemoved:DeleteMarkerCreated" | "s3:ObjectRestore:Completed" | "s3:ObjectRestore:Post" | "s3:ReducedRedundancyLostObject")) | fn.Fn
		Filter?: __NotificationFilter
		Topic:   string | fn.Fn
	}
	__Transition :: {
		StorageClass:      string | fn.Fn
		TransitionDate?:   time.Time | fn.Fn
		TransitionInDays?: int | fn.Fn
	}
	__VersioningConfiguration :: {
		Status: (string & ("Enabled" | "Suspended")) | fn.Fn
	}
	__WebsiteConfiguration :: {
		ErrorDocument?:         string | fn.Fn
		IndexDocument?:         string | fn.Fn
		RedirectAllRequestsTo?: __RedirectAllRequestsTo
		RoutingRules?: [...__RoutingRule]
	}
}
BucketPolicy :: {
	Type: "AWS::S3::BucketPolicy"
	Properties: {
		Bucket:         string | fn.Fn
		PolicyDocument: {
		} | fn.Fn
	}
}

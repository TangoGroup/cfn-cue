package S3

import "github.com/TangoGroup/fn"

Bucket :: {
	Type: "AWS::S3::Bucket"
	Properties: {
		AccelerateConfiguration?: propAccelerateConfiguration
		AccessControl?:           (string & ("AuthenticatedRead" | "AwsExecRead" | "BucketOwnerFullControl" | "BucketOwnerRead" | "LogDeliveryWrite" | "Private" | "PublicRead" | "PublicReadWrite")) | fn.Fn
		AnalyticsConfigurations?: [...propAnalyticsConfiguration]
		BucketEncryption?:  propBucketEncryption
		BucketName?:        string | fn.Fn
		CorsConfiguration?: propCorsConfiguration
		InventoryConfigurations?: [...propInventoryConfiguration]
		LifecycleConfiguration?: propLifecycleConfiguration
		LoggingConfiguration?:   propLoggingConfiguration
		MetricsConfigurations?: [...propMetricsConfiguration]
		NotificationConfiguration?:      propNotificationConfiguration
		ObjectLockConfiguration?:        propObjectLockConfiguration
		ObjectLockEnabled?:              bool | fn.Fn
		PublicAccessBlockConfiguration?: propPublicAccessBlockConfiguration
		ReplicationConfiguration?:       propReplicationConfiguration
		Tags?: [...propTag]
		VersioningConfiguration?: propVersioningConfiguration
		WebsiteConfiguration?:    propWebsiteConfiguration
	}
	propAbortIncompleteMultipartUpload :: {
		DaysAfterInitiation: int | fn.Fn
	}
	propAccelerateConfiguration :: {
		AccelerationStatus: (string & ("Enabled" | "Suspended")) | fn.Fn
	}
	propAccessControlTranslation :: {
		Owner: string | fn.Fn
	}
	propAnalyticsConfiguration :: {
		Id:                   string | fn.Fn
		Prefix?:              string | fn.Fn
		StorageClassAnalysis: propStorageClassAnalysis
		TagFilters?: [...propTagFilter]
	}
	propBucketEncryption :: {
		ServerSideEncryptionConfiguration: [...propServerSideEncryptionRule]
	}
	propCorsConfiguration :: {
		CorsRules: [...propCorsRule]
	}
	propCorsRule :: {
		AllowedHeaders?: [...string] | fn.Fn
		AllowedMethods:  [...string] | fn.Fn
		AllowedOrigins:  [...string] | fn.Fn
		ExposedHeaders?: [...string] | fn.Fn
		Id?:             string | fn.Fn
		MaxAge?:         int | fn.Fn
	}
	propDataExport :: {
		Destination:         propDestination
		OutputSchemaVersion: string | fn.Fn
	}
	propDefaultRetention :: {
		Days?:  int | fn.Fn
		Mode?:  string | fn.Fn
		Years?: int | fn.Fn
	}
	propDestination :: {
		BucketAccountId?: string | fn.Fn
		BucketArn:        string | fn.Fn
		Format:           string | fn.Fn
		Prefix?:          string | fn.Fn
	}
	propEncryptionConfiguration :: {
		ReplicaKmsKeyID: string | fn.Fn
	}
	propFilterRule :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
	propInventoryConfiguration :: {
		Destination:            propDestination
		Enabled:                bool | fn.Fn
		Id:                     string | fn.Fn
		IncludedObjectVersions: string | fn.Fn
		OptionalFields?:        [...string] | fn.Fn
		Prefix?:                string | fn.Fn
		ScheduleFrequency:      string | fn.Fn
	}
	propLambdaConfiguration :: {
		Event:    string | fn.Fn
		Filter?:  propNotificationFilter
		Function: string | fn.Fn
	}
	propLifecycleConfiguration :: {
		Rules: [...propRule]
	}
	propLoggingConfiguration :: {
		DestinationBucketName?: string | fn.Fn
		LogFilePrefix?:         string | fn.Fn
	}
	propMetricsConfiguration :: {
		Id:      string | fn.Fn
		Prefix?: string | fn.Fn
		TagFilters?: [...propTagFilter]
	}
	propNoncurrentVersionTransition :: {
		StorageClass:     string | fn.Fn
		TransitionInDays: int | fn.Fn
	}
	propNotificationConfiguration :: {
		LambdaConfigurations?: [...propLambdaConfiguration]
		QueueConfigurations?: [...propQueueConfiguration]
		TopicConfigurations?: [...propTopicConfiguration]
	}
	propNotificationFilter :: {
		S3Key: propS3KeyFilter
	}
	propObjectLockConfiguration :: {
		ObjectLockEnabled?: string | fn.Fn
		Rule?:              propObjectLockRule
	}
	propObjectLockRule :: {
		DefaultRetention?: propDefaultRetention
	}
	propPublicAccessBlockConfiguration :: {
		BlockPublicAcls?:       bool | fn.Fn
		BlockPublicPolicy?:     bool | fn.Fn
		IgnorePublicAcls?:      bool | fn.Fn
		RestrictPublicBuckets?: bool | fn.Fn
	}
	propQueueConfiguration :: {
		Event:   string | fn.Fn
		Filter?: propNotificationFilter
		Queue:   string | fn.Fn
	}
	propRedirectAllRequestsTo :: {
		HostName:  string | fn.Fn
		Protocol?: (string & ("http" | "https")) | fn.Fn
	}
	propRedirectRule :: {
		HostName?:             string | fn.Fn
		HttpRedirectCode?:     string | fn.Fn
		Protocol?:             string | fn.Fn
		ReplaceKeyPrefixWith?: string | fn.Fn
		ReplaceKeyWith?:       string | fn.Fn
	}
	propReplicationConfiguration :: {
		Role: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		Rules: [...propReplicationRule]
	}
	propReplicationDestination :: {
		AccessControlTranslation?: propAccessControlTranslation
		Account?:                  string | fn.Fn
		Bucket:                    string | fn.Fn
		EncryptionConfiguration?:  propEncryptionConfiguration
		StorageClass?:             string | fn.Fn
	}
	propReplicationRule :: {
		Destination:              propReplicationDestination
		Id?:                      string | fn.Fn
		Prefix:                   string | fn.Fn
		SourceSelectionCriteria?: propSourceSelectionCriteria
		Status:                   string | fn.Fn
	}
	propRoutingRule :: {
		RedirectRule:          propRedirectRule
		RoutingRuleCondition?: propRoutingRuleCondition
	}
	propRoutingRuleCondition :: {
		HttpErrorCodeReturnedEquals?: string | fn.Fn
		KeyPrefixEquals?:             string | fn.Fn
	}
	propRule :: {
		AbortIncompleteMultipartUpload?:    propAbortIncompleteMultipartUpload
		ExpirationDate?:                    time.Time | fn.Fn
		ExpirationInDays?:                  int | fn.Fn
		Id?:                                string | fn.Fn
		NoncurrentVersionExpirationInDays?: int | fn.Fn
		NoncurrentVersionTransition?:       propNoncurrentVersionTransition
		NoncurrentVersionTransitions?: [...propNoncurrentVersionTransition]
		Prefix?: string | fn.Fn
		Status:  string | fn.Fn
		TagFilters?: [...propTagFilter]
		Transition?: propTransition
		Transitions?: [...propTransition]
	}
	propS3KeyFilter :: {
		Rules: [...propFilterRule]
	}
	propServerSideEncryptionByDefault :: {
		KMSMasterKeyID?: string | fn.Fn
		SSEAlgorithm:    (string & ("AES256" | "aws:kms")) | fn.Fn
	}
	propServerSideEncryptionRule :: {
		ServerSideEncryptionByDefault?: propServerSideEncryptionByDefault
	}
	propSourceSelectionCriteria :: {
		SseKmsEncryptedObjects: propSseKmsEncryptedObjects
	}
	propSseKmsEncryptedObjects :: {
		Status: string | fn.Fn
	}
	propStorageClassAnalysis :: {
		DataExport?: propDataExport
	}
	propTagFilter :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	propTopicConfiguration :: {
		Event:   (string & ("s3:ObjectCreated:*" | "s3:ObjectCreated:CompleteMultipartUpload" | "s3:ObjectCreated:Copy" | "s3:ObjectCreated:Post" | "s3:ObjectCreated:Put" | "s3:ObjectRemoved:*" | "s3:ObjectRemoved:Delete" | "s3:ObjectRemoved:DeleteMarkerCreated" | "s3:ObjectRestore:Completed" | "s3:ObjectRestore:Post" | "s3:ReducedRedundancyLostObject")) | fn.Fn
		Filter?: propNotificationFilter
		Topic:   string | fn.Fn
	}
	propTransition :: {
		StorageClass:      string | fn.Fn
		TransitionDate?:   time.Time | fn.Fn
		TransitionInDays?: int | fn.Fn
	}
	propVersioningConfiguration :: {
		Status: (string & ("Enabled" | "Suspended")) | fn.Fn
	}
	propWebsiteConfiguration :: {
		ErrorDocument?:         string | fn.Fn
		IndexDocument?:         string | fn.Fn
		RedirectAllRequestsTo?: propRedirectAllRequestsTo
		RoutingRules?: [...propRoutingRule]
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

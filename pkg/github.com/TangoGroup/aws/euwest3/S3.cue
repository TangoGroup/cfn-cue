package euwest3

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
	"time"
)

S3 :: {
	AccessPoint :: {
		Type: "AWS::S3::AccessPoint"
		Properties: {
			Bucket:         string | fn.Fn
			CreationDate?:  string | fn.Fn
			Name?:          string | fn.Fn
			NetworkOrigin?: string | fn.Fn
			Policy?:        {
				[string]: _
			} | fn.Fn
			PolicyStatus?: {
				[string]: _
			} | fn.Fn
			PublicAccessBlockConfiguration?: {
				BlockPublicAcls?:       bool | fn.Fn
				BlockPublicPolicy?:     bool | fn.Fn
				IgnorePublicAcls?:      bool | fn.Fn
				RestrictPublicBuckets?: bool | fn.Fn
			}
			VpcConfiguration?: VpcId?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Bucket :: {
		Type: "AWS::S3::Bucket"
		Properties: {
			AccelerateConfiguration?: AccelerationStatus: (string & ("Enabled" | "Suspended")) | fn.Fn
			AccessControl?: (string & ("AuthenticatedRead" | "AwsExecRead" | "BucketOwnerFullControl" | "BucketOwnerRead" | "LogDeliveryWrite" | "Private" | "PublicRead" | "PublicReadWrite")) | fn.Fn
			AnalyticsConfigurations?: [...{
				Id:      string | fn.Fn
				Prefix?: string | fn.Fn
				StorageClassAnalysis: DataExport?: {
					Destination: {
						BucketAccountId?: string | fn.Fn
						BucketArn:        string | fn.Fn
						Format:           string | fn.Fn
						Prefix?:          string | fn.Fn
					}
					OutputSchemaVersion: string | fn.Fn
				}
				TagFilters?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}]
			BucketEncryption?: ServerSideEncryptionConfiguration: [...{
				ServerSideEncryptionByDefault?: {
					KMSMasterKeyID?: string | fn.Fn
					SSEAlgorithm:    (string & ("AES256" | "aws:kms")) | fn.Fn
				}
			}]
			BucketName?: (string & (strings.MinRunes(3) & strings.MaxRunes(63)) & (=~#"^[a-z0-9][a-z0-9.-]*[a-z0-9]$"#)) | fn.Fn
			CorsConfiguration?: CorsRules: [...{
				AllowedHeaders?: [...(string | fn.Fn)] | fn.Fn
				AllowedMethods:  [...(string | fn.Fn)] | fn.Fn
				AllowedOrigins:  [...(string | fn.Fn)] | fn.Fn
				ExposedHeaders?: [...(string | fn.Fn)] | fn.Fn
				Id?:             string | fn.Fn
				MaxAge?:         int | fn.Fn
			}]
			InventoryConfigurations?: [...{
				Destination: {
					BucketAccountId?: string | fn.Fn
					BucketArn:        string | fn.Fn
					Format:           string | fn.Fn
					Prefix?:          string | fn.Fn
				}
				Enabled:                bool | fn.Fn
				Id:                     string | fn.Fn
				IncludedObjectVersions: string | fn.Fn
				OptionalFields?:        [...(string | fn.Fn)] | fn.Fn
				Prefix?:                string | fn.Fn
				ScheduleFrequency:      string | fn.Fn
			}]
			LifecycleConfiguration?: Rules: [...{
				AbortIncompleteMultipartUpload?: DaysAfterInitiation: int | fn.Fn
				ExpirationDate?:                    time.Time | fn.Fn
				ExpirationInDays?:                  int | fn.Fn
				Id?:                                string | fn.Fn
				NoncurrentVersionExpirationInDays?: int | fn.Fn
				NoncurrentVersionTransition?: {
					StorageClass:     string | fn.Fn
					TransitionInDays: int | fn.Fn
				}
				NoncurrentVersionTransitions?: [...{
					StorageClass:     string | fn.Fn
					TransitionInDays: int | fn.Fn
				}]
				Prefix?: string | fn.Fn
				Status:  string | fn.Fn
				TagFilters?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Transition?: {
					StorageClass:      string | fn.Fn
					TransitionDate?:   time.Time | fn.Fn
					TransitionInDays?: int | fn.Fn
				}
				Transitions?: [...{
					StorageClass:      string | fn.Fn
					TransitionDate?:   time.Time | fn.Fn
					TransitionInDays?: int | fn.Fn
				}]
			}]
			LoggingConfiguration?: {
				DestinationBucketName?: string | fn.Fn
				LogFilePrefix?:         string | fn.Fn
			}
			MetricsConfigurations?: [...{
				Id:      string | fn.Fn
				Prefix?: string | fn.Fn
				TagFilters?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}]
			NotificationConfiguration?: {
				LambdaConfigurations?: [...{
					Event: string | fn.Fn
					Filter?: S3Key: Rules: [...{
						Name:  string | fn.Fn
						Value: string | fn.Fn
					}]
					Function: string | fn.Fn
				}]
				QueueConfigurations?: [...{
					Event: string | fn.Fn
					Filter?: S3Key: Rules: [...{
						Name:  string | fn.Fn
						Value: string | fn.Fn
					}]
					Queue: string | fn.Fn
				}]
				TopicConfigurations?: [...{
					Event: (string & ("s3:ObjectCreated:*" | "s3:ObjectCreated:CompleteMultipartUpload" | "s3:ObjectCreated:Copy" | "s3:ObjectCreated:Post" | "s3:ObjectCreated:Put" | "s3:ObjectRemoved:*" | "s3:ObjectRemoved:Delete" | "s3:ObjectRemoved:DeleteMarkerCreated" | "s3:ObjectRestore:Completed" | "s3:ObjectRestore:Post" | "s3:ReducedRedundancyLostObject")) | fn.Fn
					Filter?: S3Key: Rules: [...{
						Name:  string | fn.Fn
						Value: string | fn.Fn
					}]
					Topic: string | fn.Fn
				}]
			}
			ObjectLockConfiguration?: {
				ObjectLockEnabled?: string | fn.Fn
				Rule?: DefaultRetention?: {
					Days?:  int | fn.Fn
					Mode?:  string | fn.Fn
					Years?: int | fn.Fn
				}
			}
			ObjectLockEnabled?: bool | fn.Fn
			PublicAccessBlockConfiguration?: {
				BlockPublicAcls?:       bool | fn.Fn
				BlockPublicPolicy?:     bool | fn.Fn
				IgnorePublicAcls?:      bool | fn.Fn
				RestrictPublicBuckets?: bool | fn.Fn
			}
			ReplicationConfiguration?: {
				Role: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
				Rules: [...{
					Destination: {
						AccessControlTranslation?: Owner: string | fn.Fn
						Account?: string | fn.Fn
						Bucket:   string | fn.Fn
						EncryptionConfiguration?: ReplicaKmsKeyID: string | fn.Fn
						StorageClass?: string | fn.Fn
					}
					Id?:    string | fn.Fn
					Prefix: string | fn.Fn
					SourceSelectionCriteria?: SseKmsEncryptedObjects: Status: string | fn.Fn
					Status: string | fn.Fn
				}]
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VersioningConfiguration?: Status: (string & ("Enabled" | "Suspended")) | fn.Fn
			WebsiteConfiguration?: {
				ErrorDocument?: string | fn.Fn
				IndexDocument?: string | fn.Fn
				RedirectAllRequestsTo?: {
					HostName:  string | fn.Fn
					Protocol?: (string & ("http" | "https")) | fn.Fn
				}
				RoutingRules?: [...{
					RedirectRule: {
						HostName?:             string | fn.Fn
						HttpRedirectCode?:     string | fn.Fn
						Protocol?:             string | fn.Fn
						ReplaceKeyPrefixWith?: string | fn.Fn
						ReplaceKeyWith?:       string | fn.Fn
					}
					RoutingRuleCondition?: {
						HttpErrorCodeReturnedEquals?: string | fn.Fn
						KeyPrefixEquals?:             string | fn.Fn
					}
				}]
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	BucketPolicy :: {
		Type: "AWS::S3::BucketPolicy"
		Properties: {
			Bucket:         string | fn.Fn
			PolicyDocument: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

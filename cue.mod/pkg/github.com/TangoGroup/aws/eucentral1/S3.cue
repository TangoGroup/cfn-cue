package eucentral1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
	"time"
)

#S3: {
	#AccessPoint: {
		Type: "AWS::S3::AccessPoint"
		Properties: {
			Bucket:         string | fn.#Fn
			Name?:          string | fn.#Fn
			NetworkOrigin?: string | fn.#Fn
			Policy?:        {
				[string]: _
			} | fn.#Fn
			PolicyStatus?: {
				[string]: _
			} | fn.#Fn
			PublicAccessBlockConfiguration?: {
				BlockPublicAcls?:       bool | fn.#Fn
				BlockPublicPolicy?:     bool | fn.#Fn
				IgnorePublicAcls?:      bool | fn.#Fn
				RestrictPublicBuckets?: bool | fn.#Fn
			} | fn.#If
			VpcConfiguration?: {
				VpcId?: string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Bucket: {
		Type: "AWS::S3::Bucket"
		Properties: {
			AccelerateConfiguration?: {
				AccelerationStatus: ("Enabled" | "Suspended") | fn.#Fn
			} | fn.#If
			AccessControl?:           ("AuthenticatedRead" | "AwsExecRead" | "BucketOwnerFullControl" | "BucketOwnerRead" | "LogDeliveryWrite" | "Private" | "PublicRead" | "PublicReadWrite") | fn.#Fn
			AnalyticsConfigurations?: [...{
				Id:                   string | fn.#Fn
				Prefix?:              string | fn.#Fn
				StorageClassAnalysis: {
					DataExport?: {
						Destination: {
							BucketAccountId?: string | fn.#Fn
							BucketArn:        string | fn.#Fn
							Format:           string | fn.#Fn
							Prefix?:          string | fn.#Fn
						} | fn.#If
						OutputSchemaVersion: string | fn.#Fn
					} | fn.#If
				} | fn.#If
				TagFilters?: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
			}] | fn.#If
			BucketEncryption?: {
				ServerSideEncryptionConfiguration: [...{
					BucketKeyEnabled?:              bool | fn.#Fn
					ServerSideEncryptionByDefault?: {
						KMSMasterKeyID?: string | fn.#Fn
						SSEAlgorithm:    ("AES256" | "aws:kms") | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			BucketName?:        (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"^[a-z0-9][a-z0-9.-]*[a-z0-9]$"#)) | fn.#Fn
			CorsConfiguration?: {
				CorsRules: [...{
					AllowedHeaders?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					AllowedMethods:  [...(string | fn.#Fn)] | (string | fn.#Fn)
					AllowedOrigins:  [...(string | fn.#Fn)] | (string | fn.#Fn)
					ExposedHeaders?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					Id?:             string | fn.#Fn
					MaxAge?:         int | fn.#Fn
				}] | fn.#If
			} | fn.#If
			IntelligentTieringConfigurations?: [...{
				Id:          string | fn.#Fn
				Prefix?:     string | fn.#Fn
				Status:      string | fn.#Fn
				TagFilters?: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
				Tierings: [...{
					AccessTier: string | fn.#Fn
					Days:       int | fn.#Fn
				}] | fn.#If
			}] | fn.#If
			InventoryConfigurations?: [...{
				Destination: {
					BucketAccountId?: string | fn.#Fn
					BucketArn:        string | fn.#Fn
					Format:           string | fn.#Fn
					Prefix?:          string | fn.#Fn
				} | fn.#If
				Enabled:                bool | fn.#Fn
				Id:                     (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9-_.]+$"#)) | fn.#Fn
				IncludedObjectVersions: ("All" | "Current") | fn.#Fn
				OptionalFields?:        [...(string | fn.#Fn)] | (string | fn.#Fn)
				Prefix?:                string | fn.#Fn
				ScheduleFrequency:      ("Daily" | "Weekly") | fn.#Fn
			}] | fn.#If
			LifecycleConfiguration?: {
				Rules: [...{
					AbortIncompleteMultipartUpload?: {
						DaysAfterInitiation: int | fn.#Fn
					} | fn.#If
					ExpirationDate?:                    time.Time | fn.#Fn
					ExpirationInDays?:                  int | fn.#Fn
					Id?:                                string | fn.#Fn
					NoncurrentVersionExpirationInDays?: int | fn.#Fn
					NoncurrentVersionTransition?:       {
						StorageClass:     string | fn.#Fn
						TransitionInDays: int | fn.#Fn
					} | fn.#If
					NoncurrentVersionTransitions?: [...{
						StorageClass:     string | fn.#Fn
						TransitionInDays: int | fn.#Fn
					}] | fn.#If
					Prefix?:     string | fn.#Fn
					Status:      string | fn.#Fn
					TagFilters?: [...{
						Key:   string | fn.#Fn
						Value: string | fn.#Fn
					}] | fn.#If
					Transition?: {
						StorageClass:      string | fn.#Fn
						TransitionDate?:   time.Time | fn.#Fn
						TransitionInDays?: int | fn.#Fn
					} | fn.#If
					Transitions?: [...{
						StorageClass:      string | fn.#Fn
						TransitionDate?:   time.Time | fn.#Fn
						TransitionInDays?: int | fn.#Fn
					}] | fn.#If
				}] | fn.#If
			} | fn.#If
			LoggingConfiguration?: {
				DestinationBucketName?: string | fn.#Fn
				LogFilePrefix?:         string | fn.#Fn
			} | fn.#If
			MetricsConfigurations?: [...{
				Id:          string | fn.#Fn
				Prefix?:     string | fn.#Fn
				TagFilters?: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
			}] | fn.#If
			NotificationConfiguration?: {
				LambdaConfigurations?: [...{
					Event:   string | fn.#Fn
					Filter?: {
						S3Key: {
							Rules: [...{
								Name:  string | fn.#Fn
								Value: string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					Function: string | fn.#Fn
				}] | fn.#If
				QueueConfigurations?: [...{
					Event:   string | fn.#Fn
					Filter?: {
						S3Key: {
							Rules: [...{
								Name:  string | fn.#Fn
								Value: string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					Queue: string | fn.#Fn
				}] | fn.#If
				TopicConfigurations?: [...{
					Event:   ("s3:ObjectCreated:*" | "s3:ObjectCreated:CompleteMultipartUpload" | "s3:ObjectCreated:Copy" | "s3:ObjectCreated:Post" | "s3:ObjectCreated:Put" | "s3:ObjectRemoved:*" | "s3:ObjectRemoved:Delete" | "s3:ObjectRemoved:DeleteMarkerCreated" | "s3:ObjectRestore:*" | "s3:ObjectRestore:Completed" | "s3:ObjectRestore:Post" | "s3:ReducedRedundancyLostObject" | "s3:Replication:*" | "s3:Replication:OperationFailedReplication" | "s3:Replication:OperationMissedThreshold" | "s3:Replication:OperationNotTracked" | "s3:Replication:OperationReplicatedAfterThreshold") | fn.#Fn
					Filter?: {
						S3Key: {
							Rules: [...{
								Name:  string | fn.#Fn
								Value: string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					Topic: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			ObjectLockConfiguration?: {
				ObjectLockEnabled?: string | fn.#Fn
				Rule?:              {
					DefaultRetention?: {
						Days?:  int | fn.#Fn
						Mode?:  string | fn.#Fn
						Years?: int | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			ObjectLockEnabled?: bool | fn.#Fn
			OwnershipControls?: {
				Rules: [...{
					ObjectOwnership?: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			PublicAccessBlockConfiguration?: {
				BlockPublicAcls?:       bool | fn.#Fn
				BlockPublicPolicy?:     bool | fn.#Fn
				IgnorePublicAcls?:      bool | fn.#Fn
				RestrictPublicBuckets?: bool | fn.#Fn
			} | fn.#If
			ReplicationConfiguration?: {
				Role:  (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
				Rules: [...{
					DeleteMarkerReplication?: {
						Status?: string | fn.#Fn
					} | fn.#If
					Destination: {
						AccessControlTranslation?: {
							Owner: string | fn.#Fn
						} | fn.#If
						Account?:                 string | fn.#Fn
						Bucket:                   string | fn.#Fn
						EncryptionConfiguration?: {
							ReplicaKmsKeyID: string | fn.#Fn
						} | fn.#If
						Metrics?: {
							EventThreshold?: {
								Minutes: int | fn.#Fn
							} | fn.#If
							Status: string | fn.#Fn
						} | fn.#If
						ReplicationTime?: {
							Status: string | fn.#Fn
							Time:   {
								Minutes: int | fn.#Fn
							} | fn.#If
						} | fn.#If
						StorageClass?: string | fn.#Fn
					} | fn.#If
					Filter?: {
						And?: {
							Prefix?:     string | fn.#Fn
							TagFilters?: [...{
								Key:   string | fn.#Fn
								Value: string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						Prefix?:    string | fn.#Fn
						TagFilter?: {
							Key:   string | fn.#Fn
							Value: string | fn.#Fn
						} | fn.#If
					} | fn.#If
					Id?:                      string | fn.#Fn
					Prefix?:                  string | fn.#Fn
					Priority?:                int | fn.#Fn
					SourceSelectionCriteria?: {
						ReplicaModifications?: {
							Status: string | fn.#Fn
						} | fn.#If
						SseKmsEncryptedObjects?: {
							Status: string | fn.#Fn
						} | fn.#If
					} | fn.#If
					Status: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			VersioningConfiguration?: {
				Status: ("Enabled" | "Suspended") | fn.#Fn
			} | fn.#If
			WebsiteConfiguration?: {
				ErrorDocument?:         string | fn.#Fn
				IndexDocument?:         string | fn.#Fn
				RedirectAllRequestsTo?: {
					HostName:  string | fn.#Fn
					Protocol?: ("http" | "https") | fn.#Fn
				} | fn.#If
				RoutingRules?: [...{
					RedirectRule: {
						HostName?:             string | fn.#Fn
						HttpRedirectCode?:     string | fn.#Fn
						Protocol?:             string | fn.#Fn
						ReplaceKeyPrefixWith?: string | fn.#Fn
						ReplaceKeyWith?:       string | fn.#Fn
					} | fn.#If
					RoutingRuleCondition?: {
						HttpErrorCodeReturnedEquals?: string | fn.#Fn
						KeyPrefixEquals?:             string | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#BucketPolicy: {
		Type: "AWS::S3::BucketPolicy"
		Properties: {
			Bucket:         string | fn.#Fn
			PolicyDocument: {
				{
					[string]: _
				}
				Version: string | *"2012-10-17"
			} | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StorageLens: {
		Type: "AWS::S3::StorageLens"
		Properties: {
			StorageLensConfiguration: {
				AccountLevel: {
					ActivityMetrics?: {
						IsEnabled?: bool | fn.#Fn
					} | fn.#If
					BucketLevel: {
						ActivityMetrics?: {
							IsEnabled?: bool | fn.#Fn
						} | fn.#If
						PrefixLevel?: {
							StorageMetrics: {
								IsEnabled?:         bool | fn.#Fn
								SelectionCriteria?: {
									Delimiter?:                 string | fn.#Fn
									MaxDepth?:                  int | fn.#Fn
									MinStorageBytesPercentage?: number | fn.#Fn
								} | fn.#If
							} | fn.#If
						} | fn.#If
					} | fn.#If
				} | fn.#If
				AwsOrg?: {
					Arn: string | fn.#Fn
				} | fn.#If
				DataExport?: {
					S3BucketDestination: {
						AccountId:           string | fn.#Fn
						Arn:                 string | fn.#Fn
						Encryption?:         {} | fn.#If
						Format:              string | fn.#Fn
						OutputSchemaVersion: string | fn.#Fn
						Prefix?:             string | fn.#Fn
					} | fn.#If
				} | fn.#If
				Exclude?: {
					Buckets?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					Regions?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
				Id:       string | fn.#Fn
				Include?: {
					Buckets?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					Regions?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
				IsEnabled:       bool | fn.#Fn
				StorageLensArn?: string | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

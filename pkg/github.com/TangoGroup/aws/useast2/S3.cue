package useast2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
	"time"
)

S3 :: {
	AccessPoint :: {
		Type:       "AWS::S3::AccessPoint"
		Properties: close({
			Bucket:  (strings.MinRunes(3) & strings.MaxRunes(255)) | fn.Fn
			Name?:   (strings.MinRunes(3) & strings.MaxRunes(50) & (=~#"^[a-z0-9]([a-z0-9\-]*[a-z0-9])?$"#)) | fn.Fn
			Policy?: {
				[string]: _
			} | fn.Fn
			PublicAccessBlockConfiguration?: close({
				BlockPublicAcls?:       bool | fn.Fn
				BlockPublicPolicy?:     bool | fn.Fn
				IgnorePublicAcls?:      bool | fn.Fn
				RestrictPublicBuckets?: bool | fn.Fn
			}) | fn.If
			VpcConfiguration?: close({
				VpcId?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Bucket :: {
		Type:       "AWS::S3::Bucket"
		Properties: close({
			AccelerateConfiguration?: close({
				AccelerationStatus: ("Enabled" | "Suspended") | fn.Fn
			}) | fn.If
			AccessControl?:           ("AuthenticatedRead" | "AwsExecRead" | "BucketOwnerFullControl" | "BucketOwnerRead" | "LogDeliveryWrite" | "Private" | "PublicRead" | "PublicReadWrite") | fn.Fn
			AnalyticsConfigurations?: [...close({
				Id:                   string | fn.Fn
				Prefix?:              string | fn.Fn
				StorageClassAnalysis: close({
					DataExport?: close({
						Destination: close({
							BucketAccountId?: string | fn.Fn
							BucketArn:        string | fn.Fn
							Format:           string | fn.Fn
							Prefix?:          string | fn.Fn
						}) | fn.If
						OutputSchemaVersion: string | fn.Fn
					}) | fn.If
				}) | fn.If
				TagFilters?: [...close({
					Key:   string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
			})] | fn.If
			BucketEncryption?: close({
				ServerSideEncryptionConfiguration: [...close({
					BucketKeyEnabled?:              bool | fn.Fn
					ServerSideEncryptionByDefault?: close({
						KMSMasterKeyID?: string | fn.Fn
						SSEAlgorithm:    ("AES256" | "aws:kms") | fn.Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
			BucketName?:        (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"^[a-z0-9][a-z0-9.-]*[a-z0-9]$"#)) | fn.Fn
			CorsConfiguration?: close({
				CorsRules: [...close({
					AllowedHeaders?: [...(string | fn.Fn)] | (string | fn.Fn)
					AllowedMethods:  [...(string | fn.Fn)] | (string | fn.Fn)
					AllowedOrigins:  [...(string | fn.Fn)] | (string | fn.Fn)
					ExposedHeaders?: [...(string | fn.Fn)] | (string | fn.Fn)
					Id?:             string | fn.Fn
					MaxAge?:         int | fn.Fn
				})] | fn.If
			}) | fn.If
			IntelligentTieringConfigurations?: [...close({
				Id:          string | fn.Fn
				Prefix?:     string | fn.Fn
				Status:      string | fn.Fn
				TagFilters?: [...close({
					Key:   string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
				Tierings: [...close({
					AccessTier: string | fn.Fn
					Days:       int | fn.Fn
				})] | fn.If
			})] | fn.If
			InventoryConfigurations?: [...close({
				Destination: close({
					BucketAccountId?: string | fn.Fn
					BucketArn:        string | fn.Fn
					Format:           string | fn.Fn
					Prefix?:          string | fn.Fn
				}) | fn.If
				Enabled:                bool | fn.Fn
				Id:                     (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9-_.]+$"#)) | fn.Fn
				IncludedObjectVersions: ("All" | "Current") | fn.Fn
				OptionalFields?:        [...(string | fn.Fn)] | (string | fn.Fn)
				Prefix?:                string | fn.Fn
				ScheduleFrequency:      ("Daily" | "Weekly") | fn.Fn
			})] | fn.If
			LifecycleConfiguration?: close({
				Rules: [...close({
					AbortIncompleteMultipartUpload?: close({
						DaysAfterInitiation: int | fn.Fn
					}) | fn.If
					ExpirationDate?:                    time.Time | fn.Fn
					ExpirationInDays?:                  int | fn.Fn
					Id?:                                string | fn.Fn
					NoncurrentVersionExpirationInDays?: int | fn.Fn
					NoncurrentVersionTransition?:       close({
						StorageClass:     string | fn.Fn
						TransitionInDays: int | fn.Fn
					}) | fn.If
					NoncurrentVersionTransitions?: [...close({
						StorageClass:     string | fn.Fn
						TransitionInDays: int | fn.Fn
					})] | fn.If
					Prefix?:     string | fn.Fn
					Status:      string | fn.Fn
					TagFilters?: [...close({
						Key:   string | fn.Fn
						Value: string | fn.Fn
					})] | fn.If
					Transition?: close({
						StorageClass:      string | fn.Fn
						TransitionDate?:   time.Time | fn.Fn
						TransitionInDays?: int | fn.Fn
					}) | fn.If
					Transitions?: [...close({
						StorageClass:      string | fn.Fn
						TransitionDate?:   time.Time | fn.Fn
						TransitionInDays?: int | fn.Fn
					})] | fn.If
				})] | fn.If
			}) | fn.If
			LoggingConfiguration?: close({
				DestinationBucketName?: string | fn.Fn
				LogFilePrefix?:         string | fn.Fn
			}) | fn.If
			MetricsConfigurations?: [...close({
				Id:          string | fn.Fn
				Prefix?:     string | fn.Fn
				TagFilters?: [...close({
					Key:   string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
			})] | fn.If
			NotificationConfiguration?: close({
				LambdaConfigurations?: [...close({
					Event:   string | fn.Fn
					Filter?: close({
						S3Key: close({
							Rules: [...close({
								Name:  string | fn.Fn
								Value: string | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					Function: string | fn.Fn
				})] | fn.If
				QueueConfigurations?: [...close({
					Event:   string | fn.Fn
					Filter?: close({
						S3Key: close({
							Rules: [...close({
								Name:  string | fn.Fn
								Value: string | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					Queue: string | fn.Fn
				})] | fn.If
				TopicConfigurations?: [...close({
					Event:   ("s3:ObjectCreated:*" | "s3:ObjectCreated:CompleteMultipartUpload" | "s3:ObjectCreated:Copy" | "s3:ObjectCreated:Post" | "s3:ObjectCreated:Put" | "s3:ObjectRemoved:*" | "s3:ObjectRemoved:Delete" | "s3:ObjectRemoved:DeleteMarkerCreated" | "s3:ObjectRestore:*" | "s3:ObjectRestore:Completed" | "s3:ObjectRestore:Post" | "s3:ReducedRedundancyLostObject" | "s3:Replication:*" | "s3:Replication:OperationFailedReplication" | "s3:Replication:OperationMissedThreshold" | "s3:Replication:OperationNotTracked" | "s3:Replication:OperationReplicatedAfterThreshold") | fn.Fn
					Filter?: close({
						S3Key: close({
							Rules: [...close({
								Name:  string | fn.Fn
								Value: string | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					Topic: string | fn.Fn
				})] | fn.If
			}) | fn.If
			ObjectLockConfiguration?: close({
				ObjectLockEnabled?: string | fn.Fn
				Rule?:              close({
					DefaultRetention?: close({
						Days?:  int | fn.Fn
						Mode?:  string | fn.Fn
						Years?: int | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			ObjectLockEnabled?: bool | fn.Fn
			OwnershipControls?: close({
				Rules: [...close({
					ObjectOwnership?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			PublicAccessBlockConfiguration?: close({
				BlockPublicAcls?:       bool | fn.Fn
				BlockPublicPolicy?:     bool | fn.Fn
				IgnorePublicAcls?:      bool | fn.Fn
				RestrictPublicBuckets?: bool | fn.Fn
			}) | fn.If
			ReplicationConfiguration?: close({
				Role:  (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
				Rules: [...close({
					DeleteMarkerReplication?: close({
						Status?: string | fn.Fn
					}) | fn.If
					Destination: close({
						AccessControlTranslation?: close({
							Owner: string | fn.Fn
						}) | fn.If
						Account?:                 string | fn.Fn
						Bucket:                   string | fn.Fn
						EncryptionConfiguration?: close({
							ReplicaKmsKeyID: string | fn.Fn
						}) | fn.If
						Metrics?: close({
							EventThreshold?: close({
								Minutes: int | fn.Fn
							}) | fn.If
							Status: string | fn.Fn
						}) | fn.If
						ReplicationTime?: close({
							Status: string | fn.Fn
							Time:   close({
								Minutes: int | fn.Fn
							}) | fn.If
						}) | fn.If
						StorageClass?: string | fn.Fn
					}) | fn.If
					Filter?: close({
						And?: close({
							Prefix?:     string | fn.Fn
							TagFilters?: [...close({
								Key:   string | fn.Fn
								Value: string | fn.Fn
							})] | fn.If
						}) | fn.If
						Prefix?:    string | fn.Fn
						TagFilter?: close({
							Key:   string | fn.Fn
							Value: string | fn.Fn
						}) | fn.If
					}) | fn.If
					Id?:                      string | fn.Fn
					Prefix?:                  string | fn.Fn
					Priority?:                int | fn.Fn
					SourceSelectionCriteria?: close({
						ReplicaModifications?: close({
							Status: string | fn.Fn
						}) | fn.If
						SseKmsEncryptedObjects?: close({
							Status: string | fn.Fn
						}) | fn.If
					}) | fn.If
					Status: string | fn.Fn
				})] | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VersioningConfiguration?: close({
				Status: ("Enabled" | "Suspended") | fn.Fn
			}) | fn.If
			WebsiteConfiguration?: close({
				ErrorDocument?:         string | fn.Fn
				IndexDocument?:         string | fn.Fn
				RedirectAllRequestsTo?: close({
					HostName:  string | fn.Fn
					Protocol?: ("http" | "https") | fn.Fn
				}) | fn.If
				RoutingRules?: [...close({
					RedirectRule: close({
						HostName?:             string | fn.Fn
						HttpRedirectCode?:     string | fn.Fn
						Protocol?:             string | fn.Fn
						ReplaceKeyPrefixWith?: string | fn.Fn
						ReplaceKeyWith?:       string | fn.Fn
					}) | fn.If
					RoutingRuleCondition?: close({
						HttpErrorCodeReturnedEquals?: string | fn.Fn
						KeyPrefixEquals?:             string | fn.Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	BucketPolicy :: {
		Type:       "AWS::S3::BucketPolicy"
		Properties: close({
			Bucket:         string | fn.Fn
			PolicyDocument: {
				[string]: _
				Version:  string | *"2012-10-17"
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	StorageLens :: {
		Type:       "AWS::S3::StorageLens"
		Properties: close({
			StorageLensConfiguration: close({
				AccountLevel: close({
					ActivityMetrics?: close({
						IsEnabled?: bool | fn.Fn
					}) | fn.If
					BucketLevel: close({
						ActivityMetrics?: close({
							IsEnabled?: bool | fn.Fn
						}) | fn.If
						PrefixLevel?: close({
							StorageMetrics: close({
								IsEnabled?:         bool | fn.Fn
								SelectionCriteria?: close({
									Delimiter?:                 string | fn.Fn
									MaxDepth?:                  int | fn.Fn
									MinStorageBytesPercentage?: number | fn.Fn
								}) | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
				}) | fn.If
				AwsOrg?: close({
					Arn: string | fn.Fn
				}) | fn.If
				DataExport?: close({
					S3BucketDestination: close({
						AccountId:   string | fn.Fn
						Arn:         string | fn.Fn
						Encryption?: close({
						}) | fn.If
						Format:              ("CSV" | "Parquet") | fn.Fn
						OutputSchemaVersion: ("V_1") | fn.Fn
						Prefix?:             string | fn.Fn
					}) | fn.If
				}) | fn.If
				Exclude?: close({
					Buckets?: [...(string | fn.Fn)] | (string | fn.Fn)
					Regions?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				Id:       (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9\-_.]+$"#)) | fn.Fn
				Include?: close({
					Buckets?: [...(string | fn.Fn)] | (string | fn.Fn)
					Regions?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				IsEnabled:       bool | fn.Fn
				StorageLensArn?: string | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

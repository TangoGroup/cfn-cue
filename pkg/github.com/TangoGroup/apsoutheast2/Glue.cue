package apsoutheast2

import "github.com/TangoGroup/fn"

Glue :: {
	Classifier :: {
		Type: "AWS::Glue::Classifier"
		Properties: {
			CsvClassifier?: {
				AllowSingleColumn?:    bool | fn.Fn
				ContainsHeader?:       string | fn.Fn
				Delimiter?:            string | fn.Fn
				DisableValueTrimming?: bool | fn.Fn
				Header?: [...(string | fn.Fn)]
				Name?:        string | fn.Fn
				QuoteSymbol?: string | fn.Fn
			}
			GrokClassifier?: {
				Classification:  string | fn.Fn
				CustomPatterns?: string | fn.Fn
				GrokPattern:     string | fn.Fn
				Name?:           string | fn.Fn
			}
			JsonClassifier?: {
				JsonPath: string | fn.Fn
				Name?:    string | fn.Fn
			}
			XMLClassifier?: {
				Classification: string | fn.Fn
				Name?:          string | fn.Fn
				RowTag:         string | fn.Fn
			}
		}
	}
	Connection :: {
		Type: "AWS::Glue::Connection"
		Properties: {
			CatalogId: string | fn.Fn
			ConnectionInput: {
				ConnectionProperties: {
				} | fn.Fn
				ConnectionType: (string & ("JDBC" | "SFTP")) | fn.Fn
				Description?:   string | fn.Fn
				MatchCriteria?: [...(string | fn.Fn)]
				Name?: string | fn.Fn
				PhysicalConnectionRequirements?: {
					AvailabilityZone?: string | fn.Fn
					SecurityGroupIdList?: [...(string | fn.Fn)]
					SubnetId?: string | fn.Fn
				}
			}
		}
	}
	Crawler :: {
		Type: "AWS::Glue::Crawler"
		Properties: {
			Classifiers?: [...(string | fn.Fn)]
			Configuration?:                string | fn.Fn
			CrawlerSecurityConfiguration?: string | fn.Fn
			DatabaseName?:                 string | fn.Fn
			Description?:                  string | fn.Fn
			Name?:                         string | fn.Fn
			Role:                          string | fn.Fn
			Schedule?: ScheduleExpression?: string | fn.Fn
			SchemaChangePolicy?: {
				DeleteBehavior?: (string & ("DELETE_FROM_DATABASE" | "DEPRECATE_IN_DATABASE" | "LOG")) | fn.Fn
				UpdateBehavior?: (string & ("LOG" | "UPDATE_IN_DATABASE")) | fn.Fn
			}
			TablePrefix?: string | fn.Fn
			Tags?:        {
			} | fn.Fn
			Targets: {
				CatalogTargets?: [...{
					DatabaseName?: string | fn.Fn
					Tables?: [...(string | fn.Fn)]
				}]
				DynamoDBTargets?: [...{
					Path?: string | fn.Fn
				}]
				JdbcTargets?: [...{
					ConnectionName?: string | fn.Fn
					Exclusions?: [...(string | fn.Fn)]
					Path?: string | fn.Fn
				}]
				S3Targets?: [...{
					Exclusions?: [...(string | fn.Fn)]
					Path?: string | fn.Fn
				}]
			}
		}
	}
	DataCatalogEncryptionSettings :: {
		Type: "AWS::Glue::DataCatalogEncryptionSettings"
		Properties: {
			CatalogId: string | fn.Fn
			DataCatalogEncryptionSettings: {
				ConnectionPasswordEncryption?: {
					KmsKeyId?:                          string | fn.Fn
					ReturnConnectionPasswordEncrypted?: bool | fn.Fn
				}
				EncryptionAtRest?: {
					CatalogEncryptionMode?: string | fn.Fn
					SseAwsKmsKeyId?:        string | fn.Fn
				}
			}
		}
	}
	Database :: {
		Type: "AWS::Glue::Database"
		Properties: {
			CatalogId: string | fn.Fn
			DatabaseInput: {
				Description?: string | fn.Fn
				LocationUri?: string | fn.Fn
				Name?:        string | fn.Fn
				Parameters?:  {
				} | fn.Fn
			}
		}
	}
	DevEndpoint :: {
		Type: "AWS::Glue::DevEndpoint"
		Properties: {
			Arguments?: {
			} | fn.Fn
			EndpointName?:          string | fn.Fn
			ExtraJarsS3Path?:       string | fn.Fn
			ExtraPythonLibsS3Path?: string | fn.Fn
			GlueVersion?:           string | fn.Fn
			NumberOfNodes?:         int | fn.Fn
			NumberOfWorkers?:       int | fn.Fn
			PublicKey?:             string | fn.Fn
			RoleArn:                string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			SecurityGroupIds?: [...(string | fn.Fn)]
			SubnetId?: string | fn.Fn
			Tags?:     {
			} | fn.Fn
			WorkerType?: string | fn.Fn
		}
	}
	Job :: {
		Type: "AWS::Glue::Job"
		Properties: {
			AllocatedCapacity?: float | fn.Fn
			Command: {
				Name?:           string | fn.Fn
				PythonVersion?:  string | fn.Fn
				ScriptLocation?: string | fn.Fn
			}
			Connections?: Connections?: [...(string | fn.Fn)]
			DefaultArguments?: {
			} | fn.Fn
			Description?: string | fn.Fn
			ExecutionProperty?: MaxConcurrentRuns?: float | fn.Fn
			GlueVersion?: string | fn.Fn
			LogUri?:      string | fn.Fn
			MaxCapacity?: float | fn.Fn
			MaxRetries?:  float | fn.Fn
			Name?:        string | fn.Fn
			NotificationProperty?: NotifyDelayAfter?: int | fn.Fn
			NumberOfWorkers?:       (int & (>=0 & <=299)) | fn.Fn
			Role:                   string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			Tags?:                  {
			} | fn.Fn
			Timeout?:    int | fn.Fn
			WorkerType?: string | fn.Fn
		}
	}
	Partition :: {
		Type: "AWS::Glue::Partition"
		Properties: {
			CatalogId:    string | fn.Fn
			DatabaseName: string | fn.Fn
			PartitionInput: {
				Parameters?: {
				} | fn.Fn
				StorageDescriptor?: {
					BucketColumns?: [...(string | fn.Fn)]
					Columns?: [...{
						Comment?: string | fn.Fn
						Name:     string | fn.Fn
						Type?:    string | fn.Fn
					}]
					Compressed?:      bool | fn.Fn
					InputFormat?:     string | fn.Fn
					Location?:        string | fn.Fn
					NumberOfBuckets?: int | fn.Fn
					OutputFormat?:    string | fn.Fn
					Parameters?:      {
					} | fn.Fn
					SerdeInfo?: {
						Name?:       string | fn.Fn
						Parameters?: {
						} | fn.Fn
						SerializationLibrary?: string | fn.Fn
					}
					SkewedInfo?: {
						SkewedColumnNames?: [...(string | fn.Fn)]
						SkewedColumnValueLocationMaps?: {
						} | fn.Fn
						SkewedColumnValues?: [...(string | fn.Fn)]
					}
					SortColumns?: [...{
						Column:     string | fn.Fn
						SortOrder?: int | fn.Fn
					}]
					StoredAsSubDirectories?: bool | fn.Fn
				}
				Values: [...(string | fn.Fn)]
			}
			TableName: string | fn.Fn
		}
	}
	SecurityConfiguration :: {
		Type: "AWS::Glue::SecurityConfiguration"
		Properties: {
			EncryptionConfiguration: {
				CloudWatchEncryption?: {
					CloudWatchEncryptionMode?: string | fn.Fn
					KmsKeyArn?:                string | fn.Fn
				}
				JobBookmarksEncryption?: {
					JobBookmarksEncryptionMode?: string | fn.Fn
					KmsKeyArn?:                  string | fn.Fn
				}
				S3Encryptions?: {
				}
			}
			Name: string | fn.Fn
		}
	}
	Table :: {
		Type: "AWS::Glue::Table"
		Properties: {
			CatalogId:    string | fn.Fn
			DatabaseName: string | fn.Fn
			TableInput: {
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				Owner?:       string | fn.Fn
				Parameters?:  {
				} | fn.Fn
				PartitionKeys?: [...{
					Comment?: string | fn.Fn
					Name:     string | fn.Fn
					Type?:    string | fn.Fn
				}]
				Retention?: int | fn.Fn
				StorageDescriptor?: {
					BucketColumns?: [...(string | fn.Fn)]
					Columns?: [...{
						Comment?: string | fn.Fn
						Name:     string | fn.Fn
						Type?:    string | fn.Fn
					}]
					Compressed?:      bool | fn.Fn
					InputFormat?:     string | fn.Fn
					Location?:        string | fn.Fn
					NumberOfBuckets?: int | fn.Fn
					OutputFormat?:    string | fn.Fn
					Parameters?:      {
					} | fn.Fn
					SerdeInfo?: {
						Name?:       string | fn.Fn
						Parameters?: {
						} | fn.Fn
						SerializationLibrary?: string | fn.Fn
					}
					SkewedInfo?: {
						SkewedColumnNames?: [...(string | fn.Fn)]
						SkewedColumnValueLocationMaps?: {
						} | fn.Fn
						SkewedColumnValues?: [...(string | fn.Fn)]
					}
					SortColumns?: [...{
						Column:    string | fn.Fn
						SortOrder: int | fn.Fn
					}]
					StoredAsSubDirectories?: bool | fn.Fn
				}
				TableType?:        (string & ("EXTERNAL_TABLE" | "VIRTUAL_VIEW")) | fn.Fn
				ViewExpandedText?: string | fn.Fn
				ViewOriginalText?: string | fn.Fn
			}
		}
	}
	Trigger :: {
		Type: "AWS::Glue::Trigger"
		Properties: {
			Actions: [...{
				Arguments?: {
				} | fn.Fn
				CrawlerName?: string | fn.Fn
				JobName?:     string | fn.Fn
				NotificationProperty?: NotifyDelayAfter?: int | fn.Fn
				SecurityConfiguration?: string | fn.Fn
				Timeout?:               int | fn.Fn
			}]
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Predicate?: {
				Conditions?: [...{
					CrawlState?:      string | fn.Fn
					CrawlerName?:     string | fn.Fn
					JobName?:         string | fn.Fn
					LogicalOperator?: (string & ("EQUALS")) | fn.Fn
					State?:           (string & ("SUCCEEDED")) | fn.Fn
				}]
				Logical?: (string & ("AND")) | fn.Fn
			}
			Schedule?:        string | fn.Fn
			StartOnCreation?: bool | fn.Fn
			Tags?:            {
			} | fn.Fn
			Type:          (string & ("CONDITIONAL" | "ON_DEMAND" | "SCHEDULED")) | fn.Fn
			WorkflowName?: string | fn.Fn
		}
	}
	Workflow :: {
		Type: "AWS::Glue::Workflow"
		Properties: {
			DefaultRunProperties?: {
			} | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Tags?:        {
			} | fn.Fn
		}
	}
}

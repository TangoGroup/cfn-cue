package apsoutheast1

import "github.com/TangoGroup/aws/fn"

Glue :: {
	Classifier :: {
		Type:       "AWS::Glue::Classifier"
		Properties: close({
			CsvClassifier?: close({
				AllowSingleColumn?:    bool | fn.Fn
				ContainsHeader?:       string | fn.Fn
				Delimiter?:            string | fn.Fn
				DisableValueTrimming?: bool | fn.Fn
				Header?:               [...(string | fn.Fn)] | (string | fn.Fn)
				Name?:                 string | fn.Fn
				QuoteSymbol?:          string | fn.Fn
			}) | fn.If
			GrokClassifier?: close({
				Classification:  string | fn.Fn
				CustomPatterns?: string | fn.Fn
				GrokPattern:     string | fn.Fn
				Name?:           string | fn.Fn
			}) | fn.If
			JsonClassifier?: close({
				JsonPath: string | fn.Fn
				Name?:    string | fn.Fn
			}) | fn.If
			XMLClassifier?: close({
				Classification: string | fn.Fn
				Name?:          string | fn.Fn
				RowTag:         string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Connection :: {
		Type:       "AWS::Glue::Connection"
		Properties: close({
			CatalogId:       string | fn.Fn
			ConnectionInput: close({
				ConnectionProperties: {
					[string]: _
				} | fn.Fn
				ConnectionType:                  ("JDBC" | "SFTP") | fn.Fn
				Description?:                    string | fn.Fn
				MatchCriteria?:                  [...(string | fn.Fn)] | (string | fn.Fn)
				Name?:                           string | fn.Fn
				PhysicalConnectionRequirements?: close({
					AvailabilityZone?:    string | fn.Fn
					SecurityGroupIdList?: [...(string | fn.Fn)] | (string | fn.Fn)
					SubnetId?:            string | fn.Fn
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Crawler :: {
		Type:       "AWS::Glue::Crawler"
		Properties: close({
			Classifiers?:                  [...(string | fn.Fn)] | (string | fn.Fn)
			Configuration?:                string | fn.Fn
			CrawlerSecurityConfiguration?: string | fn.Fn
			DatabaseName?:                 string | fn.Fn
			Description?:                  string | fn.Fn
			Name?:                         string | fn.Fn
			Role:                          string | fn.Fn
			Schedule?:                     close({
				ScheduleExpression?: string | fn.Fn
			}) | fn.If
			SchemaChangePolicy?: close({
				DeleteBehavior?: ("DELETE_FROM_DATABASE" | "DEPRECATE_IN_DATABASE" | "LOG") | fn.Fn
				UpdateBehavior?: ("LOG" | "UPDATE_IN_DATABASE") | fn.Fn
			}) | fn.If
			TablePrefix?: string | fn.Fn
			Tags?:        {
				[string]: _
			} | fn.Fn
			Targets: close({
				CatalogTargets?: [...close({
					DatabaseName?: string | fn.Fn
					Tables?:       [...(string | fn.Fn)] | (string | fn.Fn)
				})] | fn.If
				DynamoDBTargets?: [...close({
					Path?: string | fn.Fn
				})] | fn.If
				JdbcTargets?: [...close({
					ConnectionName?: string | fn.Fn
					Exclusions?:     [...(string | fn.Fn)] | (string | fn.Fn)
					Path?:           string | fn.Fn
				})] | fn.If
				S3Targets?: [...close({
					Exclusions?: [...(string | fn.Fn)] | (string | fn.Fn)
					Path?:       string | fn.Fn
				})] | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DataCatalogEncryptionSettings :: {
		Type:       "AWS::Glue::DataCatalogEncryptionSettings"
		Properties: close({
			CatalogId:                     string | fn.Fn
			DataCatalogEncryptionSettings: close({
				ConnectionPasswordEncryption?: close({
					KmsKeyId?:                          string | fn.Fn
					ReturnConnectionPasswordEncrypted?: bool | fn.Fn
				}) | fn.If
				EncryptionAtRest?: close({
					CatalogEncryptionMode?: string | fn.Fn
					SseAwsKmsKeyId?:        string | fn.Fn
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Database :: {
		Type:       "AWS::Glue::Database"
		Properties: close({
			CatalogId:     string | fn.Fn
			DatabaseInput: close({
				Description?: string | fn.Fn
				LocationUri?: string | fn.Fn
				Name?:        string | fn.Fn
				Parameters?:  {
					[string]: _
				} | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DevEndpoint :: {
		Type:       "AWS::Glue::DevEndpoint"
		Properties: close({
			Arguments?: {
				[string]: _
			} | fn.Fn
			EndpointName?:          string | fn.Fn
			ExtraJarsS3Path?:       string | fn.Fn
			ExtraPythonLibsS3Path?: string | fn.Fn
			GlueVersion?:           string | fn.Fn
			NumberOfNodes?:         int | fn.Fn
			NumberOfWorkers?:       int | fn.Fn
			PublicKey?:             string | fn.Fn
			PublicKeys?:            [...(string | fn.Fn)] | (string | fn.Fn)
			RoleArn:                string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			SecurityGroupIds?:      [...(string | fn.Fn)] | (string | fn.Fn)
			SubnetId?:              string | fn.Fn
			Tags?:                  {
				[string]: _
			} | fn.Fn
			WorkerType?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Job :: {
		Type:       "AWS::Glue::Job"
		Properties: close({
			AllocatedCapacity?: number | fn.Fn
			Command:            close({
				Name?:           string | fn.Fn
				PythonVersion?:  string | fn.Fn
				ScriptLocation?: string | fn.Fn
			}) | fn.If
			Connections?: close({
				Connections?: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			DefaultArguments?: {
				[string]: _
			} | fn.Fn
			Description?:       string | fn.Fn
			ExecutionProperty?: close({
				MaxConcurrentRuns?: number | fn.Fn
			}) | fn.If
			GlueVersion?:          string | fn.Fn
			LogUri?:               string | fn.Fn
			MaxCapacity?:          number | fn.Fn
			MaxRetries?:           number | fn.Fn
			Name?:                 string | fn.Fn
			NotificationProperty?: close({
				NotifyDelayAfter?: int | fn.Fn
			}) | fn.If
			NumberOfWorkers?:       (>=0 & <=299) | fn.Fn
			Role:                   string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			Tags?:                  {
				[string]: _
			} | fn.Fn
			Timeout?:    int | fn.Fn
			WorkerType?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MLTransform :: {
		Type:       "AWS::Glue::MLTransform"
		Properties: close({
			Description?:      string | fn.Fn
			GlueVersion?:      string | fn.Fn
			InputRecordTables: close({
				GlueTables?: [...close({
					CatalogId?:      string | fn.Fn
					ConnectionName?: string | fn.Fn
					DatabaseName:    string | fn.Fn
					TableName:       string | fn.Fn
				})] | fn.If
			}) | fn.If
			MaxCapacity?:     (>=1 & <=100) | fn.Fn
			MaxRetries?:      int | fn.Fn
			Name?:            string | fn.Fn
			NumberOfWorkers?: int | fn.Fn
			Role:             string | fn.Fn
			Tags?:            {
				[string]: _
			} | fn.Fn
			Timeout?:            int | fn.Fn
			TransformParameters: close({
				FindMatchesParameters?: close({
					AccuracyCostTradeoff?:    number | fn.Fn
					EnforceProvidedLabels?:   bool | fn.Fn
					PrecisionRecallTradeoff?: number | fn.Fn
					PrimaryKeyColumnName:     string | fn.Fn
				}) | fn.If
				TransformType: string | fn.Fn
			}) | fn.If
			WorkerType?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Partition :: {
		Type:       "AWS::Glue::Partition"
		Properties: close({
			CatalogId:      string | fn.Fn
			DatabaseName:   string | fn.Fn
			PartitionInput: close({
				Parameters?: {
					[string]: _
				} | fn.Fn
				StorageDescriptor?: close({
					BucketColumns?: [...(string | fn.Fn)] | (string | fn.Fn)
					Columns?:       [...close({
						Comment?: string | fn.Fn
						Name:     string | fn.Fn
						Type?:    string | fn.Fn
					})] | fn.If
					Compressed?:      bool | fn.Fn
					InputFormat?:     string | fn.Fn
					Location?:        string | fn.Fn
					NumberOfBuckets?: int | fn.Fn
					OutputFormat?:    string | fn.Fn
					Parameters?:      {
						[string]: _
					} | fn.Fn
					SerdeInfo?: close({
						Name?:       string | fn.Fn
						Parameters?: {
							[string]: _
						} | fn.Fn
						SerializationLibrary?: string | fn.Fn
					}) | fn.If
					SkewedInfo?: close({
						SkewedColumnNames?:             [...(string | fn.Fn)] | (string | fn.Fn)
						SkewedColumnValueLocationMaps?: {
							[string]: _
						} | fn.Fn
						SkewedColumnValues?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					SortColumns?: [...close({
						Column:     string | fn.Fn
						SortOrder?: int | fn.Fn
					})] | fn.If
					StoredAsSubDirectories?: bool | fn.Fn
				}) | fn.If
				Values: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			TableName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SecurityConfiguration :: {
		Type:       "AWS::Glue::SecurityConfiguration"
		Properties: close({
			EncryptionConfiguration: close({
				CloudWatchEncryption?: close({
					CloudWatchEncryptionMode?: string | fn.Fn
					KmsKeyArn?:                string | fn.Fn
				}) | fn.If
				JobBookmarksEncryption?: close({
					JobBookmarksEncryptionMode?: string | fn.Fn
					KmsKeyArn?:                  string | fn.Fn
				}) | fn.If
				S3Encryptions?: [...close({
					KmsKeyArn?:        string | fn.Fn
					S3EncryptionMode?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			Name: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Table :: {
		Type:       "AWS::Glue::Table"
		Properties: close({
			CatalogId:    string | fn.Fn
			DatabaseName: string | fn.Fn
			TableInput:   close({
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				Owner?:       string | fn.Fn
				Parameters?:  {
					[string]: _
				} | fn.Fn
				PartitionKeys?: [...close({
					Comment?: string | fn.Fn
					Name:     string | fn.Fn
					Type?:    string | fn.Fn
				})] | fn.If
				Retention?:         int | fn.Fn
				StorageDescriptor?: close({
					BucketColumns?: [...(string | fn.Fn)] | (string | fn.Fn)
					Columns?:       [...close({
						Comment?: string | fn.Fn
						Name:     string | fn.Fn
						Type?:    string | fn.Fn
					})] | fn.If
					Compressed?:      bool | fn.Fn
					InputFormat?:     string | fn.Fn
					Location?:        string | fn.Fn
					NumberOfBuckets?: int | fn.Fn
					OutputFormat?:    string | fn.Fn
					Parameters?:      {
						[string]: _
					} | fn.Fn
					SerdeInfo?: close({
						Name?:       string | fn.Fn
						Parameters?: {
							[string]: _
						} | fn.Fn
						SerializationLibrary?: string | fn.Fn
					}) | fn.If
					SkewedInfo?: close({
						SkewedColumnNames?:             [...(string | fn.Fn)] | (string | fn.Fn)
						SkewedColumnValueLocationMaps?: {
							[string]: _
						} | fn.Fn
						SkewedColumnValues?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					SortColumns?: [...close({
						Column:    string | fn.Fn
						SortOrder: int | fn.Fn
					})] | fn.If
					StoredAsSubDirectories?: bool | fn.Fn
				}) | fn.If
				TableType?:        ("EXTERNAL_TABLE" | "VIRTUAL_VIEW") | fn.Fn
				ViewExpandedText?: string | fn.Fn
				ViewOriginalText?: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Trigger :: {
		Type:       "AWS::Glue::Trigger"
		Properties: close({
			Actions: [...close({
				Arguments?: {
					[string]: _
				} | fn.Fn
				CrawlerName?:          string | fn.Fn
				JobName?:              string | fn.Fn
				NotificationProperty?: close({
					NotifyDelayAfter?: int | fn.Fn
				}) | fn.If
				SecurityConfiguration?: string | fn.Fn
				Timeout?:               int | fn.Fn
			})] | fn.If
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Predicate?:   close({
				Conditions?: [...close({
					CrawlState?:      string | fn.Fn
					CrawlerName?:     string | fn.Fn
					JobName?:         string | fn.Fn
					LogicalOperator?: ("EQUALS") | fn.Fn
					State?:           ("SUCCEEDED") | fn.Fn
				})] | fn.If
				Logical?: ("AND") | fn.Fn
			}) | fn.If
			Schedule?:        string | fn.Fn
			StartOnCreation?: bool | fn.Fn
			Tags?:            {
				[string]: _
			} | fn.Fn
			Type:          ("CONDITIONAL" | "ON_DEMAND" | "SCHEDULED") | fn.Fn
			WorkflowName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Workflow :: {
		Type:       "AWS::Glue::Workflow"
		Properties: close({
			DefaultRunProperties?: {
				[string]: _
			} | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Tags?:        {
				[string]: _
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

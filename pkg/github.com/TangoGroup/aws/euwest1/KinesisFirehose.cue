package euwest1

import "github.com/TangoGroup/aws/fn"

#KinesisFirehose: {
	#DeliveryStream: {
		Type: "AWS::KinesisFirehose::DeliveryStream"
		Properties: {
			DeliveryStreamEncryptionConfigurationInput?: {
				KeyARN?: string | fn.#Fn
				KeyType: string | fn.#Fn
			} | fn.If
			DeliveryStreamName?:                    string | fn.#Fn
			DeliveryStreamType?:                    string | fn.#Fn
			ElasticsearchDestinationConfiguration?: {
				BufferingHints?: {
					IntervalInSeconds?: int | fn.#Fn
					SizeInMBs?:         int | fn.#Fn
				} | fn.If
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.#Fn
					LogGroupName?:  string | fn.#Fn
					LogStreamName?: string | fn.#Fn
				} | fn.If
				ClusterEndpoint?:         string | fn.#Fn
				DomainARN?:               string | fn.#Fn
				IndexName:                string | fn.#Fn
				IndexRotationPeriod?:     string | fn.#Fn
				ProcessingConfiguration?: {
					Enabled?:    bool | fn.#Fn
					Processors?: [...{
						Parameters?: [...{
							ParameterName:  string | fn.#Fn
							ParameterValue: string | fn.#Fn
						}] | fn.If
						Type: string | fn.#Fn
					}] | fn.If
				} | fn.If
				RetryOptions?: {
					DurationInSeconds?: int | fn.#Fn
				} | fn.If
				RoleARN:         string | fn.#Fn
				S3BackupMode?:   string | fn.#Fn
				S3Configuration: {
					BucketARN:       string | fn.#Fn
					BufferingHints?: {
						IntervalInSeconds?: int | fn.#Fn
						SizeInMBs?:         int | fn.#Fn
					} | fn.If
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.#Fn
						LogGroupName?:  string | fn.#Fn
						LogStreamName?: string | fn.#Fn
					} | fn.If
					CompressionFormat?:       string | fn.#Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: {
							AWSKMSKeyARN: string | fn.#Fn
						} | fn.If
						NoEncryptionConfig?: string | fn.#Fn
					} | fn.If
					ErrorOutputPrefix?: string | fn.#Fn
					Prefix?:            string | fn.#Fn
					RoleARN:            string | fn.#Fn
				} | fn.If
				TypeName?:         string | fn.#Fn
				VpcConfiguration?: {
					RoleARN:          string | fn.#Fn
					SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
					SubnetIds:        [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.If
			} | fn.If
			ExtendedS3DestinationConfiguration?: {
				BucketARN:       string | fn.#Fn
				BufferingHints?: {
					IntervalInSeconds?: int | fn.#Fn
					SizeInMBs?:         int | fn.#Fn
				} | fn.If
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.#Fn
					LogGroupName?:  string | fn.#Fn
					LogStreamName?: string | fn.#Fn
				} | fn.If
				CompressionFormat?:                 string | fn.#Fn
				DataFormatConversionConfiguration?: {
					Enabled?:                  bool | fn.#Fn
					InputFormatConfiguration?: {
						Deserializer?: {
							HiveJsonSerDe?: {
								TimestampFormats?: [...(string | fn.#Fn)] | (string | fn.#Fn)
							} | fn.If
							OpenXJsonSerDe?: {
								CaseInsensitive?:         bool | fn.#Fn
								ColumnToJsonKeyMappings?: {
									[string]: string | fn.#Fn
								} | fn.If
								ConvertDotsInJsonKeysToUnderscores?: bool | fn.#Fn
							} | fn.If
						} | fn.If
					} | fn.If
					OutputFormatConfiguration?: {
						Serializer?: {
							OrcSerDe?: {
								BlockSizeBytes?:                      int | fn.#Fn
								BloomFilterColumns?:                  [...(string | fn.#Fn)] | (string | fn.#Fn)
								BloomFilterFalsePositiveProbability?: number | fn.#Fn
								Compression?:                         string | fn.#Fn
								DictionaryKeyThreshold?:              number | fn.#Fn
								EnablePadding?:                       bool | fn.#Fn
								FormatVersion?:                       string | fn.#Fn
								PaddingTolerance?:                    number | fn.#Fn
								RowIndexStride?:                      int | fn.#Fn
								StripeSizeBytes?:                     int | fn.#Fn
							} | fn.If
							ParquetSerDe?: {
								BlockSizeBytes?:              int | fn.#Fn
								Compression?:                 string | fn.#Fn
								EnableDictionaryCompression?: bool | fn.#Fn
								MaxPaddingBytes?:             int | fn.#Fn
								PageSizeBytes?:               int | fn.#Fn
								WriterVersion?:               string | fn.#Fn
							} | fn.If
						} | fn.If
					} | fn.If
					SchemaConfiguration?: {
						CatalogId?:    string | fn.#Fn
						DatabaseName?: string | fn.#Fn
						Region?:       string | fn.#Fn
						RoleARN?:      string | fn.#Fn
						TableName?:    string | fn.#Fn
						VersionId?:    string | fn.#Fn
					} | fn.If
				} | fn.If
				EncryptionConfiguration?: {
					KMSEncryptionConfig?: {
						AWSKMSKeyARN: string | fn.#Fn
					} | fn.If
					NoEncryptionConfig?: string | fn.#Fn
				} | fn.If
				ErrorOutputPrefix?:       string | fn.#Fn
				Prefix?:                  string | fn.#Fn
				ProcessingConfiguration?: {
					Enabled?:    bool | fn.#Fn
					Processors?: [...{
						Parameters?: [...{
							ParameterName:  string | fn.#Fn
							ParameterValue: string | fn.#Fn
						}] | fn.If
						Type: string | fn.#Fn
					}] | fn.If
				} | fn.If
				RoleARN:                string | fn.#Fn
				S3BackupConfiguration?: {
					BucketARN:       string | fn.#Fn
					BufferingHints?: {
						IntervalInSeconds?: int | fn.#Fn
						SizeInMBs?:         int | fn.#Fn
					} | fn.If
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.#Fn
						LogGroupName?:  string | fn.#Fn
						LogStreamName?: string | fn.#Fn
					} | fn.If
					CompressionFormat?:       string | fn.#Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: {
							AWSKMSKeyARN: string | fn.#Fn
						} | fn.If
						NoEncryptionConfig?: string | fn.#Fn
					} | fn.If
					ErrorOutputPrefix?: string | fn.#Fn
					Prefix?:            string | fn.#Fn
					RoleARN:            string | fn.#Fn
				} | fn.If
				S3BackupMode?: string | fn.#Fn
			} | fn.If
			HttpEndpointDestinationConfiguration?: {
				BufferingHints?: {
					IntervalInSeconds?: int | fn.#Fn
					SizeInMBs?:         int | fn.#Fn
				} | fn.If
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.#Fn
					LogGroupName?:  string | fn.#Fn
					LogStreamName?: string | fn.#Fn
				} | fn.If
				EndpointConfiguration: {
					AccessKey?: string | fn.#Fn
					Name?:      string | fn.#Fn
					Url:        string | fn.#Fn
				} | fn.If
				ProcessingConfiguration?: {
					Enabled?:    bool | fn.#Fn
					Processors?: [...{
						Parameters?: [...{
							ParameterName:  string | fn.#Fn
							ParameterValue: string | fn.#Fn
						}] | fn.If
						Type: string | fn.#Fn
					}] | fn.If
				} | fn.If
				RequestConfiguration?: {
					CommonAttributes?: [...{
						AttributeName:  string | fn.#Fn
						AttributeValue: string | fn.#Fn
					}] | fn.If
					ContentEncoding?: string | fn.#Fn
				} | fn.If
				RetryOptions?: {
					DurationInSeconds?: int | fn.#Fn
				} | fn.If
				RoleARN?:        string | fn.#Fn
				S3BackupMode?:   string | fn.#Fn
				S3Configuration: {
					BucketARN:       string | fn.#Fn
					BufferingHints?: {
						IntervalInSeconds?: int | fn.#Fn
						SizeInMBs?:         int | fn.#Fn
					} | fn.If
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.#Fn
						LogGroupName?:  string | fn.#Fn
						LogStreamName?: string | fn.#Fn
					} | fn.If
					CompressionFormat?:       string | fn.#Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: {
							AWSKMSKeyARN: string | fn.#Fn
						} | fn.If
						NoEncryptionConfig?: string | fn.#Fn
					} | fn.If
					ErrorOutputPrefix?: string | fn.#Fn
					Prefix?:            string | fn.#Fn
					RoleARN:            string | fn.#Fn
				} | fn.If
			} | fn.If
			KinesisStreamSourceConfiguration?: {
				KinesisStreamARN: string | fn.#Fn
				RoleARN:          string | fn.#Fn
			} | fn.If
			RedshiftDestinationConfiguration?: {
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.#Fn
					LogGroupName?:  string | fn.#Fn
					LogStreamName?: string | fn.#Fn
				} | fn.If
				ClusterJDBCURL: string | fn.#Fn
				CopyCommand:    {
					CopyOptions?:      string | fn.#Fn
					DataTableColumns?: string | fn.#Fn
					DataTableName:     string | fn.#Fn
				} | fn.If
				Password:                 string | fn.#Fn
				ProcessingConfiguration?: {
					Enabled?:    bool | fn.#Fn
					Processors?: [...{
						Parameters?: [...{
							ParameterName:  string | fn.#Fn
							ParameterValue: string | fn.#Fn
						}] | fn.If
						Type: string | fn.#Fn
					}] | fn.If
				} | fn.If
				RetryOptions?: {
					DurationInSeconds?: int | fn.#Fn
				} | fn.If
				RoleARN:                string | fn.#Fn
				S3BackupConfiguration?: {
					BucketARN:       string | fn.#Fn
					BufferingHints?: {
						IntervalInSeconds?: int | fn.#Fn
						SizeInMBs?:         int | fn.#Fn
					} | fn.If
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.#Fn
						LogGroupName?:  string | fn.#Fn
						LogStreamName?: string | fn.#Fn
					} | fn.If
					CompressionFormat?:       string | fn.#Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: {
							AWSKMSKeyARN: string | fn.#Fn
						} | fn.If
						NoEncryptionConfig?: string | fn.#Fn
					} | fn.If
					ErrorOutputPrefix?: string | fn.#Fn
					Prefix?:            string | fn.#Fn
					RoleARN:            string | fn.#Fn
				} | fn.If
				S3BackupMode?:   string | fn.#Fn
				S3Configuration: {
					BucketARN:       string | fn.#Fn
					BufferingHints?: {
						IntervalInSeconds?: int | fn.#Fn
						SizeInMBs?:         int | fn.#Fn
					} | fn.If
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.#Fn
						LogGroupName?:  string | fn.#Fn
						LogStreamName?: string | fn.#Fn
					} | fn.If
					CompressionFormat?:       string | fn.#Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: {
							AWSKMSKeyARN: string | fn.#Fn
						} | fn.If
						NoEncryptionConfig?: string | fn.#Fn
					} | fn.If
					ErrorOutputPrefix?: string | fn.#Fn
					Prefix?:            string | fn.#Fn
					RoleARN:            string | fn.#Fn
				} | fn.If
				Username: string | fn.#Fn
			} | fn.If
			S3DestinationConfiguration?: {
				BucketARN:       string | fn.#Fn
				BufferingHints?: {
					IntervalInSeconds?: int | fn.#Fn
					SizeInMBs?:         int | fn.#Fn
				} | fn.If
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.#Fn
					LogGroupName?:  string | fn.#Fn
					LogStreamName?: string | fn.#Fn
				} | fn.If
				CompressionFormat?:       string | fn.#Fn
				EncryptionConfiguration?: {
					KMSEncryptionConfig?: {
						AWSKMSKeyARN: string | fn.#Fn
					} | fn.If
					NoEncryptionConfig?: string | fn.#Fn
				} | fn.If
				ErrorOutputPrefix?: string | fn.#Fn
				Prefix?:            string | fn.#Fn
				RoleARN:            string | fn.#Fn
			} | fn.If
			SplunkDestinationConfiguration?: {
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.#Fn
					LogGroupName?:  string | fn.#Fn
					LogStreamName?: string | fn.#Fn
				} | fn.If
				HECAcknowledgmentTimeoutInSeconds?: int | fn.#Fn
				HECEndpoint:                        string | fn.#Fn
				HECEndpointType:                    string | fn.#Fn
				HECToken:                           string | fn.#Fn
				ProcessingConfiguration?:           {
					Enabled?:    bool | fn.#Fn
					Processors?: [...{
						Parameters?: [...{
							ParameterName:  string | fn.#Fn
							ParameterValue: string | fn.#Fn
						}] | fn.If
						Type: string | fn.#Fn
					}] | fn.If
				} | fn.If
				RetryOptions?: {
					DurationInSeconds?: int | fn.#Fn
				} | fn.If
				S3BackupMode?:   string | fn.#Fn
				S3Configuration: {
					BucketARN:       string | fn.#Fn
					BufferingHints?: {
						IntervalInSeconds?: int | fn.#Fn
						SizeInMBs?:         int | fn.#Fn
					} | fn.If
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.#Fn
						LogGroupName?:  string | fn.#Fn
						LogStreamName?: string | fn.#Fn
					} | fn.If
					CompressionFormat?:       string | fn.#Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: {
							AWSKMSKeyARN: string | fn.#Fn
						} | fn.If
						NoEncryptionConfig?: string | fn.#Fn
					} | fn.If
					ErrorOutputPrefix?: string | fn.#Fn
					Prefix?:            string | fn.#Fn
					RoleARN:            string | fn.#Fn
				} | fn.If
			} | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

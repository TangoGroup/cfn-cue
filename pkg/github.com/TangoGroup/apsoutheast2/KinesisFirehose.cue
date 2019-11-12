package apsoutheast2

import "github.com/TangoGroup/fn"

KinesisFirehose :: {
	DeliveryStream :: {
		Type: "AWS::KinesisFirehose::DeliveryStream"
		Properties: {
			DeliveryStreamName?: string | fn.Fn
			DeliveryStreamType?: string | fn.Fn
			ElasticsearchDestinationConfiguration?: {
				BufferingHints: {
					IntervalInSeconds: int | fn.Fn
					SizeInMBs:         int | fn.Fn
				}
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}
				DomainARN:           string | fn.Fn
				IndexName:           string | fn.Fn
				IndexRotationPeriod: string | fn.Fn
				ProcessingConfiguration?: {
					Enabled?: bool | fn.Fn
					Processors?: [...{
						Parameters: [...{
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						}]
						Type: string | fn.Fn
					}]
				}
				RetryOptions: DurationInSeconds: int | fn.Fn
				RoleARN:      string | fn.Fn
				S3BackupMode: string | fn.Fn
				S3Configuration: {
					BucketARN: string | fn.Fn
					BufferingHints: {
						IntervalInSeconds: int | fn.Fn
						SizeInMBs:         int | fn.Fn
					}
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					CompressionFormat: string | fn.Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
						NoEncryptionConfig?: string | fn.Fn
					}
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}
				TypeName: string | fn.Fn
			}
			ExtendedS3DestinationConfiguration?: {
				BucketARN: string | fn.Fn
				BufferingHints: {
					IntervalInSeconds: int | fn.Fn
					SizeInMBs:         int | fn.Fn
				}
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}
				CompressionFormat: string | fn.Fn
				DataFormatConversionConfiguration?: {
					Enabled: bool | fn.Fn
					InputFormatConfiguration: Deserializer: {
						HiveJsonSerDe?: TimestampFormats?: [...(string | fn.Fn)]
						OpenXJsonSerDe?: {
							CaseInsensitive?: bool | fn.Fn
							ColumnToJsonKeyMappings?: [string]: string | fn.Fn
							ConvertDotsInJsonKeysToUnderscores?: bool | fn.Fn
						}
					}
					OutputFormatConfiguration: Serializer: {
						OrcSerDe?: {
							BlockSizeBytes?: int | fn.Fn
							BloomFilterColumns?: [...(string | fn.Fn)]
							BloomFilterFalsePositiveProbability?: float | fn.Fn
							Compression?:                         string | fn.Fn
							DictionaryKeyThreshold?:              float | fn.Fn
							EnablePadding?:                       bool | fn.Fn
							FormatVersion?:                       string | fn.Fn
							PaddingTolerance?:                    float | fn.Fn
							RowIndexStride?:                      int | fn.Fn
							StripeSizeBytes?:                     int | fn.Fn
						}
						ParquetSerDe?: {
							BlockSizeBytes?:              int | fn.Fn
							Compression?:                 string | fn.Fn
							EnableDictionaryCompression?: bool | fn.Fn
							MaxPaddingBytes?:             int | fn.Fn
							PageSizeBytes?:               int | fn.Fn
							WriterVersion?:               string | fn.Fn
						}
					}
					SchemaConfiguration: {
						CatalogId:    string | fn.Fn
						DatabaseName: string | fn.Fn
						Region:       string | fn.Fn
						RoleARN:      string | fn.Fn
						TableName:    string | fn.Fn
						VersionId:    string | fn.Fn
					}
				}
				EncryptionConfiguration?: {
					KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
					NoEncryptionConfig?: string | fn.Fn
				}
				ErrorOutputPrefix?: string | fn.Fn
				Prefix?:            string | fn.Fn
				ProcessingConfiguration?: {
					Enabled?: bool | fn.Fn
					Processors?: [...{
						Parameters: [...{
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						}]
						Type: string | fn.Fn
					}]
				}
				RoleARN: string | fn.Fn
				S3BackupConfiguration?: {
					BucketARN: string | fn.Fn
					BufferingHints: {
						IntervalInSeconds: int | fn.Fn
						SizeInMBs:         int | fn.Fn
					}
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					CompressionFormat: string | fn.Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
						NoEncryptionConfig?: string | fn.Fn
					}
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}
				S3BackupMode?: string | fn.Fn
			}
			KinesisStreamSourceConfiguration?: {
				KinesisStreamARN: string | fn.Fn
				RoleARN:          string | fn.Fn
			}
			RedshiftDestinationConfiguration?: {
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}
				ClusterJDBCURL: string | fn.Fn
				CopyCommand: {
					CopyOptions?:      string | fn.Fn
					DataTableColumns?: string | fn.Fn
					DataTableName:     string | fn.Fn
				}
				Password: string | fn.Fn
				ProcessingConfiguration?: {
					Enabled?: bool | fn.Fn
					Processors?: [...{
						Parameters: [...{
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						}]
						Type: string | fn.Fn
					}]
				}
				RoleARN: string | fn.Fn
				S3Configuration: {
					BucketARN: string | fn.Fn
					BufferingHints: {
						IntervalInSeconds: int | fn.Fn
						SizeInMBs:         int | fn.Fn
					}
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					CompressionFormat: string | fn.Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
						NoEncryptionConfig?: string | fn.Fn
					}
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}
				Username: string | fn.Fn
			}
			S3DestinationConfiguration?: {
				BucketARN: string | fn.Fn
				BufferingHints: {
					IntervalInSeconds: int | fn.Fn
					SizeInMBs:         int | fn.Fn
				}
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}
				CompressionFormat: string | fn.Fn
				EncryptionConfiguration?: {
					KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
					NoEncryptionConfig?: string | fn.Fn
				}
				ErrorOutputPrefix?: string | fn.Fn
				Prefix?:            string | fn.Fn
				RoleARN:            string | fn.Fn
			}
			SplunkDestinationConfiguration?: {
				CloudWatchLoggingOptions?: {
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}
				HECAcknowledgmentTimeoutInSeconds?: int | fn.Fn
				HECEndpoint:                        string | fn.Fn
				HECEndpointType:                    string | fn.Fn
				HECToken:                           string | fn.Fn
				ProcessingConfiguration?: {
					Enabled?: bool | fn.Fn
					Processors?: [...{
						Parameters: [...{
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						}]
						Type: string | fn.Fn
					}]
				}
				RetryOptions?: DurationInSeconds: int | fn.Fn
				S3BackupMode?: string | fn.Fn
				S3Configuration: {
					BucketARN: string | fn.Fn
					BufferingHints: {
						IntervalInSeconds: int | fn.Fn
						SizeInMBs:         int | fn.Fn
					}
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					CompressionFormat: string | fn.Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
						NoEncryptionConfig?: string | fn.Fn
					}
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}
			}
		}
	}
}

package apsoutheast2

import "github.com/TangoGroup/aws/fn"

KinesisFirehose :: {
	DeliveryStream :: {
		Type:       "AWS::KinesisFirehose::DeliveryStream"
		Properties: close({
			DeliveryStreamEncryptionConfigurationInput?: close({
				KeyARN?: string | fn.Fn
				KeyType: string | fn.Fn
			}) | fn.If
			DeliveryStreamName?:                    string | fn.Fn
			DeliveryStreamType?:                    string | fn.Fn
			ElasticsearchDestinationConfiguration?: close({
				BufferingHints?: close({
					IntervalInSeconds?: int | fn.Fn
					SizeInMBs?:         int | fn.Fn
				}) | fn.If
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				ClusterEndpoint?:         string | fn.Fn
				DomainARN?:               string | fn.Fn
				IndexName:                string | fn.Fn
				IndexRotationPeriod?:     string | fn.Fn
				ProcessingConfiguration?: close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: string | fn.Fn
					})] | fn.If
				}) | fn.If
				RetryOptions?: close({
					DurationInSeconds?: int | fn.Fn
				}) | fn.If
				RoleARN:         string | fn.Fn
				S3BackupMode?:   string | fn.Fn
				S3Configuration: close({
					BucketARN:       string | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       string | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: string | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}) | fn.If
				TypeName?:         string | fn.Fn
				VpcConfiguration?: close({
					RoleARN:          string | fn.Fn
					SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
					SubnetIds:        [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
			}) | fn.If
			ExtendedS3DestinationConfiguration?: close({
				BucketARN:       string | fn.Fn
				BufferingHints?: close({
					IntervalInSeconds?: int | fn.Fn
					SizeInMBs?:         int | fn.Fn
				}) | fn.If
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				CompressionFormat?:                 string | fn.Fn
				DataFormatConversionConfiguration?: close({
					Enabled?:                  bool | fn.Fn
					InputFormatConfiguration?: close({
						Deserializer?: close({
							HiveJsonSerDe?: close({
								TimestampFormats?: [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							OpenXJsonSerDe?: close({
								CaseInsensitive?:         bool | fn.Fn
								ColumnToJsonKeyMappings?: {
									[string]: string | fn.Fn
								} | fn.If
								ConvertDotsInJsonKeysToUnderscores?: bool | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					OutputFormatConfiguration?: close({
						Serializer?: close({
							OrcSerDe?: close({
								BlockSizeBytes?:                      int | fn.Fn
								BloomFilterColumns?:                  [...(string | fn.Fn)] | (string | fn.Fn)
								BloomFilterFalsePositiveProbability?: number | fn.Fn
								Compression?:                         string | fn.Fn
								DictionaryKeyThreshold?:              number | fn.Fn
								EnablePadding?:                       bool | fn.Fn
								FormatVersion?:                       string | fn.Fn
								PaddingTolerance?:                    number | fn.Fn
								RowIndexStride?:                      int | fn.Fn
								StripeSizeBytes?:                     int | fn.Fn
							}) | fn.If
							ParquetSerDe?: close({
								BlockSizeBytes?:              int | fn.Fn
								Compression?:                 string | fn.Fn
								EnableDictionaryCompression?: bool | fn.Fn
								MaxPaddingBytes?:             int | fn.Fn
								PageSizeBytes?:               int | fn.Fn
								WriterVersion?:               string | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					SchemaConfiguration?: close({
						CatalogId?:    string | fn.Fn
						DatabaseName?: string | fn.Fn
						Region?:       string | fn.Fn
						RoleARN?:      string | fn.Fn
						TableName?:    string | fn.Fn
						VersionId?:    string | fn.Fn
					}) | fn.If
				}) | fn.If
				EncryptionConfiguration?: close({
					KMSEncryptionConfig?: close({
						AWSKMSKeyARN: string | fn.Fn
					}) | fn.If
					NoEncryptionConfig?: string | fn.Fn
				}) | fn.If
				ErrorOutputPrefix?:       string | fn.Fn
				Prefix?:                  string | fn.Fn
				ProcessingConfiguration?: close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: string | fn.Fn
					})] | fn.If
				}) | fn.If
				RoleARN:                string | fn.Fn
				S3BackupConfiguration?: close({
					BucketARN:       string | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       string | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: string | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}) | fn.If
				S3BackupMode?: string | fn.Fn
			}) | fn.If
			HttpEndpointDestinationConfiguration?: close({
				BufferingHints?: close({
					IntervalInSeconds?: int | fn.Fn
					SizeInMBs?:         int | fn.Fn
				}) | fn.If
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				EndpointConfiguration: close({
					AccessKey?: string | fn.Fn
					Name?:      string | fn.Fn
					Url:        string | fn.Fn
				}) | fn.If
				ProcessingConfiguration?: close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: string | fn.Fn
					})] | fn.If
				}) | fn.If
				RequestConfiguration?: close({
					CommonAttributes?: [...close({
						AttributeName:  string | fn.Fn
						AttributeValue: string | fn.Fn
					})] | fn.If
					ContentEncoding?: string | fn.Fn
				}) | fn.If
				RetryOptions?: close({
					DurationInSeconds?: int | fn.Fn
				}) | fn.If
				RoleARN?:        string | fn.Fn
				S3BackupMode?:   string | fn.Fn
				S3Configuration: close({
					BucketARN:       string | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       string | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: string | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}) | fn.If
			}) | fn.If
			KinesisStreamSourceConfiguration?: close({
				KinesisStreamARN: string | fn.Fn
				RoleARN:          string | fn.Fn
			}) | fn.If
			RedshiftDestinationConfiguration?: close({
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				ClusterJDBCURL: string | fn.Fn
				CopyCommand:    close({
					CopyOptions?:      string | fn.Fn
					DataTableColumns?: string | fn.Fn
					DataTableName:     string | fn.Fn
				}) | fn.If
				Password:                 string | fn.Fn
				ProcessingConfiguration?: close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: string | fn.Fn
					})] | fn.If
				}) | fn.If
				RetryOptions?: close({
					DurationInSeconds?: int | fn.Fn
				}) | fn.If
				RoleARN:                string | fn.Fn
				S3BackupConfiguration?: close({
					BucketARN:       string | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       string | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: string | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}) | fn.If
				S3BackupMode?:   string | fn.Fn
				S3Configuration: close({
					BucketARN:       string | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       string | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: string | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}) | fn.If
				Username: string | fn.Fn
			}) | fn.If
			S3DestinationConfiguration?: close({
				BucketARN:       string | fn.Fn
				BufferingHints?: close({
					IntervalInSeconds?: int | fn.Fn
					SizeInMBs?:         int | fn.Fn
				}) | fn.If
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				CompressionFormat?:       string | fn.Fn
				EncryptionConfiguration?: close({
					KMSEncryptionConfig?: close({
						AWSKMSKeyARN: string | fn.Fn
					}) | fn.If
					NoEncryptionConfig?: string | fn.Fn
				}) | fn.If
				ErrorOutputPrefix?: string | fn.Fn
				Prefix?:            string | fn.Fn
				RoleARN:            string | fn.Fn
			}) | fn.If
			SplunkDestinationConfiguration?: close({
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				HECAcknowledgmentTimeoutInSeconds?: int | fn.Fn
				HECEndpoint:                        string | fn.Fn
				HECEndpointType:                    string | fn.Fn
				HECToken:                           string | fn.Fn
				ProcessingConfiguration?:           close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: string | fn.Fn
					})] | fn.If
				}) | fn.If
				RetryOptions?: close({
					DurationInSeconds?: int | fn.Fn
				}) | fn.If
				S3BackupMode?:   string | fn.Fn
				S3Configuration: close({
					BucketARN:       string | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       string | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: string | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}) | fn.If
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

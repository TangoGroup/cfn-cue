package apnortheast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

KinesisFirehose :: {
	DeliveryStream :: {
		Type:       "AWS::KinesisFirehose::DeliveryStream"
		Properties: close({
			DeliveryStreamEncryptionConfigurationInput?: close({
				KeyARN?: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				KeyType: ("AWS_OWNED_CMK" | "CUSTOMER_MANAGED_CMK") | fn.Fn
			}) | fn.If
			DeliveryStreamName?:                    (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"[a-zA-Z0-9._-]+"#)) | fn.Fn
			DeliveryStreamType?:                    ("DirectPut" | "KinesisStreamAsSource") | fn.Fn
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
				ClusterEndpoint?:         (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"https:.*"#)) | fn.Fn
				DomainARN?:               (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				IndexName:                (strings.MinRunes(1) & strings.MaxRunes(80)) | fn.Fn
				IndexRotationPeriod?:     ("NoRotation" | "OneHour" | "OneDay" | "OneWeek" | "OneMonth") | fn.Fn
				ProcessingConfiguration?: close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: ("Lambda") | fn.Fn
					})] | fn.If
				}) | fn.If
				RetryOptions?: close({
					DurationInSeconds?: int | fn.Fn
				}) | fn.If
				RoleARN:         (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				S3BackupMode?:   ("FailedDocumentsOnly" | "AllDocuments") | fn.Fn
				S3Configuration: close({
					BucketARN:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"arn:.*"#)) | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       ("UNCOMPRESSED" | "GZIP" | "ZIP" | "Snappy" | "HADOOP_SNAPPY") | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: ("NoEncryption") | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				}) | fn.If
				TypeName?:         string | fn.Fn
				VpcConfiguration?: close({
					RoleARN:          (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
					SecurityGroupIds: [...((strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn)
					SubnetIds:        [...((strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn)
				}) | fn.If
			}) | fn.If
			ExtendedS3DestinationConfiguration?: close({
				BucketARN:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"arn:.*"#)) | fn.Fn
				BufferingHints?: close({
					IntervalInSeconds?: int | fn.Fn
					SizeInMBs?:         int | fn.Fn
				}) | fn.If
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				CompressionFormat?:                 ("UNCOMPRESSED" | "GZIP" | "ZIP" | "Snappy" | "HADOOP_SNAPPY") | fn.Fn
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
						RoleARN?:      (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
						TableName?:    string | fn.Fn
						VersionId?:    string | fn.Fn
					}) | fn.If
				}) | fn.If
				EncryptionConfiguration?: close({
					KMSEncryptionConfig?: close({
						AWSKMSKeyARN: string | fn.Fn
					}) | fn.If
					NoEncryptionConfig?: ("NoEncryption") | fn.Fn
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
						Type: ("Lambda") | fn.Fn
					})] | fn.If
				}) | fn.If
				RoleARN:                (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				S3BackupConfiguration?: close({
					BucketARN:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"arn:.*"#)) | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       ("UNCOMPRESSED" | "GZIP" | "ZIP" | "Snappy" | "HADOOP_SNAPPY") | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: ("NoEncryption") | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				}) | fn.If
				S3BackupMode?: ("Disabled" | "Enabled") | fn.Fn
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
					Name?:      (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
					Url:        (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
				}) | fn.If
				ProcessingConfiguration?: close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: ("Lambda") | fn.Fn
					})] | fn.If
				}) | fn.If
				RequestConfiguration?: close({
					CommonAttributes?: [...close({
						AttributeName:  (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
						AttributeValue: string | fn.Fn
					})] | fn.If
					ContentEncoding?: ("NONE" | "GZIP") | fn.Fn
				}) | fn.If
				RetryOptions?: close({
					DurationInSeconds?: int | fn.Fn
				}) | fn.If
				RoleARN?:        (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				S3BackupMode?:   string | fn.Fn
				S3Configuration: close({
					BucketARN:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"arn:.*"#)) | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       ("UNCOMPRESSED" | "GZIP" | "ZIP" | "Snappy" | "HADOOP_SNAPPY") | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: ("NoEncryption") | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				}) | fn.If
			}) | fn.If
			KinesisStreamSourceConfiguration?: close({
				KinesisStreamARN: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				RoleARN:          (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
			}) | fn.If
			RedshiftDestinationConfiguration?: close({
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				ClusterJDBCURL: (strings.MinRunes(1) & strings.MaxRunes(512)) | fn.Fn
				CopyCommand:    close({
					CopyOptions?:      string | fn.Fn
					DataTableColumns?: string | fn.Fn
					DataTableName:     (strings.MinRunes(1) & strings.MaxRunes(512)) | fn.Fn
				}) | fn.If
				Password:                 (strings.MinRunes(6) & strings.MaxRunes(512)) | fn.Fn
				ProcessingConfiguration?: close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: ("Lambda") | fn.Fn
					})] | fn.If
				}) | fn.If
				RetryOptions?: close({
					DurationInSeconds?: int | fn.Fn
				}) | fn.If
				RoleARN:                (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				S3BackupConfiguration?: close({
					BucketARN:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"arn:.*"#)) | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       ("UNCOMPRESSED" | "GZIP" | "ZIP" | "Snappy" | "HADOOP_SNAPPY") | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: ("NoEncryption") | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				}) | fn.If
				S3BackupMode?:   ("Disabled" | "Enabled") | fn.Fn
				S3Configuration: close({
					BucketARN:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"arn:.*"#)) | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       ("UNCOMPRESSED" | "GZIP" | "ZIP" | "Snappy" | "HADOOP_SNAPPY") | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: ("NoEncryption") | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
				}) | fn.If
				Username: (strings.MinRunes(1) & strings.MaxRunes(512)) | fn.Fn
			}) | fn.If
			S3DestinationConfiguration?: close({
				BucketARN:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"arn:.*"#)) | fn.Fn
				BufferingHints?: close({
					IntervalInSeconds?: int | fn.Fn
					SizeInMBs?:         int | fn.Fn
				}) | fn.If
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				CompressionFormat?:       ("UNCOMPRESSED" | "GZIP" | "ZIP" | "Snappy" | "HADOOP_SNAPPY") | fn.Fn
				EncryptionConfiguration?: close({
					KMSEncryptionConfig?: close({
						AWSKMSKeyARN: string | fn.Fn
					}) | fn.If
					NoEncryptionConfig?: ("NoEncryption") | fn.Fn
				}) | fn.If
				ErrorOutputPrefix?: string | fn.Fn
				Prefix?:            string | fn.Fn
				RoleARN:            (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
			}) | fn.If
			SplunkDestinationConfiguration?: close({
				CloudWatchLoggingOptions?: close({
					Enabled?:       bool | fn.Fn
					LogGroupName?:  string | fn.Fn
					LogStreamName?: string | fn.Fn
				}) | fn.If
				HECAcknowledgmentTimeoutInSeconds?: (>=180 & <=600) | fn.Fn
				HECEndpoint:                        string | fn.Fn
				HECEndpointType:                    ("Raw" | "Event") | fn.Fn
				HECToken:                           string | fn.Fn
				ProcessingConfiguration?:           close({
					Enabled?:    bool | fn.Fn
					Processors?: [...close({
						Parameters?: [...close({
							ParameterName:  string | fn.Fn
							ParameterValue: string | fn.Fn
						})] | fn.If
						Type: ("Lambda") | fn.Fn
					})] | fn.If
				}) | fn.If
				RetryOptions?: close({
					DurationInSeconds?: int | fn.Fn
				}) | fn.If
				S3BackupMode?:   string | fn.Fn
				S3Configuration: close({
					BucketARN:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"arn:.*"#)) | fn.Fn
					BufferingHints?: close({
						IntervalInSeconds?: int | fn.Fn
						SizeInMBs?:         int | fn.Fn
					}) | fn.If
					CloudWatchLoggingOptions?: close({
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}) | fn.If
					CompressionFormat?:       ("UNCOMPRESSED" | "GZIP" | "ZIP" | "Snappy" | "HADOOP_SNAPPY") | fn.Fn
					EncryptionConfiguration?: close({
						KMSEncryptionConfig?: close({
							AWSKMSKeyARN: string | fn.Fn
						}) | fn.If
						NoEncryptionConfig?: ("NoEncryption") | fn.Fn
					}) | fn.If
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"arn:.*"#)) | fn.Fn
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

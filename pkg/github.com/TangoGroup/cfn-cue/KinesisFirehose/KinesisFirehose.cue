package KinesisFirehose

import "github.com/TangoGroup/fn"

DeliveryStream :: {
	Type: "AWS::KinesisFirehose::DeliveryStream"
	Properties: {
		DeliveryStreamName?:                    string | fn.Fn
		DeliveryStreamType?:                    string | fn.Fn
		ElasticsearchDestinationConfiguration?: propElasticsearchDestinationConfiguration
		ExtendedS3DestinationConfiguration?:    propExtendedS3DestinationConfiguration
		KinesisStreamSourceConfiguration?:      propKinesisStreamSourceConfiguration
		RedshiftDestinationConfiguration?:      propRedshiftDestinationConfiguration
		S3DestinationConfiguration?:            propS3DestinationConfiguration
		SplunkDestinationConfiguration?:        propSplunkDestinationConfiguration
	}
	propBufferingHints :: {
		IntervalInSeconds: int | fn.Fn
		SizeInMBs:         int | fn.Fn
	}
	propCloudWatchLoggingOptions :: {
		Enabled?:       bool | fn.Fn
		LogGroupName?:  string | fn.Fn
		LogStreamName?: string | fn.Fn
	}
	propCopyCommand :: {
		CopyOptions?:      string | fn.Fn
		DataTableColumns?: string | fn.Fn
		DataTableName:     string | fn.Fn
	}
	propDataFormatConversionConfiguration :: {
		Enabled:                   bool | fn.Fn
		InputFormatConfiguration:  propInputFormatConfiguration
		OutputFormatConfiguration: propOutputFormatConfiguration
		SchemaConfiguration:       propSchemaConfiguration
	}
	propDeserializer :: {
		HiveJsonSerDe?:  propHiveJsonSerDe
		OpenXJsonSerDe?: propOpenXJsonSerDe
	}
	propElasticsearchBufferingHints :: {
		IntervalInSeconds: int | fn.Fn
		SizeInMBs:         int | fn.Fn
	}
	propElasticsearchDestinationConfiguration :: {
		BufferingHints:            propElasticsearchBufferingHints
		CloudWatchLoggingOptions?: propCloudWatchLoggingOptions
		DomainARN:                 string | fn.Fn
		IndexName:                 string | fn.Fn
		IndexRotationPeriod:       string | fn.Fn
		ProcessingConfiguration?:  propProcessingConfiguration
		RetryOptions:              propElasticsearchRetryOptions
		RoleARN:                   string | fn.Fn
		S3BackupMode:              string | fn.Fn
		S3Configuration:           propS3DestinationConfiguration
		TypeName:                  string | fn.Fn
	}
	propElasticsearchRetryOptions :: {
		DurationInSeconds: int | fn.Fn
	}
	propEncryptionConfiguration :: {
		KMSEncryptionConfig?: propKMSEncryptionConfig
		NoEncryptionConfig?:  string | fn.Fn
	}
	propExtendedS3DestinationConfiguration :: {
		BucketARN:                          string | fn.Fn
		BufferingHints:                     propBufferingHints
		CloudWatchLoggingOptions?:          propCloudWatchLoggingOptions
		CompressionFormat:                  string | fn.Fn
		DataFormatConversionConfiguration?: propDataFormatConversionConfiguration
		EncryptionConfiguration?:           propEncryptionConfiguration
		ErrorOutputPrefix?:                 string | fn.Fn
		Prefix?:                            string | fn.Fn
		ProcessingConfiguration?:           propProcessingConfiguration
		RoleARN:                            string | fn.Fn
		S3BackupConfiguration?:             propS3DestinationConfiguration
		S3BackupMode?:                      string | fn.Fn
	}
	propHiveJsonSerDe :: {
		TimestampFormats?: [...string] | fn.Fn
	}
	propInputFormatConfiguration :: {
		Deserializer: propDeserializer
	}
	propKMSEncryptionConfig :: {
		AWSKMSKeyARN: string | fn.Fn
	}
	propKinesisStreamSourceConfiguration :: {
		KinesisStreamARN: string | fn.Fn
		RoleARN:          string | fn.Fn
	}
	propOpenXJsonSerDe :: {
		CaseInsensitive?: bool | fn.Fn
		ColumnToJsonKeyMappings?: {
		}
		ConvertDotsInJsonKeysToUnderscores?: bool | fn.Fn
	}
	propOrcSerDe :: {
		BlockSizeBytes?:                      int | fn.Fn
		BloomFilterColumns?:                  [...string] | fn.Fn
		BloomFilterFalsePositiveProbability?: float | fn.Fn
		Compression?:                         string | fn.Fn
		DictionaryKeyThreshold?:              float | fn.Fn
		EnablePadding?:                       bool | fn.Fn
		FormatVersion?:                       string | fn.Fn
		PaddingTolerance?:                    float | fn.Fn
		RowIndexStride?:                      int | fn.Fn
		StripeSizeBytes?:                     int | fn.Fn
	}
	propOutputFormatConfiguration :: {
		Serializer: propSerializer
	}
	propParquetSerDe :: {
		BlockSizeBytes?:              int | fn.Fn
		Compression?:                 string | fn.Fn
		EnableDictionaryCompression?: bool | fn.Fn
		MaxPaddingBytes?:             int | fn.Fn
		PageSizeBytes?:               int | fn.Fn
		WriterVersion?:               string | fn.Fn
	}
	propProcessingConfiguration :: {
		Enabled?: bool | fn.Fn
		Processors?: [...propProcessor]
	}
	propProcessor :: {
		Parameters: [...propProcessorParameter]
		Type: string | fn.Fn
	}
	propProcessorParameter :: {
		ParameterName:  string | fn.Fn
		ParameterValue: string | fn.Fn
	}
	propRedshiftDestinationConfiguration :: {
		CloudWatchLoggingOptions?: propCloudWatchLoggingOptions
		ClusterJDBCURL:            string | fn.Fn
		CopyCommand:               propCopyCommand
		Password:                  string | fn.Fn
		ProcessingConfiguration?:  propProcessingConfiguration
		RoleARN:                   string | fn.Fn
		S3Configuration:           propS3DestinationConfiguration
		Username:                  string | fn.Fn
	}
	propS3DestinationConfiguration :: {
		BucketARN:                 string | fn.Fn
		BufferingHints:            propBufferingHints
		CloudWatchLoggingOptions?: propCloudWatchLoggingOptions
		CompressionFormat:         string | fn.Fn
		EncryptionConfiguration?:  propEncryptionConfiguration
		ErrorOutputPrefix?:        string | fn.Fn
		Prefix?:                   string | fn.Fn
		RoleARN:                   string | fn.Fn
	}
	propSchemaConfiguration :: {
		CatalogId:    string | fn.Fn
		DatabaseName: string | fn.Fn
		Region:       string | fn.Fn
		RoleARN:      string | fn.Fn
		TableName:    string | fn.Fn
		VersionId:    string | fn.Fn
	}
	propSerializer :: {
		OrcSerDe?:     propOrcSerDe
		ParquetSerDe?: propParquetSerDe
	}
	propSplunkDestinationConfiguration :: {
		CloudWatchLoggingOptions?:          propCloudWatchLoggingOptions
		HECAcknowledgmentTimeoutInSeconds?: int | fn.Fn
		HECEndpoint:                        string | fn.Fn
		HECEndpointType:                    string | fn.Fn
		HECToken:                           string | fn.Fn
		ProcessingConfiguration?:           propProcessingConfiguration
		RetryOptions?:                      propSplunkRetryOptions
		S3BackupMode?:                      string | fn.Fn
		S3Configuration:                    propS3DestinationConfiguration
	}
	propSplunkRetryOptions :: {
		DurationInSeconds: int | fn.Fn
	}
}

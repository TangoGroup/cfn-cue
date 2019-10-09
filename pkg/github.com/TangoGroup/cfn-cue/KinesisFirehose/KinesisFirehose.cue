package KinesisFirehose

import "github.com/TangoGroup/fn"

DeliveryStream :: {
	Type: "AWS::KinesisFirehose::DeliveryStream"
	Properties: {
		DeliveryStreamName?:                    string | fn.Fn
		DeliveryStreamType?:                    string | fn.Fn
		ElasticsearchDestinationConfiguration?: __ElasticsearchDestinationConfiguration
		ExtendedS3DestinationConfiguration?:    __ExtendedS3DestinationConfiguration
		KinesisStreamSourceConfiguration?:      __KinesisStreamSourceConfiguration
		RedshiftDestinationConfiguration?:      __RedshiftDestinationConfiguration
		S3DestinationConfiguration?:            __S3DestinationConfiguration
		SplunkDestinationConfiguration?:        __SplunkDestinationConfiguration
	}
	__BufferingHints :: {
		IntervalInSeconds: int | fn.Fn
		SizeInMBs:         int | fn.Fn
	}
	__CloudWatchLoggingOptions :: {
		Enabled?:       bool | fn.Fn
		LogGroupName?:  string | fn.Fn
		LogStreamName?: string | fn.Fn
	}
	__CopyCommand :: {
		CopyOptions?:      string | fn.Fn
		DataTableColumns?: string | fn.Fn
		DataTableName:     string | fn.Fn
	}
	__DataFormatConversionConfiguration :: {
		Enabled:                   bool | fn.Fn
		InputFormatConfiguration:  __InputFormatConfiguration
		OutputFormatConfiguration: __OutputFormatConfiguration
		SchemaConfiguration:       __SchemaConfiguration
	}
	__Deserializer :: {
		HiveJsonSerDe?:  __HiveJsonSerDe
		OpenXJsonSerDe?: __OpenXJsonSerDe
	}
	__ElasticsearchBufferingHints :: {
		IntervalInSeconds: int | fn.Fn
		SizeInMBs:         int | fn.Fn
	}
	__ElasticsearchDestinationConfiguration :: {
		BufferingHints:            __ElasticsearchBufferingHints
		CloudWatchLoggingOptions?: __CloudWatchLoggingOptions
		DomainARN:                 string | fn.Fn
		IndexName:                 string | fn.Fn
		IndexRotationPeriod:       string | fn.Fn
		ProcessingConfiguration?:  __ProcessingConfiguration
		RetryOptions:              __ElasticsearchRetryOptions
		RoleARN:                   string | fn.Fn
		S3BackupMode:              string | fn.Fn
		S3Configuration:           __S3DestinationConfiguration
		TypeName:                  string | fn.Fn
	}
	__ElasticsearchRetryOptions :: {
		DurationInSeconds: int | fn.Fn
	}
	__EncryptionConfiguration :: {
		KMSEncryptionConfig?: __KMSEncryptionConfig
		NoEncryptionConfig?:  string | fn.Fn
	}
	__ExtendedS3DestinationConfiguration :: {
		BucketARN:                          string | fn.Fn
		BufferingHints:                     __BufferingHints
		CloudWatchLoggingOptions?:          __CloudWatchLoggingOptions
		CompressionFormat:                  string | fn.Fn
		DataFormatConversionConfiguration?: __DataFormatConversionConfiguration
		EncryptionConfiguration?:           __EncryptionConfiguration
		ErrorOutputPrefix?:                 string | fn.Fn
		Prefix?:                            string | fn.Fn
		ProcessingConfiguration?:           __ProcessingConfiguration
		RoleARN:                            string | fn.Fn
		S3BackupConfiguration?:             __S3DestinationConfiguration
		S3BackupMode?:                      string | fn.Fn
	}
	__HiveJsonSerDe :: {
		TimestampFormats?: [...string] | fn.Fn
	}
	__InputFormatConfiguration :: {
		Deserializer: __Deserializer
	}
	__KMSEncryptionConfig :: {
		AWSKMSKeyARN: string | fn.Fn
	}
	__KinesisStreamSourceConfiguration :: {
		KinesisStreamARN: string | fn.Fn
		RoleARN:          string | fn.Fn
	}
	__OpenXJsonSerDe :: {
		CaseInsensitive?: bool | fn.Fn
		ColumnToJsonKeyMappings?: {
		}
		ConvertDotsInJsonKeysToUnderscores?: bool | fn.Fn
	}
	__OrcSerDe :: {
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
	__OutputFormatConfiguration :: {
		Serializer: __Serializer
	}
	__ParquetSerDe :: {
		BlockSizeBytes?:              int | fn.Fn
		Compression?:                 string | fn.Fn
		EnableDictionaryCompression?: bool | fn.Fn
		MaxPaddingBytes?:             int | fn.Fn
		PageSizeBytes?:               int | fn.Fn
		WriterVersion?:               string | fn.Fn
	}
	__ProcessingConfiguration :: {
		Enabled?: bool | fn.Fn
		Processors?: [...__Processor]
	}
	__Processor :: {
		Parameters: [...__ProcessorParameter]
		Type: string | fn.Fn
	}
	__ProcessorParameter :: {
		ParameterName:  string | fn.Fn
		ParameterValue: string | fn.Fn
	}
	__RedshiftDestinationConfiguration :: {
		CloudWatchLoggingOptions?: __CloudWatchLoggingOptions
		ClusterJDBCURL:            string | fn.Fn
		CopyCommand:               __CopyCommand
		Password:                  string | fn.Fn
		ProcessingConfiguration?:  __ProcessingConfiguration
		RoleARN:                   string | fn.Fn
		S3Configuration:           __S3DestinationConfiguration
		Username:                  string | fn.Fn
	}
	__S3DestinationConfiguration :: {
		BucketARN:                 string | fn.Fn
		BufferingHints:            __BufferingHints
		CloudWatchLoggingOptions?: __CloudWatchLoggingOptions
		CompressionFormat:         string | fn.Fn
		EncryptionConfiguration?:  __EncryptionConfiguration
		ErrorOutputPrefix?:        string | fn.Fn
		Prefix?:                   string | fn.Fn
		RoleARN:                   string | fn.Fn
	}
	__SchemaConfiguration :: {
		CatalogId:    string | fn.Fn
		DatabaseName: string | fn.Fn
		Region:       string | fn.Fn
		RoleARN:      string | fn.Fn
		TableName:    string | fn.Fn
		VersionId:    string | fn.Fn
	}
	__Serializer :: {
		OrcSerDe?:     __OrcSerDe
		ParquetSerDe?: __ParquetSerDe
	}
	__SplunkDestinationConfiguration :: {
		CloudWatchLoggingOptions?:          __CloudWatchLoggingOptions
		HECAcknowledgmentTimeoutInSeconds?: int | fn.Fn
		HECEndpoint:                        string | fn.Fn
		HECEndpointType:                    string | fn.Fn
		HECToken:                           string | fn.Fn
		ProcessingConfiguration?:           __ProcessingConfiguration
		RetryOptions?:                      __SplunkRetryOptions
		S3BackupMode?:                      string | fn.Fn
		S3Configuration:                    __S3DestinationConfiguration
	}
	__SplunkRetryOptions :: {
		DurationInSeconds: int | fn.Fn
	}
}

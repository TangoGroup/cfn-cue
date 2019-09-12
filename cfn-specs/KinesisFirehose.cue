package KinesisFirehose

DeliveryStream :: {
	Type: "AWS::KinesisFirehose::DeliveryStream"
	Properties: {
		DeliveryStreamName?:                    string
		DeliveryStreamType?:                    string
		ElasticsearchDestinationConfiguration?: __ElasticsearchDestinationConfiguration
		ExtendedS3DestinationConfiguration?:    __ExtendedS3DestinationConfiguration
		KinesisStreamSourceConfiguration?:      __KinesisStreamSourceConfiguration
		RedshiftDestinationConfiguration?:      __RedshiftDestinationConfiguration
		S3DestinationConfiguration?:            __S3DestinationConfiguration
		SplunkDestinationConfiguration?:        __SplunkDestinationConfiguration
	}
	__BufferingHints = {
		IntervalInSeconds: int
		SizeInMBs:         int
	}
	__CloudWatchLoggingOptions = {
		Enabled?:       bool
		LogGroupName?:  string
		LogStreamName?: string
	}
	__CopyCommand = {
		CopyOptions?:      string
		DataTableColumns?: string
		DataTableName:     string
	}
	__DataFormatConversionConfiguration = {
		Enabled:                   bool
		InputFormatConfiguration:  __InputFormatConfiguration
		OutputFormatConfiguration: __OutputFormatConfiguration
		SchemaConfiguration:       __SchemaConfiguration
	}
	__Deserializer = {
		HiveJsonSerDe?:  __HiveJsonSerDe
		OpenXJsonSerDe?: __OpenXJsonSerDe
	}
	__ElasticsearchBufferingHints = {
		IntervalInSeconds: int
		SizeInMBs:         int
	}
	__ElasticsearchDestinationConfiguration = {
		BufferingHints:            __ElasticsearchBufferingHints
		CloudWatchLoggingOptions?: __CloudWatchLoggingOptions
		DomainARN:                 string
		IndexName:                 string
		IndexRotationPeriod:       string
		ProcessingConfiguration?:  __ProcessingConfiguration
		RetryOptions:              __ElasticsearchRetryOptions
		RoleARN:                   string
		S3BackupMode:              string
		S3Configuration:           __S3DestinationConfiguration
		TypeName:                  string
	}
	__ElasticsearchRetryOptions = {
		DurationInSeconds: int
	}
	__EncryptionConfiguration = {
		KMSEncryptionConfig?: __KMSEncryptionConfig
		NoEncryptionConfig?:  string
	}
	__ExtendedS3DestinationConfiguration = {
		BucketARN:                          string
		BufferingHints:                     __BufferingHints
		CloudWatchLoggingOptions?:          __CloudWatchLoggingOptions
		CompressionFormat:                  string
		DataFormatConversionConfiguration?: __DataFormatConversionConfiguration
		EncryptionConfiguration?:           __EncryptionConfiguration
		ErrorOutputPrefix?:                 string
		Prefix?:                            string
		ProcessingConfiguration?:           __ProcessingConfiguration
		RoleARN:                            string
		S3BackupConfiguration?:             __S3DestinationConfiguration
		S3BackupMode?:                      string
	}
	__HiveJsonSerDe = {
		TimestampFormats?: [...string]
	}
	__InputFormatConfiguration = {
		Deserializer: __Deserializer
	}
	__KMSEncryptionConfig = {
		AWSKMSKeyARN: string
	}
	__KinesisStreamSourceConfiguration = {
		KinesisStreamARN: string
		RoleARN:          string
	}
	__OpenXJsonSerDe = {
		CaseInsensitive?: bool
		ColumnToJsonKeyMappings?: {
		}
		ConvertDotsInJsonKeysToUnderscores?: bool
	}
	__OrcSerDe = {
		BlockSizeBytes?: int
		BloomFilterColumns?: [...string]
		BloomFilterFalsePositiveProbability?: float
		Compression?:                         string
		DictionaryKeyThreshold?:              float
		EnablePadding?:                       bool
		FormatVersion?:                       string
		PaddingTolerance?:                    float
		RowIndexStride?:                      int
		StripeSizeBytes?:                     int
	}
	__OutputFormatConfiguration = {
		Serializer: __Serializer
	}
	__ParquetSerDe = {
		BlockSizeBytes?:              int
		Compression?:                 string
		EnableDictionaryCompression?: bool
		MaxPaddingBytes?:             int
		PageSizeBytes?:               int
		WriterVersion?:               string
	}
	__ProcessingConfiguration = {
		Enabled?: bool
		Processors?: [...__Processor]
	}
	__Processor = {
		Parameters: [...__ProcessorParameter]
		Type: string
	}
	__ProcessorParameter = {
		ParameterName:  string
		ParameterValue: string
	}
	__RedshiftDestinationConfiguration = {
		CloudWatchLoggingOptions?: __CloudWatchLoggingOptions
		ClusterJDBCURL:            string
		CopyCommand:               __CopyCommand
		Password:                  string
		ProcessingConfiguration?:  __ProcessingConfiguration
		RoleARN:                   string
		S3Configuration:           __S3DestinationConfiguration
		Username:                  string
	}
	__S3DestinationConfiguration = {
		BucketARN:                 string
		BufferingHints:            __BufferingHints
		CloudWatchLoggingOptions?: __CloudWatchLoggingOptions
		CompressionFormat:         string
		EncryptionConfiguration?:  __EncryptionConfiguration
		ErrorOutputPrefix?:        string
		Prefix?:                   string
		RoleARN:                   string
	}
	__SchemaConfiguration = {
		CatalogId:    string
		DatabaseName: string
		Region:       string
		RoleARN:      string
		TableName:    string
		VersionId:    string
	}
	__Serializer = {
		OrcSerDe?:     __OrcSerDe
		ParquetSerDe?: __ParquetSerDe
	}
	__SplunkDestinationConfiguration = {
		CloudWatchLoggingOptions?:          __CloudWatchLoggingOptions
		HECAcknowledgmentTimeoutInSeconds?: int
		HECEndpoint:                        string
		HECEndpointType:                    string
		HECToken:                           string
		ProcessingConfiguration?:           __ProcessingConfiguration
		RetryOptions?:                      __SplunkRetryOptions
		S3BackupMode?:                      string
		S3Configuration:                    __S3DestinationConfiguration
	}
	__SplunkRetryOptions = {
		DurationInSeconds: int
	}
}

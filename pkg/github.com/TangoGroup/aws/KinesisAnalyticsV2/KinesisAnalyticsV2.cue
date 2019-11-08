package KinesisAnalyticsV2

import "github.com/TangoGroup/fn"

Application :: {
	Type: "AWS::KinesisAnalyticsV2::Application"
	Properties: {
		ApplicationConfiguration?: propApplicationConfiguration
		ApplicationDescription?:   string | fn.Fn
		ApplicationName?:          string | fn.Fn
		RuntimeEnvironment:        string | fn.Fn
		ServiceExecutionRole:      string | fn.Fn
	}
	propApplicationCodeConfiguration :: {
		CodeContent:     propCodeContent
		CodeContentType: string | fn.Fn
	}
	propApplicationConfiguration :: {
		ApplicationCodeConfiguration?:     propApplicationCodeConfiguration
		ApplicationSnapshotConfiguration?: propApplicationSnapshotConfiguration
		EnvironmentProperties?:            propEnvironmentProperties
		FlinkApplicationConfiguration?:    propFlinkApplicationConfiguration
		SqlApplicationConfiguration?:      propSqlApplicationConfiguration
	}
	propApplicationSnapshotConfiguration :: {
		SnapshotsEnabled: bool | fn.Fn
	}
	propCSVMappingParameters :: {
		RecordColumnDelimiter: string | fn.Fn
		RecordRowDelimiter:    string | fn.Fn
	}
	propCheckpointConfiguration :: {
		CheckpointInterval?:         int | fn.Fn
		CheckpointingEnabled?:       bool | fn.Fn
		ConfigurationType:           string | fn.Fn
		MinPauseBetweenCheckpoints?: int | fn.Fn
	}
	propCodeContent :: {
		S3ContentLocation?: propS3ContentLocation
		TextContent?:       string | fn.Fn
		ZipFileContent?:    string | fn.Fn
	}
	propEnvironmentProperties :: {
		PropertyGroups?: [...propPropertyGroup]
	}
	propFlinkApplicationConfiguration :: {
		CheckpointConfiguration?:  propCheckpointConfiguration
		MonitoringConfiguration?:  propMonitoringConfiguration
		ParallelismConfiguration?: propParallelismConfiguration
	}
	propInput :: {
		InputParallelism?:             propInputParallelism
		InputProcessingConfiguration?: propInputProcessingConfiguration
		InputSchema:                   propInputSchema
		KinesisFirehoseInput?:         propKinesisFirehoseInput
		KinesisStreamsInput?:          propKinesisStreamsInput
		NamePrefix:                    string | fn.Fn
	}
	propInputLambdaProcessor :: {
		ResourceARN: string | fn.Fn
	}
	propInputParallelism :: {
		Count?: int | fn.Fn
	}
	propInputProcessingConfiguration :: {
		InputLambdaProcessor?: propInputLambdaProcessor
	}
	propInputSchema :: {
		RecordColumns: [...propRecordColumn]
		RecordEncoding?: string | fn.Fn
		RecordFormat:    propRecordFormat
	}
	propJSONMappingParameters :: {
		RecordRowPath: string | fn.Fn
	}
	propKinesisFirehoseInput :: {
		ResourceARN: string | fn.Fn
	}
	propKinesisStreamsInput :: {
		ResourceARN: string | fn.Fn
	}
	propMappingParameters :: {
		CSVMappingParameters?:  propCSVMappingParameters
		JSONMappingParameters?: propJSONMappingParameters
	}
	propMonitoringConfiguration :: {
		ConfigurationType: string | fn.Fn
		LogLevel?:         string | fn.Fn
		MetricsLevel?:     string | fn.Fn
	}
	propParallelismConfiguration :: {
		AutoScalingEnabled?: bool | fn.Fn
		ConfigurationType:   string | fn.Fn
		Parallelism?:        int | fn.Fn
		ParallelismPerKPU?:  int | fn.Fn
	}
	propPropertyGroup :: {
		PropertyGroupId?: string | fn.Fn
		PropertyMap?:     {
		} | fn.Fn
	}
	propRecordColumn :: {
		Mapping?: string | fn.Fn
		Name:     string | fn.Fn
		SqlType:  string | fn.Fn
	}
	propRecordFormat :: {
		MappingParameters?: propMappingParameters
		RecordFormatType:   string | fn.Fn
	}
	propS3ContentLocation :: {
		BucketARN?:     string | fn.Fn
		FileKey?:       string | fn.Fn
		ObjectVersion?: string | fn.Fn
	}
	propSqlApplicationConfiguration :: {
		Inputs?: [...propInput]
	}
}
ApplicationCloudWatchLoggingOption :: {
	Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
	Properties: {
		ApplicationName:         string | fn.Fn
		CloudWatchLoggingOption: propCloudWatchLoggingOption
	}
	propCloudWatchLoggingOption :: {
		LogStreamARN: string | fn.Fn
	}
}
ApplicationOutput :: {
	Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
	Properties: {
		ApplicationName: string | fn.Fn
		Output:          propOutput
	}
	propDestinationSchema :: {
		RecordFormatType?: string | fn.Fn
	}
	propKinesisFirehoseOutput :: {
		ResourceARN: string | fn.Fn
	}
	propKinesisStreamsOutput :: {
		ResourceARN: string | fn.Fn
	}
	propLambdaOutput :: {
		ResourceARN: string | fn.Fn
	}
	propOutput :: {
		DestinationSchema:      propDestinationSchema
		KinesisFirehoseOutput?: propKinesisFirehoseOutput
		KinesisStreamsOutput?:  propKinesisStreamsOutput
		LambdaOutput?:          propLambdaOutput
		Name?:                  string | fn.Fn
	}
}
ApplicationReferenceDataSource :: {
	Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
	Properties: {
		ApplicationName:     string | fn.Fn
		ReferenceDataSource: propReferenceDataSource
	}
	propCSVMappingParameters :: {
		RecordColumnDelimiter: string | fn.Fn
		RecordRowDelimiter:    string | fn.Fn
	}
	propJSONMappingParameters :: {
		RecordRowPath: string | fn.Fn
	}
	propMappingParameters :: {
		CSVMappingParameters?:  propCSVMappingParameters
		JSONMappingParameters?: propJSONMappingParameters
	}
	propRecordColumn :: {
		Mapping?: string | fn.Fn
		Name:     string | fn.Fn
		SqlType:  string | fn.Fn
	}
	propRecordFormat :: {
		MappingParameters?: propMappingParameters
		RecordFormatType:   string | fn.Fn
	}
	propReferenceDataSource :: {
		ReferenceSchema:        propReferenceSchema
		S3ReferenceDataSource?: propS3ReferenceDataSource
		TableName?:             string | fn.Fn
	}
	propReferenceSchema :: {
		RecordColumns: [...propRecordColumn]
		RecordEncoding?: string | fn.Fn
		RecordFormat:    propRecordFormat
	}
	propS3ReferenceDataSource :: {
		BucketARN: string | fn.Fn
		FileKey:   string | fn.Fn
	}
}

package KinesisAnalyticsV2

import "github.com/TangoGroup/fn"

Application :: {
	Type: "AWS::KinesisAnalyticsV2::Application"
	Properties: {
		ApplicationConfiguration?: __ApplicationConfiguration
		ApplicationDescription?:   string | fn.Fn
		ApplicationName?:          string | fn.Fn
		RuntimeEnvironment:        string | fn.Fn
		ServiceExecutionRole:      string | fn.Fn
	}
	__ApplicationCodeConfiguration :: {
		CodeContent:     __CodeContent
		CodeContentType: string | fn.Fn
	}
	__ApplicationConfiguration :: {
		ApplicationCodeConfiguration?:     __ApplicationCodeConfiguration
		ApplicationSnapshotConfiguration?: __ApplicationSnapshotConfiguration
		EnvironmentProperties?:            __EnvironmentProperties
		FlinkApplicationConfiguration?:    __FlinkApplicationConfiguration
		SqlApplicationConfiguration?:      __SqlApplicationConfiguration
	}
	__ApplicationSnapshotConfiguration :: {
		SnapshotsEnabled: bool | fn.Fn
	}
	__CSVMappingParameters :: {
		RecordColumnDelimiter: string | fn.Fn
		RecordRowDelimiter:    string | fn.Fn
	}
	__CheckpointConfiguration :: {
		CheckpointInterval?:         int | fn.Fn
		CheckpointingEnabled?:       bool | fn.Fn
		ConfigurationType:           string | fn.Fn
		MinPauseBetweenCheckpoints?: int | fn.Fn
	}
	__CodeContent :: {
		S3ContentLocation?: __S3ContentLocation
		TextContent?:       string | fn.Fn
		ZipFileContent?:    string | fn.Fn
	}
	__EnvironmentProperties :: {
		PropertyGroups?: [...__PropertyGroup]
	}
	__FlinkApplicationConfiguration :: {
		CheckpointConfiguration?:  __CheckpointConfiguration
		MonitoringConfiguration?:  __MonitoringConfiguration
		ParallelismConfiguration?: __ParallelismConfiguration
	}
	__Input :: {
		InputParallelism?:             __InputParallelism
		InputProcessingConfiguration?: __InputProcessingConfiguration
		InputSchema:                   __InputSchema
		KinesisFirehoseInput?:         __KinesisFirehoseInput
		KinesisStreamsInput?:          __KinesisStreamsInput
		NamePrefix:                    string | fn.Fn
	}
	__InputLambdaProcessor :: {
		ResourceARN: string | fn.Fn
	}
	__InputParallelism :: {
		Count?: int | fn.Fn
	}
	__InputProcessingConfiguration :: {
		InputLambdaProcessor?: __InputLambdaProcessor
	}
	__InputSchema :: {
		RecordColumns: [...__RecordColumn]
		RecordEncoding?: string | fn.Fn
		RecordFormat:    __RecordFormat
	}
	__JSONMappingParameters :: {
		RecordRowPath: string | fn.Fn
	}
	__KinesisFirehoseInput :: {
		ResourceARN: string | fn.Fn
	}
	__KinesisStreamsInput :: {
		ResourceARN: string | fn.Fn
	}
	__MappingParameters :: {
		CSVMappingParameters?:  __CSVMappingParameters
		JSONMappingParameters?: __JSONMappingParameters
	}
	__MonitoringConfiguration :: {
		ConfigurationType: string | fn.Fn
		LogLevel?:         string | fn.Fn
		MetricsLevel?:     string | fn.Fn
	}
	__ParallelismConfiguration :: {
		AutoScalingEnabled?: bool | fn.Fn
		ConfigurationType:   string | fn.Fn
		Parallelism?:        int | fn.Fn
		ParallelismPerKPU?:  int | fn.Fn
	}
	__PropertyGroup :: {
		PropertyGroupId?: string | fn.Fn
		PropertyMap?:     {
		} | fn.Fn
	}
	__RecordColumn :: {
		Mapping?: string | fn.Fn
		Name:     string | fn.Fn
		SqlType:  string | fn.Fn
	}
	__RecordFormat :: {
		MappingParameters?: __MappingParameters
		RecordFormatType:   string | fn.Fn
	}
	__S3ContentLocation :: {
		BucketARN?:     string | fn.Fn
		FileKey?:       string | fn.Fn
		ObjectVersion?: string | fn.Fn
	}
	__SqlApplicationConfiguration :: {
		Inputs?: [...__Input]
	}
}
ApplicationCloudWatchLoggingOption :: {
	Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
	Properties: {
		ApplicationName:         string | fn.Fn
		CloudWatchLoggingOption: __CloudWatchLoggingOption
	}
	__CloudWatchLoggingOption :: {
		LogStreamARN: string | fn.Fn
	}
}
ApplicationOutput :: {
	Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
	Properties: {
		ApplicationName: string | fn.Fn
		Output:          __Output
	}
	__DestinationSchema :: {
		RecordFormatType?: string | fn.Fn
	}
	__KinesisFirehoseOutput :: {
		ResourceARN: string | fn.Fn
	}
	__KinesisStreamsOutput :: {
		ResourceARN: string | fn.Fn
	}
	__LambdaOutput :: {
		ResourceARN: string | fn.Fn
	}
	__Output :: {
		DestinationSchema:      __DestinationSchema
		KinesisFirehoseOutput?: __KinesisFirehoseOutput
		KinesisStreamsOutput?:  __KinesisStreamsOutput
		LambdaOutput?:          __LambdaOutput
		Name?:                  string | fn.Fn
	}
}
ApplicationReferenceDataSource :: {
	Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
	Properties: {
		ApplicationName:     string | fn.Fn
		ReferenceDataSource: __ReferenceDataSource
	}
	__CSVMappingParameters :: {
		RecordColumnDelimiter: string | fn.Fn
		RecordRowDelimiter:    string | fn.Fn
	}
	__JSONMappingParameters :: {
		RecordRowPath: string | fn.Fn
	}
	__MappingParameters :: {
		CSVMappingParameters?:  __CSVMappingParameters
		JSONMappingParameters?: __JSONMappingParameters
	}
	__RecordColumn :: {
		Mapping?: string | fn.Fn
		Name:     string | fn.Fn
		SqlType:  string | fn.Fn
	}
	__RecordFormat :: {
		MappingParameters?: __MappingParameters
		RecordFormatType:   string | fn.Fn
	}
	__ReferenceDataSource :: {
		ReferenceSchema:        __ReferenceSchema
		S3ReferenceDataSource?: __S3ReferenceDataSource
		TableName?:             string | fn.Fn
	}
	__ReferenceSchema :: {
		RecordColumns: [...__RecordColumn]
		RecordEncoding?: string | fn.Fn
		RecordFormat:    __RecordFormat
	}
	__S3ReferenceDataSource :: {
		BucketARN: string | fn.Fn
		FileKey:   string | fn.Fn
	}
}

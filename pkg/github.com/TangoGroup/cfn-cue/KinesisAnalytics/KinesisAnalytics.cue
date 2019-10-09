package KinesisAnalytics

import "github.com/TangoGroup/fn"

Application :: {
	Type: "AWS::KinesisAnalytics::Application"
	Properties: {
		ApplicationCode?:        string | fn.Fn
		ApplicationDescription?: string | fn.Fn
		ApplicationName?:        string | fn.Fn
		Inputs: [...__Input]
	}
	__CSVMappingParameters :: {
		RecordColumnDelimiter: string | fn.Fn
		RecordRowDelimiter:    string | fn.Fn
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
		RoleARN:     string | fn.Fn
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
		RoleARN:     string | fn.Fn
	}
	__KinesisStreamsInput :: {
		ResourceARN: string | fn.Fn
		RoleARN:     string | fn.Fn
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
}
ApplicationOutput :: {
	Type: "AWS::KinesisAnalytics::ApplicationOutput"
	Properties: {
		ApplicationName: string | fn.Fn
		Output:          __Output
	}
	__DestinationSchema :: {
		RecordFormatType?: string | fn.Fn
	}
	__KinesisFirehoseOutput :: {
		ResourceARN: string | fn.Fn
		RoleARN:     string | fn.Fn
	}
	__KinesisStreamsOutput :: {
		ResourceARN: string | fn.Fn
		RoleARN:     string | fn.Fn
	}
	__LambdaOutput :: {
		ResourceARN: string | fn.Fn
		RoleARN:     string | fn.Fn
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
	Type: "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
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
		BucketARN:        string | fn.Fn
		FileKey:          string | fn.Fn
		ReferenceRoleARN: string | fn.Fn
	}
}

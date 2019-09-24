package KinesisAnalytics

Application :: {
	Type: "AWS::KinesisAnalytics::Application"
	Properties: {
		ApplicationCode?:        string
		ApplicationDescription?: string
		ApplicationName?:        string
		Inputs: [...__Input]
	}
	__CSVMappingParameters :: {
		RecordColumnDelimiter: string
		RecordRowDelimiter:    string
	}
	__Input :: {
		InputParallelism?:             __InputParallelism
		InputProcessingConfiguration?: __InputProcessingConfiguration
		InputSchema:                   __InputSchema
		KinesisFirehoseInput?:         __KinesisFirehoseInput
		KinesisStreamsInput?:          __KinesisStreamsInput
		NamePrefix:                    string
	}
	__InputLambdaProcessor :: {
		ResourceARN: string
		RoleARN:     string
	}
	__InputParallelism :: {
		Count?: int
	}
	__InputProcessingConfiguration :: {
		InputLambdaProcessor?: __InputLambdaProcessor
	}
	__InputSchema :: {
		RecordColumns: [...__RecordColumn]
		RecordEncoding?: string
		RecordFormat:    __RecordFormat
	}
	__JSONMappingParameters :: {
		RecordRowPath: string
	}
	__KinesisFirehoseInput :: {
		ResourceARN: string
		RoleARN:     string
	}
	__KinesisStreamsInput :: {
		ResourceARN: string
		RoleARN:     string
	}
	__MappingParameters :: {
		CSVMappingParameters?:  __CSVMappingParameters
		JSONMappingParameters?: __JSONMappingParameters
	}
	__RecordColumn :: {
		Mapping?: string
		Name:     string
		SqlType:  string
	}
	__RecordFormat :: {
		MappingParameters?: __MappingParameters
		RecordFormatType:   string
	}
}
ApplicationOutput :: {
	Type: "AWS::KinesisAnalytics::ApplicationOutput"
	Properties: {
		ApplicationName: string
		Output:          __Output
	}
	__DestinationSchema :: {
		RecordFormatType?: string
	}
	__KinesisFirehoseOutput :: {
		ResourceARN: string
		RoleARN:     string
	}
	__KinesisStreamsOutput :: {
		ResourceARN: string
		RoleARN:     string
	}
	__LambdaOutput :: {
		ResourceARN: string
		RoleARN:     string
	}
	__Output :: {
		DestinationSchema:      __DestinationSchema
		KinesisFirehoseOutput?: __KinesisFirehoseOutput
		KinesisStreamsOutput?:  __KinesisStreamsOutput
		LambdaOutput?:          __LambdaOutput
		Name?:                  string
	}
}
ApplicationReferenceDataSource :: {
	Type: "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
	Properties: {
		ApplicationName:     string
		ReferenceDataSource: __ReferenceDataSource
	}
	__CSVMappingParameters :: {
		RecordColumnDelimiter: string
		RecordRowDelimiter:    string
	}
	__JSONMappingParameters :: {
		RecordRowPath: string
	}
	__MappingParameters :: {
		CSVMappingParameters?:  __CSVMappingParameters
		JSONMappingParameters?: __JSONMappingParameters
	}
	__RecordColumn :: {
		Mapping?: string
		Name:     string
		SqlType:  string
	}
	__RecordFormat :: {
		MappingParameters?: __MappingParameters
		RecordFormatType:   string
	}
	__ReferenceDataSource :: {
		ReferenceSchema:        __ReferenceSchema
		S3ReferenceDataSource?: __S3ReferenceDataSource
		TableName?:             string
	}
	__ReferenceSchema :: {
		RecordColumns: [...__RecordColumn]
		RecordEncoding?: string
		RecordFormat:    __RecordFormat
	}
	__S3ReferenceDataSource :: {
		BucketARN:        string
		FileKey:          string
		ReferenceRoleARN: string
	}
}

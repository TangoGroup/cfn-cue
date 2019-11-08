package KinesisAnalytics

import "github.com/TangoGroup/fn"

Application :: {
	Type: "AWS::KinesisAnalytics::Application"
	Properties: {
		ApplicationCode?:        string | fn.Fn
		ApplicationDescription?: string | fn.Fn
		ApplicationName?:        string | fn.Fn
		Inputs: [...propInput]
	}
	propCSVMappingParameters :: {
		RecordColumnDelimiter: string | fn.Fn
		RecordRowDelimiter:    string | fn.Fn
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
		RoleARN:     string | fn.Fn
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
		RoleARN:     string | fn.Fn
	}
	propKinesisStreamsInput :: {
		ResourceARN: string | fn.Fn
		RoleARN:     string | fn.Fn
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
}
ApplicationOutput :: {
	Type: "AWS::KinesisAnalytics::ApplicationOutput"
	Properties: {
		ApplicationName: string | fn.Fn
		Output:          propOutput
	}
	propDestinationSchema :: {
		RecordFormatType?: string | fn.Fn
	}
	propKinesisFirehoseOutput :: {
		ResourceARN: string | fn.Fn
		RoleARN:     string | fn.Fn
	}
	propKinesisStreamsOutput :: {
		ResourceARN: string | fn.Fn
		RoleARN:     string | fn.Fn
	}
	propLambdaOutput :: {
		ResourceARN: string | fn.Fn
		RoleARN:     string | fn.Fn
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
	Type: "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
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
		BucketARN:        string | fn.Fn
		FileKey:          string | fn.Fn
		ReferenceRoleARN: string | fn.Fn
	}
}

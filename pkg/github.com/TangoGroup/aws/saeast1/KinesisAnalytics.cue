package saeast1

import "github.com/TangoGroup/aws/fn"

KinesisAnalytics :: {
	Application :: {
		Type:       "AWS::KinesisAnalytics::Application"
		Properties: close({
			ApplicationCode?:        string | fn.Fn
			ApplicationDescription?: string | fn.Fn
			ApplicationName?:        string | fn.Fn
			Inputs:                  [...close({
				InputParallelism?: close({
					Count?: int | fn.Fn
				}) | fn.If
				InputProcessingConfiguration?: close({
					InputLambdaProcessor?: close({
						ResourceARN: string | fn.Fn
						RoleARN:     string | fn.Fn
					}) | fn.If
				}) | fn.If
				InputSchema: close({
					RecordColumns: [...close({
						Mapping?: string | fn.Fn
						Name:     string | fn.Fn
						SqlType:  string | fn.Fn
					})] | fn.If
					RecordEncoding?: string | fn.Fn
					RecordFormat:    close({
						MappingParameters?: close({
							CSVMappingParameters?: close({
								RecordColumnDelimiter: string | fn.Fn
								RecordRowDelimiter:    string | fn.Fn
							}) | fn.If
							JSONMappingParameters?: close({
								RecordRowPath: string | fn.Fn
							}) | fn.If
						}) | fn.If
						RecordFormatType: string | fn.Fn
					}) | fn.If
				}) | fn.If
				KinesisFirehoseInput?: close({
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}) | fn.If
				KinesisStreamsInput?: close({
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}) | fn.If
				NamePrefix: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationOutput :: {
		Type:       "AWS::KinesisAnalytics::ApplicationOutput"
		Properties: close({
			ApplicationName: string | fn.Fn
			Output:          close({
				DestinationSchema: close({
					RecordFormatType?: string | fn.Fn
				}) | fn.If
				KinesisFirehoseOutput?: close({
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}) | fn.If
				KinesisStreamsOutput?: close({
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}) | fn.If
				LambdaOutput?: close({
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}) | fn.If
				Name?: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationReferenceDataSource :: {
		Type:       "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
		Properties: close({
			ApplicationName:     string | fn.Fn
			ReferenceDataSource: close({
				ReferenceSchema: close({
					RecordColumns: [...close({
						Mapping?: string | fn.Fn
						Name:     string | fn.Fn
						SqlType:  string | fn.Fn
					})] | fn.If
					RecordEncoding?: string | fn.Fn
					RecordFormat:    close({
						MappingParameters?: close({
							CSVMappingParameters?: close({
								RecordColumnDelimiter: string | fn.Fn
								RecordRowDelimiter:    string | fn.Fn
							}) | fn.If
							JSONMappingParameters?: close({
								RecordRowPath: string | fn.Fn
							}) | fn.If
						}) | fn.If
						RecordFormatType: string | fn.Fn
					}) | fn.If
				}) | fn.If
				S3ReferenceDataSource?: close({
					BucketARN:        string | fn.Fn
					FileKey:          string | fn.Fn
					ReferenceRoleARN: string | fn.Fn
				}) | fn.If
				TableName?: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

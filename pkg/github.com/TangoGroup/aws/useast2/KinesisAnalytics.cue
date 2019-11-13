package useast2

import "github.com/TangoGroup/aws/fn"

KinesisAnalytics :: {
	Application :: {
		Type: "AWS::KinesisAnalytics::Application"
		Properties: {
			ApplicationCode?:        string | fn.Fn
			ApplicationDescription?: string | fn.Fn
			ApplicationName?:        string | fn.Fn
			Inputs: [...{
				InputParallelism?: Count?: int | fn.Fn
				InputProcessingConfiguration?: InputLambdaProcessor?: {
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}
				InputSchema: {
					RecordColumns: [...{
						Mapping?: string | fn.Fn
						Name:     string | fn.Fn
						SqlType:  string | fn.Fn
					}]
					RecordEncoding?: string | fn.Fn
					RecordFormat: {
						MappingParameters?: {
							CSVMappingParameters?: {
								RecordColumnDelimiter: string | fn.Fn
								RecordRowDelimiter:    string | fn.Fn
							}
							JSONMappingParameters?: RecordRowPath: string | fn.Fn
						}
						RecordFormatType: string | fn.Fn
					}
				}
				KinesisFirehoseInput?: {
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}
				KinesisStreamsInput?: {
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}
				NamePrefix: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ApplicationOutput :: {
		Type: "AWS::KinesisAnalytics::ApplicationOutput"
		Properties: {
			ApplicationName: string | fn.Fn
			Output: {
				DestinationSchema: RecordFormatType?: string | fn.Fn
				KinesisFirehoseOutput?: {
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}
				KinesisStreamsOutput?: {
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}
				LambdaOutput?: {
					ResourceARN: string | fn.Fn
					RoleARN:     string | fn.Fn
				}
				Name?: string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ApplicationReferenceDataSource :: {
		Type: "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
		Properties: {
			ApplicationName: string | fn.Fn
			ReferenceDataSource: {
				ReferenceSchema: {
					RecordColumns: [...{
						Mapping?: string | fn.Fn
						Name:     string | fn.Fn
						SqlType:  string | fn.Fn
					}]
					RecordEncoding?: string | fn.Fn
					RecordFormat: {
						MappingParameters?: {
							CSVMappingParameters?: {
								RecordColumnDelimiter: string | fn.Fn
								RecordRowDelimiter:    string | fn.Fn
							}
							JSONMappingParameters?: RecordRowPath: string | fn.Fn
						}
						RecordFormatType: string | fn.Fn
					}
				}
				S3ReferenceDataSource?: {
					BucketARN:        string | fn.Fn
					FileKey:          string | fn.Fn
					ReferenceRoleARN: string | fn.Fn
				}
				TableName?: string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

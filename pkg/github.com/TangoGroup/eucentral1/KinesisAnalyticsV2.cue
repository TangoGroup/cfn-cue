package eucentral1

import "github.com/TangoGroup/fn"

KinesisAnalyticsV2 :: {
	Application :: {
		Type: "AWS::KinesisAnalyticsV2::Application"
		Properties: {
			ApplicationConfiguration?: {
				ApplicationCodeConfiguration?: {
					CodeContent: {
						S3ContentLocation?: {
							BucketARN?:     string | fn.Fn
							FileKey?:       string | fn.Fn
							ObjectVersion?: string | fn.Fn
						}
						TextContent?:    string | fn.Fn
						ZipFileContent?: string | fn.Fn
					}
					CodeContentType: string | fn.Fn
				}
				ApplicationSnapshotConfiguration?: SnapshotsEnabled: bool | fn.Fn
				EnvironmentProperties?: PropertyGroups?: [...{
					PropertyGroupId?: string | fn.Fn
					PropertyMap?:     {
						[string]: _
					} | fn.Fn
				}]
				FlinkApplicationConfiguration?: {
					CheckpointConfiguration?: {
						CheckpointInterval?:         int | fn.Fn
						CheckpointingEnabled?:       bool | fn.Fn
						ConfigurationType:           string | fn.Fn
						MinPauseBetweenCheckpoints?: int | fn.Fn
					}
					MonitoringConfiguration?: {
						ConfigurationType: string | fn.Fn
						LogLevel?:         string | fn.Fn
						MetricsLevel?:     string | fn.Fn
					}
					ParallelismConfiguration?: {
						AutoScalingEnabled?: bool | fn.Fn
						ConfigurationType:   string | fn.Fn
						Parallelism?:        int | fn.Fn
						ParallelismPerKPU?:  int | fn.Fn
					}
				}
				SqlApplicationConfiguration?: Inputs?: [...{
					InputParallelism?: Count?: int | fn.Fn
					InputProcessingConfiguration?: InputLambdaProcessor?: ResourceARN: string | fn.Fn
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
					KinesisFirehoseInput?: ResourceARN: string | fn.Fn
					KinesisStreamsInput?: ResourceARN:  string | fn.Fn
					NamePrefix: string | fn.Fn
				}]
			}
			ApplicationDescription?: string | fn.Fn
			ApplicationName?:        string | fn.Fn
			RuntimeEnvironment:      string | fn.Fn
			ServiceExecutionRole:    string | fn.Fn
		}
	}
	ApplicationCloudWatchLoggingOption :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
		Properties: {
			ApplicationName: string | fn.Fn
			CloudWatchLoggingOption: LogStreamARN: string | fn.Fn
		}
	}
	ApplicationOutput :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
		Properties: {
			ApplicationName: string | fn.Fn
			Output: {
				DestinationSchema: RecordFormatType?: string | fn.Fn
				KinesisFirehoseOutput?: ResourceARN:  string | fn.Fn
				KinesisStreamsOutput?: ResourceARN:   string | fn.Fn
				LambdaOutput?: ResourceARN:           string | fn.Fn
				Name?: string | fn.Fn
			}
		}
	}
	ApplicationReferenceDataSource :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
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
					BucketARN: string | fn.Fn
					FileKey:   string | fn.Fn
				}
				TableName?: string | fn.Fn
			}
		}
	}
}

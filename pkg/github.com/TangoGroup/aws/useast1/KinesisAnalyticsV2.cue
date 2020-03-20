package useast1

import "github.com/TangoGroup/aws/fn"

KinesisAnalyticsV2 :: {
	Application :: {
		Type: "AWS::KinesisAnalyticsV2::Application"
		Properties: {
			ApplicationConfiguration?: close({
				ApplicationCodeConfiguration?: close({
					CodeContent: close({
						S3ContentLocation?: close({
							BucketARN?:     string | fn.Fn
							FileKey?:       string | fn.Fn
							ObjectVersion?: string | fn.Fn
						}) | fn.If
						TextContent?:    string | fn.Fn
						ZipFileContent?: string | fn.Fn
					}) | fn.If
					CodeContentType: string | fn.Fn
				}) | fn.If
				ApplicationSnapshotConfiguration?: close({
					SnapshotsEnabled: bool | fn.Fn
				}) | fn.If
				EnvironmentProperties?: close({
					PropertyGroups?: [...close({
						PropertyGroupId?: string | fn.Fn
						PropertyMap?:     {
							[string]: _
						} | fn.Fn
					})] | fn.If
				}) | fn.If
				FlinkApplicationConfiguration?: close({
					CheckpointConfiguration?: close({
						CheckpointInterval?:         int | fn.Fn
						CheckpointingEnabled?:       bool | fn.Fn
						ConfigurationType:           string | fn.Fn
						MinPauseBetweenCheckpoints?: int | fn.Fn
					}) | fn.If
					MonitoringConfiguration?: close({
						ConfigurationType: string | fn.Fn
						LogLevel?:         string | fn.Fn
						MetricsLevel?:     string | fn.Fn
					}) | fn.If
					ParallelismConfiguration?: close({
						AutoScalingEnabled?: bool | fn.Fn
						ConfigurationType:   string | fn.Fn
						Parallelism?:        int | fn.Fn
						ParallelismPerKPU?:  int | fn.Fn
					}) | fn.If
				}) | fn.If
				SqlApplicationConfiguration?: close({
					Inputs?: [...close({
						InputParallelism?: close({
							Count?: int | fn.Fn
						}) | fn.If
						InputProcessingConfiguration?: close({
							InputLambdaProcessor?: close({
								ResourceARN: string | fn.Fn
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
						}) | fn.If
						KinesisStreamsInput?: close({
							ResourceARN: string | fn.Fn
						}) | fn.If
						NamePrefix: string | fn.Fn
					})] | fn.If
				}) | fn.If
			}) | fn.If
			ApplicationDescription?: string | fn.Fn
			ApplicationName?:        string | fn.Fn
			RuntimeEnvironment:      ("FLINK-1_6" | "FLINK-1_8" | "SQL-1_0") | fn.Fn
			ServiceExecutionRole:    string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationCloudWatchLoggingOption :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
		Properties: {
			ApplicationName:         string | fn.Fn
			CloudWatchLoggingOption: close({
				LogStreamARN: string | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationOutput :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
		Properties: {
			ApplicationName: string | fn.Fn
			Output:          close({
				DestinationSchema: close({
					RecordFormatType?: string | fn.Fn
				}) | fn.If
				KinesisFirehoseOutput?: close({
					ResourceARN: string | fn.Fn
				}) | fn.If
				KinesisStreamsOutput?: close({
					ResourceARN: string | fn.Fn
				}) | fn.If
				LambdaOutput?: close({
					ResourceARN: string | fn.Fn
				}) | fn.If
				Name?: string | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationReferenceDataSource :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
		Properties: {
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
					BucketARN: string | fn.Fn
					FileKey:   string | fn.Fn
				}) | fn.If
				TableName?: string | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

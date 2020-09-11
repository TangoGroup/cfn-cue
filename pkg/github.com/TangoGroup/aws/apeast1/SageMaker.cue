package apeast1

import "github.com/TangoGroup/aws/fn"

SageMaker :: {
	MonitoringSchedule :: {
		Type:       "AWS::SageMaker::MonitoringSchedule"
		Properties: close({
			CreationTime?:                   string | fn.Fn
			EndpointName?:                   string | fn.Fn
			FailureReason?:                  string | fn.Fn
			LastModifiedTime?:               string | fn.Fn
			LastMonitoringExecutionSummary?: close({
				CreationTime:              string | fn.Fn
				EndpointName?:             string | fn.Fn
				FailureReason?:            string | fn.Fn
				LastModifiedTime:          string | fn.Fn
				MonitoringExecutionStatus: string | fn.Fn
				MonitoringScheduleName:    string | fn.Fn
				ProcessingJobArn?:         string | fn.Fn
				ScheduledTime:             string | fn.Fn
			}) | fn.If
			MonitoringScheduleArn?:   string | fn.Fn
			MonitoringScheduleConfig: close({
				MonitoringJobDefinition: close({
					BaselineConfig?: close({
						ConstraintsResource?: close({
							S3Uri?: string | fn.Fn
						}) | fn.If
						StatisticsResource?: close({
							S3Uri?: string | fn.Fn
						}) | fn.If
					}) | fn.If
					Environment?: close({
					}) | fn.If
					MonitoringAppSpecification: close({
						ContainerArguments?:              [...(string | fn.Fn)] | (string | fn.Fn)
						ContainerEntrypoint?:             [...(string | fn.Fn)] | (string | fn.Fn)
						ImageUri:                         string | fn.Fn
						PostAnalyticsProcessorSourceUri?: string | fn.Fn
						RecordPreprocessorSourceUri?:     string | fn.Fn
					}) | fn.If
					MonitoringInputs: close({
						MonitoringInputs?: [...close({
							[string]: _
						})] | fn.If
					}) | fn.If
					MonitoringOutputConfig: close({
						KmsKeyId?:         string | fn.Fn
						MonitoringOutputs: [...close({
							S3Output: close({
								LocalPath:     string | fn.Fn
								S3UploadMode?: string | fn.Fn
								S3Uri:         string | fn.Fn
							}) | fn.If
						})] | fn.If
					}) | fn.If
					MonitoringResources: close({
						ClusterConfig: close({
							InstanceCount:   int | fn.Fn
							InstanceType:    string | fn.Fn
							VolumeKmsKeyId?: string | fn.Fn
							VolumeSizeInGB:  int | fn.Fn
						}) | fn.If
					}) | fn.If
					NetworkConfig?: close({
						EnableInterContainerTrafficEncryption?: bool | fn.Fn
						EnableNetworkIsolation?:                bool | fn.Fn
						VpcConfig?:                             close({
							SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
							Subnets:          [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
					}) | fn.If
					RoleArn:            string | fn.Fn
					StoppingCondition?: close({
						MaxRuntimeInSeconds: int | fn.Fn
					}) | fn.If
				}) | fn.If
				ScheduleConfig?: close({
					ScheduleExpression: string | fn.Fn
				}) | fn.If
			}) | fn.If
			MonitoringScheduleName:    string | fn.Fn
			MonitoringScheduleStatus?: string | fn.Fn
			Tags?:                     [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

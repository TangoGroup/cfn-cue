package saeast1

import "github.com/TangoGroup/aws/fn"

#SageMaker: {
	#MonitoringSchedule: {
		Type: "AWS::SageMaker::MonitoringSchedule"
		Properties: {
			CreationTime?:                   string | fn.#Fn
			EndpointName?:                   string | fn.#Fn
			FailureReason?:                  string | fn.#Fn
			LastModifiedTime?:               string | fn.#Fn
			LastMonitoringExecutionSummary?: {
				CreationTime:              string | fn.#Fn
				EndpointName?:             string | fn.#Fn
				FailureReason?:            string | fn.#Fn
				LastModifiedTime:          string | fn.#Fn
				MonitoringExecutionStatus: string | fn.#Fn
				MonitoringScheduleName:    string | fn.#Fn
				ProcessingJobArn?:         string | fn.#Fn
				ScheduledTime:             string | fn.#Fn
			} | fn.If
			MonitoringScheduleArn?:   string | fn.#Fn
			MonitoringScheduleConfig: {
				MonitoringJobDefinition: {
					BaselineConfig?: {
						ConstraintsResource?: {
							S3Uri?: string | fn.#Fn
						} | fn.If
						StatisticsResource?: {
							S3Uri?: string | fn.#Fn
						} | fn.If
					} | fn.If
					Environment?:               {} | fn.If
					MonitoringAppSpecification: {
						ContainerArguments?:              [...(string | fn.#Fn)] | (string | fn.#Fn)
						ContainerEntrypoint?:             [...(string | fn.#Fn)] | (string | fn.#Fn)
						ImageUri:                         string | fn.#Fn
						PostAnalyticsProcessorSourceUri?: string | fn.#Fn
						RecordPreprocessorSourceUri?:     string | fn.#Fn
					} | fn.If
					MonitoringInputs: {
						MonitoringInputs?: [...{
							[string]: _
						}] | fn.If
					} | fn.If
					MonitoringOutputConfig: {
						KmsKeyId?:         string | fn.#Fn
						MonitoringOutputs: [...{
							S3Output: {
								LocalPath:     string | fn.#Fn
								S3UploadMode?: string | fn.#Fn
								S3Uri:         string | fn.#Fn
							} | fn.If
						}] | fn.If
					} | fn.If
					MonitoringResources: {
						ClusterConfig: {
							InstanceCount:   int | fn.#Fn
							InstanceType:    string | fn.#Fn
							VolumeKmsKeyId?: string | fn.#Fn
							VolumeSizeInGB:  int | fn.#Fn
						} | fn.If
					} | fn.If
					NetworkConfig?: {
						EnableInterContainerTrafficEncryption?: bool | fn.#Fn
						EnableNetworkIsolation?:                bool | fn.#Fn
						VpcConfig?:                             {
							SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
							Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.If
					} | fn.If
					RoleArn:            string | fn.#Fn
					StoppingCondition?: {
						MaxRuntimeInSeconds: int | fn.#Fn
					} | fn.If
				} | fn.If
				ScheduleConfig?: {
					ScheduleExpression: string | fn.#Fn
				} | fn.If
			} | fn.If
			MonitoringScheduleName:    string | fn.#Fn
			MonitoringScheduleStatus?: string | fn.#Fn
			Tags?:                     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package cnnorthwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

SageMaker :: {
	MonitoringSchedule :: {
		Type:       "AWS::SageMaker::MonitoringSchedule"
		Properties: close({
			EndpointName?:                   (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.Fn
			FailureReason?:                  (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			LastMonitoringExecutionSummary?: close({
				CreationTime:              string | fn.Fn
				EndpointName?:             (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.Fn
				FailureReason?:            string | fn.Fn
				LastModifiedTime:          string | fn.Fn
				MonitoringExecutionStatus: ("Pending" | "Completed" | "CompletedWithViolations" | "InProgress" | "Failed" | "Stopping" | "Stopped") | fn.Fn
				MonitoringScheduleName:    (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
				ProcessingJobArn?:         (=~#"aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:processing-job/.*"#) | fn.Fn
				ScheduledTime:             string | fn.Fn
			}) | fn.If
			MonitoringScheduleConfig: close({
				MonitoringJobDefinition: close({
					BaselineConfig?: close({
						ConstraintsResource?: close({
							S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
						}) | fn.If
						StatisticsResource?: close({
							S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
						}) | fn.If
					}) | fn.If
					Environment?: close({
					}) | fn.If
					MonitoringAppSpecification: close({
						ContainerArguments?:              [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
						ContainerEntrypoint?:             [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
						ImageUri:                         (=~#".*"#) | fn.Fn
						PostAnalyticsProcessorSourceUri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
						RecordPreprocessorSourceUri?:     (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
					}) | fn.If
					MonitoringInputs: close({
						MonitoringInputs?: [...close({
							[string]: _
						})] | fn.If
					}) | fn.If
					MonitoringOutputConfig: close({
						KmsKeyId?:         (=~#".*"#) | fn.Fn
						MonitoringOutputs: [...close({
							S3Output: close({
								LocalPath:     (=~#".*"#) | fn.Fn
								S3UploadMode?: ("Continuous" | "EndOfJob") | fn.Fn
								S3Uri:         (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
							}) | fn.If
						})] | fn.If
					}) | fn.If
					MonitoringResources: close({
						ClusterConfig: close({
							InstanceCount:   (>=1 & <=100) | fn.Fn
							InstanceType:    string | fn.Fn
							VolumeKmsKeyId?: string | fn.Fn
							VolumeSizeInGB:  (>=1 & <=16384) | fn.Fn
						}) | fn.If
					}) | fn.If
					NetworkConfig?: close({
						EnableInterContainerTrafficEncryption?: bool | fn.Fn
						EnableNetworkIsolation?:                bool | fn.Fn
						VpcConfig?:                             close({
							SecurityGroupIds: [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
							Subnets:          [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
						}) | fn.If
					}) | fn.If
					RoleArn:            (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
					StoppingCondition?: close({
						MaxRuntimeInSeconds: (>=1 & <=86400) | fn.Fn
					}) | fn.If
				}) | fn.If
				ScheduleConfig?: close({
					ScheduleExpression: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
				}) | fn.If
			}) | fn.If
			MonitoringScheduleName:    (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
			MonitoringScheduleStatus?: ("Pending" | "Failed" | "Scheduled" | "Stopped") | fn.Fn
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

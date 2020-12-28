package apnortheast1

import "github.com/TangoGroup/aws/fn"

MWAA :: {
	Environment :: {
		Type:       "AWS::MWAA::Environment"
		Properties: close({
			AirflowConfigurationOptions?: close({
			}) | fn.If
			AirflowVersion?:       string | fn.Fn
			DagS3Path?:            string | fn.Fn
			EnvironmentClass?:     string | fn.Fn
			ExecutionRoleArn?:     string | fn.Fn
			KmsKey?:               string | fn.Fn
			LoggingConfiguration?: close({
				DagProcessingLogs?: close({
					CloudWatchLogGroupArn?: string | fn.Fn
					Enabled?:               bool | fn.Fn
					LogLevel?:              string | fn.Fn
				}) | fn.If
				SchedulerLogs?: close({
					CloudWatchLogGroupArn?: string | fn.Fn
					Enabled?:               bool | fn.Fn
					LogLevel?:              string | fn.Fn
				}) | fn.If
				TaskLogs?: close({
					CloudWatchLogGroupArn?: string | fn.Fn
					Enabled?:               bool | fn.Fn
					LogLevel?:              string | fn.Fn
				}) | fn.If
				WebserverLogs?: close({
					CloudWatchLogGroupArn?: string | fn.Fn
					Enabled?:               bool | fn.Fn
					LogLevel?:              string | fn.Fn
				}) | fn.If
				WorkerLogs?: close({
					CloudWatchLogGroupArn?: string | fn.Fn
					Enabled?:               bool | fn.Fn
					LogLevel?:              string | fn.Fn
				}) | fn.If
			}) | fn.If
			MaxWorkers?:           int | fn.Fn
			NetworkConfiguration?: close({
				SecurityGroupIds?: close({
					SecurityGroupList?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				SubnetIds?: close({
					SubnetList?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
			}) | fn.If
			PluginsS3ObjectVersion?:      string | fn.Fn
			PluginsS3Path?:               string | fn.Fn
			RequirementsS3ObjectVersion?: string | fn.Fn
			RequirementsS3Path?:          string | fn.Fn
			SourceBucketArn?:             string | fn.Fn
			Tags?:                        close({
			}) | fn.If
			WebserverAccessMode?:          string | fn.Fn
			WebserverUrl?:                 string | fn.Fn
			WeeklyMaintenanceWindowStart?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

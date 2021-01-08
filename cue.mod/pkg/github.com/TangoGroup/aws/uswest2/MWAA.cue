package uswest2

import "github.com/TangoGroup/aws/fn"

#MWAA: {
	#Environment: {
		Type: "AWS::MWAA::Environment"
		Properties: {
			AirflowConfigurationOptions?: {} | fn.#If
			AirflowVersion?:              string | fn.#Fn
			DagS3Path?:                   string | fn.#Fn
			EnvironmentClass?:            string | fn.#Fn
			ExecutionRoleArn?:            string | fn.#Fn
			KmsKey?:                      string | fn.#Fn
			LoggingConfiguration?:        {
				DagProcessingLogs?: {
					CloudWatchLogGroupArn?: string | fn.#Fn
					Enabled?:               bool | fn.#Fn
					LogLevel?:              string | fn.#Fn
				} | fn.#If
				SchedulerLogs?: {
					CloudWatchLogGroupArn?: string | fn.#Fn
					Enabled?:               bool | fn.#Fn
					LogLevel?:              string | fn.#Fn
				} | fn.#If
				TaskLogs?: {
					CloudWatchLogGroupArn?: string | fn.#Fn
					Enabled?:               bool | fn.#Fn
					LogLevel?:              string | fn.#Fn
				} | fn.#If
				WebserverLogs?: {
					CloudWatchLogGroupArn?: string | fn.#Fn
					Enabled?:               bool | fn.#Fn
					LogLevel?:              string | fn.#Fn
				} | fn.#If
				WorkerLogs?: {
					CloudWatchLogGroupArn?: string | fn.#Fn
					Enabled?:               bool | fn.#Fn
					LogLevel?:              string | fn.#Fn
				} | fn.#If
			} | fn.#If
			MaxWorkers?:           int | fn.#Fn
			NetworkConfiguration?: {
				SecurityGroupIds?: {
					SecurityGroupList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
				SubnetIds?: {
					SubnetList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
			} | fn.#If
			PluginsS3ObjectVersion?:       string | fn.#Fn
			PluginsS3Path?:                string | fn.#Fn
			RequirementsS3ObjectVersion?:  string | fn.#Fn
			RequirementsS3Path?:           string | fn.#Fn
			SourceBucketArn?:              string | fn.#Fn
			Tags?:                         {} | fn.#If
			WebserverAccessMode?:          string | fn.#Fn
			WebserverUrl?:                 string | fn.#Fn
			WeeklyMaintenanceWindowStart?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

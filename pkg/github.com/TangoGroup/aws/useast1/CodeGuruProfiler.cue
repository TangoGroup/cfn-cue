package useast1

import "github.com/TangoGroup/aws/fn"

#CodeGuruProfiler: {
	#ProfilingGroup: {
		Type:       "AWS::CodeGuruProfiler::ProfilingGroup"
		Properties: close({
			AgentPermissions?: {
				[string]: _
			} | fn.#Fn
			AnomalyDetectionNotificationConfiguration?: [...close({
				channelId?: string | fn.#Fn
				channelUri: string | fn.#Fn
			})] | fn.If
			ComputePlatform?:   string | fn.#Fn
			ProfilingGroupName: string | fn.#Fn
			Tags?:              [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

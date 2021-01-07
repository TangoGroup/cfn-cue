package eunorth1

import "github.com/TangoGroup/aws/fn"

#CodeGuruProfiler: {
	#ProfilingGroup: {
		Type: "AWS::CodeGuruProfiler::ProfilingGroup"
		Properties: {
			AgentPermissions?: {
				[string]: _
			} | fn.#Fn
			AnomalyDetectionNotificationConfiguration?: [...{
				channelId?: string | fn.#Fn
				channelUri: string | fn.#Fn
			}] | fn.#If
			ComputePlatform?:   string | fn.#Fn
			ProfilingGroupName: string | fn.#Fn
			Tags?:              [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

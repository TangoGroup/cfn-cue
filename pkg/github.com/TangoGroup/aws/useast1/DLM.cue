package useast1

import "github.com/TangoGroup/aws/fn"

#DLM: {
	#LifecyclePolicy: {
		Type: "AWS::DLM::LifecyclePolicy"
		Properties: {
			Description?:     string | fn.#Fn
			ExecutionRoleArn: string | fn.#Fn
			PolicyDetails?:   {
				Parameters?: {
					ExcludeBootVolume?: bool | fn.#Fn
					NoReboot?:          bool | fn.#Fn
				} | fn.If
				PolicyType?:   string | fn.#Fn
				ResourceTypes: [...(("INSTANCE" | "VOLUME") | fn.#Fn)] | (("INSTANCE" | "VOLUME") | fn.#Fn)
				Schedules:     [...{
					CopyTags?:   bool | fn.#Fn
					CreateRule?: {
						CronExpression?: string | fn.#Fn
						Interval?:       int | fn.#Fn
						IntervalUnit?:   string | fn.#Fn
						Times?:          [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.If
					CrossRegionCopyRules?: [...{
						CmkArn?:     string | fn.#Fn
						CopyTags?:   bool | fn.#Fn
						Encrypted:   bool | fn.#Fn
						RetainRule?: {
							Interval:     int | fn.#Fn
							IntervalUnit: string | fn.#Fn
						} | fn.If
						TargetRegion: string | fn.#Fn
					}] | fn.If
					FastRestoreRule?: {
						AvailabilityZones?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						Count?:             int | fn.#Fn
						Interval?:          int | fn.#Fn
						IntervalUnit?:      string | fn.#Fn
					} | fn.If
					Name?:       string | fn.#Fn
					RetainRule?: {
						Count?:        int | fn.#Fn
						Interval?:     int | fn.#Fn
						IntervalUnit?: string | fn.#Fn
					} | fn.If
					TagsToAdd?: [...{
						Key:   string | fn.#Fn
						Value: string | fn.#Fn
					}] | fn.If
					VariableTags?: [...{
						Key:   string | fn.#Fn
						Value: string | fn.#Fn
					}] | fn.If
				}] | fn.If
				TargetTags: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.If
			} | fn.If
			State: ("DISABLED" | "ENABLED") | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

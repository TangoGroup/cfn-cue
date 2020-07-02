package cacentral1

import "github.com/TangoGroup/aws/fn"

DLM :: {
	LifecyclePolicy :: {
		Type:       "AWS::DLM::LifecyclePolicy"
		Properties: close({
			Description?:     string | fn.Fn
			ExecutionRoleArn: string | fn.Fn
			PolicyDetails?:   close({
				Parameters?: close({
					ExcludeBootVolume?: bool | fn.Fn
				}) | fn.If
				PolicyType?:   string | fn.Fn
				ResourceTypes: [...(("INSTANCE" | "VOLUME") | fn.Fn)] | (("INSTANCE" | "VOLUME") | fn.Fn)
				Schedules:     [...close({
					CopyTags?:   bool | fn.Fn
					CreateRule?: close({
						CronExpression?: string | fn.Fn
						Interval?:       int | fn.Fn
						IntervalUnit?:   string | fn.Fn
						Times?:          [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					CrossRegionCopyRules?: [...close({
						CmkArn?:     string | fn.Fn
						CopyTags?:   bool | fn.Fn
						Encrypted:   bool | fn.Fn
						RetainRule?: close({
							Interval:     int | fn.Fn
							IntervalUnit: string | fn.Fn
						}) | fn.If
						TargetRegion: string | fn.Fn
					})] | fn.If
					FastRestoreRule?: close({
						AvailabilityZones?: [...(string | fn.Fn)] | (string | fn.Fn)
						Count?:             int | fn.Fn
						Interval?:          int | fn.Fn
						IntervalUnit?:      string | fn.Fn
					}) | fn.If
					Name?:       string | fn.Fn
					RetainRule?: close({
						Count?:        int | fn.Fn
						Interval?:     int | fn.Fn
						IntervalUnit?: string | fn.Fn
					}) | fn.If
					TagsToAdd?: [...close({
						Key:   string | fn.Fn
						Value: string | fn.Fn
					})] | fn.If
					VariableTags?: [...close({
						Key:   string | fn.Fn
						Value: string | fn.Fn
					})] | fn.If
				})] | fn.If
				TargetTags: [...close({
					Key:   string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
			}) | fn.If
			State: ("DISABLED" | "ENABLED") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

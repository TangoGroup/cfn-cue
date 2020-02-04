package useast2

import "github.com/TangoGroup/aws/fn"

DLM :: {
	LifecyclePolicy :: {
		Type: "AWS::DLM::LifecyclePolicy"
		Properties: {
			Description?:     string | fn.Fn
			ExecutionRoleArn: string | fn.Fn
			PolicyDetails?: {
				Parameters?: ExcludeBootVolume?: bool | fn.Fn
				PolicyType?:   string | fn.Fn
				ResourceTypes: [...(("INSTANCE" | "VOLUME") | fn.Fn)] | fn.Fn
				Schedules: [...{
					CopyTags?: bool | fn.Fn
					CreateRule?: {
						Interval:     int | fn.Fn
						IntervalUnit: string | fn.Fn
						Times?:       [...(string | fn.Fn)] | fn.Fn
					}
					CrossRegionCopyRules?: [...{
						CmkArn?:    string | fn.Fn
						CopyTags?:  bool | fn.Fn
						Encrypted?: bool | fn.Fn
						RetainRule?: {
							Interval?:     int | fn.Fn
							IntervalUnit?: string | fn.Fn
						}
						TargetRegion?: string | fn.Fn
					}]
					FastRestoreRule?: {
						AvailabilityZones?: [...(string | fn.Fn)] | fn.Fn
						Count?:             int | fn.Fn
						Interval?:          int | fn.Fn
						IntervalUnit?:      string | fn.Fn
					}
					Name?: string | fn.Fn
					RetainRule?: {
						Count?:        int | fn.Fn
						Interval?:     int | fn.Fn
						IntervalUnit?: string | fn.Fn
					}
					TagsToAdd?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
					VariableTags?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				TargetTags: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}
			State: ("DISABLED" | "ENABLED") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

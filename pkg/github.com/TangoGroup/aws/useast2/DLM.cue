package useast2

import "github.com/TangoGroup/aws/fn"

DLM :: {
	LifecyclePolicy :: {
		Type:       "AWS::DLM::LifecyclePolicy"
		Properties: close({
			Description?:     string | fn.Fn
			ExecutionRoleArn: string | fn.Fn
			PolicyDetails?:   close({
				Actions?: [...close({
					CrossRegionCopy: [...close({
						EncryptionConfiguration: close({
							CmkArn?:   string | fn.Fn
							Encrypted: bool | fn.Fn
						}) | fn.If
						RetainRule?: close({
							Interval:     int | fn.Fn
							IntervalUnit: string | fn.Fn
						}) | fn.If
						Target: string | fn.Fn
					})] | fn.If
					Name: string | fn.Fn
				})] | fn.If
				EventSource?: close({
					Parameters?: close({
						DescriptionRegex?: string | fn.Fn
						EventType:         string | fn.Fn
						SnapshotOwner:     [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Type: string | fn.Fn
				}) | fn.If
				Parameters?: close({
					ExcludeBootVolume?: bool | fn.Fn
					NoReboot?:          bool | fn.Fn
				}) | fn.If
				PolicyType?:    string | fn.Fn
				ResourceTypes?: [...(("INSTANCE" | "VOLUME") | fn.Fn)] | (("INSTANCE" | "VOLUME") | fn.Fn)
				Schedules?:     [...close({
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
					ShareRules?: [...close({
						TargetAccounts?:      [...(string | fn.Fn)] | (string | fn.Fn)
						UnshareInterval?:     int | fn.Fn
						UnshareIntervalUnit?: string | fn.Fn
					})] | fn.If
					TagsToAdd?: [...close({
						Key:   string | fn.Fn
						Value: string | fn.Fn
					})] | fn.If
					VariableTags?: [...close({
						Key:   string | fn.Fn
						Value: string | fn.Fn
					})] | fn.If
				})] | fn.If
				TargetTags?: [...close({
					Key:   string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
			}) | fn.If
			State: ("DISABLED" | "ENABLED") | fn.Fn
			Tags?: [...close({
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

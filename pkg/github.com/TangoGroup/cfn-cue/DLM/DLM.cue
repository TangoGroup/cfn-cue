package DLM

import "github.com/TangoGroup/fn"

LifecyclePolicy :: {
	Type: "AWS::DLM::LifecyclePolicy"
	Properties: {
		Description?:     string | fn.Fn
		ExecutionRoleArn: string | fn.Fn
		PolicyDetails?:   propPolicyDetails
		State:            (string & ("DISABLED" | "ENABLED")) | fn.Fn
	}
	propCreateRule :: {
		Interval:     int | fn.Fn
		IntervalUnit: string | fn.Fn
		Times?: [...(string | fn.Fn)]
	}
	propFastRestoreRule :: {
		AvailabilityZones?: [...(string | fn.Fn)]
		Count: int | fn.Fn
	}
	propParameters :: {
		ExcludeBootVolume?: bool | fn.Fn
	}
	propPolicyDetails :: {
		Parameters?: propParameters
		PolicyType?: string | fn.Fn
		ResourceTypes?: [...((string & ("INSTANCE" | "VOLUME")) | fn.Fn)]
		Schedules?: [...propSchedule]
		TargetTags?: [...propTag]
	}
	propRetainRule :: {
		Count: int | fn.Fn
	}
	propSchedule :: {
		CopyTags?:        bool | fn.Fn
		CreateRule?:      propCreateRule
		FastRestoreRule?: propFastRestoreRule
		Name?:            string | fn.Fn
		RetainRule?:      propRetainRule
		TagsToAdd?: [...propTag]
		VariableTags?: [...propTag]
	}
}

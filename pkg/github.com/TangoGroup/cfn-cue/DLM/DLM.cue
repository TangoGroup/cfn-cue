package DLM

import "github.com/TangoGroup/fn"

LifecyclePolicy :: {
	Type: "AWS::DLM::LifecyclePolicy"
	Properties: {
		Description?:     string | fn.Fn
		ExecutionRoleArn: string | fn.Fn
		PolicyDetails?:   __PolicyDetails
		State:            (string & ("DISABLED" | "ENABLED")) | fn.Fn
	}
	__CreateRule :: {
		Interval:     int | fn.Fn
		IntervalUnit: string | fn.Fn
		Times?:       [...string] | fn.Fn
	}
	__FastRestoreRule :: {
		AvailabilityZones?: [...string] | fn.Fn
		Count:              int | fn.Fn
	}
	__Parameters :: {
		ExcludeBootVolume?: bool | fn.Fn
	}
	__PolicyDetails :: {
		Parameters?:    __Parameters
		PolicyType?:    string | fn.Fn
		ResourceTypes?: ([...string] & ("INSTANCE" | "VOLUME")) | fn.Fn
		Schedules?: [...__Schedule]
		TargetTags?: [...__Tag]
	}
	__RetainRule :: {
		Count: int | fn.Fn
	}
	__Schedule :: {
		CopyTags?:        bool | fn.Fn
		CreateRule?:      __CreateRule
		FastRestoreRule?: __FastRestoreRule
		Name?:            string | fn.Fn
		RetainRule?:      __RetainRule
		TagsToAdd?: [...__Tag]
		VariableTags?: [...__Tag]
	}
}

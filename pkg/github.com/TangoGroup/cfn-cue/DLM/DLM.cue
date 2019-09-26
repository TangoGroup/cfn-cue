package DLM

LifecyclePolicy :: {
	Type: "AWS::DLM::LifecyclePolicy"
	Properties: {
		Description?:     string
		ExecutionRoleArn: string
		PolicyDetails?:   __PolicyDetails
		State:            "DISABLED" | "ENABLED"
		State:            string
	}
	__CreateRule :: {
		Interval:     int
		IntervalUnit: string
		Times?: [...string]
	}
	__Parameters :: {
		ExcludeBootVolume?: bool
	}
	__PolicyDetails :: {
		Parameters?:    __Parameters
		PolicyType?:    string
		ResourceTypes?: "INSTANCE" | "VOLUME"
		ResourceTypes?: [...string]
		Schedules?: [...__Schedule]
		TargetTags?: [...__Tag]
	}
	__RetainRule :: {
		Count: int
	}
	__Schedule :: {
		CopyTags?:   bool
		CreateRule?: __CreateRule
		Name?:       string
		RetainRule?: __RetainRule
		TagsToAdd?: [...__Tag]
		VariableTags?: [...__Tag]
	}
}

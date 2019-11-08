package MediaConvert

import "github.com/TangoGroup/fn"

JobTemplate :: {
	Type: "AWS::MediaConvert::JobTemplate"
	Properties: {
		AccelerationSettings?: propAccelerationSettings
		Category?:             string | fn.Fn
		Description?:          string | fn.Fn
		Name?:                 string | fn.Fn
		Priority?:             int | fn.Fn
		Queue?:                string | fn.Fn
		SettingsJson:          {
		} | fn.Fn
		StatusUpdateInterval?: string | fn.Fn
		Tags?:                 {
		} | fn.Fn
	}
	propAccelerationSettings :: {
		Mode: string | fn.Fn
	}
}
Preset :: {
	Type: "AWS::MediaConvert::Preset"
	Properties: {
		Category?:    string | fn.Fn
		Description?: string | fn.Fn
		Name?:        string | fn.Fn
		SettingsJson: {
		} | fn.Fn
		Tags?: {
		} | fn.Fn
	}
}
Queue :: {
	Type: "AWS::MediaConvert::Queue"
	Properties: {
		Description?: string | fn.Fn
		Name?:        string | fn.Fn
		PricingPlan?: string | fn.Fn
		Status?:      string | fn.Fn
		Tags?:        {
		} | fn.Fn
	}
}

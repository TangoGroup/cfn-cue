package uswest2

import "github.com/TangoGroup/fn"

MediaConvert :: {
	JobTemplate :: {
		Type: "AWS::MediaConvert::JobTemplate"
		Properties: {
			AccelerationSettings?: Mode: string | fn.Fn
			Category?:    string | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Priority?:    int | fn.Fn
			Queue?:       string | fn.Fn
			SettingsJson: {
				[string]: _
			} | fn.Fn
			StatusUpdateInterval?: string | fn.Fn
			Tags?:                 {
				[string]: _
			} | fn.Fn
		}
		DependsOn?: string | [...string]
	}
	Preset :: {
		Type: "AWS::MediaConvert::Preset"
		Properties: {
			Category?:    string | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			SettingsJson: {
				[string]: _
			} | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?: string | [...string]
	}
	Queue :: {
		Type: "AWS::MediaConvert::Queue"
		Properties: {
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			PricingPlan?: string | fn.Fn
			Status?:      string | fn.Fn
			Tags?:        {
				[string]: _
			} | fn.Fn
		}
		DependsOn?: string | [...string]
	}
}

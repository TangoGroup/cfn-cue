package apnortheast3

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

StepFunctions :: {
	StateMachine :: {
		Type:       "AWS::StepFunctions::StateMachine"
		Properties: close({
			DefinitionS3Location?: close({
				Bucket:   string | fn.Fn
				Key:      string | fn.Fn
				Version?: string | fn.Fn
			}) | fn.If
			DefinitionString?:        (strings.MinRunes(1) & strings.MaxRunes(1048576)) | fn.Fn
			DefinitionSubstitutions?: {
				[string]: string | fn.Fn
			} | fn.If
			LoggingConfiguration?: close({
				Destinations?: [...close({
					CloudWatchLogsLogGroup?: close({
						LogGroupArn?: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
					}) | fn.If
				})] | fn.If
				IncludeExecutionData?: bool | fn.Fn
				Level?:                ("ALL" | "ERROR" | "FATAL" | "OFF") | fn.Fn
			}) | fn.If
			RoleArn:           (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			StateMachineName?: (strings.MinRunes(1) & strings.MaxRunes(80)) | fn.Fn
			StateMachineType?: ("STANDARD" | "EXPRESS") | fn.Fn
			Tags?:             [...close({
				Key:   (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
				Value: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			})] | fn.If
			TracingConfiguration?: close({
				Enabled?: bool | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

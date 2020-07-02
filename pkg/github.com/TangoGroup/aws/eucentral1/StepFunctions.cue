package eucentral1

import "github.com/TangoGroup/aws/fn"

StepFunctions :: {
	Activity :: {
		Type:       "AWS::StepFunctions::Activity"
		Properties: close({
			Name:  string | fn.Fn
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
	StateMachine :: {
		Type:       "AWS::StepFunctions::StateMachine"
		Properties: close({
			DefinitionS3Location?: close({
				Bucket:   string | fn.Fn
				Key:      string | fn.Fn
				Version?: string | fn.Fn
			}) | fn.If
			DefinitionString?:        string | fn.Fn
			DefinitionSubstitutions?: close({
			}) | fn.If
			LoggingConfiguration?: close({
				Destinations?: [...close({
					CloudWatchLogsLogGroup?: close({
						LogGroupArn: string | fn.Fn
					}) | fn.If
				})] | fn.If
				IncludeExecutionData?: bool | fn.Fn
				Level?:                string | fn.Fn
			}) | fn.If
			RoleArn:           string | fn.Fn
			StateMachineName?: string | fn.Fn
			StateMachineType?: string | fn.Fn
			Tags?:             [...close({
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

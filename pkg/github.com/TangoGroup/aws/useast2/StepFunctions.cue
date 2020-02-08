package useast2

import "github.com/TangoGroup/aws/fn"

StepFunctions :: {
	Activity :: {
		Type: "AWS::StepFunctions::Activity"
		Properties: {
			Name: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	StateMachine :: {
		Type: "AWS::StepFunctions::StateMachine"
		Properties: {
			DefinitionString: string | fn.Fn
			LoggingConfiguration?: {
				Destinations?: [...{
					CloudWatchLogsLogGroup?: LogGroupArn: string | fn.Fn
				}]
				IncludeExecutionData?: bool | fn.Fn
				Level?:                string | fn.Fn
			}
			RoleArn:           string | fn.Fn
			StateMachineName?: string | fn.Fn
			StateMachineType?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

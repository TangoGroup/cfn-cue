package uswest2

import "github.com/TangoGroup/fn"

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
		DependsOn?:      string | [...string]
		DeletionPolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	StateMachine :: {
		Type: "AWS::StepFunctions::StateMachine"
		Properties: {
			DefinitionString:  string | fn.Fn
			RoleArn:           string | fn.Fn
			StateMachineName?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:      string | [...string]
		DeletionPolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

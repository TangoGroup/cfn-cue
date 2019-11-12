package eunorth1

import "github.com/TangoGroup/fn"

StepFunctions :: {
	Activity :: {
		Type: "AWS::StepFunctions::Activity"
		Properties: {
			Name: string | fn.Fn
			Tags?: [...{
			}]
		}
	}
	StateMachine :: {
		Type: "AWS::StepFunctions::StateMachine"
		Properties: {
			DefinitionString:  string | fn.Fn
			RoleArn:           string | fn.Fn
			StateMachineName?: string | fn.Fn
			Tags?: [...{
			}]
		}
	}
}

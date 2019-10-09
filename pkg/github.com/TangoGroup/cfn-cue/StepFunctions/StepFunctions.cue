package StepFunctions

import "github.com/TangoGroup/fn"

Activity :: {
	Type: "AWS::StepFunctions::Activity"
	Properties: {
		Name: string | fn.Fn
		Tags?: [...__TagsEntry]
	}
	__TagsEntry :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
}
StateMachine :: {
	Type: "AWS::StepFunctions::StateMachine"
	Properties: {
		DefinitionString:  string | fn.Fn
		RoleArn:           string | fn.Fn
		StateMachineName?: string | fn.Fn
		Tags?: [...__TagsEntry]
	}
	__TagsEntry :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
}

package apnortheast2

import "github.com/TangoGroup/aws/fn"

#StepFunctions: {
	#Activity: {
		Type:       "AWS::StepFunctions::Activity"
		Properties: close({
			Name:  string | fn.#Fn
			Tags?: [...close({})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StateMachine: {
		Type:       "AWS::StepFunctions::StateMachine"
		Properties: close({
			DefinitionS3Location?:    close({}) | fn.If
			DefinitionString?:        string | fn.#Fn
			DefinitionSubstitutions?: close({}) | fn.If
			LoggingConfiguration?:    close({}) | fn.If
			RoleArn:                  string | fn.#Fn
			StateMachineName?:        string | fn.#Fn
			StateMachineType?:        string | fn.#Fn
			Tags?:                    [...close({})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

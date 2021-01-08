package apnortheast1

import "github.com/TangoGroup/aws/fn"

#StepFunctions: {
	#Activity: {
		Type: "AWS::StepFunctions::Activity"
		Properties: {
			Name:  string | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StateMachine: {
		Type: "AWS::StepFunctions::StateMachine"
		Properties: {
			DefinitionS3Location?: {
				Bucket:   string | fn.#Fn
				Key:      string | fn.#Fn
				Version?: string | fn.#Fn
			} | fn.#If
			DefinitionString?:        string | fn.#Fn
			DefinitionSubstitutions?: {} | fn.#If
			LoggingConfiguration?:    {
				Destinations?: [...{
					CloudWatchLogsLogGroup?: {
						LogGroupArn?: string | fn.#Fn
					} | fn.#If
				}] | fn.#If
				IncludeExecutionData?: bool | fn.#Fn
				Level?:                string | fn.#Fn
			} | fn.#If
			RoleArn:           string | fn.#Fn
			StateMachineName?: string | fn.#Fn
			StateMachineType?: string | fn.#Fn
			Tags?:             [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			TracingConfiguration?: {
				Enabled?: bool | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package usgoveast1

import "github.com/TangoGroup/aws/fn"

Batch :: {
	ComputeEnvironment :: {
		Type:       "AWS::Batch::ComputeEnvironment"
		Properties: close({
			ComputeEnvironmentName?: string | fn.Fn
			ComputeResources?:       close({
			}) | fn.If
			ServiceRole: string | fn.Fn
			State?:      string | fn.Fn
			Type:        string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	JobDefinition :: {
		Type:       "AWS::Batch::JobDefinition"
		Properties: close({
			ContainerProperties?: close({
			}) | fn.If
			JobDefinitionName?: string | fn.Fn
			NodeProperties?:    close({
			}) | fn.If
			Parameters?: {
				[string]: _
			} | fn.Fn
			RetryStrategy?: close({
			}) | fn.If
			Timeout?: close({
			}) | fn.If
			Type: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	JobQueue :: {
		Type:       "AWS::Batch::JobQueue"
		Properties: close({
			ComputeEnvironmentOrder: [...close({
			})] | fn.If
			JobQueueName?: string | fn.Fn
			Priority:      int | fn.Fn
			State?:        string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

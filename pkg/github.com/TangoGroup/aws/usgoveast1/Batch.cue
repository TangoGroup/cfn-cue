package usgoveast1

import "github.com/TangoGroup/aws/fn"

Batch :: {
	ComputeEnvironment :: {
		Type: "AWS::Batch::ComputeEnvironment"
		Properties: {
			ComputeEnvironmentName?: string | fn.Fn
			ComputeResources?:       {
			} | fn.If
			ServiceRole: string | fn.Fn
			State?:      string | fn.Fn
			Type:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	JobDefinition :: {
		Type: "AWS::Batch::JobDefinition"
		Properties: {
			ContainerProperties?: {
			} | fn.If
			JobDefinitionName?: string | fn.Fn
			NodeProperties?:    {
			} | fn.If
			Parameters?: {
				[string]: _
			} | fn.Fn
			RetryStrategy?: {
			} | fn.If
			Timeout?: {
			} | fn.If
			Type: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	JobQueue :: {
		Type: "AWS::Batch::JobQueue"
		Properties: {
			ComputeEnvironmentOrder: [...{
			}] | fn.If
			JobQueueName?: string | fn.Fn
			Priority:      int | fn.Fn
			State?:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

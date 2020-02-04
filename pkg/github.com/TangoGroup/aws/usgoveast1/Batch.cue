package usgoveast1

import "github.com/TangoGroup/aws/fn"

Batch :: {
	ComputeEnvironment :: {
		Type: "AWS::Batch::ComputeEnvironment"
		Properties: {
			ComputeEnvironmentName?: string | fn.Fn
			ComputeResources?: {
			}
			ServiceRole: string | fn.Fn
			State?:      string | fn.Fn
			Type:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	JobDefinition :: {
		Type: "AWS::Batch::JobDefinition"
		Properties: {
			ContainerProperties?: {
			}
			JobDefinitionName?: string | fn.Fn
			NodeProperties?: {
			}
			Parameters?: {
				[string]: _
			} | fn.Fn
			RetryStrategy?: {
			}
			Timeout?: {
			}
			Type: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	JobQueue :: {
		Type: "AWS::Batch::JobQueue"
		Properties: {
			ComputeEnvironmentOrder: [...{
			}]
			JobQueueName?: string | fn.Fn
			Priority:      int | fn.Fn
			State?:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

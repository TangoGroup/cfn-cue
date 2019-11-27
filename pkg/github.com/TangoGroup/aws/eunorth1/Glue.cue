package eunorth1

import "github.com/TangoGroup/aws/fn"

Glue :: {
	Job :: {
		Type: "AWS::Glue::Job"
		Properties: {
			AllocatedCapacity?: float | fn.Fn
			Command: {
				Name?:           string | fn.Fn
				ScriptLocation?: string | fn.Fn
			}
			Connections?: Connections?: [...(string | fn.Fn)] | fn.Fn
			DefaultArguments?: {
				[string]: _
			} | fn.Fn
			Description?: string | fn.Fn
			ExecutionProperty?: MaxConcurrentRuns?: float | fn.Fn
			LogUri?:                string | fn.Fn
			MaxRetries?:            float | fn.Fn
			Name?:                  string | fn.Fn
			Role:                   string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			Tags?:                  {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Trigger :: {
		Type: "AWS::Glue::Trigger"
		Properties: {
			Actions: [...{
				Arguments?: {
					[string]: _
				} | fn.Fn
				JobName?:               string | fn.Fn
				SecurityConfiguration?: string | fn.Fn
			}]
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Predicate?: {
				Conditions?: [...{
					JobName?:         string | fn.Fn
					LogicalOperator?: (string & ("EQUALS")) | fn.Fn
					State?:           (string & ("SUCCEEDED")) | fn.Fn
				}]
				Logical?: (string & ("AND")) | fn.Fn
			}
			Schedule?: string | fn.Fn
			Tags?:     {
				[string]: _
			} | fn.Fn
			Type: (string & ("CONDITIONAL" | "ON_DEMAND" | "SCHEDULED")) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

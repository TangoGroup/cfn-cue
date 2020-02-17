package eunorth1

import "github.com/TangoGroup/aws/fn"

Glue :: {
	Job :: {
		Type: "AWS::Glue::Job"
		Properties: {
			AllocatedCapacity?: number | fn.Fn
			Command:            {
				Name?:           string | fn.Fn
				ScriptLocation?: string | fn.Fn
			} | fn.If
			Connections?: {
				Connections?: [...(string | fn.Fn)] | (string | fn.Fn)
			} | fn.If
			DefaultArguments?: {
				[string]: _
			} | fn.Fn
			Description?:       string | fn.Fn
			ExecutionProperty?: {
				MaxConcurrentRuns?: number | fn.Fn
			} | fn.If
			LogUri?:                string | fn.Fn
			MaxRetries?:            number | fn.Fn
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
		Condition?: string
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
			}] | fn.If
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Predicate?:   {
				Conditions?: [...{
					JobName?:         string | fn.Fn
					LogicalOperator?: ("EQUALS") | fn.Fn
					State?:           ("SUCCEEDED") | fn.Fn
				}] | fn.If
				Logical?: ("AND") | fn.Fn
			} | fn.If
			Schedule?: string | fn.Fn
			Tags?:     {
				[string]: _
			} | fn.Fn
			Type: ("CONDITIONAL" | "ON_DEMAND" | "SCHEDULED") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

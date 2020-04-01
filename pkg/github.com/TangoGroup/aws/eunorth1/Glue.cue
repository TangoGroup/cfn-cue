package eunorth1

import "github.com/TangoGroup/aws/fn"

Glue :: {
	Job :: {
		Type:       "AWS::Glue::Job"
		Properties: close({
			AllocatedCapacity?: number | fn.Fn
			Command:            close({
				Name?:           string | fn.Fn
				PythonVersion?:  string | fn.Fn
				ScriptLocation?: string | fn.Fn
			}) | fn.If
			Connections?: close({
				Connections?: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			DefaultArguments?: {
				[string]: _
			} | fn.Fn
			Description?:       string | fn.Fn
			ExecutionProperty?: close({
				MaxConcurrentRuns?: number | fn.Fn
			}) | fn.If
			GlueVersion?:          string | fn.Fn
			LogUri?:               string | fn.Fn
			MaxCapacity?:          number | fn.Fn
			MaxRetries?:           number | fn.Fn
			Name?:                 string | fn.Fn
			NotificationProperty?: close({
				NotifyDelayAfter?: int | fn.Fn
			}) | fn.If
			NumberOfWorkers?:       (>=0 & <=299) | fn.Fn
			Role:                   string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			Tags?:                  {
				[string]: _
			} | fn.Fn
			Timeout?:    int | fn.Fn
			WorkerType?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Trigger :: {
		Type:       "AWS::Glue::Trigger"
		Properties: close({
			Actions: [...close({
				Arguments?: {
					[string]: _
				} | fn.Fn
				CrawlerName?:          string | fn.Fn
				JobName?:              string | fn.Fn
				NotificationProperty?: close({
					NotifyDelayAfter?: int | fn.Fn
				}) | fn.If
				SecurityConfiguration?: string | fn.Fn
				Timeout?:               int | fn.Fn
			})] | fn.If
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Predicate?:   close({
				Conditions?: [...close({
					CrawlState?:      string | fn.Fn
					CrawlerName?:     string | fn.Fn
					JobName?:         string | fn.Fn
					LogicalOperator?: ("EQUALS") | fn.Fn
					State?:           ("SUCCEEDED") | fn.Fn
				})] | fn.If
				Logical?: ("AND") | fn.Fn
			}) | fn.If
			Schedule?:        string | fn.Fn
			StartOnCreation?: bool | fn.Fn
			Tags?:            {
				[string]: _
			} | fn.Fn
			Type:          ("CONDITIONAL" | "ON_DEMAND" | "SCHEDULED") | fn.Fn
			WorkflowName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

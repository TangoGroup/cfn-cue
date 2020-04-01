package apnortheast3

import "github.com/TangoGroup/aws/fn"

DataPipeline :: {
	Pipeline :: {
		Type:       "AWS::DataPipeline::Pipeline"
		Properties: close({
			Activate?:        bool | fn.Fn
			Description?:     string | fn.Fn
			Name:             string | fn.Fn
			ParameterObjects: [...close({
				Attributes: [...close({
					Key:         string | fn.Fn
					StringValue: string | fn.Fn
				})] | fn.If
				Id: string | fn.Fn
			})] | fn.If
			ParameterValues?: [...close({
				Id:          string | fn.Fn
				StringValue: string | fn.Fn
			})] | fn.If
			PipelineObjects?: [...close({
				Fields: [...close({
					Key:          string | fn.Fn
					RefValue?:    string | fn.Fn
					StringValue?: string | fn.Fn
				})] | fn.If
				Id:   string | fn.Fn
				Name: string | fn.Fn
			})] | fn.If
			PipelineTags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

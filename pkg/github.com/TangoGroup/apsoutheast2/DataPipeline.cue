package apsoutheast2

import "github.com/TangoGroup/fn"

DataPipeline :: {
	Pipeline :: {
		Type: "AWS::DataPipeline::Pipeline"
		Properties: {
			Activate?:    bool | fn.Fn
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			ParameterObjects: [...{
				Attributes: [...{
					Key:         string | fn.Fn
					StringValue: string | fn.Fn
				}]
				Id: string | fn.Fn
			}]
			ParameterValues?: [...{
				Id:          string | fn.Fn
				StringValue: string | fn.Fn
			}]
			PipelineObjects?: [...{
				Fields: [...{
					Key:          string | fn.Fn
					RefValue?:    string | fn.Fn
					StringValue?: string | fn.Fn
				}]
				Id:   string | fn.Fn
				Name: string | fn.Fn
			}]
			PipelineTags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
	}
}

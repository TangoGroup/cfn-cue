package DataPipeline

import "github.com/TangoGroup/fn"

Pipeline :: {
	Type: "AWS::DataPipeline::Pipeline"
	Properties: {
		Activate?:    bool | fn.Fn
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		ParameterObjects: [...propParameterObject]
		ParameterValues?: [...propParameterValue]
		PipelineObjects?: [...propPipelineObject]
		PipelineTags?: [...propPipelineTag]
	}
	propField :: {
		Key:          string | fn.Fn
		RefValue?:    string | fn.Fn
		StringValue?: string | fn.Fn
	}
	propParameterAttribute :: {
		Key:         string | fn.Fn
		StringValue: string | fn.Fn
	}
	propParameterObject :: {
		Attributes: [...propParameterAttribute]
		Id: string | fn.Fn
	}
	propParameterValue :: {
		Id:          string | fn.Fn
		StringValue: string | fn.Fn
	}
	propPipelineObject :: {
		Fields: [...propField]
		Id:   string | fn.Fn
		Name: string | fn.Fn
	}
	propPipelineTag :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
}

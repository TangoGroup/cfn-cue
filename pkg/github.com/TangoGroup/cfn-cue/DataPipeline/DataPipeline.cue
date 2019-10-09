package DataPipeline

import "github.com/TangoGroup/fn"

Pipeline :: {
	Type: "AWS::DataPipeline::Pipeline"
	Properties: {
		Activate?:    bool | fn.Fn
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		ParameterObjects: [...__ParameterObject]
		ParameterValues?: [...__ParameterValue]
		PipelineObjects?: [...__PipelineObject]
		PipelineTags?: [...__PipelineTag]
	}
	__Field :: {
		Key:          string | fn.Fn
		RefValue?:    string | fn.Fn
		StringValue?: string | fn.Fn
	}
	__ParameterAttribute :: {
		Key:         string | fn.Fn
		StringValue: string | fn.Fn
	}
	__ParameterObject :: {
		Attributes: [...__ParameterAttribute]
		Id: string | fn.Fn
	}
	__ParameterValue :: {
		Id:          string | fn.Fn
		StringValue: string | fn.Fn
	}
	__PipelineObject :: {
		Fields: [...__Field]
		Id:   string | fn.Fn
		Name: string | fn.Fn
	}
	__PipelineTag :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
}

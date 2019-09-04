package DataPipeline

Pipeline :: {
  Type: "AWS::DataPipeline::Pipeline"
  Properties: {
    Activate?:    bool
    Description?: string
    Name:         string
    ParameterObjects: [...__ParameterObject]
    ParameterValues?: [...__ParameterValue]
    PipelineObjects?: [...__PipelineObject]
    PipelineTags?: [...__PipelineTag]
  }
  __Field = {
    Key:          string
    RefValue?:    string
    StringValue?: string
  }
  __ParameterAttribute = {
    Key:         string
    StringValue: string
  }
  __ParameterObject = {
    Attributes: [...__ParameterAttribute]
    Id: string
  }
  __ParameterValue = {
    Id:          string
    StringValue: string
  }
  __PipelineObject = {
    Fields: [...__Field]
    Id:   string
    Name: string
  }
  __PipelineTag = {
    Key:   string
    Value: string
  }
}

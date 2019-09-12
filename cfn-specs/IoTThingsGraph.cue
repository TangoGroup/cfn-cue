package IoTThingsGraph

FlowTemplate :: {
	Type: "AWS::IoTThingsGraph::FlowTemplate"
	Properties: {
		CompatibleNamespaceVersion?: float
		Definition:                  __DefinitionDocument
	}
	__DefinitionDocument = {
		Language: string
		Text:     string
	}
}

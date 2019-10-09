package IoTThingsGraph

import "github.com/TangoGroup/fn"

FlowTemplate :: {
	Type: "AWS::IoTThingsGraph::FlowTemplate"
	Properties: {
		CompatibleNamespaceVersion?: float | fn.Fn
		Definition:                  __DefinitionDocument
	}
	__DefinitionDocument :: {
		Language: string | fn.Fn
		Text:     string | fn.Fn
	}
}

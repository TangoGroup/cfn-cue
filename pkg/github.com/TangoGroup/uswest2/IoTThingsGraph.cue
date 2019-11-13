package uswest2

import "github.com/TangoGroup/fn"

IoTThingsGraph :: {
	FlowTemplate :: {
		Type: "AWS::IoTThingsGraph::FlowTemplate"
		Properties: {
			CompatibleNamespaceVersion?: float | fn.Fn
			Definition: {
				Language: string | fn.Fn
				Text:     string | fn.Fn
			}
		}
		DependsOn?: string | [...string]
	}
}

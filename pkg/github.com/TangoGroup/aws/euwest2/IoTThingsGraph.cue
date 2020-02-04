package euwest2

import "github.com/TangoGroup/aws/fn"

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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

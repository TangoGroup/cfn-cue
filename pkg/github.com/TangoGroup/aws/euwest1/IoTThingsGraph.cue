package euwest1

import "github.com/TangoGroup/aws/fn"

IoTThingsGraph :: {
	FlowTemplate :: {
		Type: "AWS::IoTThingsGraph::FlowTemplate"
		Properties: {
			CompatibleNamespaceVersion?: number | fn.Fn
			Definition:                  close({
				Language: string | fn.Fn
				Text:     string | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

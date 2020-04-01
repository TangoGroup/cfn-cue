package eucentral1

import "github.com/TangoGroup/aws/fn"

IoT1Click :: {
	Device :: {
		Type:       "AWS::IoT1Click::Device"
		Properties: close({
			DeviceId: string | fn.Fn
			Enabled:  bool | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Placement :: {
		Type:       "AWS::IoT1Click::Placement"
		Properties: close({
			AssociatedDevices?: {
				[string]: _
			} | fn.Fn
			Attributes?: {
				[string]: _
			} | fn.Fn
			PlacementName?: string | fn.Fn
			ProjectName:    string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Project :: {
		Type:       "AWS::IoT1Click::Project"
		Properties: close({
			Description?:      string | fn.Fn
			PlacementTemplate: close({
				DefaultAttributes?: {
					[string]: _
				} | fn.Fn
				DeviceTemplates?: {
					[string]: _
				} | fn.Fn
			}) | fn.If
			ProjectName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

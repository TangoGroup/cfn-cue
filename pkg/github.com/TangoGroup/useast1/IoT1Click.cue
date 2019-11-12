package useast1

import "github.com/TangoGroup/fn"

IoT1Click :: {
	Device :: {
		Type: "AWS::IoT1Click::Device"
		Properties: {
			DeviceId: string | fn.Fn
			Enabled:  bool | fn.Fn
		}
	}
	Placement :: {
		Type: "AWS::IoT1Click::Placement"
		Properties: {
			AssociatedDevices?: {
				[string]: _
			} | fn.Fn
			Attributes?: {
				[string]: _
			} | fn.Fn
			PlacementName?: string | fn.Fn
			ProjectName:    string | fn.Fn
		}
	}
	Project :: {
		Type: "AWS::IoT1Click::Project"
		Properties: {
			Description?: string | fn.Fn
			PlacementTemplate: {
				DefaultAttributes?: {
					[string]: _
				} | fn.Fn
				DeviceTemplates?: {
					[string]: _
				} | fn.Fn
			}
			ProjectName?: string | fn.Fn
		}
	}
}

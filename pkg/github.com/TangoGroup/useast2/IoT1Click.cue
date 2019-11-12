package useast2

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
			} | fn.Fn
			Attributes?: {
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
				} | fn.Fn
				DeviceTemplates?: {
				} | fn.Fn
			}
			ProjectName?: string | fn.Fn
		}
	}
}

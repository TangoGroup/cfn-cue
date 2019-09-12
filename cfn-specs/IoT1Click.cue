package IoT1Click

Device :: {
	Type: "AWS::IoT1Click::Device"
	Properties: {
		DeviceId: string
		Enabled:  bool
	}
}
Placement :: {
	Type: "AWS::IoT1Click::Placement"
	Properties: {
		AssociatedDevices?: {
		}
		Attributes?: {
		}
		PlacementName?: string
		ProjectName:    string
	}
}
Project :: {
	Type: "AWS::IoT1Click::Project"
	Properties: {
		Description?:      string
		PlacementTemplate: __PlacementTemplate
		ProjectName?:      string
	}
	__DeviceTemplate = {
		CallbackOverrides?: {
		}
		DeviceType?: string
	}
	__PlacementTemplate = {
		DefaultAttributes?: {
		}
		DeviceTemplates?: {
		}
	}
}

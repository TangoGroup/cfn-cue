package eucentral1

import "github.com/TangoGroup/aws/fn"

#IoTSiteWise: {
	#Asset: {
		Type:       "AWS::IoTSiteWise::Asset"
		Properties: close({
			AssetHierarchies?: [...close({
				ChildAssetId: string | fn.#Fn
				LogicalId:    string | fn.#Fn
			})] | fn.If
			AssetModelId:     string | fn.#Fn
			AssetName:        string | fn.#Fn
			AssetProperties?: [...close({
				Alias?:             string | fn.#Fn
				LogicalId:          string | fn.#Fn
				NotificationState?: string | fn.#Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#AssetModel: {
		Type:       "AWS::IoTSiteWise::AssetModel"
		Properties: close({
			AssetModelDescription?: string | fn.#Fn
			AssetModelHierarchies?: [...close({
				ChildAssetModelId: string | fn.#Fn
				LogicalId:         string | fn.#Fn
				Name:              string | fn.#Fn
			})] | fn.If
			AssetModelName:        string | fn.#Fn
			AssetModelProperties?: [...close({
				DataType:  string | fn.#Fn
				LogicalId: string | fn.#Fn
				Name:      string | fn.#Fn
				Type:      close({
					Attribute?: close({
						DefaultValue?: string | fn.#Fn
					}) | fn.If
					Metric?: close({
						Expression: string | fn.#Fn
						Variables:  [...close({
							Name:  string | fn.#Fn
							Value: close({
								HierarchyLogicalId?: string | fn.#Fn
								PropertyLogicalId:   string | fn.#Fn
							}) | fn.If
						})] | fn.If
						Window: close({
							Tumbling?: close({
								Interval: string | fn.#Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					Transform?: close({
						Expression: string | fn.#Fn
						Variables:  [...close({
							Name:  string | fn.#Fn
							Value: close({
								HierarchyLogicalId?: string | fn.#Fn
								PropertyLogicalId:   string | fn.#Fn
							}) | fn.If
						})] | fn.If
					}) | fn.If
					TypeName: string | fn.#Fn
				}) | fn.If
				Unit?: string | fn.#Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Gateway: {
		Type:       "AWS::IoTSiteWise::Gateway"
		Properties: close({
			GatewayCapabilitySummaries?: [...close({
				CapabilityConfiguration?: string | fn.#Fn
				CapabilityNamespace:      string | fn.#Fn
			})] | fn.If
			GatewayName:     string | fn.#Fn
			GatewayPlatform: close({
				Greengrass: close({
					GroupArn: string | fn.#Fn
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package uswest2

import "github.com/TangoGroup/aws/fn"

#IoTSiteWise: {
	#Asset: {
		Type: "AWS::IoTSiteWise::Asset"
		Properties: {
			AssetHierarchies?: [...{
				ChildAssetId: string | fn.#Fn
				LogicalId:    string | fn.#Fn
			}] | fn.If
			AssetModelId:     string | fn.#Fn
			AssetName:        string | fn.#Fn
			AssetProperties?: [...{
				Alias?:             string | fn.#Fn
				LogicalId:          string | fn.#Fn
				NotificationState?: string | fn.#Fn
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#AssetModel: {
		Type: "AWS::IoTSiteWise::AssetModel"
		Properties: {
			AssetModelDescription?: string | fn.#Fn
			AssetModelHierarchies?: [...{
				ChildAssetModelId: string | fn.#Fn
				LogicalId:         string | fn.#Fn
				Name:              string | fn.#Fn
			}] | fn.If
			AssetModelName:        string | fn.#Fn
			AssetModelProperties?: [...{
				DataType:  string | fn.#Fn
				LogicalId: string | fn.#Fn
				Name:      string | fn.#Fn
				Type:      {
					Attribute?: {
						DefaultValue?: string | fn.#Fn
					} | fn.If
					Metric?: {
						Expression: string | fn.#Fn
						Variables:  [...{
							Name:  string | fn.#Fn
							Value: {
								HierarchyLogicalId?: string | fn.#Fn
								PropertyLogicalId:   string | fn.#Fn
							} | fn.If
						}] | fn.If
						Window: {
							Tumbling?: {
								Interval: string | fn.#Fn
							} | fn.If
						} | fn.If
					} | fn.If
					Transform?: {
						Expression: string | fn.#Fn
						Variables:  [...{
							Name:  string | fn.#Fn
							Value: {
								HierarchyLogicalId?: string | fn.#Fn
								PropertyLogicalId:   string | fn.#Fn
							} | fn.If
						}] | fn.If
					} | fn.If
					TypeName: string | fn.#Fn
				} | fn.If
				Unit?: string | fn.#Fn
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Gateway: {
		Type: "AWS::IoTSiteWise::Gateway"
		Properties: {
			GatewayCapabilitySummaries?: [...{
				CapabilityConfiguration?: string | fn.#Fn
				CapabilityNamespace:      string | fn.#Fn
			}] | fn.If
			GatewayName:     string | fn.#Fn
			GatewayPlatform: {
				Greengrass: {
					GroupArn: string | fn.#Fn
				} | fn.If
			} | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

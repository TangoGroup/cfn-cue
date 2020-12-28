package euwest1

import "github.com/TangoGroup/aws/fn"

IoTSiteWise :: {
	AccessPolicy :: {
		Type:       "AWS::IoTSiteWise::AccessPolicy"
		Properties: close({
			AccessPolicyIdentity: close({
				User?: close({
					id?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			AccessPolicyPermission: string | fn.Fn
			AccessPolicyResource:   close({
				Portal?: close({
					id?: string | fn.Fn
				}) | fn.If
				Project?: close({
					id?: string | fn.Fn
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Asset :: {
		Type:       "AWS::IoTSiteWise::Asset"
		Properties: close({
			AssetHierarchies?: [...close({
				ChildAssetId: string | fn.Fn
				LogicalId:    string | fn.Fn
			})] | fn.If
			AssetModelId:     string | fn.Fn
			AssetName:        string | fn.Fn
			AssetProperties?: [...close({
				Alias?:             string | fn.Fn
				LogicalId:          string | fn.Fn
				NotificationState?: string | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	AssetModel :: {
		Type:       "AWS::IoTSiteWise::AssetModel"
		Properties: close({
			AssetModelDescription?: string | fn.Fn
			AssetModelHierarchies?: [...close({
				ChildAssetModelId: string | fn.Fn
				LogicalId:         string | fn.Fn
				Name:              string | fn.Fn
			})] | fn.If
			AssetModelName:        string | fn.Fn
			AssetModelProperties?: [...close({
				DataType:  string | fn.Fn
				LogicalId: string | fn.Fn
				Name:      string | fn.Fn
				Type:      close({
					Attribute?: close({
						DefaultValue?: string | fn.Fn
					}) | fn.If
					Metric?: close({
						Expression: string | fn.Fn
						Variables:  [...close({
							Name:  string | fn.Fn
							Value: close({
								HierarchyLogicalId?: string | fn.Fn
								PropertyLogicalId:   string | fn.Fn
							}) | fn.If
						})] | fn.If
						Window: close({
							Tumbling?: close({
								Interval: string | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					Transform?: close({
						Expression: string | fn.Fn
						Variables:  [...close({
							Name:  string | fn.Fn
							Value: close({
								HierarchyLogicalId?: string | fn.Fn
								PropertyLogicalId:   string | fn.Fn
							}) | fn.If
						})] | fn.If
					}) | fn.If
					TypeName: string | fn.Fn
				}) | fn.If
				Unit?: string | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Dashboard :: {
		Type:       "AWS::IoTSiteWise::Dashboard"
		Properties: close({
			DashboardDefinition:  string | fn.Fn
			DashboardDescription: string | fn.Fn
			DashboardName:        string | fn.Fn
			ProjectId?:           string | fn.Fn
			Tags?:                [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Gateway :: {
		Type:       "AWS::IoTSiteWise::Gateway"
		Properties: close({
			GatewayCapabilitySummaries?: [...close({
				CapabilityConfiguration?: string | fn.Fn
				CapabilityNamespace:      string | fn.Fn
			})] | fn.If
			GatewayName:     string | fn.Fn
			GatewayPlatform: close({
				Greengrass: close({
					GroupArn: string | fn.Fn
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Portal :: {
		Type:       "AWS::IoTSiteWise::Portal"
		Properties: close({
			PortalContactEmail: string | fn.Fn
			PortalDescription?: string | fn.Fn
			PortalName:         string | fn.Fn
			RoleArn:            string | fn.Fn
			Tags?:              [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Project :: {
		Type:       "AWS::IoTSiteWise::Project"
		Properties: close({
			PortalId:            string | fn.Fn
			ProjectDescription?: string | fn.Fn
			ProjectName:         string | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package uswest2

import "github.com/TangoGroup/aws/fn"

#IoTSiteWise: {
	#AccessPolicy: {
		Type: "AWS::IoTSiteWise::AccessPolicy"
		Properties: {
			AccessPolicyIdentity: {
				User?: {
					id?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			AccessPolicyPermission: string | fn.#Fn
			AccessPolicyResource:   {
				Portal?: {
					id?: string | fn.#Fn
				} | fn.#If
				Project?: {
					id?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Asset: {
		Type: "AWS::IoTSiteWise::Asset"
		Properties: {
			AssetHierarchies?: [...{
				ChildAssetId: string | fn.#Fn
				LogicalId:    string | fn.#Fn
			}] | fn.#If
			AssetModelId:     string | fn.#Fn
			AssetName:        string | fn.#Fn
			AssetProperties?: [...{
				Alias?:             string | fn.#Fn
				LogicalId:          string | fn.#Fn
				NotificationState?: string | fn.#Fn
			}] | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
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
			}] | fn.#If
			AssetModelName:        string | fn.#Fn
			AssetModelProperties?: [...{
				DataType:  string | fn.#Fn
				LogicalId: string | fn.#Fn
				Name:      string | fn.#Fn
				Type:      {
					Attribute?: {
						DefaultValue?: string | fn.#Fn
					} | fn.#If
					Metric?: {
						Expression: string | fn.#Fn
						Variables:  [...{
							Name:  string | fn.#Fn
							Value: {
								HierarchyLogicalId?: string | fn.#Fn
								PropertyLogicalId:   string | fn.#Fn
							} | fn.#If
						}] | fn.#If
						Window: {
							Tumbling?: {
								Interval: string | fn.#Fn
							} | fn.#If
						} | fn.#If
					} | fn.#If
					Transform?: {
						Expression: string | fn.#Fn
						Variables:  [...{
							Name:  string | fn.#Fn
							Value: {
								HierarchyLogicalId?: string | fn.#Fn
								PropertyLogicalId:   string | fn.#Fn
							} | fn.#If
						}] | fn.#If
					} | fn.#If
					TypeName: string | fn.#Fn
				} | fn.#If
				Unit?: string | fn.#Fn
			}] | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Dashboard: {
		Type: "AWS::IoTSiteWise::Dashboard"
		Properties: {
			DashboardDefinition:  string | fn.#Fn
			DashboardDescription: string | fn.#Fn
			DashboardName:        string | fn.#Fn
			ProjectId?:           string | fn.#Fn
			Tags?:                [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
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
			}] | fn.#If
			GatewayName:     string | fn.#Fn
			GatewayPlatform: {
				Greengrass: {
					GroupArn: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Portal: {
		Type: "AWS::IoTSiteWise::Portal"
		Properties: {
			PortalContactEmail: string | fn.#Fn
			PortalDescription?: string | fn.#Fn
			PortalName:         string | fn.#Fn
			RoleArn:            string | fn.#Fn
			Tags?:              [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Project: {
		Type: "AWS::IoTSiteWise::Project"
		Properties: {
			PortalId:            string | fn.#Fn
			ProjectDescription?: string | fn.#Fn
			ProjectName:         string | fn.#Fn
			Tags?:               [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

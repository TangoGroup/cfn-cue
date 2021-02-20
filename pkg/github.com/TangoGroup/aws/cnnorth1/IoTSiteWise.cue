package cnnorth1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

IoTSiteWise :: {
	Asset :: {
		Type:       "AWS::IoTSiteWise::Asset"
		Properties: close({
			AssetHierarchies?: [...close({
				ChildAssetId: (=~#"^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"#) | fn.Fn
				LogicalId:    (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
			})] | fn.If
			AssetModelId:     (=~#"^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"#) | fn.Fn
			AssetName:        (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
			AssetProperties?: [...close({
				Alias?:             (strings.MinRunes(1) & strings.MaxRunes(1000) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
				LogicalId:          (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
				NotificationState?: ("ENABLED" | "DISABLED") | fn.Fn
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
			AssetModelDescription?: (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
			AssetModelHierarchies?: [...close({
				ChildAssetModelId: (=~#"^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"#) | fn.Fn
				LogicalId:         (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
				Name:              (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
			})] | fn.If
			AssetModelName:        (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
			AssetModelProperties?: [...close({
				DataType:  ("STRING" | "INTEGER" | "DOUBLE" | "BOOLEAN") | fn.Fn
				LogicalId: (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
				Name:      (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
				Type:      close({
					Attribute?: close({
						DefaultValue?: (strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
					}) | fn.If
					Metric?: close({
						Expression: (strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^[a-z0-9._+\-*%/^, ()]+$"#)) | fn.Fn
						Variables:  [...close({
							Name:  (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-z][a-z0-9_]*$"#)) | fn.Fn
							Value: close({
								HierarchyLogicalId?: (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
								PropertyLogicalId:   (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
							}) | fn.If
						})] | fn.If
						Window: close({
							Tumbling?: close({
								Interval: ("1w" | "1d" | "1h" | "15m" | "5m" | "1m") | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					Transform?: close({
						Expression: (strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^[a-z0-9._+\-*%/^, ()]+$"#)) | fn.Fn
						Variables:  [...close({
							Name:  (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-z][a-z0-9_]*$"#)) | fn.Fn
							Value: close({
								HierarchyLogicalId?: (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
								PropertyLogicalId:   (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
							}) | fn.If
						})] | fn.If
					}) | fn.If
					TypeName: ("Measurement" | "Attribute" | "Transform" | "Metric") | fn.Fn
				}) | fn.If
				Unit?: (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
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
	Gateway :: {
		Type:       "AWS::IoTSiteWise::Gateway"
		Properties: close({
			GatewayCapabilitySummaries?: [...close({
				CapabilityConfiguration?: (strings.MinRunes(1) & strings.MaxRunes(204800)) | fn.Fn
				CapabilityNamespace:      (=~#"^[a-zA-Z]+:[a-zA-Z]+:[0-9]+$"#) | fn.Fn
			})] | fn.If
			GatewayName:     (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[^\u0000-\u001F\u007F]+"#)) | fn.Fn
			GatewayPlatform: close({
				Greengrass: close({
					GroupArn: (strings.MinRunes(1) & strings.MaxRunes(1600)) | fn.Fn
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
}
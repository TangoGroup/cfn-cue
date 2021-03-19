package apeast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

S3ObjectLambda :: {
	AccessPoint :: {
		Type:       "AWS::S3ObjectLambda::AccessPoint"
		Properties: close({
			Name:                       (strings.MinRunes(3) & strings.MaxRunes(45) & (=~#"^[a-z0-9]([a-z0-9\-]*[a-z0-9])?$"#)) | fn.Fn
			ObjectLambdaConfiguration?: close({
				AllowedFeatures?:             [...(string | fn.Fn)] | (string | fn.Fn)
				CloudWatchMetricsEnabled?:    bool | fn.Fn
				SupportingAccessPoint:        (strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.Fn
				TransformationConfigurations: [...close({
					Actions?:               [...(string | fn.Fn)] | (string | fn.Fn)
					ContentTransformation?: {
						[string]: _
					} | fn.Fn
				})] | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	AccessPointPolicy :: {
		Type:       "AWS::S3ObjectLambda::AccessPointPolicy"
		Properties: close({
			ObjectLambdaAccessPoint: (strings.MinRunes(3) & strings.MaxRunes(45) & (=~#"^[a-z0-9]([a-z0-9\-]*[a-z0-9])?$"#)) | fn.Fn
			PolicyDocument:          {
				[string]: _
				Version:  string | *"2012-10-17"
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

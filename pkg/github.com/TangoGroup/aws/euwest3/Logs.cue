package euwest3

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Logs :: {
	Destination :: {
		Type:       "AWS::Logs::Destination"
		Properties: close({
			DestinationName:   string | fn.Fn
			DestinationPolicy: string | fn.Fn
			RoleArn:           string | fn.Fn
			TargetArn:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LogGroup :: {
		Type:       "AWS::Logs::LogGroup"
		Properties: close({
			KmsKeyId?:        (=~#"^arn:[a-z0-9-]+:kms:[a-z0-9-]+:\d{12}:(key|alias)/.+\Z"#) | fn.Fn
			LogGroupName?:    (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"^[.\-_/#A-Za-z0-9]{1,512}\Z"#)) | fn.Fn
			RetentionInDays?: (1 | 3 | 5 | 7 | 14 | 30 | 60 | 90 | 120 | 150 | 180 | 365 | 400 | 545 | 731 | 1827 | 3653) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LogStream :: {
		Type:       "AWS::Logs::LogStream"
		Properties: close({
			LogGroupName:   string | fn.Fn
			LogStreamName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MetricFilter :: {
		Type:       "AWS::Logs::MetricFilter"
		Properties: close({
			FilterPattern:         string | fn.Fn
			LogGroupName:          string | fn.Fn
			MetricTransformations: [...close({
				DefaultValue?:   number | fn.Fn
				MetricName:      string | fn.Fn
				MetricNamespace: string | fn.Fn
				MetricValue:     (=~#"^(([0-9]*)|(\$.*))$"#) | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	QueryDefinition :: {
		Type:       "AWS::Logs::QueryDefinition"
		Properties: close({
			LogGroupNames?: [...((strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn)
			Name:           (strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"^([^:*\/]+\/?)*[^:*\/]+$"#)) | fn.Fn
			QueryString:    (strings.MinRunes(1) & strings.MaxRunes(10000)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SubscriptionFilter :: {
		Type:       "AWS::Logs::SubscriptionFilter"
		Properties: close({
			DestinationArn: string | fn.Fn
			FilterPattern:  string | fn.Fn
			LogGroupName:   string | fn.Fn
			RoleArn?:       string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

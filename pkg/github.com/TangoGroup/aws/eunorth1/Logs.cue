package eunorth1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

#Logs: {
	#Destination: {
		Type: "AWS::Logs::Destination"
		Properties: {
			DestinationName:   string | fn.#Fn
			DestinationPolicy: string | fn.#Fn
			RoleArn:           string | fn.#Fn
			TargetArn:         string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LogGroup: {
		Type: "AWS::Logs::LogGroup"
		Properties: {
			KmsKeyId?:        string | fn.#Fn
			LogGroupName?:    (strings.MinRunes(1) & strings.MaxRunes(512)) | fn.#Fn
			RetentionInDays?: (1 | 3 | 5 | 7 | 14 | 30 | 60 | 90 | 120 | 150 | 180 | 365 | 400 | 545 | 731 | 1827 | 3653) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LogStream: {
		Type: "AWS::Logs::LogStream"
		Properties: {
			LogGroupName:   string | fn.#Fn
			LogStreamName?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MetricFilter: {
		Type: "AWS::Logs::MetricFilter"
		Properties: {
			FilterPattern:         string | fn.#Fn
			LogGroupName:          string | fn.#Fn
			MetricTransformations: [...{
				DefaultValue?:   number | fn.#Fn
				MetricName:      string | fn.#Fn
				MetricNamespace: string | fn.#Fn
				MetricValue:     (=~#"^(([0-9]*)|(\$.*))$"#) | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubscriptionFilter: {
		Type: "AWS::Logs::SubscriptionFilter"
		Properties: {
			DestinationArn: string | fn.#Fn
			FilterPattern:  string | fn.#Fn
			LogGroupName:   string | fn.#Fn
			RoleArn?:       string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

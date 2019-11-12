package apnortheast2

import (
	"github.com/TangoGroup/fn"
	"strings"
)

Logs :: {
	Destination :: {
		Type: "AWS::Logs::Destination"
		Properties: {
			DestinationName:   string | fn.Fn
			DestinationPolicy: string | fn.Fn
			RoleArn:           string | fn.Fn
			TargetArn:         string | fn.Fn
		}
	}
	LogGroup :: {
		Type: "AWS::Logs::LogGroup"
		Properties: {
			LogGroupName?:    (string & (strings.MinRunes(1) & strings.MaxRunes(512))) | fn.Fn
			RetentionInDays?: (int & (1 | 3 | 5 | 7 | 14 | 30 | 60 | 90 | 120 | 150 | 180 | 365 | 400 | 545 | 731 | 1827 | 3653)) | fn.Fn
		}
	}
	LogStream :: {
		Type: "AWS::Logs::LogStream"
		Properties: {
			LogGroupName:   string | fn.Fn
			LogStreamName?: string | fn.Fn
		}
	}
	MetricFilter :: {
		Type: "AWS::Logs::MetricFilter"
		Properties: {
			FilterPattern: string | fn.Fn
			LogGroupName:  string | fn.Fn
			MetricTransformations: [...{
				DefaultValue?:   float | fn.Fn
				MetricName:      string | fn.Fn
				MetricNamespace: string | fn.Fn
				MetricValue:     string | fn.Fn
			}]
		}
	}
	SubscriptionFilter :: {
		Type: "AWS::Logs::SubscriptionFilter"
		Properties: {
			DestinationArn: string | fn.Fn
			FilterPattern:  string | fn.Fn
			LogGroupName:   string | fn.Fn
			RoleArn?:       string | fn.Fn
		}
	}
}

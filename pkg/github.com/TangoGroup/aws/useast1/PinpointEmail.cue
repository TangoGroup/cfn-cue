package useast1

import "github.com/TangoGroup/aws/fn"

PinpointEmail :: {
	ConfigurationSet :: {
		Type: "AWS::PinpointEmail::ConfigurationSet"
		Properties: {
			DeliveryOptions?: SendingPoolName?: string | fn.Fn
			Name: string | fn.Fn
			ReputationOptions?: ReputationMetricsEnabled?: bool | fn.Fn
			SendingOptions?: SendingEnabled?:              bool | fn.Fn
			Tags?: [...{
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			}]
			TrackingOptions?: CustomRedirectDomain?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ConfigurationSetEventDestination :: {
		Type: "AWS::PinpointEmail::ConfigurationSetEventDestination"
		Properties: {
			ConfigurationSetName: string | fn.Fn
			EventDestination?: {
				CloudWatchDestination?: DimensionConfigurations?: [...{
					DefaultDimensionValue: string | fn.Fn
					DimensionName:         string | fn.Fn
					DimensionValueSource:  string | fn.Fn
				}]
				Enabled?: bool | fn.Fn
				KinesisFirehoseDestination?: {
					DeliveryStreamArn: string | fn.Fn
					IamRoleArn:        string | fn.Fn
				}
				MatchingEventTypes: [...(string | fn.Fn)]
				PinpointDestination?: ApplicationArn?: string | fn.Fn
				SnsDestination?: TopicArn:             string | fn.Fn
			}
			EventDestinationName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	DedicatedIpPool :: {
		Type: "AWS::PinpointEmail::DedicatedIpPool"
		Properties: {
			PoolName?: string | fn.Fn
			Tags?: [...{
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Identity :: {
		Type: "AWS::PinpointEmail::Identity"
		Properties: {
			DkimSigningEnabled?:        bool | fn.Fn
			FeedbackForwardingEnabled?: bool | fn.Fn
			MailFromAttributes?: {
				BehaviorOnMxFailure?: string | fn.Fn
				MailFromDomain?:      string | fn.Fn
			}
			Name: string | fn.Fn
			Tags?: [...{
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

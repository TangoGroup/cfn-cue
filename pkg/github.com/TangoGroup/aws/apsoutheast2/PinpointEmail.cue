package apsoutheast2

import "github.com/TangoGroup/aws/fn"

PinpointEmail :: {
	ConfigurationSet :: {
		Type:       "AWS::PinpointEmail::ConfigurationSet"
		Properties: close({
			DeliveryOptions?: close({
				SendingPoolName?: string | fn.Fn
			}) | fn.If
			Name:               string | fn.Fn
			ReputationOptions?: close({
				ReputationMetricsEnabled?: bool | fn.Fn
			}) | fn.If
			SendingOptions?: close({
				SendingEnabled?: bool | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
			TrackingOptions?: close({
				CustomRedirectDomain?: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ConfigurationSetEventDestination :: {
		Type:       "AWS::PinpointEmail::ConfigurationSetEventDestination"
		Properties: close({
			ConfigurationSetName: string | fn.Fn
			EventDestination?:    close({
				CloudWatchDestination?: close({
					DimensionConfigurations?: [...close({
						DefaultDimensionValue: string | fn.Fn
						DimensionName:         string | fn.Fn
						DimensionValueSource:  string | fn.Fn
					})] | fn.If
				}) | fn.If
				Enabled?:                    bool | fn.Fn
				KinesisFirehoseDestination?: close({
					DeliveryStreamArn: string | fn.Fn
					IamRoleArn:        string | fn.Fn
				}) | fn.If
				MatchingEventTypes:   [...(string | fn.Fn)] | (string | fn.Fn)
				PinpointDestination?: close({
					ApplicationArn?: string | fn.Fn
				}) | fn.If
				SnsDestination?: close({
					TopicArn: string | fn.Fn
				}) | fn.If
			}) | fn.If
			EventDestinationName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DedicatedIpPool :: {
		Type:       "AWS::PinpointEmail::DedicatedIpPool"
		Properties: close({
			PoolName?: string | fn.Fn
			Tags?:     [...close({
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Identity :: {
		Type:       "AWS::PinpointEmail::Identity"
		Properties: close({
			DkimSigningEnabled?:        bool | fn.Fn
			FeedbackForwardingEnabled?: bool | fn.Fn
			MailFromAttributes?:        close({
				BehaviorOnMxFailure?: string | fn.Fn
				MailFromDomain?:      string | fn.Fn
			}) | fn.If
			Name:  string | fn.Fn
			Tags?: [...close({
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

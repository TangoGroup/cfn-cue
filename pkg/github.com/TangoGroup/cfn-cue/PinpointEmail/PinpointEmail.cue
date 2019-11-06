package PinpointEmail

import "github.com/TangoGroup/fn"

ConfigurationSet :: {
	Type: "AWS::PinpointEmail::ConfigurationSet"
	Properties: {
		DeliveryOptions?:   propDeliveryOptions
		Name:               string | fn.Fn
		ReputationOptions?: propReputationOptions
		SendingOptions?:    propSendingOptions
		Tags?: [...propTags]
		TrackingOptions?: propTrackingOptions
	}
	propDeliveryOptions :: {
		SendingPoolName?: string | fn.Fn
	}
	propReputationOptions :: {
		ReputationMetricsEnabled?: bool | fn.Fn
	}
	propSendingOptions :: {
		SendingEnabled?: bool | fn.Fn
	}
	propTags :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
	propTrackingOptions :: {
		CustomRedirectDomain?: string | fn.Fn
	}
}
ConfigurationSetEventDestination :: {
	Type: "AWS::PinpointEmail::ConfigurationSetEventDestination"
	Properties: {
		ConfigurationSetName: string | fn.Fn
		EventDestination?:    propEventDestination
		EventDestinationName: string | fn.Fn
	}
	propCloudWatchDestination :: {
		DimensionConfigurations?: [...propDimensionConfiguration]
	}
	propDimensionConfiguration :: {
		DefaultDimensionValue: string | fn.Fn
		DimensionName:         string | fn.Fn
		DimensionValueSource:  string | fn.Fn
	}
	propEventDestination :: {
		CloudWatchDestination?:      propCloudWatchDestination
		Enabled?:                    bool | fn.Fn
		KinesisFirehoseDestination?: propKinesisFirehoseDestination
		MatchingEventTypes:          [...string] | fn.Fn
		PinpointDestination?:        propPinpointDestination
		SnsDestination?:             propSnsDestination
	}
	propKinesisFirehoseDestination :: {
		DeliveryStreamArn: string | fn.Fn
		IamRoleArn:        string | fn.Fn
	}
	propPinpointDestination :: {
		ApplicationArn?: string | fn.Fn
	}
	propSnsDestination :: {
		TopicArn: string | fn.Fn
	}
}
Identity :: {
	Type: "AWS::PinpointEmail::Identity"
	Properties: {
		DkimSigningEnabled?:        bool | fn.Fn
		FeedbackForwardingEnabled?: bool | fn.Fn
		MailFromAttributes?:        propMailFromAttributes
		Name:                       string | fn.Fn
		Tags?: [...propTags]
	}
	propMailFromAttributes :: {
		BehaviorOnMxFailure?: string | fn.Fn
		MailFromDomain?:      string | fn.Fn
	}
	propTags :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
}

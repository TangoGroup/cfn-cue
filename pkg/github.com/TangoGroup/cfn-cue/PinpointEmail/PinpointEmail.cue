package PinpointEmail

import "github.com/TangoGroup/fn"

ConfigurationSet :: {
	Type: "AWS::PinpointEmail::ConfigurationSet"
	Properties: {
		DeliveryOptions?:   __DeliveryOptions
		Name:               string | fn.Fn
		ReputationOptions?: __ReputationOptions
		SendingOptions?:    __SendingOptions
		Tags?: [...__Tags]
		TrackingOptions?: __TrackingOptions
	}
	__DeliveryOptions :: {
		SendingPoolName?: string | fn.Fn
	}
	__ReputationOptions :: {
		ReputationMetricsEnabled?: bool | fn.Fn
	}
	__SendingOptions :: {
		SendingEnabled?: bool | fn.Fn
	}
	__Tags :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
	__TrackingOptions :: {
		CustomRedirectDomain?: string | fn.Fn
	}
}
ConfigurationSetEventDestination :: {
	Type: "AWS::PinpointEmail::ConfigurationSetEventDestination"
	Properties: {
		ConfigurationSetName: string | fn.Fn
		EventDestination?:    __EventDestination
		EventDestinationName: string | fn.Fn
	}
	__CloudWatchDestination :: {
		DimensionConfigurations?: [...__DimensionConfiguration]
	}
	__DimensionConfiguration :: {
		DefaultDimensionValue: string | fn.Fn
		DimensionName:         string | fn.Fn
		DimensionValueSource:  string | fn.Fn
	}
	__EventDestination :: {
		CloudWatchDestination?:      __CloudWatchDestination
		Enabled?:                    bool | fn.Fn
		KinesisFirehoseDestination?: __KinesisFirehoseDestination
		MatchingEventTypes:          [...string] | fn.Fn
		PinpointDestination?:        __PinpointDestination
		SnsDestination?:             __SnsDestination
	}
	__KinesisFirehoseDestination :: {
		DeliveryStreamArn: string | fn.Fn
		IamRoleArn:        string | fn.Fn
	}
	__PinpointDestination :: {
		ApplicationArn?: string | fn.Fn
	}
	__SnsDestination :: {
		TopicArn: string | fn.Fn
	}
}
Identity :: {
	Type: "AWS::PinpointEmail::Identity"
	Properties: {
		DkimSigningEnabled?:        bool | fn.Fn
		FeedbackForwardingEnabled?: bool | fn.Fn
		MailFromAttributes?:        __MailFromAttributes
		Name:                       string | fn.Fn
		Tags?: [...__Tags]
	}
	__MailFromAttributes :: {
		BehaviorOnMxFailure?: string | fn.Fn
		MailFromDomain?:      string | fn.Fn
	}
	__Tags :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
}

package PinpointEmail

ConfigurationSet :: {
	Type: "AWS::PinpointEmail::ConfigurationSet"
	Properties: {
		DeliveryOptions?:   __DeliveryOptions
		Name:               string
		ReputationOptions?: __ReputationOptions
		SendingOptions?:    __SendingOptions
		Tags?: [...__Tags]
		TrackingOptions?: __TrackingOptions
	}
	__DeliveryOptions :: {
		SendingPoolName?: string
	}
	__ReputationOptions :: {
		ReputationMetricsEnabled?: bool
	}
	__SendingOptions :: {
		SendingEnabled?: bool
	}
	__Tags :: {
		Key?:   string
		Value?: string
	}
	__TrackingOptions :: {
		CustomRedirectDomain?: string
	}
}
ConfigurationSetEventDestination :: {
	Type: "AWS::PinpointEmail::ConfigurationSetEventDestination"
	Properties: {
		ConfigurationSetName: string
		EventDestination?:    __EventDestination
		EventDestinationName: string
	}
	__CloudWatchDestination :: {
		DimensionConfigurations?: [...__DimensionConfiguration]
	}
	__DimensionConfiguration :: {
		DefaultDimensionValue: string
		DimensionName:         string
		DimensionValueSource:  string
	}
	__EventDestination :: {
		CloudWatchDestination?:      __CloudWatchDestination
		Enabled?:                    bool
		KinesisFirehoseDestination?: __KinesisFirehoseDestination
		MatchingEventTypes: [...string]
		PinpointDestination?: __PinpointDestination
		SnsDestination?:      __SnsDestination
	}
	__KinesisFirehoseDestination :: {
		DeliveryStreamArn: string
		IamRoleArn:        string
	}
	__PinpointDestination :: {
		ApplicationArn?: string
	}
	__SnsDestination :: {
		TopicArn: string
	}
}
Identity :: {
	Type: "AWS::PinpointEmail::Identity"
	Properties: {
		DkimSigningEnabled?:        bool
		FeedbackForwardingEnabled?: bool
		MailFromAttributes?:        __MailFromAttributes
		Name:                       string
		Tags?: [...__Tags]
	}
	__MailFromAttributes :: {
		BehaviorOnMxFailure?: string
		MailFromDomain?:      string
	}
	__Tags :: {
		Key?:   string
		Value?: string
	}
}

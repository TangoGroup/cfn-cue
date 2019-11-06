package Pinpoint

import "github.com/TangoGroup/fn"

ADMChannel :: {
	Type: "AWS::Pinpoint::ADMChannel"
	Properties: {
		ApplicationId: string | fn.Fn
		ClientId:      string | fn.Fn
		ClientSecret:  string | fn.Fn
		Enabled?:      bool | fn.Fn
	}
}
APNSChannel :: {
	Type: "AWS::Pinpoint::APNSChannel"
	Properties: {
		ApplicationId:                string | fn.Fn
		BundleId?:                    string | fn.Fn
		Certificate?:                 string | fn.Fn
		DefaultAuthenticationMethod?: string | fn.Fn
		Enabled?:                     bool | fn.Fn
		PrivateKey?:                  string | fn.Fn
		TeamId?:                      string | fn.Fn
		TokenKey?:                    string | fn.Fn
		TokenKeyId?:                  string | fn.Fn
	}
}
APNSSandboxChannel :: {
	Type: "AWS::Pinpoint::APNSSandboxChannel"
	Properties: {
		ApplicationId:                string | fn.Fn
		BundleId?:                    string | fn.Fn
		Certificate?:                 string | fn.Fn
		DefaultAuthenticationMethod?: string | fn.Fn
		Enabled?:                     bool | fn.Fn
		PrivateKey?:                  string | fn.Fn
		TeamId?:                      string | fn.Fn
		TokenKey?:                    string | fn.Fn
		TokenKeyId?:                  string | fn.Fn
	}
}
APNSVoipChannel :: {
	Type: "AWS::Pinpoint::APNSVoipChannel"
	Properties: {
		ApplicationId:                string | fn.Fn
		BundleId?:                    string | fn.Fn
		Certificate?:                 string | fn.Fn
		DefaultAuthenticationMethod?: string | fn.Fn
		Enabled?:                     bool | fn.Fn
		PrivateKey?:                  string | fn.Fn
		TeamId?:                      string | fn.Fn
		TokenKey?:                    string | fn.Fn
		TokenKeyId?:                  string | fn.Fn
	}
}
APNSVoipSandboxChannel :: {
	Type: "AWS::Pinpoint::APNSVoipSandboxChannel"
	Properties: {
		ApplicationId:                string | fn.Fn
		BundleId?:                    string | fn.Fn
		Certificate?:                 string | fn.Fn
		DefaultAuthenticationMethod?: string | fn.Fn
		Enabled?:                     bool | fn.Fn
		PrivateKey?:                  string | fn.Fn
		TeamId?:                      string | fn.Fn
		TokenKey?:                    string | fn.Fn
		TokenKeyId?:                  string | fn.Fn
	}
}
App :: {
	Type: "AWS::Pinpoint::App"
	Properties: {
		Name:  string | fn.Fn
		Tags?: {
		} | fn.Fn
	}
}
ApplicationSettings :: {
	Type: "AWS::Pinpoint::ApplicationSettings"
	Properties: {
		ApplicationId:             string | fn.Fn
		CampaignHook?:             propCampaignHook
		CloudWatchMetricsEnabled?: bool | fn.Fn
		Limits?:                   propLimits
		QuietTime?:                propQuietTime
	}
	propCampaignHook :: {
		LambdaFunctionName?: string | fn.Fn
		Mode?:               string | fn.Fn
		WebUrl?:             string | fn.Fn
	}
	propLimits :: {
		Daily?:             int | fn.Fn
		MaximumDuration?:   int | fn.Fn
		MessagesPerSecond?: int | fn.Fn
		Total?:             int | fn.Fn
	}
	propQuietTime :: {
		End:   string | fn.Fn
		Start: string | fn.Fn
	}
}
BaiduChannel :: {
	Type: "AWS::Pinpoint::BaiduChannel"
	Properties: {
		ApiKey:        string | fn.Fn
		ApplicationId: string | fn.Fn
		Enabled?:      bool | fn.Fn
		SecretKey:     string | fn.Fn
	}
}
Campaign :: {
	Type: "AWS::Pinpoint::Campaign"
	Properties: {
		AdditionalTreatments?: [...propWriteTreatmentResource]
		ApplicationId:        string | fn.Fn
		CampaignHook?:        propCampaignHook
		Description?:         string | fn.Fn
		HoldoutPercent?:      int | fn.Fn
		IsPaused?:            bool | fn.Fn
		Limits?:              propLimits
		MessageConfiguration: propMessageConfiguration
		Name:                 string | fn.Fn
		Schedule:             propSchedule
		SegmentId:            string | fn.Fn
		SegmentVersion?:      int | fn.Fn
		Tags?:                {
		} | fn.Fn
		TreatmentDescription?: string | fn.Fn
		TreatmentName?:        string | fn.Fn
	}
	propAttributeDimension :: {
		AttributeType?: string | fn.Fn
		Values?:        [...string] | fn.Fn
	}
	propCampaignEmailMessage :: {
		Body?:        string | fn.Fn
		FromAddress?: string | fn.Fn
		HtmlBody?:    string | fn.Fn
		Title?:       string | fn.Fn
	}
	propCampaignEventFilter :: {
		Dimensions?: propEventDimensions
		FilterType?: string | fn.Fn
	}
	propCampaignHook :: {
		LambdaFunctionName?: string | fn.Fn
		Mode?:               string | fn.Fn
		WebUrl?:             string | fn.Fn
	}
	propCampaignSmsMessage :: {
		Body?:        string | fn.Fn
		MessageType?: string | fn.Fn
		SenderId?:    string | fn.Fn
	}
	propEventDimensions :: {
		Attributes?: {
		} | fn.Fn
		EventType?: propSetDimension
		Metrics?:   {
		} | fn.Fn
	}
	propLimits :: {
		Daily?:             int | fn.Fn
		MaximumDuration?:   int | fn.Fn
		MessagesPerSecond?: int | fn.Fn
		Total?:             int | fn.Fn
	}
	propMessage :: {
		Action?:            string | fn.Fn
		Body?:              string | fn.Fn
		ImageIconUrl?:      string | fn.Fn
		ImageSmallIconUrl?: string | fn.Fn
		ImageUrl?:          string | fn.Fn
		JsonBody?:          string | fn.Fn
		MediaUrl?:          string | fn.Fn
		RawContent?:        string | fn.Fn
		SilentPush?:        bool | fn.Fn
		TimeToLive?:        int | fn.Fn
		Title?:             string | fn.Fn
		Url?:               string | fn.Fn
	}
	propMessageConfiguration :: {
		ADMMessage?:     propMessage
		APNSMessage?:    propMessage
		BaiduMessage?:   propMessage
		DefaultMessage?: propMessage
		EmailMessage?:   propCampaignEmailMessage
		GCMMessage?:     propMessage
		SMSMessage?:     propCampaignSmsMessage
	}
	propMetricDimension :: {
		ComparisonOperator?: string | fn.Fn
		Value?:              float | fn.Fn
	}
	propQuietTime :: {
		End:   string | fn.Fn
		Start: string | fn.Fn
	}
	propSchedule :: {
		EndTime?:     string | fn.Fn
		EventFilter?: propCampaignEventFilter
		Frequency?:   string | fn.Fn
		IsLocalTime?: bool | fn.Fn
		QuietTime?:   propQuietTime
		StartTime?:   string | fn.Fn
		TimeZone?:    string | fn.Fn
	}
	propSetDimension :: {
		DimensionType?: string | fn.Fn
		Values?:        [...string] | fn.Fn
	}
	propWriteTreatmentResource :: {
		MessageConfiguration?: propMessageConfiguration
		Schedule?:             propSchedule
		SizePercent?:          int | fn.Fn
		TreatmentDescription?: string | fn.Fn
		TreatmentName?:        string | fn.Fn
	}
}
EmailChannel :: {
	Type: "AWS::Pinpoint::EmailChannel"
	Properties: {
		ApplicationId:     string | fn.Fn
		ConfigurationSet?: string | fn.Fn
		Enabled?:          bool | fn.Fn
		FromAddress:       string | fn.Fn
		Identity:          string | fn.Fn
		RoleArn?:          string | fn.Fn
	}
}
EventStream :: {
	Type: "AWS::Pinpoint::EventStream"
	Properties: {
		ApplicationId:        string | fn.Fn
		DestinationStreamArn: string | fn.Fn
		RoleArn:              string | fn.Fn
	}
}
GCMChannel :: {
	Type: "AWS::Pinpoint::GCMChannel"
	Properties: {
		ApiKey:        string | fn.Fn
		ApplicationId: string | fn.Fn
		Enabled?:      bool | fn.Fn
	}
}
SMSChannel :: {
	Type: "AWS::Pinpoint::SMSChannel"
	Properties: {
		ApplicationId: string | fn.Fn
		Enabled?:      bool | fn.Fn
		SenderId?:     string | fn.Fn
		ShortCode?:    string | fn.Fn
	}
}
Segment :: {
	Type: "AWS::Pinpoint::Segment"
	Properties: {
		ApplicationId:  string | fn.Fn
		Dimensions?:    propSegmentDimensions
		Name:           string | fn.Fn
		SegmentGroups?: propSegmentGroups
		Tags?:          {
		} | fn.Fn
	}
	propAttributeDimension :: {
		AttributeType?: string | fn.Fn
		Values?:        [...string] | fn.Fn
	}
	propBehavior :: {
		Recency?: propRecency
	}
	propCoordinates :: {
		Latitude:  float | fn.Fn
		Longitude: float | fn.Fn
	}
	propDemographic :: {
		AppVersion?: propSetDimension
		Channel?:    propSetDimension
		DeviceType?: propSetDimension
		Make?:       propSetDimension
		Model?:      propSetDimension
		Platform?:   propSetDimension
	}
	propGPSPoint :: {
		Coordinates:       propCoordinates
		RangeInKilometers: float | fn.Fn
	}
	propGroups :: {
		Dimensions?: [...propSegmentDimensions]
		SourceSegments?: [...propSourceSegments]
		SourceType?: string | fn.Fn
		Type?:       string | fn.Fn
	}
	propLocation :: {
		Country?:  propSetDimension
		GPSPoint?: propGPSPoint
	}
	propRecency :: {
		Duration:    string | fn.Fn
		RecencyType: string | fn.Fn
	}
	propSegmentDimensions :: {
		Attributes?: {
		} | fn.Fn
		Behavior?:    propBehavior
		Demographic?: propDemographic
		Location?:    propLocation
		Metrics?:     {
		} | fn.Fn
		UserAttributes?: {
		} | fn.Fn
	}
	propSegmentGroups :: {
		Groups?: [...propGroups]
		Include?: string | fn.Fn
	}
	propSetDimension :: {
		DimensionType?: string | fn.Fn
		Values?:        [...string] | fn.Fn
	}
	propSourceSegments :: {
		Id:       string | fn.Fn
		Version?: int | fn.Fn
	}
}
VoiceChannel :: {
	Type: "AWS::Pinpoint::VoiceChannel"
	Properties: {
		ApplicationId: string | fn.Fn
		Enabled?:      bool | fn.Fn
	}
}

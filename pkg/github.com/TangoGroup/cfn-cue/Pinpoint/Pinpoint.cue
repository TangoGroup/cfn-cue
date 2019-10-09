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
		CampaignHook?:             __CampaignHook
		CloudWatchMetricsEnabled?: bool | fn.Fn
		Limits?:                   __Limits
		QuietTime?:                __QuietTime
	}
	__CampaignHook :: {
		LambdaFunctionName?: string | fn.Fn
		Mode?:               string | fn.Fn
		WebUrl?:             string | fn.Fn
	}
	__Limits :: {
		Daily?:             int | fn.Fn
		MaximumDuration?:   int | fn.Fn
		MessagesPerSecond?: int | fn.Fn
		Total?:             int | fn.Fn
	}
	__QuietTime :: {
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
		AdditionalTreatments?: [...__WriteTreatmentResource]
		ApplicationId:        string | fn.Fn
		CampaignHook?:        __CampaignHook
		Description?:         string | fn.Fn
		HoldoutPercent?:      int | fn.Fn
		IsPaused?:            bool | fn.Fn
		Limits?:              __Limits
		MessageConfiguration: __MessageConfiguration
		Name:                 string | fn.Fn
		Schedule:             __Schedule
		SegmentId:            string | fn.Fn
		SegmentVersion?:      int | fn.Fn
		Tags?:                {
		} | fn.Fn
		TreatmentDescription?: string | fn.Fn
		TreatmentName?:        string | fn.Fn
	}
	__AttributeDimension :: {
		AttributeType?: string | fn.Fn
		Values?:        [...string] | fn.Fn
	}
	__CampaignEmailMessage :: {
		Body?:        string | fn.Fn
		FromAddress?: string | fn.Fn
		HtmlBody?:    string | fn.Fn
		Title?:       string | fn.Fn
	}
	__CampaignEventFilter :: {
		Dimensions?: __EventDimensions
		FilterType?: string | fn.Fn
	}
	__CampaignHook :: {
		LambdaFunctionName?: string | fn.Fn
		Mode?:               string | fn.Fn
		WebUrl?:             string | fn.Fn
	}
	__CampaignSmsMessage :: {
		Body?:        string | fn.Fn
		MessageType?: string | fn.Fn
		SenderId?:    string | fn.Fn
	}
	__EventDimensions :: {
		Attributes?: {
		} | fn.Fn
		EventType?: __SetDimension
		Metrics?:   {
		} | fn.Fn
	}
	__Limits :: {
		Daily?:             int | fn.Fn
		MaximumDuration?:   int | fn.Fn
		MessagesPerSecond?: int | fn.Fn
		Total?:             int | fn.Fn
	}
	__Message :: {
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
	__MessageConfiguration :: {
		ADMMessage?:     __Message
		APNSMessage?:    __Message
		BaiduMessage?:   __Message
		DefaultMessage?: __Message
		EmailMessage?:   __CampaignEmailMessage
		GCMMessage?:     __Message
		SMSMessage?:     __CampaignSmsMessage
	}
	__MetricDimension :: {
		ComparisonOperator?: string | fn.Fn
		Value?:              float | fn.Fn
	}
	__QuietTime :: {
		End:   string | fn.Fn
		Start: string | fn.Fn
	}
	__Schedule :: {
		EndTime?:     string | fn.Fn
		EventFilter?: __CampaignEventFilter
		Frequency?:   string | fn.Fn
		IsLocalTime?: bool | fn.Fn
		QuietTime?:   __QuietTime
		StartTime?:   string | fn.Fn
		TimeZone?:    string | fn.Fn
	}
	__SetDimension :: {
		DimensionType?: string | fn.Fn
		Values?:        [...string] | fn.Fn
	}
	__WriteTreatmentResource :: {
		MessageConfiguration?: __MessageConfiguration
		Schedule?:             __Schedule
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
		Dimensions?:    __SegmentDimensions
		Name:           string | fn.Fn
		SegmentGroups?: __SegmentGroups
		Tags?:          {
		} | fn.Fn
	}
	__AttributeDimension :: {
		AttributeType?: string | fn.Fn
		Values?:        [...string] | fn.Fn
	}
	__Behavior :: {
		Recency?: __Recency
	}
	__Coordinates :: {
		Latitude:  float | fn.Fn
		Longitude: float | fn.Fn
	}
	__Demographic :: {
		AppVersion?: __SetDimension
		Channel?:    __SetDimension
		DeviceType?: __SetDimension
		Make?:       __SetDimension
		Model?:      __SetDimension
		Platform?:   __SetDimension
	}
	__GPSPoint :: {
		Coordinates:       __Coordinates
		RangeInKilometers: float | fn.Fn
	}
	__Groups :: {
		Dimensions?: [...__SegmentDimensions]
		SourceSegments?: [...__SourceSegments]
		SourceType?: string | fn.Fn
		Type?:       string | fn.Fn
	}
	__Location :: {
		Country?:  __SetDimension
		GPSPoint?: __GPSPoint
	}
	__Recency :: {
		Duration:    string | fn.Fn
		RecencyType: string | fn.Fn
	}
	__SegmentDimensions :: {
		Attributes?: {
		} | fn.Fn
		Behavior?:    __Behavior
		Demographic?: __Demographic
		Location?:    __Location
		Metrics?:     {
		} | fn.Fn
		UserAttributes?: {
		} | fn.Fn
	}
	__SegmentGroups :: {
		Groups?: [...__Groups]
		Include?: string | fn.Fn
	}
	__SetDimension :: {
		DimensionType?: string | fn.Fn
		Values?:        [...string] | fn.Fn
	}
	__SourceSegments :: {
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

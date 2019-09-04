package Pinpoint

ADMChannel :: {
  Type: "AWS::Pinpoint::ADMChannel"
  Properties: {
    ApplicationId: string
    ClientId:      string
    ClientSecret:  string
    Enabled?:      bool
  }
}
APNSChannel :: {
  Type: "AWS::Pinpoint::APNSChannel"
  Properties: {
    ApplicationId:                string
    BundleId?:                    string
    Certificate?:                 string
    DefaultAuthenticationMethod?: string
    Enabled?:                     bool
    PrivateKey?:                  string
    TeamId?:                      string
    TokenKey?:                    string
    TokenKeyId?:                  string
  }
}
APNSSandboxChannel :: {
  Type: "AWS::Pinpoint::APNSSandboxChannel"
  Properties: {
    ApplicationId:                string
    BundleId?:                    string
    Certificate?:                 string
    DefaultAuthenticationMethod?: string
    Enabled?:                     bool
    PrivateKey?:                  string
    TeamId?:                      string
    TokenKey?:                    string
    TokenKeyId?:                  string
  }
}
APNSVoipChannel :: {
  Type: "AWS::Pinpoint::APNSVoipChannel"
  Properties: {
    ApplicationId:                string
    BundleId?:                    string
    Certificate?:                 string
    DefaultAuthenticationMethod?: string
    Enabled?:                     bool
    PrivateKey?:                  string
    TeamId?:                      string
    TokenKey?:                    string
    TokenKeyId?:                  string
  }
}
APNSVoipSandboxChannel :: {
  Type: "AWS::Pinpoint::APNSVoipSandboxChannel"
  Properties: {
    ApplicationId:                string
    BundleId?:                    string
    Certificate?:                 string
    DefaultAuthenticationMethod?: string
    Enabled?:                     bool
    PrivateKey?:                  string
    TeamId?:                      string
    TokenKey?:                    string
    TokenKeyId?:                  string
  }
}
App :: {
  Type: "AWS::Pinpoint::App"
  Properties: {
    Name: string
  }
}
ApplicationSettings :: {
  Type: "AWS::Pinpoint::ApplicationSettings"
  Properties: {
    ApplicationId:             string
    CampaignHook?:             __CampaignHook
    CloudWatchMetricsEnabled?: bool
    Limits?:                   __Limits
    QuietTime?:                __QuietTime
  }
  __CampaignHook = {
    LambdaFunctionName?: string
    Mode?:               string
    WebUrl?:             string
  }
  __Limits = {
    Daily?:             int
    MaximumDuration?:   int
    MessagesPerSecond?: int
    Total?:             int
  }
  __QuietTime = {
    End:   string
    Start: string
  }
}
BaiduChannel :: {
  Type: "AWS::Pinpoint::BaiduChannel"
  Properties: {
    ApiKey:        string
    ApplicationId: string
    Enabled?:      bool
    SecretKey:     string
  }
}
Campaign :: {
  Type: "AWS::Pinpoint::Campaign"
  Properties: {
    AdditionalTreatments?: [...__WriteTreatmentResource]
    ApplicationId:         string
    CampaignHook?:         __CampaignHook
    Description?:          string
    HoldoutPercent?:       int
    IsPaused?:             bool
    Limits?:               __Limits
    MessageConfiguration:  __MessageConfiguration
    Name:                  string
    Schedule:              __Schedule
    SegmentId:             string
    SegmentVersion?:       int
    TreatmentDescription?: string
    TreatmentName?:        string
  }
  __AttributeDimension = {
    AttributeType?: string
    Values?: [...string]
  }
  __CampaignEmailMessage = {
    Body?:        string
    FromAddress?: string
    HtmlBody?:    string
    Title?:       string
  }
  __CampaignEventFilter = {
    Dimensions?: __EventDimensions
    FilterType?: string
  }
  __CampaignHook = {
    LambdaFunctionName?: string
    Mode?:               string
    WebUrl?:             string
  }
  __CampaignSmsMessage = {
    Body?:        string
    MessageType?: string
    SenderId?:    string
  }
  __EventDimensions = {
    Attributes?: {
    }
    EventType?: __SetDimension
    Metrics?: {
    }
  }
  __Limits = {
    Daily?:             int
    MaximumDuration?:   int
    MessagesPerSecond?: int
    Total?:             int
  }
  __Message = {
    Action?:            string
    Body?:              string
    ImageIconUrl?:      string
    ImageSmallIconUrl?: string
    ImageUrl?:          string
    JsonBody?:          string
    MediaUrl?:          string
    RawContent?:        string
    SilentPush?:        bool
    TimeToLive?:        int
    Title?:             string
    Url?:               string
  }
  __MessageConfiguration = {
    ADMMessage?:     __Message
    APNSMessage?:    __Message
    BaiduMessage?:   __Message
    DefaultMessage?: __Message
    EmailMessage?:   __CampaignEmailMessage
    GCMMessage?:     __Message
    SMSMessage?:     __CampaignSmsMessage
  }
  __MetricDimension = {
    ComparisonOperator?: string
    Value?:              float
  }
  __QuietTime = {
    End:   string
    Start: string
  }
  __Schedule = {
    EndTime?:     string
    EventFilter?: __CampaignEventFilter
    Frequency?:   string
    IsLocalTime?: bool
    QuietTime?:   __QuietTime
    StartTime?:   string
    TimeZone?:    string
  }
  __SetDimension = {
    DimensionType?: string
    Values?: [...string]
  }
  __WriteTreatmentResource = {
    MessageConfiguration?: __MessageConfiguration
    Schedule?:             __Schedule
    SizePercent?:          int
    TreatmentDescription?: string
    TreatmentName?:        string
  }
}
EmailChannel :: {
  Type: "AWS::Pinpoint::EmailChannel"
  Properties: {
    ApplicationId:     string
    ConfigurationSet?: string
    Enabled?:          bool
    FromAddress:       string
    Identity:          string
    RoleArn?:          string
  }
}
EventStream :: {
  Type: "AWS::Pinpoint::EventStream"
  Properties: {
    ApplicationId:        string
    DestinationStreamArn: string
    RoleArn:              string
  }
}
GCMChannel :: {
  Type: "AWS::Pinpoint::GCMChannel"
  Properties: {
    ApiKey:        string
    ApplicationId: string
    Enabled?:      bool
  }
}
SMSChannel :: {
  Type: "AWS::Pinpoint::SMSChannel"
  Properties: {
    ApplicationId: string
    Enabled?:      bool
    SenderId?:     string
    ShortCode?:    string
  }
}
Segment :: {
  Type: "AWS::Pinpoint::Segment"
  Properties: {
    ApplicationId:  string
    Dimensions?:    __SegmentDimensions
    Name:           string
    SegmentGroups?: __SegmentGroups
  }
  __AttributeDimension = {
    AttributeType?: string
    Values?: [...string]
  }
  __Behavior = {
    Recency?: __Recency
  }
  __Coordinates = {
    Latitude:  float
    Longitude: float
  }
  __Demographic = {
    AppVersion?: __SetDimension
    Channel?:    __SetDimension
    DeviceType?: __SetDimension
    Make?:       __SetDimension
    Model?:      __SetDimension
    Platform?:   __SetDimension
  }
  __GPSPoint = {
    Coordinates:       __Coordinates
    RangeInKilometers: float
  }
  __Groups = {
    Dimensions?: [...__SegmentDimensions]
    SourceSegments?: [...__SourceSegments]
    SourceType?: string
    Type?:       string
  }
  __Location = {
    Country?:  __SetDimension
    GPSPoint?: __GPSPoint
  }
  __Recency = {
    Duration:    string
    RecencyType: string
  }
  __SegmentDimensions = {
    Attributes?: {
    }
    Behavior?:    __Behavior
    Demographic?: __Demographic
    Location?:    __Location
    Metrics?: {
    }
    UserAttributes?: {
    }
  }
  __SegmentGroups = {
    Groups?: [...__Groups]
    Include?: string
  }
  __SetDimension = {
    DimensionType?: string
    Values?: [...string]
  }
  __SourceSegments = {
    Id:       string
    Version?: int
  }
}
VoiceChannel :: {
  Type: "AWS::Pinpoint::VoiceChannel"
  Properties: {
    ApplicationId: string
    Enabled?:      bool
  }
}

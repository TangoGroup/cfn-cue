package MediaLive

Channel :: {
  Type: "AWS::MediaLive::Channel"
  Properties: {
    ChannelClass?: string
    Destinations?: [...__OutputDestination]
    EncoderSettings?: {
    }
    InputAttachments?: [...__InputAttachment]
    InputSpecification?: __InputSpecification
    LogLevel?:           string
    Name?:               string
    RoleArn?:            string
    Tags?: {
    }
  }
  __AribSourceSettings = {
  }
  __AudioLanguageSelection = {
    LanguageCode?:            string
    LanguageSelectionPolicy?: string
  }
  __AudioPidSelection = {
    Pid?: int
  }
  __AudioSelector = {
    Name?:             string
    SelectorSettings?: __AudioSelectorSettings
  }
  __AudioSelectorSettings = {
    AudioLanguageSelection?: __AudioLanguageSelection
    AudioPidSelection?:      __AudioPidSelection
  }
  __CaptionSelector = {
    LanguageCode?:     string
    Name?:             string
    SelectorSettings?: __CaptionSelectorSettings
  }
  __CaptionSelectorSettings = {
    AribSourceSettings?:     __AribSourceSettings
    DvbSubSourceSettings?:   __DvbSubSourceSettings
    EmbeddedSourceSettings?: __EmbeddedSourceSettings
    Scte20SourceSettings?:   __Scte20SourceSettings
    Scte27SourceSettings?:   __Scte27SourceSettings
    TeletextSourceSettings?: __TeletextSourceSettings
  }
  __DvbSubSourceSettings = {
    Pid?: int
  }
  __EmbeddedSourceSettings = {
    Convert608To708?:        string
    Scte20Detection?:        string
    Source608ChannelNumber?: int
    Source608TrackNumber?:   int
  }
  __HlsInputSettings = {
    Bandwidth?:      int
    BufferSegments?: int
    Retries?:        int
    RetryInterval?:  int
  }
  __InputAttachment = {
    InputAttachmentName?: string
    InputId?:             string
    InputSettings?:       __InputSettings
  }
  __InputSettings = {
    AudioSelectors?: [...__AudioSelector]
    CaptionSelectors?: [...__CaptionSelector]
    DeblockFilter?:        string
    DenoiseFilter?:        string
    FilterStrength?:       int
    InputFilter?:          string
    NetworkInputSettings?: __NetworkInputSettings
    SourceEndBehavior?:    string
    VideoSelector?:        __VideoSelector
  }
  __InputSpecification = {
    Codec?:          string
    MaximumBitrate?: string
    Resolution?:     string
  }
  __MediaPackageOutputDestinationSettings = {
    ChannelId?: string
  }
  __NetworkInputSettings = {
    HlsInputSettings?: __HlsInputSettings
    ServerValidation?: string
  }
  __OutputDestination = {
    Id?: string
    MediaPackageSettings?: [...__MediaPackageOutputDestinationSettings]
    Settings?: [...__OutputDestinationSettings]
  }
  __OutputDestinationSettings = {
    PasswordParam?: string
    StreamName?:    string
    Url?:           string
    Username?:      string
  }
  __Scte20SourceSettings = {
    Convert608To708?:        string
    Source608ChannelNumber?: int
  }
  __Scte27SourceSettings = {
    Pid?: int
  }
  __TeletextSourceSettings = {
    PageNumber?: string
  }
  __VideoSelector = {
    ColorSpace?:       string
    ColorSpaceUsage?:  string
    SelectorSettings?: __VideoSelectorSettings
  }
  __VideoSelectorPid = {
    Pid?: int
  }
  __VideoSelectorProgramId = {
    ProgramId?: int
  }
  __VideoSelectorSettings = {
    VideoSelectorPid?:       __VideoSelectorPid
    VideoSelectorProgramId?: __VideoSelectorProgramId
  }
}
Input :: {
  Type: "AWS::MediaLive::Input"
  Properties: {
    Destinations?: [...__InputDestinationRequest]
    InputSecurityGroups?: [...string]
    MediaConnectFlows?: [...__MediaConnectFlowRequest]
    Name?:    string
    RoleArn?: string
    Sources?: [...__InputSourceRequest]
    Tags?: {
    }
    Type?: string
    Vpc?:  __InputVpcRequest
  }
  __InputDestinationRequest = {
    StreamName?: string
  }
  __InputSourceRequest = {
    PasswordParam?: string
    Url?:           string
    Username?:      string
  }
  __InputVpcRequest = {
    SecurityGroupIds?: [...string]
    SubnetIds?: [...string]
  }
  __MediaConnectFlowRequest = {
    FlowArn?: string
  }
}
InputSecurityGroup :: {
  Type: "AWS::MediaLive::InputSecurityGroup"
  Properties: {
    Tags?: {
    }
    WhitelistRules?: [...__InputWhitelistRuleCidr]
  }
  __InputWhitelistRuleCidr = {
    Cidr?: string
  }
}

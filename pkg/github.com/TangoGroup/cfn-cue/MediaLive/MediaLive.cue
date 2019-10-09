package MediaLive

import "github.com/TangoGroup/fn"

Channel :: {
	Type: "AWS::MediaLive::Channel"
	Properties: {
		ChannelClass?: string | fn.Fn
		Destinations?: [...__OutputDestination]
		EncoderSettings?: {
		} | fn.Fn
		InputAttachments?: [...__InputAttachment]
		InputSpecification?: __InputSpecification
		LogLevel?:           string | fn.Fn
		Name?:               string | fn.Fn
		RoleArn?:            string | fn.Fn
		Tags?:               {
		} | fn.Fn
	}
	__AribSourceSettings :: {
	}
	__AudioLanguageSelection :: {
		LanguageCode?:            string | fn.Fn
		LanguageSelectionPolicy?: string | fn.Fn
	}
	__AudioPidSelection :: {
		Pid?: int | fn.Fn
	}
	__AudioSelector :: {
		Name?:             string | fn.Fn
		SelectorSettings?: __AudioSelectorSettings
	}
	__AudioSelectorSettings :: {
		AudioLanguageSelection?: __AudioLanguageSelection
		AudioPidSelection?:      __AudioPidSelection
	}
	__CaptionSelector :: {
		LanguageCode?:     string | fn.Fn
		Name?:             string | fn.Fn
		SelectorSettings?: __CaptionSelectorSettings
	}
	__CaptionSelectorSettings :: {
		AribSourceSettings?:     __AribSourceSettings
		DvbSubSourceSettings?:   __DvbSubSourceSettings
		EmbeddedSourceSettings?: __EmbeddedSourceSettings
		Scte20SourceSettings?:   __Scte20SourceSettings
		Scte27SourceSettings?:   __Scte27SourceSettings
		TeletextSourceSettings?: __TeletextSourceSettings
	}
	__DvbSubSourceSettings :: {
		Pid?: int | fn.Fn
	}
	__EmbeddedSourceSettings :: {
		Convert608To708?:        string | fn.Fn
		Scte20Detection?:        string | fn.Fn
		Source608ChannelNumber?: int | fn.Fn
		Source608TrackNumber?:   int | fn.Fn
	}
	__HlsInputSettings :: {
		Bandwidth?:      int | fn.Fn
		BufferSegments?: int | fn.Fn
		Retries?:        int | fn.Fn
		RetryInterval?:  int | fn.Fn
	}
	__InputAttachment :: {
		InputAttachmentName?: string | fn.Fn
		InputId?:             string | fn.Fn
		InputSettings?:       __InputSettings
	}
	__InputSettings :: {
		AudioSelectors?: [...__AudioSelector]
		CaptionSelectors?: [...__CaptionSelector]
		DeblockFilter?:        string | fn.Fn
		DenoiseFilter?:        string | fn.Fn
		FilterStrength?:       int | fn.Fn
		InputFilter?:          string | fn.Fn
		NetworkInputSettings?: __NetworkInputSettings
		SourceEndBehavior?:    string | fn.Fn
		VideoSelector?:        __VideoSelector
	}
	__InputSpecification :: {
		Codec?:          string | fn.Fn
		MaximumBitrate?: string | fn.Fn
		Resolution?:     string | fn.Fn
	}
	__MediaPackageOutputDestinationSettings :: {
		ChannelId?: string | fn.Fn
	}
	__NetworkInputSettings :: {
		HlsInputSettings?: __HlsInputSettings
		ServerValidation?: string | fn.Fn
	}
	__OutputDestination :: {
		Id?: string | fn.Fn
		MediaPackageSettings?: [...__MediaPackageOutputDestinationSettings]
		Settings?: [...__OutputDestinationSettings]
	}
	__OutputDestinationSettings :: {
		PasswordParam?: string | fn.Fn
		StreamName?:    string | fn.Fn
		Url?:           string | fn.Fn
		Username?:      string | fn.Fn
	}
	__Scte20SourceSettings :: {
		Convert608To708?:        string | fn.Fn
		Source608ChannelNumber?: int | fn.Fn
	}
	__Scte27SourceSettings :: {
		Pid?: int | fn.Fn
	}
	__TeletextSourceSettings :: {
		PageNumber?: string | fn.Fn
	}
	__VideoSelector :: {
		ColorSpace?:       string | fn.Fn
		ColorSpaceUsage?:  string | fn.Fn
		SelectorSettings?: __VideoSelectorSettings
	}
	__VideoSelectorPid :: {
		Pid?: int | fn.Fn
	}
	__VideoSelectorProgramId :: {
		ProgramId?: int | fn.Fn
	}
	__VideoSelectorSettings :: {
		VideoSelectorPid?:       __VideoSelectorPid
		VideoSelectorProgramId?: __VideoSelectorProgramId
	}
}
Input :: {
	Type: "AWS::MediaLive::Input"
	Properties: {
		Destinations?: [...__InputDestinationRequest]
		InputSecurityGroups?: [...string] | fn.Fn
		MediaConnectFlows?: [...__MediaConnectFlowRequest]
		Name?:    string | fn.Fn
		RoleArn?: string | fn.Fn
		Sources?: [...__InputSourceRequest]
		Tags?: {
		} | fn.Fn
		Type?: string | fn.Fn
		Vpc?:  __InputVpcRequest
	}
	__InputDestinationRequest :: {
		StreamName?: string | fn.Fn
	}
	__InputSourceRequest :: {
		PasswordParam?: string | fn.Fn
		Url?:           string | fn.Fn
		Username?:      string | fn.Fn
	}
	__InputVpcRequest :: {
		SecurityGroupIds?: [...string] | fn.Fn
		SubnetIds?:        [...string] | fn.Fn
	}
	__MediaConnectFlowRequest :: {
		FlowArn?: string | fn.Fn
	}
}
InputSecurityGroup :: {
	Type: "AWS::MediaLive::InputSecurityGroup"
	Properties: {
		Tags?: {
		} | fn.Fn
		WhitelistRules?: [...__InputWhitelistRuleCidr]
	}
	__InputWhitelistRuleCidr :: {
		Cidr?: string | fn.Fn
	}
}

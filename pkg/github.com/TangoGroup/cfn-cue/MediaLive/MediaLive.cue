package MediaLive

import "github.com/TangoGroup/fn"

Channel :: {
	Type: "AWS::MediaLive::Channel"
	Properties: {
		ChannelClass?: string | fn.Fn
		Destinations?: [...propOutputDestination]
		EncoderSettings?: {
		} | fn.Fn
		InputAttachments?: [...propInputAttachment]
		InputSpecification?: propInputSpecification
		LogLevel?:           string | fn.Fn
		Name?:               string | fn.Fn
		RoleArn?:            string | fn.Fn
		Tags?:               {
		} | fn.Fn
	}
	propAribSourceSettings :: {
	}
	propAudioLanguageSelection :: {
		LanguageCode?:            string | fn.Fn
		LanguageSelectionPolicy?: string | fn.Fn
	}
	propAudioPidSelection :: {
		Pid?: int | fn.Fn
	}
	propAudioSelector :: {
		Name?:             string | fn.Fn
		SelectorSettings?: propAudioSelectorSettings
	}
	propAudioSelectorSettings :: {
		AudioLanguageSelection?: propAudioLanguageSelection
		AudioPidSelection?:      propAudioPidSelection
	}
	propCaptionSelector :: {
		LanguageCode?:     string | fn.Fn
		Name?:             string | fn.Fn
		SelectorSettings?: propCaptionSelectorSettings
	}
	propCaptionSelectorSettings :: {
		AribSourceSettings?:     propAribSourceSettings
		DvbSubSourceSettings?:   propDvbSubSourceSettings
		EmbeddedSourceSettings?: propEmbeddedSourceSettings
		Scte20SourceSettings?:   propScte20SourceSettings
		Scte27SourceSettings?:   propScte27SourceSettings
		TeletextSourceSettings?: propTeletextSourceSettings
	}
	propDvbSubSourceSettings :: {
		Pid?: int | fn.Fn
	}
	propEmbeddedSourceSettings :: {
		Convert608To708?:        string | fn.Fn
		Scte20Detection?:        string | fn.Fn
		Source608ChannelNumber?: int | fn.Fn
		Source608TrackNumber?:   int | fn.Fn
	}
	propHlsInputSettings :: {
		Bandwidth?:      int | fn.Fn
		BufferSegments?: int | fn.Fn
		Retries?:        int | fn.Fn
		RetryInterval?:  int | fn.Fn
	}
	propInputAttachment :: {
		InputAttachmentName?: string | fn.Fn
		InputId?:             string | fn.Fn
		InputSettings?:       propInputSettings
	}
	propInputSettings :: {
		AudioSelectors?: [...propAudioSelector]
		CaptionSelectors?: [...propCaptionSelector]
		DeblockFilter?:        string | fn.Fn
		DenoiseFilter?:        string | fn.Fn
		FilterStrength?:       int | fn.Fn
		InputFilter?:          string | fn.Fn
		NetworkInputSettings?: propNetworkInputSettings
		SourceEndBehavior?:    string | fn.Fn
		VideoSelector?:        propVideoSelector
	}
	propInputSpecification :: {
		Codec?:          string | fn.Fn
		MaximumBitrate?: string | fn.Fn
		Resolution?:     string | fn.Fn
	}
	propMediaPackageOutputDestinationSettings :: {
		ChannelId?: string | fn.Fn
	}
	propNetworkInputSettings :: {
		HlsInputSettings?: propHlsInputSettings
		ServerValidation?: string | fn.Fn
	}
	propOutputDestination :: {
		Id?: string | fn.Fn
		MediaPackageSettings?: [...propMediaPackageOutputDestinationSettings]
		Settings?: [...propOutputDestinationSettings]
	}
	propOutputDestinationSettings :: {
		PasswordParam?: string | fn.Fn
		StreamName?:    string | fn.Fn
		Url?:           string | fn.Fn
		Username?:      string | fn.Fn
	}
	propScte20SourceSettings :: {
		Convert608To708?:        string | fn.Fn
		Source608ChannelNumber?: int | fn.Fn
	}
	propScte27SourceSettings :: {
		Pid?: int | fn.Fn
	}
	propTeletextSourceSettings :: {
		PageNumber?: string | fn.Fn
	}
	propVideoSelector :: {
		ColorSpace?:       string | fn.Fn
		ColorSpaceUsage?:  string | fn.Fn
		SelectorSettings?: propVideoSelectorSettings
	}
	propVideoSelectorPid :: {
		Pid?: int | fn.Fn
	}
	propVideoSelectorProgramId :: {
		ProgramId?: int | fn.Fn
	}
	propVideoSelectorSettings :: {
		VideoSelectorPid?:       propVideoSelectorPid
		VideoSelectorProgramId?: propVideoSelectorProgramId
	}
}
Input :: {
	Type: "AWS::MediaLive::Input"
	Properties: {
		Destinations?: [...propInputDestinationRequest]
		InputSecurityGroups?: [...string] | fn.Fn
		MediaConnectFlows?: [...propMediaConnectFlowRequest]
		Name?:    string | fn.Fn
		RoleArn?: string | fn.Fn
		Sources?: [...propInputSourceRequest]
		Tags?: {
		} | fn.Fn
		Type?: string | fn.Fn
		Vpc?:  propInputVpcRequest
	}
	propInputDestinationRequest :: {
		StreamName?: string | fn.Fn
	}
	propInputSourceRequest :: {
		PasswordParam?: string | fn.Fn
		Url?:           string | fn.Fn
		Username?:      string | fn.Fn
	}
	propInputVpcRequest :: {
		SecurityGroupIds?: [...string] | fn.Fn
		SubnetIds?:        [...string] | fn.Fn
	}
	propMediaConnectFlowRequest :: {
		FlowArn?: string | fn.Fn
	}
}
InputSecurityGroup :: {
	Type: "AWS::MediaLive::InputSecurityGroup"
	Properties: {
		Tags?: {
		} | fn.Fn
		WhitelistRules?: [...propInputWhitelistRuleCidr]
	}
	propInputWhitelistRuleCidr :: {
		Cidr?: string | fn.Fn
	}
}

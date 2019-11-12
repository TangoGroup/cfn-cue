package saeast1

import "github.com/TangoGroup/fn"

MediaLive :: {
	Channel :: {
		Type: "AWS::MediaLive::Channel"
		Properties: {
			ChannelClass?: string | fn.Fn
			Destinations?: [...{
				Id?: string | fn.Fn
				MediaPackageSettings?: [...{
					ChannelId?: string | fn.Fn
				}]
				Settings?: [...{
					PasswordParam?: string | fn.Fn
					StreamName?:    string | fn.Fn
					Url?:           string | fn.Fn
					Username?:      string | fn.Fn
				}]
			}]
			EncoderSettings?: {
				[string]: _
			} | fn.Fn
			InputAttachments?: [...{
				InputAttachmentName?: string | fn.Fn
				InputId?:             string | fn.Fn
				InputSettings?: {
					AudioSelectors?: [...{
						Name?: string | fn.Fn
						SelectorSettings?: {
							AudioLanguageSelection?: {
								LanguageCode?:            string | fn.Fn
								LanguageSelectionPolicy?: string | fn.Fn
							}
							AudioPidSelection?: Pid?: int | fn.Fn
						}
					}]
					CaptionSelectors?: [...{
						LanguageCode?: string | fn.Fn
						Name?:         string | fn.Fn
						SelectorSettings?: {
							AribSourceSettings?: {
							}
							DvbSubSourceSettings?: Pid?: int | fn.Fn
							EmbeddedSourceSettings?: {
								Convert608To708?:        string | fn.Fn
								Scte20Detection?:        string | fn.Fn
								Source608ChannelNumber?: int | fn.Fn
								Source608TrackNumber?:   int | fn.Fn
							}
							Scte20SourceSettings?: {
								Convert608To708?:        string | fn.Fn
								Source608ChannelNumber?: int | fn.Fn
							}
							Scte27SourceSettings?: Pid?:          int | fn.Fn
							TeletextSourceSettings?: PageNumber?: string | fn.Fn
						}
					}]
					DeblockFilter?:  string | fn.Fn
					DenoiseFilter?:  string | fn.Fn
					FilterStrength?: int | fn.Fn
					InputFilter?:    string | fn.Fn
					NetworkInputSettings?: {
						HlsInputSettings?: {
							Bandwidth?:      int | fn.Fn
							BufferSegments?: int | fn.Fn
							Retries?:        int | fn.Fn
							RetryInterval?:  int | fn.Fn
						}
						ServerValidation?: string | fn.Fn
					}
					SourceEndBehavior?: string | fn.Fn
					VideoSelector?: {
						ColorSpace?:      string | fn.Fn
						ColorSpaceUsage?: string | fn.Fn
						SelectorSettings?: {
							VideoSelectorPid?: Pid?:             int | fn.Fn
							VideoSelectorProgramId?: ProgramId?: int | fn.Fn
						}
					}
				}
			}]
			InputSpecification?: {
				Codec?:          string | fn.Fn
				MaximumBitrate?: string | fn.Fn
				Resolution?:     string | fn.Fn
			}
			LogLevel?: string | fn.Fn
			Name?:     string | fn.Fn
			RoleArn?:  string | fn.Fn
			Tags?:     {
				[string]: _
			} | fn.Fn
		}
	}
	Input :: {
		Type: "AWS::MediaLive::Input"
		Properties: {
			Destinations?: [...{
				StreamName?: string | fn.Fn
			}]
			InputSecurityGroups?: [...(string | fn.Fn)]
			MediaConnectFlows?: [...{
				FlowArn?: string | fn.Fn
			}]
			Name?:    string | fn.Fn
			RoleArn?: string | fn.Fn
			Sources?: [...{
				PasswordParam?: string | fn.Fn
				Url?:           string | fn.Fn
				Username?:      string | fn.Fn
			}]
			Tags?: {
				[string]: _
			} | fn.Fn
			Type?: string | fn.Fn
			Vpc?: {
				SecurityGroupIds?: [...(string | fn.Fn)]
				SubnetIds?: [...(string | fn.Fn)]
			}
		}
	}
	InputSecurityGroup :: {
		Type: "AWS::MediaLive::InputSecurityGroup"
		Properties: {
			Tags?: {
				[string]: _
			} | fn.Fn
			WhitelistRules?: [...{
				Cidr?: string | fn.Fn
			}]
		}
	}
}

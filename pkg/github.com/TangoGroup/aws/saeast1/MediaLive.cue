package saeast1

import "github.com/TangoGroup/aws/fn"

#MediaLive: {
	#Channel: {
		Type:       "AWS::MediaLive::Channel"
		Properties: close({
			ChannelClass?: string | fn.#Fn
			Destinations?: [...close({
				Id?:                   string | fn.#Fn
				MediaPackageSettings?: [...close({
					ChannelId?: string | fn.#Fn
				})] | fn.If
				MultiplexSettings?: close({
					MultiplexId?: string | fn.#Fn
					ProgramName?: string | fn.#Fn
				}) | fn.If
				Settings?: [...close({
					PasswordParam?: string | fn.#Fn
					StreamName?:    string | fn.#Fn
					Url?:           string | fn.#Fn
					Username?:      string | fn.#Fn
				})] | fn.If
			})] | fn.If
			EncoderSettings?: {
				[string]: _
			} | fn.#Fn
			InputAttachments?: [...close({
				InputAttachmentName?: string | fn.#Fn
				InputId?:             string | fn.#Fn
				InputSettings?:       close({
					AudioSelectors?: [...close({
						Name?:             string | fn.#Fn
						SelectorSettings?: close({
							AudioLanguageSelection?: close({
								LanguageCode?:            string | fn.#Fn
								LanguageSelectionPolicy?: string | fn.#Fn
							}) | fn.If
							AudioPidSelection?: close({
								Pid?: int | fn.#Fn
							}) | fn.If
						}) | fn.If
					})] | fn.If
					CaptionSelectors?: [...close({
						LanguageCode?:     string | fn.#Fn
						Name?:             string | fn.#Fn
						SelectorSettings?: close({
							AribSourceSettings?:   close({}) | fn.If
							DvbSubSourceSettings?: close({
								Pid?: int | fn.#Fn
							}) | fn.If
							EmbeddedSourceSettings?: close({
								Convert608To708?:        string | fn.#Fn
								Scte20Detection?:        string | fn.#Fn
								Source608ChannelNumber?: int | fn.#Fn
								Source608TrackNumber?:   int | fn.#Fn
							}) | fn.If
							Scte20SourceSettings?: close({
								Convert608To708?:        string | fn.#Fn
								Source608ChannelNumber?: int | fn.#Fn
							}) | fn.If
							Scte27SourceSettings?: close({
								Pid?: int | fn.#Fn
							}) | fn.If
							TeletextSourceSettings?: close({
								PageNumber?: string | fn.#Fn
							}) | fn.If
						}) | fn.If
					})] | fn.If
					DeblockFilter?:        string | fn.#Fn
					DenoiseFilter?:        string | fn.#Fn
					FilterStrength?:       int | fn.#Fn
					InputFilter?:          string | fn.#Fn
					NetworkInputSettings?: close({
						HlsInputSettings?: close({
							Bandwidth?:      int | fn.#Fn
							BufferSegments?: int | fn.#Fn
							Retries?:        int | fn.#Fn
							RetryInterval?:  int | fn.#Fn
						}) | fn.If
						ServerValidation?: string | fn.#Fn
					}) | fn.If
					SourceEndBehavior?: string | fn.#Fn
					VideoSelector?:     close({
						ColorSpace?:       string | fn.#Fn
						ColorSpaceUsage?:  string | fn.#Fn
						SelectorSettings?: close({
							VideoSelectorPid?: close({
								Pid?: int | fn.#Fn
							}) | fn.If
							VideoSelectorProgramId?: close({
								ProgramId?: int | fn.#Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
				}) | fn.If
			})] | fn.If
			InputSpecification?: close({
				Codec?:          string | fn.#Fn
				MaximumBitrate?: string | fn.#Fn
				Resolution?:     string | fn.#Fn
			}) | fn.If
			LogLevel?: string | fn.#Fn
			Name?:     string | fn.#Fn
			RoleArn?:  string | fn.#Fn
			Tags?:     {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Input: {
		Type:       "AWS::MediaLive::Input"
		Properties: close({
			Destinations?: [...close({
				StreamName?: string | fn.#Fn
			})] | fn.If
			InputSecurityGroups?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			MediaConnectFlows?:   [...close({
				FlowArn?: string | fn.#Fn
			})] | fn.If
			Name?:    string | fn.#Fn
			RoleArn?: string | fn.#Fn
			Sources?: [...close({
				PasswordParam?: string | fn.#Fn
				Url?:           string | fn.#Fn
				Username?:      string | fn.#Fn
			})] | fn.If
			Tags?: {
				[string]: _
			} | fn.#Fn
			Type?: string | fn.#Fn
			Vpc?:  close({
				SecurityGroupIds?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				SubnetIds?:        [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#InputSecurityGroup: {
		Type:       "AWS::MediaLive::InputSecurityGroup"
		Properties: close({
			Tags?: {
				[string]: _
			} | fn.#Fn
			WhitelistRules?: [...close({
				Cidr?: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

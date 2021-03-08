package apsouth1

import "github.com/TangoGroup/aws/fn"

Pinpoint :: {
	ADMChannel :: {
		Type:       "AWS::Pinpoint::ADMChannel"
		Properties: close({
			ApplicationId: string | fn.Fn
			ClientId:      string | fn.Fn
			ClientSecret:  string | fn.Fn
			Enabled?:      bool | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	APNSChannel :: {
		Type:       "AWS::Pinpoint::APNSChannel"
		Properties: close({
			ApplicationId:                string | fn.Fn
			BundleId?:                    string | fn.Fn
			Certificate?:                 string | fn.Fn
			DefaultAuthenticationMethod?: string | fn.Fn
			Enabled?:                     bool | fn.Fn
			PrivateKey?:                  string | fn.Fn
			TeamId?:                      string | fn.Fn
			TokenKey?:                    string | fn.Fn
			TokenKeyId?:                  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	APNSSandboxChannel :: {
		Type:       "AWS::Pinpoint::APNSSandboxChannel"
		Properties: close({
			ApplicationId:                string | fn.Fn
			BundleId?:                    string | fn.Fn
			Certificate?:                 string | fn.Fn
			DefaultAuthenticationMethod?: string | fn.Fn
			Enabled?:                     bool | fn.Fn
			PrivateKey?:                  string | fn.Fn
			TeamId?:                      string | fn.Fn
			TokenKey?:                    string | fn.Fn
			TokenKeyId?:                  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	APNSVoipChannel :: {
		Type:       "AWS::Pinpoint::APNSVoipChannel"
		Properties: close({
			ApplicationId:                string | fn.Fn
			BundleId?:                    string | fn.Fn
			Certificate?:                 string | fn.Fn
			DefaultAuthenticationMethod?: string | fn.Fn
			Enabled?:                     bool | fn.Fn
			PrivateKey?:                  string | fn.Fn
			TeamId?:                      string | fn.Fn
			TokenKey?:                    string | fn.Fn
			TokenKeyId?:                  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	APNSVoipSandboxChannel :: {
		Type:       "AWS::Pinpoint::APNSVoipSandboxChannel"
		Properties: close({
			ApplicationId:                string | fn.Fn
			BundleId?:                    string | fn.Fn
			Certificate?:                 string | fn.Fn
			DefaultAuthenticationMethod?: string | fn.Fn
			Enabled?:                     bool | fn.Fn
			PrivateKey?:                  string | fn.Fn
			TeamId?:                      string | fn.Fn
			TokenKey?:                    string | fn.Fn
			TokenKeyId?:                  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	App :: {
		Type:       "AWS::Pinpoint::App"
		Properties: close({
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationSettings :: {
		Type:       "AWS::Pinpoint::ApplicationSettings"
		Properties: close({
			ApplicationId: string | fn.Fn
			CampaignHook?: close({
				LambdaFunctionName?: string | fn.Fn
				Mode?:               string | fn.Fn
				WebUrl?:             string | fn.Fn
			}) | fn.If
			CloudWatchMetricsEnabled?: bool | fn.Fn
			Limits?:                   close({
				Daily?:             int | fn.Fn
				MaximumDuration?:   int | fn.Fn
				MessagesPerSecond?: int | fn.Fn
				Total?:             int | fn.Fn
			}) | fn.If
			QuietTime?: close({
				End:   string | fn.Fn
				Start: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	BaiduChannel :: {
		Type:       "AWS::Pinpoint::BaiduChannel"
		Properties: close({
			ApiKey:        string | fn.Fn
			ApplicationId: string | fn.Fn
			Enabled?:      bool | fn.Fn
			SecretKey:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Campaign :: {
		Type:       "AWS::Pinpoint::Campaign"
		Properties: close({
			AdditionalTreatments?: [...close({
				MessageConfiguration?: close({
					ADMMessage?: close({
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
					}) | fn.If
					APNSMessage?: close({
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
					}) | fn.If
					BaiduMessage?: close({
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
					}) | fn.If
					DefaultMessage?: close({
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
					}) | fn.If
					EmailMessage?: close({
						Body?:        string | fn.Fn
						FromAddress?: string | fn.Fn
						HtmlBody?:    string | fn.Fn
						Title?:       string | fn.Fn
					}) | fn.If
					GCMMessage?: close({
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
					}) | fn.If
					SMSMessage?: close({
						Body?:              string | fn.Fn
						EntityId?:          string | fn.Fn
						MessageType?:       string | fn.Fn
						OriginationNumber?: string | fn.Fn
						SenderId?:          string | fn.Fn
						TemplateId?:        string | fn.Fn
					}) | fn.If
				}) | fn.If
				Schedule?: close({
					EndTime?:     string | fn.Fn
					EventFilter?: close({
						Dimensions?: close({
							Attributes?: {
								[string]: _
							} | fn.Fn
							EventType?: close({
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							Metrics?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						FilterType?: string | fn.Fn
					}) | fn.If
					Frequency?:   string | fn.Fn
					IsLocalTime?: bool | fn.Fn
					QuietTime?:   close({
						End:   string | fn.Fn
						Start: string | fn.Fn
					}) | fn.If
					StartTime?: string | fn.Fn
					TimeZone?:  string | fn.Fn
				}) | fn.If
				SizePercent?:          int | fn.Fn
				TreatmentDescription?: string | fn.Fn
				TreatmentName?:        string | fn.Fn
			})] | fn.If
			ApplicationId: string | fn.Fn
			CampaignHook?: close({
				LambdaFunctionName?: string | fn.Fn
				Mode?:               string | fn.Fn
				WebUrl?:             string | fn.Fn
			}) | fn.If
			Description?:    string | fn.Fn
			HoldoutPercent?: int | fn.Fn
			IsPaused?:       bool | fn.Fn
			Limits?:         close({
				Daily?:             int | fn.Fn
				MaximumDuration?:   int | fn.Fn
				MessagesPerSecond?: int | fn.Fn
				Total?:             int | fn.Fn
			}) | fn.If
			MessageConfiguration: close({
				ADMMessage?: close({
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
				}) | fn.If
				APNSMessage?: close({
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
				}) | fn.If
				BaiduMessage?: close({
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
				}) | fn.If
				DefaultMessage?: close({
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
				}) | fn.If
				EmailMessage?: close({
					Body?:        string | fn.Fn
					FromAddress?: string | fn.Fn
					HtmlBody?:    string | fn.Fn
					Title?:       string | fn.Fn
				}) | fn.If
				GCMMessage?: close({
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
				}) | fn.If
				SMSMessage?: close({
					Body?:              string | fn.Fn
					EntityId?:          string | fn.Fn
					MessageType?:       string | fn.Fn
					OriginationNumber?: string | fn.Fn
					SenderId?:          string | fn.Fn
					TemplateId?:        string | fn.Fn
				}) | fn.If
			}) | fn.If
			Name:     string | fn.Fn
			Schedule: close({
				EndTime?:     string | fn.Fn
				EventFilter?: close({
					Dimensions?: close({
						Attributes?: {
							[string]: _
						} | fn.Fn
						EventType?: close({
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						Metrics?: {
							[string]: _
						} | fn.Fn
					}) | fn.If
					FilterType?: string | fn.Fn
				}) | fn.If
				Frequency?:   string | fn.Fn
				IsLocalTime?: bool | fn.Fn
				QuietTime?:   close({
					End:   string | fn.Fn
					Start: string | fn.Fn
				}) | fn.If
				StartTime?: string | fn.Fn
				TimeZone?:  string | fn.Fn
			}) | fn.If
			SegmentId:       string | fn.Fn
			SegmentVersion?: int | fn.Fn
			Tags?:           {
				[string]: _
			} | fn.Fn
			TreatmentDescription?: string | fn.Fn
			TreatmentName?:        string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EmailChannel :: {
		Type:       "AWS::Pinpoint::EmailChannel"
		Properties: close({
			ApplicationId:     string | fn.Fn
			ConfigurationSet?: string | fn.Fn
			Enabled?:          bool | fn.Fn
			FromAddress:       string | fn.Fn
			Identity:          string | fn.Fn
			RoleArn?:          string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EmailTemplate :: {
		Type:       "AWS::Pinpoint::EmailTemplate"
		Properties: close({
			DefaultSubstitutions?: string | fn.Fn
			HtmlPart?:             string | fn.Fn
			Subject:               string | fn.Fn
			Tags?:                 {
				[string]: _
			} | fn.Fn
			TemplateDescription?: string | fn.Fn
			TemplateName:         string | fn.Fn
			TextPart?:            string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EventStream :: {
		Type:       "AWS::Pinpoint::EventStream"
		Properties: close({
			ApplicationId:        string | fn.Fn
			DestinationStreamArn: string | fn.Fn
			RoleArn:              string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GCMChannel :: {
		Type:       "AWS::Pinpoint::GCMChannel"
		Properties: close({
			ApiKey:        string | fn.Fn
			ApplicationId: string | fn.Fn
			Enabled?:      bool | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PushTemplate :: {
		Type:       "AWS::Pinpoint::PushTemplate"
		Properties: close({
			ADM?: close({
				Action?:            string | fn.Fn
				Body?:              string | fn.Fn
				ImageIconUrl?:      string | fn.Fn
				ImageUrl?:          string | fn.Fn
				SmallImageIconUrl?: string | fn.Fn
				Sound?:             string | fn.Fn
				Title?:             string | fn.Fn
				Url?:               string | fn.Fn
			}) | fn.If
			APNS?: close({
				Action?:   string | fn.Fn
				Body?:     string | fn.Fn
				MediaUrl?: string | fn.Fn
				Sound?:    string | fn.Fn
				Title?:    string | fn.Fn
				Url?:      string | fn.Fn
			}) | fn.If
			Baidu?: close({
				Action?:            string | fn.Fn
				Body?:              string | fn.Fn
				ImageIconUrl?:      string | fn.Fn
				ImageUrl?:          string | fn.Fn
				SmallImageIconUrl?: string | fn.Fn
				Sound?:             string | fn.Fn
				Title?:             string | fn.Fn
				Url?:               string | fn.Fn
			}) | fn.If
			Default?: close({
				Action?: string | fn.Fn
				Body?:   string | fn.Fn
				Sound?:  string | fn.Fn
				Title?:  string | fn.Fn
				Url?:    string | fn.Fn
			}) | fn.If
			DefaultSubstitutions?: string | fn.Fn
			GCM?:                  close({
				Action?:            string | fn.Fn
				Body?:              string | fn.Fn
				ImageIconUrl?:      string | fn.Fn
				ImageUrl?:          string | fn.Fn
				SmallImageIconUrl?: string | fn.Fn
				Sound?:             string | fn.Fn
				Title?:             string | fn.Fn
				Url?:               string | fn.Fn
			}) | fn.If
			Tags?: {
				[string]: _
			} | fn.Fn
			TemplateDescription?: string | fn.Fn
			TemplateName:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SMSChannel :: {
		Type:       "AWS::Pinpoint::SMSChannel"
		Properties: close({
			ApplicationId: string | fn.Fn
			Enabled?:      bool | fn.Fn
			SenderId?:     string | fn.Fn
			ShortCode?:    string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Segment :: {
		Type:       "AWS::Pinpoint::Segment"
		Properties: close({
			ApplicationId: string | fn.Fn
			Dimensions?:   close({
				Attributes?: {
					[string]: _
				} | fn.Fn
				Behavior?: close({
					Recency?: close({
						Duration:    string | fn.Fn
						RecencyType: string | fn.Fn
					}) | fn.If
				}) | fn.If
				Demographic?: close({
					AppVersion?: close({
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Channel?: close({
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					DeviceType?: close({
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Make?: close({
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Model?: close({
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Platform?: close({
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
				}) | fn.If
				Location?: close({
					Country?: close({
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					GPSPoint?: close({
						Coordinates: close({
							Latitude:  number | fn.Fn
							Longitude: number | fn.Fn
						}) | fn.If
						RangeInKilometers: number | fn.Fn
					}) | fn.If
				}) | fn.If
				Metrics?: {
					[string]: _
				} | fn.Fn
				UserAttributes?: {
					[string]: _
				} | fn.Fn
			}) | fn.If
			Name:           string | fn.Fn
			SegmentGroups?: close({
				Groups?: [...close({
					Dimensions?: [...close({
						Attributes?: {
							[string]: _
						} | fn.Fn
						Behavior?: close({
							Recency?: close({
								Duration:    string | fn.Fn
								RecencyType: string | fn.Fn
							}) | fn.If
						}) | fn.If
						Demographic?: close({
							AppVersion?: close({
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							Channel?: close({
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							DeviceType?: close({
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							Make?: close({
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							Model?: close({
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							Platform?: close({
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
						}) | fn.If
						Location?: close({
							Country?: close({
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							GPSPoint?: close({
								Coordinates: close({
									Latitude:  number | fn.Fn
									Longitude: number | fn.Fn
								}) | fn.If
								RangeInKilometers: number | fn.Fn
							}) | fn.If
						}) | fn.If
						Metrics?: {
							[string]: _
						} | fn.Fn
						UserAttributes?: {
							[string]: _
						} | fn.Fn
					})] | fn.If
					SourceSegments?: [...close({
						Id:       string | fn.Fn
						Version?: int | fn.Fn
					})] | fn.If
					SourceType?: string | fn.Fn
					Type?:       string | fn.Fn
				})] | fn.If
				Include?: string | fn.Fn
			}) | fn.If
			Tags?: {
				[string]: _
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SmsTemplate :: {
		Type:       "AWS::Pinpoint::SmsTemplate"
		Properties: close({
			Body:                  string | fn.Fn
			DefaultSubstitutions?: string | fn.Fn
			Tags?:                 {
				[string]: _
			} | fn.Fn
			TemplateDescription?: string | fn.Fn
			TemplateName:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VoiceChannel :: {
		Type:       "AWS::Pinpoint::VoiceChannel"
		Properties: close({
			ApplicationId: string | fn.Fn
			Enabled?:      bool | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

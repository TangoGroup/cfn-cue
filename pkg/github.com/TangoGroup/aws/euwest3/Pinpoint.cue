package euwest3

import "github.com/TangoGroup/aws/fn"

Pinpoint :: {
	ADMChannel :: {
		Type: "AWS::Pinpoint::ADMChannel"
		Properties: {
			ApplicationId: string | fn.Fn
			ClientId:      string | fn.Fn
			ClientSecret:  string | fn.Fn
			Enabled?:      bool | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	App :: {
		Type: "AWS::Pinpoint::App"
		Properties: {
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationSettings :: {
		Type: "AWS::Pinpoint::ApplicationSettings"
		Properties: {
			ApplicationId: string | fn.Fn
			CampaignHook?: {
				LambdaFunctionName?: string | fn.Fn
				Mode?:               string | fn.Fn
				WebUrl?:             string | fn.Fn
			}
			CloudWatchMetricsEnabled?: bool | fn.Fn
			Limits?: {
				Daily?:             int | fn.Fn
				MaximumDuration?:   int | fn.Fn
				MessagesPerSecond?: int | fn.Fn
				Total?:             int | fn.Fn
			}
			QuietTime?: {
				End:   string | fn.Fn
				Start: string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	BaiduChannel :: {
		Type: "AWS::Pinpoint::BaiduChannel"
		Properties: {
			ApiKey:        string | fn.Fn
			ApplicationId: string | fn.Fn
			Enabled?:      bool | fn.Fn
			SecretKey:     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Campaign :: {
		Type: "AWS::Pinpoint::Campaign"
		Properties: {
			AdditionalTreatments?: [...{
				MessageConfiguration?: {
					ADMMessage?: {
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
					APNSMessage?: {
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
					BaiduMessage?: {
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
					DefaultMessage?: {
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
					EmailMessage?: {
						Body?:        string | fn.Fn
						FromAddress?: string | fn.Fn
						HtmlBody?:    string | fn.Fn
						Title?:       string | fn.Fn
					}
					GCMMessage?: {
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
					SMSMessage?: {
						Body?:        string | fn.Fn
						MessageType?: string | fn.Fn
						SenderId?:    string | fn.Fn
					}
				}
				Schedule?: {
					EndTime?: string | fn.Fn
					EventFilter?: {
						Dimensions?: {
							Attributes?: {
								[string]: _
							} | fn.Fn
							EventType?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}
							Metrics?: {
								[string]: _
							} | fn.Fn
						}
						FilterType?: string | fn.Fn
					}
					Frequency?:   string | fn.Fn
					IsLocalTime?: bool | fn.Fn
					QuietTime?: {
						End:   string | fn.Fn
						Start: string | fn.Fn
					}
					StartTime?: string | fn.Fn
					TimeZone?:  string | fn.Fn
				}
				SizePercent?:          int | fn.Fn
				TreatmentDescription?: string | fn.Fn
				TreatmentName?:        string | fn.Fn
			}]
			ApplicationId: string | fn.Fn
			CampaignHook?: {
				LambdaFunctionName?: string | fn.Fn
				Mode?:               string | fn.Fn
				WebUrl?:             string | fn.Fn
			}
			Description?:    string | fn.Fn
			HoldoutPercent?: int | fn.Fn
			IsPaused?:       bool | fn.Fn
			Limits?: {
				Daily?:             int | fn.Fn
				MaximumDuration?:   int | fn.Fn
				MessagesPerSecond?: int | fn.Fn
				Total?:             int | fn.Fn
			}
			MessageConfiguration: {
				ADMMessage?: {
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
				APNSMessage?: {
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
				BaiduMessage?: {
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
				DefaultMessage?: {
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
				EmailMessage?: {
					Body?:        string | fn.Fn
					FromAddress?: string | fn.Fn
					HtmlBody?:    string | fn.Fn
					Title?:       string | fn.Fn
				}
				GCMMessage?: {
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
				SMSMessage?: {
					Body?:        string | fn.Fn
					MessageType?: string | fn.Fn
					SenderId?:    string | fn.Fn
				}
			}
			Name: string | fn.Fn
			Schedule: {
				EndTime?: string | fn.Fn
				EventFilter?: {
					Dimensions?: {
						Attributes?: {
							[string]: _
						} | fn.Fn
						EventType?: {
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
						}
						Metrics?: {
							[string]: _
						} | fn.Fn
					}
					FilterType?: string | fn.Fn
				}
				Frequency?:   string | fn.Fn
				IsLocalTime?: bool | fn.Fn
				QuietTime?: {
					End:   string | fn.Fn
					Start: string | fn.Fn
				}
				StartTime?: string | fn.Fn
				TimeZone?:  string | fn.Fn
			}
			SegmentId:       string | fn.Fn
			SegmentVersion?: int | fn.Fn
			Tags?:           {
				[string]: _
			} | fn.Fn
			TreatmentDescription?: string | fn.Fn
			TreatmentName?:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EmailTemplate :: {
		Type: "AWS::Pinpoint::EmailTemplate"
		Properties: {
			DefaultSubstitutions?: string | fn.Fn
			HtmlPart?:             string | fn.Fn
			Subject:               string | fn.Fn
			Tags?:                 {
				[string]: _
			} | fn.Fn
			TemplateDescription?: string | fn.Fn
			TemplateName:         string | fn.Fn
			TextPart?:            string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EventStream :: {
		Type: "AWS::Pinpoint::EventStream"
		Properties: {
			ApplicationId:        string | fn.Fn
			DestinationStreamArn: string | fn.Fn
			RoleArn:              string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GCMChannel :: {
		Type: "AWS::Pinpoint::GCMChannel"
		Properties: {
			ApiKey:        string | fn.Fn
			ApplicationId: string | fn.Fn
			Enabled?:      bool | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PushTemplate :: {
		Type: "AWS::Pinpoint::PushTemplate"
		Properties: {
			ADM?: {
				Action?:            string | fn.Fn
				Body?:              string | fn.Fn
				ImageIconUrl?:      string | fn.Fn
				ImageUrl?:          string | fn.Fn
				SmallImageIconUrl?: string | fn.Fn
				Sound?:             string | fn.Fn
				Title?:             string | fn.Fn
				Url?:               string | fn.Fn
			}
			APNS?: {
				Action?:   string | fn.Fn
				Body?:     string | fn.Fn
				MediaUrl?: string | fn.Fn
				Sound?:    string | fn.Fn
				Title?:    string | fn.Fn
				Url?:      string | fn.Fn
			}
			Baidu?: {
				Action?:            string | fn.Fn
				Body?:              string | fn.Fn
				ImageIconUrl?:      string | fn.Fn
				ImageUrl?:          string | fn.Fn
				SmallImageIconUrl?: string | fn.Fn
				Sound?:             string | fn.Fn
				Title?:             string | fn.Fn
				Url?:               string | fn.Fn
			}
			Default?: {
				Action?: string | fn.Fn
				Body?:   string | fn.Fn
				Sound?:  string | fn.Fn
				Title?:  string | fn.Fn
				Url?:    string | fn.Fn
			}
			DefaultSubstitutions?: string | fn.Fn
			GCM?: {
				Action?:            string | fn.Fn
				Body?:              string | fn.Fn
				ImageIconUrl?:      string | fn.Fn
				ImageUrl?:          string | fn.Fn
				SmallImageIconUrl?: string | fn.Fn
				Sound?:             string | fn.Fn
				Title?:             string | fn.Fn
				Url?:               string | fn.Fn
			}
			Tags?: {
				[string]: _
			} | fn.Fn
			TemplateDescription?: string | fn.Fn
			TemplateName:         string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SMSChannel :: {
		Type: "AWS::Pinpoint::SMSChannel"
		Properties: {
			ApplicationId: string | fn.Fn
			Enabled?:      bool | fn.Fn
			SenderId?:     string | fn.Fn
			ShortCode?:    string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Segment :: {
		Type: "AWS::Pinpoint::Segment"
		Properties: {
			ApplicationId: string | fn.Fn
			Dimensions?: {
				Attributes?: {
					[string]: _
				} | fn.Fn
				Behavior?: Recency?: {
					Duration:    string | fn.Fn
					RecencyType: string | fn.Fn
				}
				Demographic?: {
					AppVersion?: {
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}
					Channel?: {
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}
					DeviceType?: {
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}
					Make?: {
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}
					Model?: {
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}
					Platform?: {
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}
				}
				Location?: {
					Country?: {
						DimensionType?: string | fn.Fn
						Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
					}
					GPSPoint?: {
						Coordinates: {
							Latitude:  number | fn.Fn
							Longitude: number | fn.Fn
						}
						RangeInKilometers: number | fn.Fn
					}
				}
				Metrics?: {
					[string]: _
				} | fn.Fn
				UserAttributes?: {
					[string]: _
				} | fn.Fn
			}
			Name: string | fn.Fn
			SegmentGroups?: {
				Groups?: [...{
					Dimensions?: [...{
						Attributes?: {
							[string]: _
						} | fn.Fn
						Behavior?: Recency?: {
							Duration:    string | fn.Fn
							RecencyType: string | fn.Fn
						}
						Demographic?: {
							AppVersion?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}
							Channel?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}
							DeviceType?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}
							Make?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}
							Model?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}
							Platform?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}
						}
						Location?: {
							Country?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | (string | fn.Fn)
							}
							GPSPoint?: {
								Coordinates: {
									Latitude:  number | fn.Fn
									Longitude: number | fn.Fn
								}
								RangeInKilometers: number | fn.Fn
							}
						}
						Metrics?: {
							[string]: _
						} | fn.Fn
						UserAttributes?: {
							[string]: _
						} | fn.Fn
					}]
					SourceSegments?: [...{
						Id:       string | fn.Fn
						Version?: int | fn.Fn
					}]
					SourceType?: string | fn.Fn
					Type?:       string | fn.Fn
				}]
				Include?: string | fn.Fn
			}
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SmsTemplate :: {
		Type: "AWS::Pinpoint::SmsTemplate"
		Properties: {
			Body:                  string | fn.Fn
			DefaultSubstitutions?: string | fn.Fn
			Tags?:                 {
				[string]: _
			} | fn.Fn
			TemplateDescription?: string | fn.Fn
			TemplateName:         string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VoiceChannel :: {
		Type: "AWS::Pinpoint::VoiceChannel"
		Properties: {
			ApplicationId: string | fn.Fn
			Enabled?:      bool | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

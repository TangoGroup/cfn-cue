package euwest2

import "github.com/TangoGroup/aws/fn"

MediaPackage :: {
	Asset :: {
		Type:       "AWS::MediaPackage::Asset"
		Properties: close({
			EgressEndpoints?: [...close({
				PackagingConfigurationId: string | fn.Fn
				Url:                      string | fn.Fn
			})] | fn.If
			Id:               string | fn.Fn
			PackagingGroupId: string | fn.Fn
			ResourceId?:      string | fn.Fn
			SourceArn:        string | fn.Fn
			SourceRoleArn:    string | fn.Fn
			Tags?:            [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Channel :: {
		Type:       "AWS::MediaPackage::Channel"
		Properties: close({
			Description?: string | fn.Fn
			Id:           string | fn.Fn
			Tags?:        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	OriginEndpoint :: {
		Type:       "AWS::MediaPackage::OriginEndpoint"
		Properties: close({
			Authorization?: close({
				CdnIdentifierSecret: string | fn.Fn
				SecretsRoleArn:      string | fn.Fn
			}) | fn.If
			ChannelId:    string | fn.Fn
			CmafPackage?: close({
				Encryption?: close({
					KeyRotationIntervalSeconds?: int | fn.Fn
					SpekeKeyProvider:            close({
						CertificateArn?: string | fn.Fn
						ResourceId:      string | fn.Fn
						RoleArn:         string | fn.Fn
						SystemIds:       [...(string | fn.Fn)] | (string | fn.Fn)
						Url:             string | fn.Fn
					}) | fn.If
				}) | fn.If
				HlsManifests?: [...close({
					AdMarkers?:                      string | fn.Fn
					AdTriggers?:                     [...(string | fn.Fn)] | (string | fn.Fn)
					AdsOnDeliveryRestrictions?:      string | fn.Fn
					Id:                              string | fn.Fn
					IncludeIframeOnlyStream?:        bool | fn.Fn
					ManifestName?:                   string | fn.Fn
					PlaylistType?:                   string | fn.Fn
					PlaylistWindowSeconds?:          int | fn.Fn
					ProgramDateTimeIntervalSeconds?: int | fn.Fn
					Url?:                            string | fn.Fn
				})] | fn.If
				SegmentDurationSeconds?: int | fn.Fn
				SegmentPrefix?:          string | fn.Fn
				StreamSelection?:        close({
					MaxVideoBitsPerSecond?: int | fn.Fn
					MinVideoBitsPerSecond?: int | fn.Fn
					StreamOrder?:           string | fn.Fn
				}) | fn.If
			}) | fn.If
			DashPackage?: close({
				AdTriggers?:                [...(string | fn.Fn)] | (string | fn.Fn)
				AdsOnDeliveryRestrictions?: string | fn.Fn
				Encryption?:                close({
					KeyRotationIntervalSeconds?: int | fn.Fn
					SpekeKeyProvider:            close({
						CertificateArn?: string | fn.Fn
						ResourceId:      string | fn.Fn
						RoleArn:         string | fn.Fn
						SystemIds:       [...(string | fn.Fn)] | (string | fn.Fn)
						Url:             string | fn.Fn
					}) | fn.If
				}) | fn.If
				ManifestLayout?:         string | fn.Fn
				ManifestWindowSeconds?:  int | fn.Fn
				MinBufferTimeSeconds?:   int | fn.Fn
				MinUpdatePeriodSeconds?: int | fn.Fn
				PeriodTriggers?:         [...(string | fn.Fn)] | (string | fn.Fn)
				Profile?:                string | fn.Fn
				SegmentDurationSeconds?: int | fn.Fn
				SegmentTemplateFormat?:  string | fn.Fn
				StreamSelection?:        close({
					MaxVideoBitsPerSecond?: int | fn.Fn
					MinVideoBitsPerSecond?: int | fn.Fn
					StreamOrder?:           string | fn.Fn
				}) | fn.If
				SuggestedPresentationDelaySeconds?: int | fn.Fn
			}) | fn.If
			Description?: string | fn.Fn
			HlsPackage?:  close({
				AdMarkers?:                 string | fn.Fn
				AdTriggers?:                [...(string | fn.Fn)] | (string | fn.Fn)
				AdsOnDeliveryRestrictions?: string | fn.Fn
				Encryption?:                close({
					ConstantInitializationVector?: string | fn.Fn
					EncryptionMethod?:             string | fn.Fn
					KeyRotationIntervalSeconds?:   int | fn.Fn
					RepeatExtXKey?:                bool | fn.Fn
					SpekeKeyProvider:              close({
						CertificateArn?: string | fn.Fn
						ResourceId:      string | fn.Fn
						RoleArn:         string | fn.Fn
						SystemIds:       [...(string | fn.Fn)] | (string | fn.Fn)
						Url:             string | fn.Fn
					}) | fn.If
				}) | fn.If
				IncludeIframeOnlyStream?:        bool | fn.Fn
				PlaylistType?:                   string | fn.Fn
				PlaylistWindowSeconds?:          int | fn.Fn
				ProgramDateTimeIntervalSeconds?: int | fn.Fn
				SegmentDurationSeconds?:         int | fn.Fn
				StreamSelection?:                close({
					MaxVideoBitsPerSecond?: int | fn.Fn
					MinVideoBitsPerSecond?: int | fn.Fn
					StreamOrder?:           string | fn.Fn
				}) | fn.If
				UseAudioRenditionGroup?: bool | fn.Fn
			}) | fn.If
			Id:            string | fn.Fn
			ManifestName?: string | fn.Fn
			MssPackage?:   close({
				Encryption?: close({
					SpekeKeyProvider: close({
						CertificateArn?: string | fn.Fn
						ResourceId:      string | fn.Fn
						RoleArn:         string | fn.Fn
						SystemIds:       [...(string | fn.Fn)] | (string | fn.Fn)
						Url:             string | fn.Fn
					}) | fn.If
				}) | fn.If
				ManifestWindowSeconds?:  int | fn.Fn
				SegmentDurationSeconds?: int | fn.Fn
				StreamSelection?:        close({
					MaxVideoBitsPerSecond?: int | fn.Fn
					MinVideoBitsPerSecond?: int | fn.Fn
					StreamOrder?:           string | fn.Fn
				}) | fn.If
			}) | fn.If
			Origination?:            string | fn.Fn
			StartoverWindowSeconds?: int | fn.Fn
			Tags?:                   [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TimeDelaySeconds?: int | fn.Fn
			Whitelist?:        [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PackagingConfiguration :: {
		Type:       "AWS::MediaPackage::PackagingConfiguration"
		Properties: close({
			CmafPackage?: close({
				Encryption?: close({
					SpekeKeyProvider: close({
						RoleArn:   string | fn.Fn
						SystemIds: [...(string | fn.Fn)] | (string | fn.Fn)
						Url:       string | fn.Fn
					}) | fn.If
				}) | fn.If
				HlsManifests: [...close({
					AdMarkers?:                      string | fn.Fn
					IncludeIframeOnlyStream?:        bool | fn.Fn
					ManifestName?:                   string | fn.Fn
					ProgramDateTimeIntervalSeconds?: int | fn.Fn
					RepeatExtXKey?:                  bool | fn.Fn
					StreamSelection?:                close({
						MaxVideoBitsPerSecond?: int | fn.Fn
						MinVideoBitsPerSecond?: int | fn.Fn
						StreamOrder?:           string | fn.Fn
					}) | fn.If
				})] | fn.If
				SegmentDurationSeconds?: int | fn.Fn
			}) | fn.If
			DashPackage?: close({
				DashManifests: [...close({
					ManifestLayout?:       string | fn.Fn
					ManifestName?:         string | fn.Fn
					MinBufferTimeSeconds?: int | fn.Fn
					Profile?:              string | fn.Fn
					StreamSelection?:      close({
						MaxVideoBitsPerSecond?: int | fn.Fn
						MinVideoBitsPerSecond?: int | fn.Fn
						StreamOrder?:           string | fn.Fn
					}) | fn.If
				})] | fn.If
				Encryption?: close({
					SpekeKeyProvider: close({
						RoleArn:   string | fn.Fn
						SystemIds: [...(string | fn.Fn)] | (string | fn.Fn)
						Url:       string | fn.Fn
					}) | fn.If
				}) | fn.If
				PeriodTriggers?:         [...(string | fn.Fn)] | (string | fn.Fn)
				SegmentDurationSeconds?: int | fn.Fn
				SegmentTemplateFormat?:  string | fn.Fn
			}) | fn.If
			HlsPackage?: close({
				Encryption?: close({
					ConstantInitializationVector?: string | fn.Fn
					EncryptionMethod?:             string | fn.Fn
					SpekeKeyProvider:              close({
						RoleArn:   string | fn.Fn
						SystemIds: [...(string | fn.Fn)] | (string | fn.Fn)
						Url:       string | fn.Fn
					}) | fn.If
				}) | fn.If
				HlsManifests: [...close({
					AdMarkers?:                      string | fn.Fn
					IncludeIframeOnlyStream?:        bool | fn.Fn
					ManifestName?:                   string | fn.Fn
					ProgramDateTimeIntervalSeconds?: int | fn.Fn
					RepeatExtXKey?:                  bool | fn.Fn
					StreamSelection?:                close({
						MaxVideoBitsPerSecond?: int | fn.Fn
						MinVideoBitsPerSecond?: int | fn.Fn
						StreamOrder?:           string | fn.Fn
					}) | fn.If
				})] | fn.If
				SegmentDurationSeconds?: int | fn.Fn
				UseAudioRenditionGroup?: bool | fn.Fn
			}) | fn.If
			Id:          string | fn.Fn
			MssPackage?: close({
				Encryption?: close({
					SpekeKeyProvider: close({
						RoleArn:   string | fn.Fn
						SystemIds: [...(string | fn.Fn)] | (string | fn.Fn)
						Url:       string | fn.Fn
					}) | fn.If
				}) | fn.If
				MssManifests: [...close({
					ManifestName?:    string | fn.Fn
					StreamSelection?: close({
						MaxVideoBitsPerSecond?: int | fn.Fn
						MinVideoBitsPerSecond?: int | fn.Fn
						StreamOrder?:           string | fn.Fn
					}) | fn.If
				})] | fn.If
				SegmentDurationSeconds?: int | fn.Fn
			}) | fn.If
			PackagingGroupId: string | fn.Fn
			Tags?:            [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PackagingGroup :: {
		Type:       "AWS::MediaPackage::PackagingGroup"
		Properties: close({
			Authorization?: close({
				CdnIdentifierSecret: string | fn.Fn
				SecretsRoleArn:      string | fn.Fn
			}) | fn.If
			Id:    string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package saeast1

import "github.com/TangoGroup/aws/fn"

#MediaPackage: {
	#Asset: {
		Type: "AWS::MediaPackage::Asset"
		Properties: {
			EgressEndpoints?: [...{
				PackagingConfigurationId: string | fn.#Fn
				Url:                      string | fn.#Fn
			}] | fn.If
			Id:               string | fn.#Fn
			PackagingGroupId: string | fn.#Fn
			ResourceId?:      string | fn.#Fn
			SourceArn:        string | fn.#Fn
			SourceRoleArn:    string | fn.#Fn
			Tags?:            [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Channel: {
		Type: "AWS::MediaPackage::Channel"
		Properties: {
			Description?: string | fn.#Fn
			Id:           string | fn.#Fn
			Tags?:        [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#OriginEndpoint: {
		Type: "AWS::MediaPackage::OriginEndpoint"
		Properties: {
			Authorization?: {
				CdnIdentifierSecret: string | fn.#Fn
				SecretsRoleArn:      string | fn.#Fn
			} | fn.If
			ChannelId:    string | fn.#Fn
			CmafPackage?: {
				Encryption?: {
					KeyRotationIntervalSeconds?: int | fn.#Fn
					SpekeKeyProvider:            {
						CertificateArn?: string | fn.#Fn
						ResourceId:      string | fn.#Fn
						RoleArn:         string | fn.#Fn
						SystemIds:       [...(string | fn.#Fn)] | (string | fn.#Fn)
						Url:             string | fn.#Fn
					} | fn.If
				} | fn.If
				HlsManifests?: [...{
					AdMarkers?:                      string | fn.#Fn
					AdTriggers?:                     [...(string | fn.#Fn)] | (string | fn.#Fn)
					AdsOnDeliveryRestrictions?:      string | fn.#Fn
					Id:                              string | fn.#Fn
					IncludeIframeOnlyStream?:        bool | fn.#Fn
					ManifestName?:                   string | fn.#Fn
					PlaylistType?:                   string | fn.#Fn
					PlaylistWindowSeconds?:          int | fn.#Fn
					ProgramDateTimeIntervalSeconds?: int | fn.#Fn
					Url?:                            string | fn.#Fn
				}] | fn.If
				SegmentDurationSeconds?: int | fn.#Fn
				SegmentPrefix?:          string | fn.#Fn
				StreamSelection?:        {
					MaxVideoBitsPerSecond?: int | fn.#Fn
					MinVideoBitsPerSecond?: int | fn.#Fn
					StreamOrder?:           string | fn.#Fn
				} | fn.If
			} | fn.If
			DashPackage?: {
				AdTriggers?:                [...(string | fn.#Fn)] | (string | fn.#Fn)
				AdsOnDeliveryRestrictions?: string | fn.#Fn
				Encryption?:                {
					KeyRotationIntervalSeconds?: int | fn.#Fn
					SpekeKeyProvider:            {
						CertificateArn?: string | fn.#Fn
						ResourceId:      string | fn.#Fn
						RoleArn:         string | fn.#Fn
						SystemIds:       [...(string | fn.#Fn)] | (string | fn.#Fn)
						Url:             string | fn.#Fn
					} | fn.If
				} | fn.If
				ManifestLayout?:         string | fn.#Fn
				ManifestWindowSeconds?:  int | fn.#Fn
				MinBufferTimeSeconds?:   int | fn.#Fn
				MinUpdatePeriodSeconds?: int | fn.#Fn
				PeriodTriggers?:         [...(string | fn.#Fn)] | (string | fn.#Fn)
				Profile?:                string | fn.#Fn
				SegmentDurationSeconds?: int | fn.#Fn
				SegmentTemplateFormat?:  string | fn.#Fn
				StreamSelection?:        {
					MaxVideoBitsPerSecond?: int | fn.#Fn
					MinVideoBitsPerSecond?: int | fn.#Fn
					StreamOrder?:           string | fn.#Fn
				} | fn.If
				SuggestedPresentationDelaySeconds?: int | fn.#Fn
			} | fn.If
			Description?: string | fn.#Fn
			HlsPackage?:  {
				AdMarkers?:                 string | fn.#Fn
				AdTriggers?:                [...(string | fn.#Fn)] | (string | fn.#Fn)
				AdsOnDeliveryRestrictions?: string | fn.#Fn
				Encryption?:                {
					ConstantInitializationVector?: string | fn.#Fn
					EncryptionMethod?:             string | fn.#Fn
					KeyRotationIntervalSeconds?:   int | fn.#Fn
					RepeatExtXKey?:                bool | fn.#Fn
					SpekeKeyProvider:              {
						CertificateArn?: string | fn.#Fn
						ResourceId:      string | fn.#Fn
						RoleArn:         string | fn.#Fn
						SystemIds:       [...(string | fn.#Fn)] | (string | fn.#Fn)
						Url:             string | fn.#Fn
					} | fn.If
				} | fn.If
				IncludeIframeOnlyStream?:        bool | fn.#Fn
				PlaylistType?:                   string | fn.#Fn
				PlaylistWindowSeconds?:          int | fn.#Fn
				ProgramDateTimeIntervalSeconds?: int | fn.#Fn
				SegmentDurationSeconds?:         int | fn.#Fn
				StreamSelection?:                {
					MaxVideoBitsPerSecond?: int | fn.#Fn
					MinVideoBitsPerSecond?: int | fn.#Fn
					StreamOrder?:           string | fn.#Fn
				} | fn.If
				UseAudioRenditionGroup?: bool | fn.#Fn
			} | fn.If
			Id:            string | fn.#Fn
			ManifestName?: string | fn.#Fn
			MssPackage?:   {
				Encryption?: {
					SpekeKeyProvider: {
						CertificateArn?: string | fn.#Fn
						ResourceId:      string | fn.#Fn
						RoleArn:         string | fn.#Fn
						SystemIds:       [...(string | fn.#Fn)] | (string | fn.#Fn)
						Url:             string | fn.#Fn
					} | fn.If
				} | fn.If
				ManifestWindowSeconds?:  int | fn.#Fn
				SegmentDurationSeconds?: int | fn.#Fn
				StreamSelection?:        {
					MaxVideoBitsPerSecond?: int | fn.#Fn
					MinVideoBitsPerSecond?: int | fn.#Fn
					StreamOrder?:           string | fn.#Fn
				} | fn.If
			} | fn.If
			Origination?:            string | fn.#Fn
			StartoverWindowSeconds?: int | fn.#Fn
			Tags?:                   [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			TimeDelaySeconds?: int | fn.#Fn
			Whitelist?:        [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PackagingConfiguration: {
		Type: "AWS::MediaPackage::PackagingConfiguration"
		Properties: {
			CmafPackage?: {
				Encryption?: {
					SpekeKeyProvider: {
						RoleArn:   string | fn.#Fn
						SystemIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						Url:       string | fn.#Fn
					} | fn.If
				} | fn.If
				HlsManifests: [...{
					AdMarkers?:                      string | fn.#Fn
					IncludeIframeOnlyStream?:        bool | fn.#Fn
					ManifestName?:                   string | fn.#Fn
					ProgramDateTimeIntervalSeconds?: int | fn.#Fn
					RepeatExtXKey?:                  bool | fn.#Fn
					StreamSelection?:                {
						MaxVideoBitsPerSecond?: int | fn.#Fn
						MinVideoBitsPerSecond?: int | fn.#Fn
						StreamOrder?:           string | fn.#Fn
					} | fn.If
				}] | fn.If
				SegmentDurationSeconds?: int | fn.#Fn
			} | fn.If
			DashPackage?: {
				DashManifests: [...{
					ManifestLayout?:       string | fn.#Fn
					ManifestName?:         string | fn.#Fn
					MinBufferTimeSeconds?: int | fn.#Fn
					Profile?:              string | fn.#Fn
					StreamSelection?:      {
						MaxVideoBitsPerSecond?: int | fn.#Fn
						MinVideoBitsPerSecond?: int | fn.#Fn
						StreamOrder?:           string | fn.#Fn
					} | fn.If
				}] | fn.If
				Encryption?: {
					SpekeKeyProvider: {
						RoleArn:   string | fn.#Fn
						SystemIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						Url:       string | fn.#Fn
					} | fn.If
				} | fn.If
				PeriodTriggers?:         [...(string | fn.#Fn)] | (string | fn.#Fn)
				SegmentDurationSeconds?: int | fn.#Fn
				SegmentTemplateFormat?:  string | fn.#Fn
			} | fn.If
			HlsPackage?: {
				Encryption?: {
					ConstantInitializationVector?: string | fn.#Fn
					EncryptionMethod?:             string | fn.#Fn
					SpekeKeyProvider:              {
						RoleArn:   string | fn.#Fn
						SystemIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						Url:       string | fn.#Fn
					} | fn.If
				} | fn.If
				HlsManifests: [...{
					AdMarkers?:                      string | fn.#Fn
					IncludeIframeOnlyStream?:        bool | fn.#Fn
					ManifestName?:                   string | fn.#Fn
					ProgramDateTimeIntervalSeconds?: int | fn.#Fn
					RepeatExtXKey?:                  bool | fn.#Fn
					StreamSelection?:                {
						MaxVideoBitsPerSecond?: int | fn.#Fn
						MinVideoBitsPerSecond?: int | fn.#Fn
						StreamOrder?:           string | fn.#Fn
					} | fn.If
				}] | fn.If
				SegmentDurationSeconds?: int | fn.#Fn
				UseAudioRenditionGroup?: bool | fn.#Fn
			} | fn.If
			Id:          string | fn.#Fn
			MssPackage?: {
				Encryption?: {
					SpekeKeyProvider: {
						RoleArn:   string | fn.#Fn
						SystemIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						Url:       string | fn.#Fn
					} | fn.If
				} | fn.If
				MssManifests: [...{
					ManifestName?:    string | fn.#Fn
					StreamSelection?: {
						MaxVideoBitsPerSecond?: int | fn.#Fn
						MinVideoBitsPerSecond?: int | fn.#Fn
						StreamOrder?:           string | fn.#Fn
					} | fn.If
				}] | fn.If
				SegmentDurationSeconds?: int | fn.#Fn
			} | fn.If
			PackagingGroupId: string | fn.#Fn
			Tags?:            [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PackagingGroup: {
		Type: "AWS::MediaPackage::PackagingGroup"
		Properties: {
			Authorization?: {
				CdnIdentifierSecret: string | fn.#Fn
				SecretsRoleArn:      string | fn.#Fn
			} | fn.If
			Id:    string | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

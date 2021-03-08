package euwest1

import "github.com/TangoGroup/aws/fn"

IVS :: {
	Channel :: {
		Type:       "AWS::IVS::Channel"
		Properties: close({
			Authorized?:                bool | fn.Fn
			LatencyMode?:               ("NORMAL" | "LOW") | fn.Fn
			Name?:                      (=~#"^[a-zA-Z0-9-_]*$"#) | fn.Fn
			RecordingConfigurationArn?: (=~#"^$|arn:aws:ivs:[a-z0-9-]+:[0-9]+:recording-configuration/[a-zA-Z0-9-]+$"#) | fn.Fn
			Tags?:                      [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type?: ("STANDARD" | "BASIC") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PlaybackKeyPair :: {
		Type:       "AWS::IVS::PlaybackKeyPair"
		Properties: close({
			Name?:             (=~#"^[a-zA-Z0-9-_]*$"#) | fn.Fn
			PublicKeyMaterial: string | fn.Fn
			Tags?:             [...close({
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
	StreamKey :: {
		Type:       "AWS::IVS::StreamKey"
		Properties: close({
			ChannelArn: (=~#"^arn:aws:ivs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$"#) | fn.Fn
			Tags?:      [...close({
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

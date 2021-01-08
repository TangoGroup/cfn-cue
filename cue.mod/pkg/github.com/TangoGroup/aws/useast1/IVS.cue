package useast1

import "github.com/TangoGroup/aws/fn"

#IVS: {
	#Channel: {
		Type: "AWS::IVS::Channel"
		Properties: {
			Authorized?:  bool | fn.#Fn
			LatencyMode?: string | fn.#Fn
			Name?:        string | fn.#Fn
			Tags?:        [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			Type?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PlaybackKeyPair: {
		Type: "AWS::IVS::PlaybackKeyPair"
		Properties: {
			Name?:             string | fn.#Fn
			PublicKeyMaterial: string | fn.#Fn
			Tags?:             [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#StreamKey: {
		Type: "AWS::IVS::StreamKey"
		Properties: {
			ChannelArn: string | fn.#Fn
			Tags?:      [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

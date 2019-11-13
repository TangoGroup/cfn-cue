package eunorth1

import "github.com/TangoGroup/fn"

Transfer :: {
	Server :: {
		Type: "AWS::Transfer::Server"
		Properties: {
			EndpointDetails?: VpcEndpointId: string | fn.Fn
			EndpointType?: string | fn.Fn
			IdentityProviderDetails?: {
				InvocationRole: string | fn.Fn
				Url:            string | fn.Fn
			}
			IdentityProviderType?: string | fn.Fn
			LoggingRole?:          string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	User :: {
		Type: "AWS::Transfer::User"
		Properties: {
			HomeDirectory?: string | fn.Fn
			Policy?:        string | fn.Fn
			Role:           string | fn.Fn
			ServerId:       string | fn.Fn
			SshPublicKeys?: [...(string | fn.Fn)]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			UserName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

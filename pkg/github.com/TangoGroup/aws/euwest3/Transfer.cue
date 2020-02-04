package euwest3

import "github.com/TangoGroup/aws/fn"

Transfer :: {
	Server :: {
		Type: "AWS::Transfer::Server"
		Properties: {
			EndpointDetails?: {
				AddressAllocationIds?: [...(string | fn.Fn)] | fn.Fn
				SubnetIds?:            [...(string | fn.Fn)] | fn.Fn
				VpcEndpointId?:        string | fn.Fn
				VpcId?:                string | fn.Fn
			}
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
			HomeDirectoryMappings?: [...{
				Entry:  string | fn.Fn
				Target: string | fn.Fn
			}]
			HomeDirectoryType?: string | fn.Fn
			Policy?:            string | fn.Fn
			Role:               string | fn.Fn
			ServerId:           string | fn.Fn
			SshPublicKeys?:     [...(string | fn.Fn)] | fn.Fn
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

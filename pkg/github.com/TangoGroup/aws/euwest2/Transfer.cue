package euwest2

import "github.com/TangoGroup/aws/fn"

Transfer :: {
	Server :: {
		Type: "AWS::Transfer::Server"
		Properties: {
			EndpointDetails?: {
				AddressAllocationIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetIds?:            [...(string | fn.Fn)] | (string | fn.Fn)
				VpcEndpointId?:        string | fn.Fn
				VpcId?:                string | fn.Fn
			} | fn.If
			EndpointType?:            string | fn.Fn
			IdentityProviderDetails?: {
				InvocationRole: string | fn.Fn
				Url:            string | fn.Fn
			} | fn.If
			IdentityProviderType?: string | fn.Fn
			LoggingRole?:          string | fn.Fn
			Tags?:                 [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	User :: {
		Type: "AWS::Transfer::User"
		Properties: {
			HomeDirectory?:         string | fn.Fn
			HomeDirectoryMappings?: [...{
				Entry:  string | fn.Fn
				Target: string | fn.Fn
			}] | fn.If
			HomeDirectoryType?: string | fn.Fn
			Policy?:            string | fn.Fn
			Role:               string | fn.Fn
			ServerId:           string | fn.Fn
			SshPublicKeys?:     [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:              [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			UserName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

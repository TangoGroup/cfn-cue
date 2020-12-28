package usgovwest1

import "github.com/TangoGroup/aws/fn"

Transfer :: {
	Server :: {
		Type:       "AWS::Transfer::Server"
		Properties: close({
			Certificate?:     string | fn.Fn
			EndpointDetails?: close({
				AddressAllocationIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				SecurityGroupIds?:     [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetIds?:            [...(string | fn.Fn)] | (string | fn.Fn)
				VpcEndpointId?:        string | fn.Fn
				VpcId?:                string | fn.Fn
			}) | fn.If
			EndpointType?:            string | fn.Fn
			IdentityProviderDetails?: close({
				InvocationRole: string | fn.Fn
				Url:            string | fn.Fn
			}) | fn.If
			IdentityProviderType?: string | fn.Fn
			LoggingRole?:          string | fn.Fn
			Protocols?:            [...close({
			})] | fn.If
			SecurityPolicyName?: string | fn.Fn
			Tags?:               [...close({
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
	User :: {
		Type:       "AWS::Transfer::User"
		Properties: close({
			HomeDirectory?:         string | fn.Fn
			HomeDirectoryMappings?: [...close({
				Entry:  string | fn.Fn
				Target: string | fn.Fn
			})] | fn.If
			HomeDirectoryType?: string | fn.Fn
			Policy?:            string | fn.Fn
			Role:               string | fn.Fn
			ServerId:           string | fn.Fn
			SshPublicKeys?:     [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:              [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			UserName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

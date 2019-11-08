package Transfer

import "github.com/TangoGroup/fn"

Server :: {
	Type: "AWS::Transfer::Server"
	Properties: {
		EndpointDetails?:         propEndpointDetails
		EndpointType?:            string | fn.Fn
		IdentityProviderDetails?: propIdentityProviderDetails
		IdentityProviderType?:    string | fn.Fn
		LoggingRole?:             string | fn.Fn
		Tags?: [...propTag]
	}
	propEndpointDetails :: {
		VpcEndpointId: string | fn.Fn
	}
	propIdentityProviderDetails :: {
		InvocationRole: string | fn.Fn
		Url:            string | fn.Fn
	}
}
User :: {
	Type: "AWS::Transfer::User"
	Properties: {
		HomeDirectory?: string | fn.Fn
		Policy?:        string | fn.Fn
		Role:           string | fn.Fn
		ServerId:       string | fn.Fn
		SshPublicKeys?: [...propSshPublicKey]
		Tags?: [...propTag]
		UserName: string | fn.Fn
	}
	propSshPublicKey :: {
	}
}

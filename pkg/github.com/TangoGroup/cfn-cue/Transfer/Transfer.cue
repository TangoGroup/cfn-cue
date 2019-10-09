package Transfer

import "github.com/TangoGroup/fn"

Server :: {
	Type: "AWS::Transfer::Server"
	Properties: {
		EndpointDetails?:         __EndpointDetails
		EndpointType?:            string | fn.Fn
		IdentityProviderDetails?: __IdentityProviderDetails
		IdentityProviderType?:    string | fn.Fn
		LoggingRole?:             string | fn.Fn
		Tags?: [...__Tag]
	}
	__EndpointDetails :: {
		VpcEndpointId: string | fn.Fn
	}
	__IdentityProviderDetails :: {
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
		SshPublicKeys?: [...__SshPublicKey]
		Tags?: [...__Tag]
		UserName: string | fn.Fn
	}
	__SshPublicKey :: {
	}
}

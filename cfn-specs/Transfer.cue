package Transfer

Server :: {
	Type: "AWS::Transfer::Server"
	Properties: {
		EndpointDetails?:         __EndpointDetails
		EndpointType?:            string
		IdentityProviderDetails?: __IdentityProviderDetails
		IdentityProviderType?:    string
		LoggingRole?:             string
		Tags?: [...__Tag]
	}
	__EndpointDetails = {
		VpcEndpointId: string
	}
	__IdentityProviderDetails = {
		InvocationRole: string
		Url:            string
	}
}
User :: {
	Type: "AWS::Transfer::User"
	Properties: {
		HomeDirectory?: string
		Policy?:        string
		Role:           string
		ServerId:       string
		SshPublicKeys?: [...__SshPublicKey]
		Tags?: [...__Tag]
		UserName: string
	}
	__SshPublicKey = {
	}
}

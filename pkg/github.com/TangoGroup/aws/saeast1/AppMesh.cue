package saeast1

import "github.com/TangoGroup/aws/fn"

AppMesh :: {
	GatewayRoute :: {
		Type:       "AWS::AppMesh::GatewayRoute"
		Properties: close({
			GatewayRouteName: string | fn.Fn
			MeshName:         string | fn.Fn
			MeshOwner?:       string | fn.Fn
			Spec:             close({
				GrpcRoute?: close({
					Action: close({
						Target: close({
							VirtualService: close({
								VirtualServiceName: string | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					Match: close({
						ServiceName?: string | fn.Fn
					}) | fn.If
				}) | fn.If
				Http2Route?: close({
					Action: close({
						Target: close({
							VirtualService: close({
								VirtualServiceName: string | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					Match: close({
						Prefix: string | fn.Fn
					}) | fn.If
				}) | fn.If
				HttpRoute?: close({
					Action: close({
						Target: close({
							VirtualService: close({
								VirtualServiceName: string | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					Match: close({
						Prefix: string | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VirtualGatewayName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VirtualGateway :: {
		Type:       "AWS::AppMesh::VirtualGateway"
		Properties: close({
			MeshName:   string | fn.Fn
			MeshOwner?: string | fn.Fn
			Spec:       close({
				BackendDefaults?: close({
					ClientPolicy?: close({
						TLS?: close({
							Enforce?:   bool | fn.Fn
							Ports?:     [...(int | fn.Fn)] | (int | fn.Fn)
							Validation: close({
								Trust: close({
									ACM?: close({
										CertificateAuthorityArns: [...(string | fn.Fn)] | (string | fn.Fn)
									}) | fn.If
									File?: close({
										CertificateChain: string | fn.Fn
									}) | fn.If
								}) | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
				}) | fn.If
				Listeners: [...close({
					ConnectionPool?: close({
						GRPC?: close({
							MaxRequests: int | fn.Fn
						}) | fn.If
						HTTP?: close({
							MaxConnections:      int | fn.Fn
							MaxPendingRequests?: int | fn.Fn
						}) | fn.If
						HTTP2?: close({
							MaxRequests: int | fn.Fn
						}) | fn.If
					}) | fn.If
					HealthCheck?: close({
						HealthyThreshold:   int | fn.Fn
						IntervalMillis:     int | fn.Fn
						Path?:              string | fn.Fn
						Port?:              int | fn.Fn
						Protocol:           string | fn.Fn
						TimeoutMillis:      int | fn.Fn
						UnhealthyThreshold: int | fn.Fn
					}) | fn.If
					PortMapping: close({
						Port:     int | fn.Fn
						Protocol: string | fn.Fn
					}) | fn.If
					TLS?: close({
						Certificate: close({
							ACM?: close({
								CertificateArn: string | fn.Fn
							}) | fn.If
							File?: close({
								CertificateChain: string | fn.Fn
								PrivateKey:       string | fn.Fn
							}) | fn.If
						}) | fn.If
						Mode: string | fn.Fn
					}) | fn.If
				})] | fn.If
				Logging?: close({
					AccessLog?: close({
						File?: close({
							Path: string | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VirtualGatewayName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package euwest3

import "github.com/TangoGroup/aws/fn"

#AppMesh: {
	#GatewayRoute: {
		Type: "AWS::AppMesh::GatewayRoute"
		Properties: {
			GatewayRouteName: string | fn.#Fn
			MeshName:         string | fn.#Fn
			MeshOwner?:       string | fn.#Fn
			Spec:             {
				GrpcRoute?: {
					Action: {
						Target: {
							VirtualService: {
								VirtualServiceName: string | fn.#Fn
							} | fn.If
						} | fn.If
					} | fn.If
					Match: {
						ServiceName?: string | fn.#Fn
					} | fn.If
				} | fn.If
				Http2Route?: {
					Action: {
						Target: {
							VirtualService: {
								VirtualServiceName: string | fn.#Fn
							} | fn.If
						} | fn.If
					} | fn.If
					Match: {
						Prefix: string | fn.#Fn
					} | fn.If
				} | fn.If
				HttpRoute?: {
					Action: {
						Target: {
							VirtualService: {
								VirtualServiceName: string | fn.#Fn
							} | fn.If
						} | fn.If
					} | fn.If
					Match: {
						Prefix: string | fn.#Fn
					} | fn.If
				} | fn.If
			} | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VirtualGatewayName: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#VirtualGateway: {
		Type: "AWS::AppMesh::VirtualGateway"
		Properties: {
			MeshName:   string | fn.#Fn
			MeshOwner?: string | fn.#Fn
			Spec:       {
				BackendDefaults?: {
					ClientPolicy?: {
						TLS?: {
							Enforce?:   bool | fn.#Fn
							Ports?:     [...(int | fn.#Fn)] | (int | fn.#Fn)
							Validation: {
								Trust: {
									ACM?: {
										CertificateAuthorityArns: [...(string | fn.#Fn)] | (string | fn.#Fn)
									} | fn.If
									File?: {
										CertificateChain: string | fn.#Fn
									} | fn.If
								} | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
				} | fn.If
				Listeners: [...{
					ConnectionPool?: {
						GRPC?: {
							MaxRequests: int | fn.#Fn
						} | fn.If
						HTTP?: {
							MaxConnections:      int | fn.#Fn
							MaxPendingRequests?: int | fn.#Fn
						} | fn.If
						HTTP2?: {
							MaxRequests: int | fn.#Fn
						} | fn.If
					} | fn.If
					HealthCheck?: {
						HealthyThreshold:   int | fn.#Fn
						IntervalMillis:     int | fn.#Fn
						Path?:              string | fn.#Fn
						Port?:              int | fn.#Fn
						Protocol:           string | fn.#Fn
						TimeoutMillis:      int | fn.#Fn
						UnhealthyThreshold: int | fn.#Fn
					} | fn.If
					PortMapping: {
						Port:     int | fn.#Fn
						Protocol: string | fn.#Fn
					} | fn.If
					TLS?: {
						Certificate: {
							ACM?: {
								CertificateArn: string | fn.#Fn
							} | fn.If
							File?: {
								CertificateChain: string | fn.#Fn
								PrivateKey:       string | fn.#Fn
							} | fn.If
						} | fn.If
						Mode: string | fn.#Fn
					} | fn.If
				}] | fn.If
				Logging?: {
					AccessLog?: {
						File?: {
							Path: string | fn.#Fn
						} | fn.If
					} | fn.If
				} | fn.If
			} | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VirtualGatewayName: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

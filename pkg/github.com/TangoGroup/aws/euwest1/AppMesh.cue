package euwest1

import "github.com/TangoGroup/aws/fn"

AppMesh :: {
	Mesh :: {
		Type:       "AWS::AppMesh::Mesh"
		Properties: close({
			MeshName: string | fn.Fn
			Spec?:    close({
				EgressFilter?: close({
					Type: string | fn.Fn
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
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
	Route :: {
		Type:       "AWS::AppMesh::Route"
		Properties: close({
			MeshName:   string | fn.Fn
			MeshOwner?: string | fn.Fn
			RouteName:  string | fn.Fn
			Spec:       close({
				GrpcRoute?: close({
					Action: close({
						WeightedTargets: [...close({
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						})] | fn.If
					}) | fn.If
					Match: close({
						Metadata?: [...close({
							Invert?: bool | fn.Fn
							Match?:  close({
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?:  close({
									End:   int | fn.Fn
									Start: int | fn.Fn
								}) | fn.If
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							}) | fn.If
							Name: string | fn.Fn
						})] | fn.If
						MethodName?:  string | fn.Fn
						ServiceName?: string | fn.Fn
					}) | fn.If
					RetryPolicy?: close({
						GrpcRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
						HttpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
						MaxRetries:       int | fn.Fn
						PerRetryTimeout:  close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
						TcpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Timeout?: close({
						Idle?: close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
						PerRequest?: close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
				Http2Route?: close({
					Action: close({
						WeightedTargets: [...close({
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						})] | fn.If
					}) | fn.If
					Match: close({
						Headers?: [...close({
							Invert?: bool | fn.Fn
							Match?:  close({
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?:  close({
									End:   int | fn.Fn
									Start: int | fn.Fn
								}) | fn.If
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							}) | fn.If
							Name: string | fn.Fn
						})] | fn.If
						Method?: string | fn.Fn
						Prefix:  string | fn.Fn
						Scheme?: string | fn.Fn
					}) | fn.If
					RetryPolicy?: close({
						HttpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
						MaxRetries:       int | fn.Fn
						PerRetryTimeout:  close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
						TcpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Timeout?: close({
						Idle?: close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
						PerRequest?: close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
				HttpRoute?: close({
					Action: close({
						WeightedTargets: [...close({
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						})] | fn.If
					}) | fn.If
					Match: close({
						Headers?: [...close({
							Invert?: bool | fn.Fn
							Match?:  close({
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?:  close({
									End:   int | fn.Fn
									Start: int | fn.Fn
								}) | fn.If
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							}) | fn.If
							Name: string | fn.Fn
						})] | fn.If
						Method?: string | fn.Fn
						Prefix:  string | fn.Fn
						Scheme?: string | fn.Fn
					}) | fn.If
					RetryPolicy?: close({
						HttpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
						MaxRetries:       int | fn.Fn
						PerRetryTimeout:  close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
						TcpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Timeout?: close({
						Idle?: close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
						PerRequest?: close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
				Priority?: int | fn.Fn
				TcpRoute?: close({
					Action: close({
						WeightedTargets: [...close({
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						})] | fn.If
					}) | fn.If
					Timeout?: close({
						Idle?: close({
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VirtualRouterName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VirtualNode :: {
		Type:       "AWS::AppMesh::VirtualNode"
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
				Backends?: [...close({
					VirtualService?: close({
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
						VirtualServiceName: string | fn.Fn
					}) | fn.If
				})] | fn.If
				Listeners?: [...close({
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
					Timeout?: close({
						GRPC?: close({
							Idle?: close({
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}) | fn.If
							PerRequest?: close({
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}) | fn.If
						}) | fn.If
						HTTP?: close({
							Idle?: close({
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}) | fn.If
							PerRequest?: close({
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}) | fn.If
						}) | fn.If
						HTTP2?: close({
							Idle?: close({
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}) | fn.If
							PerRequest?: close({
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}) | fn.If
						}) | fn.If
						TCP?: close({
							Idle?: close({
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
				})] | fn.If
				Logging?: close({
					AccessLog?: close({
						File?: close({
							Path: string | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
				ServiceDiscovery?: close({
					AWSCloudMap?: close({
						Attributes?: [...close({
							Key:   string | fn.Fn
							Value: string | fn.Fn
						})] | fn.If
						NamespaceName: string | fn.Fn
						ServiceName:   string | fn.Fn
					}) | fn.If
					DNS?: close({
						Hostname: string | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VirtualNodeName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VirtualRouter :: {
		Type:       "AWS::AppMesh::VirtualRouter"
		Properties: close({
			MeshName:   string | fn.Fn
			MeshOwner?: string | fn.Fn
			Spec:       close({
				Listeners: [...close({
					PortMapping: close({
						Port:     int | fn.Fn
						Protocol: string | fn.Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VirtualRouterName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VirtualService :: {
		Type:       "AWS::AppMesh::VirtualService"
		Properties: close({
			MeshName:   string | fn.Fn
			MeshOwner?: string | fn.Fn
			Spec:       close({
				Provider?: close({
					VirtualNode?: close({
						VirtualNodeName: string | fn.Fn
					}) | fn.If
					VirtualRouter?: close({
						VirtualRouterName: string | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VirtualServiceName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

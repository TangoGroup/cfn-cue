package uswest1

import "github.com/TangoGroup/aws/fn"

AppMesh :: {
	Mesh :: {
		Type: "AWS::AppMesh::Mesh"
		Properties: {
			MeshName: string | fn.Fn
			Spec?: EgressFilter?: Type: string | fn.Fn
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
	Route :: {
		Type: "AWS::AppMesh::Route"
		Properties: {
			MeshName:  string | fn.Fn
			RouteName: string | fn.Fn
			Spec: {
				GrpcRoute?: {
					Action: WeightedTargets: [...{
						VirtualNode: string | fn.Fn
						Weight:      int | fn.Fn
					}]
					Match: {
						Metadata?: [...{
							Invert?: bool | fn.Fn
							Match?: {
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?: {
									End:   int | fn.Fn
									Start: int | fn.Fn
								}
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							}
							Name: string | fn.Fn
						}]
						MethodName?:  string | fn.Fn
						ServiceName?: string | fn.Fn
					}
					RetryPolicy?: {
						GrpcRetryEvents?: [...(string | fn.Fn)] | fn.Fn
						HttpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
						MaxRetries:       int | fn.Fn
						PerRetryTimeout: {
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}
						TcpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
					}
				}
				Http2Route?: {
					Action: WeightedTargets: [...{
						VirtualNode: string | fn.Fn
						Weight:      int | fn.Fn
					}]
					Match: {
						Headers?: [...{
							Invert?: bool | fn.Fn
							Match?: {
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?: {
									End:   int | fn.Fn
									Start: int | fn.Fn
								}
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							}
							Name: string | fn.Fn
						}]
						Method?: string | fn.Fn
						Prefix:  string | fn.Fn
						Scheme?: string | fn.Fn
					}
					RetryPolicy?: {
						HttpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
						MaxRetries:       int | fn.Fn
						PerRetryTimeout: {
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}
						TcpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
					}
				}
				HttpRoute?: {
					Action: WeightedTargets: [...{
						VirtualNode: string | fn.Fn
						Weight:      int | fn.Fn
					}]
					Match: {
						Headers?: [...{
							Invert?: bool | fn.Fn
							Match?: {
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?: {
									End:   int | fn.Fn
									Start: int | fn.Fn
								}
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							}
							Name: string | fn.Fn
						}]
						Method?: string | fn.Fn
						Prefix:  string | fn.Fn
						Scheme?: string | fn.Fn
					}
					RetryPolicy?: {
						HttpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
						MaxRetries:       int | fn.Fn
						PerRetryTimeout: {
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						}
						TcpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
					}
				}
				Priority?: int | fn.Fn
				TcpRoute?: Action: WeightedTargets: [...{
					VirtualNode: string | fn.Fn
					Weight:      int | fn.Fn
				}]
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VirtualRouterName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VirtualNode :: {
		Type: "AWS::AppMesh::VirtualNode"
		Properties: {
			MeshName: string | fn.Fn
			Spec: {
				Backends?: [...{
					VirtualService?: VirtualServiceName: string | fn.Fn
				}]
				Listeners?: [...{
					HealthCheck?: {
						HealthyThreshold:   int | fn.Fn
						IntervalMillis:     int | fn.Fn
						Path?:              string | fn.Fn
						Port?:              int | fn.Fn
						Protocol:           string | fn.Fn
						TimeoutMillis:      int | fn.Fn
						UnhealthyThreshold: int | fn.Fn
					}
					PortMapping: {
						Port:     int | fn.Fn
						Protocol: string | fn.Fn
					}
				}]
				Logging?: AccessLog?: File?: Path: string | fn.Fn
				ServiceDiscovery?: {
					AWSCloudMap?: {
						Attributes?: [...{
							Key:   string | fn.Fn
							Value: string | fn.Fn
						}]
						NamespaceName: string | fn.Fn
						ServiceName:   string | fn.Fn
					}
					DNS?: Hostname: string | fn.Fn
				}
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VirtualNodeName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VirtualRouter :: {
		Type: "AWS::AppMesh::VirtualRouter"
		Properties: {
			MeshName: string | fn.Fn
			Spec: Listeners: [...{
				PortMapping: {
					Port:     int | fn.Fn
					Protocol: string | fn.Fn
				}
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VirtualRouterName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	VirtualService :: {
		Type: "AWS::AppMesh::VirtualService"
		Properties: {
			MeshName: string | fn.Fn
			Spec: Provider?: {
				VirtualNode?: VirtualNodeName:     string | fn.Fn
				VirtualRouter?: VirtualRouterName: string | fn.Fn
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VirtualServiceName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

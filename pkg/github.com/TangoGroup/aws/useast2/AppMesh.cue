package useast2

import "github.com/TangoGroup/aws/fn"

AppMesh :: {
	Mesh :: {
		Type: "AWS::AppMesh::Mesh"
		Properties: {
			MeshName: string | fn.Fn
			Spec?:    {
				EgressFilter?: {
					Type: string | fn.Fn
				} | fn.If
			} | fn.If
			Tags?: [...{
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
	Route :: {
		Type: "AWS::AppMesh::Route"
		Properties: {
			MeshName:  string | fn.Fn
			RouteName: string | fn.Fn
			Spec:      {
				GrpcRoute?: {
					Action: {
						WeightedTargets: [...{
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						}] | fn.If
					} | fn.If
					Match: {
						Metadata?: [...{
							Invert?: bool | fn.Fn
							Match?:  {
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?:  {
									End:   int | fn.Fn
									Start: int | fn.Fn
								} | fn.If
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							} | fn.If
							Name: string | fn.Fn
						}] | fn.If
						MethodName?:  string | fn.Fn
						ServiceName?: string | fn.Fn
					} | fn.If
					RetryPolicy?: {
						GrpcRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
						HttpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
						MaxRetries:       int | fn.Fn
						PerRetryTimeout:  {
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						} | fn.If
						TcpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
					} | fn.If
				} | fn.If
				Http2Route?: {
					Action: {
						WeightedTargets: [...{
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						}] | fn.If
					} | fn.If
					Match: {
						Headers?: [...{
							Invert?: bool | fn.Fn
							Match?:  {
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?:  {
									End:   int | fn.Fn
									Start: int | fn.Fn
								} | fn.If
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							} | fn.If
							Name: string | fn.Fn
						}] | fn.If
						Method?: string | fn.Fn
						Prefix:  string | fn.Fn
						Scheme?: string | fn.Fn
					} | fn.If
					RetryPolicy?: {
						HttpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
						MaxRetries:       int | fn.Fn
						PerRetryTimeout:  {
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						} | fn.If
						TcpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
					} | fn.If
				} | fn.If
				HttpRoute?: {
					Action: {
						WeightedTargets: [...{
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						}] | fn.If
					} | fn.If
					Match: {
						Headers?: [...{
							Invert?: bool | fn.Fn
							Match?:  {
								Exact?:  string | fn.Fn
								Prefix?: string | fn.Fn
								Range?:  {
									End:   int | fn.Fn
									Start: int | fn.Fn
								} | fn.If
								Regex?:  string | fn.Fn
								Suffix?: string | fn.Fn
							} | fn.If
							Name: string | fn.Fn
						}] | fn.If
						Method?: string | fn.Fn
						Prefix:  string | fn.Fn
						Scheme?: string | fn.Fn
					} | fn.If
					RetryPolicy?: {
						HttpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
						MaxRetries:       int | fn.Fn
						PerRetryTimeout:  {
							Unit:  string | fn.Fn
							Value: int | fn.Fn
						} | fn.If
						TcpRetryEvents?: [...(string | fn.Fn)] | (string | fn.Fn)
					} | fn.If
				} | fn.If
				Priority?: int | fn.Fn
				TcpRoute?: {
					Action: {
						WeightedTargets: [...{
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						}] | fn.If
					} | fn.If
				} | fn.If
			} | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VirtualRouterName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VirtualNode :: {
		Type: "AWS::AppMesh::VirtualNode"
		Properties: {
			MeshName: string | fn.Fn
			Spec:     {
				Backends?: [...{
					VirtualService?: {
						VirtualServiceName: string | fn.Fn
					} | fn.If
				}] | fn.If
				Listeners?: [...{
					HealthCheck?: {
						HealthyThreshold:   int | fn.Fn
						IntervalMillis:     int | fn.Fn
						Path?:              string | fn.Fn
						Port?:              int | fn.Fn
						Protocol:           string | fn.Fn
						TimeoutMillis:      int | fn.Fn
						UnhealthyThreshold: int | fn.Fn
					} | fn.If
					PortMapping: {
						Port:     int | fn.Fn
						Protocol: string | fn.Fn
					} | fn.If
				}] | fn.If
				Logging?: {
					AccessLog?: {
						File?: {
							Path: string | fn.Fn
						} | fn.If
					} | fn.If
				} | fn.If
				ServiceDiscovery?: {
					AWSCloudMap?: {
						Attributes?: [...{
							Key:   string | fn.Fn
							Value: string | fn.Fn
						}] | fn.If
						NamespaceName: string | fn.Fn
						ServiceName:   string | fn.Fn
					} | fn.If
					DNS?: {
						Hostname: string | fn.Fn
					} | fn.If
				} | fn.If
			} | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VirtualNodeName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VirtualRouter :: {
		Type: "AWS::AppMesh::VirtualRouter"
		Properties: {
			MeshName: string | fn.Fn
			Spec:     {
				Listeners: [...{
					PortMapping: {
						Port:     int | fn.Fn
						Protocol: string | fn.Fn
					} | fn.If
				}] | fn.If
			} | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VirtualRouterName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VirtualService :: {
		Type: "AWS::AppMesh::VirtualService"
		Properties: {
			MeshName: string | fn.Fn
			Spec:     {
				Provider?: {
					VirtualNode?: {
						VirtualNodeName: string | fn.Fn
					} | fn.If
					VirtualRouter?: {
						VirtualRouterName: string | fn.Fn
					} | fn.If
				} | fn.If
			} | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VirtualServiceName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

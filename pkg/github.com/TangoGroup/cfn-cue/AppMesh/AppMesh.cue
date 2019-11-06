package AppMesh

import "github.com/TangoGroup/fn"

Mesh :: {
	Type: "AWS::AppMesh::Mesh"
	Properties: {
		MeshName: string | fn.Fn
		Spec?:    __MeshSpec
		Tags?: [...__Tag]
	}
	__EgressFilter :: {
		Type: string | fn.Fn
	}
	__MeshSpec :: {
		EgressFilter?: __EgressFilter
	}
}
Route :: {
	Type: "AWS::AppMesh::Route"
	Properties: {
		MeshName:  string | fn.Fn
		RouteName: string | fn.Fn
		Spec:      __RouteSpec
		Tags?: [...__Tag]
		VirtualRouterName: string | fn.Fn
	}
	__Duration :: {
		Unit:  string | fn.Fn
		Value: int | fn.Fn
	}
	__GrpcRetryPolicy :: {
		GrpcRetryEvents?: [...string] | fn.Fn
		HttpRetryEvents?: [...string] | fn.Fn
		MaxRetries:       int | fn.Fn
		PerRetryTimeout:  __Duration
		TcpRetryEvents?:  [...string] | fn.Fn
	}
	__GrpcRoute :: {
		Action:       __GrpcRouteAction
		Match:        __GrpcRouteMatch
		RetryPolicy?: __GrpcRetryPolicy
	}
	__GrpcRouteAction :: {
		WeightedTargets: [...__WeightedTarget]
	}
	__GrpcRouteMatch :: {
		Metadata?: [...__GrpcRouteMetadata]
		MethodName?:  string | fn.Fn
		ServiceName?: string | fn.Fn
	}
	__GrpcRouteMetadata :: {
		Invert?: bool | fn.Fn
		Match?:  __GrpcRouteMetadataMatchMethod
		Name:    string | fn.Fn
	}
	__GrpcRouteMetadataMatchMethod :: {
		Exact?:  string | fn.Fn
		Prefix?: string | fn.Fn
		Range?:  __MatchRange
		Regex?:  string | fn.Fn
		Suffix?: string | fn.Fn
	}
	__HeaderMatchMethod :: {
		Exact?:  string | fn.Fn
		Prefix?: string | fn.Fn
		Range?:  __MatchRange
		Regex?:  string | fn.Fn
		Suffix?: string | fn.Fn
	}
	__HttpRetryPolicy :: {
		HttpRetryEvents?: [...string] | fn.Fn
		MaxRetries:       int | fn.Fn
		PerRetryTimeout:  __Duration
		TcpRetryEvents?:  [...string] | fn.Fn
	}
	__HttpRoute :: {
		Action:       __HttpRouteAction
		Match:        __HttpRouteMatch
		RetryPolicy?: __HttpRetryPolicy
	}
	__HttpRouteAction :: {
		WeightedTargets: [...__WeightedTarget]
	}
	__HttpRouteHeader :: {
		Invert?: bool | fn.Fn
		Match?:  __HeaderMatchMethod
		Name:    string | fn.Fn
	}
	__HttpRouteMatch :: {
		Headers?: [...__HttpRouteHeader]
		Method?: string | fn.Fn
		Prefix:  string | fn.Fn
		Scheme?: string | fn.Fn
	}
	__MatchRange :: {
		End:   int | fn.Fn
		Start: int | fn.Fn
	}
	__RouteSpec :: {
		GrpcRoute?:  __GrpcRoute
		Http2Route?: __HttpRoute
		HttpRoute?:  __HttpRoute
		Priority?:   int | fn.Fn
		TcpRoute?:   __TcpRoute
	}
	__TcpRoute :: {
		Action: __TcpRouteAction
	}
	__TcpRouteAction :: {
		WeightedTargets: [...__WeightedTarget]
	}
	__WeightedTarget :: {
		VirtualNode: string | fn.Fn
		Weight:      int | fn.Fn
	}
}
VirtualNode :: {
	Type: "AWS::AppMesh::VirtualNode"
	Properties: {
		MeshName: string | fn.Fn
		Spec:     __VirtualNodeSpec
		Tags?: [...__Tag]
		VirtualNodeName: string | fn.Fn
	}
	__AccessLog :: {
		File?: __FileAccessLog
	}
	__AwsCloudMapInstanceAttribute :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	__AwsCloudMapServiceDiscovery :: {
		Attributes?: [...__AwsCloudMapInstanceAttribute]
		NamespaceName: string | fn.Fn
		ServiceName:   string | fn.Fn
	}
	__Backend :: {
		VirtualService?: __VirtualServiceBackend
	}
	__DnsServiceDiscovery :: {
		Hostname: string | fn.Fn
	}
	__FileAccessLog :: {
		Path: string | fn.Fn
	}
	__HealthCheck :: {
		HealthyThreshold:   int | fn.Fn
		IntervalMillis:     int | fn.Fn
		Path?:              string | fn.Fn
		Port?:              int | fn.Fn
		Protocol:           string | fn.Fn
		TimeoutMillis:      int | fn.Fn
		UnhealthyThreshold: int | fn.Fn
	}
	__Listener :: {
		HealthCheck?: __HealthCheck
		PortMapping:  __PortMapping
	}
	__Logging :: {
		AccessLog?: __AccessLog
	}
	__PortMapping :: {
		Port:     int | fn.Fn
		Protocol: string | fn.Fn
	}
	__ServiceDiscovery :: {
		AWSCloudMap?: __AwsCloudMapServiceDiscovery
		DNS?:         __DnsServiceDiscovery
	}
	__VirtualNodeSpec :: {
		Backends?: [...__Backend]
		Listeners?: [...__Listener]
		Logging?:          __Logging
		ServiceDiscovery?: __ServiceDiscovery
	}
	__VirtualServiceBackend :: {
		VirtualServiceName: string | fn.Fn
	}
}
VirtualRouter :: {
	Type: "AWS::AppMesh::VirtualRouter"
	Properties: {
		MeshName: string | fn.Fn
		Spec:     __VirtualRouterSpec
		Tags?: [...__Tag]
		VirtualRouterName: string | fn.Fn
	}
	__PortMapping :: {
		Port:     int | fn.Fn
		Protocol: string | fn.Fn
	}
	__VirtualRouterListener :: {
		PortMapping: __PortMapping
	}
	__VirtualRouterSpec :: {
		Listeners: [...__VirtualRouterListener]
	}
}
VirtualService :: {
	Type: "AWS::AppMesh::VirtualService"
	Properties: {
		MeshName: string | fn.Fn
		Spec:     __VirtualServiceSpec
		Tags?: [...__Tag]
		VirtualServiceName: string | fn.Fn
	}
	__VirtualNodeServiceProvider :: {
		VirtualNodeName: string | fn.Fn
	}
	__VirtualRouterServiceProvider :: {
		VirtualRouterName: string | fn.Fn
	}
	__VirtualServiceProvider :: {
		VirtualNode?:   __VirtualNodeServiceProvider
		VirtualRouter?: __VirtualRouterServiceProvider
	}
	__VirtualServiceSpec :: {
		Provider?: __VirtualServiceProvider
	}
}

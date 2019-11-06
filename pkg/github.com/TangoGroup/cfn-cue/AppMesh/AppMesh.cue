package AppMesh

import "github.com/TangoGroup/fn"

Mesh :: {
	Type: "AWS::AppMesh::Mesh"
	Properties: {
		MeshName: string | fn.Fn
		Spec?:    propMeshSpec
		Tags?: [...propTag]
	}
	propEgressFilter :: {
		Type: string | fn.Fn
	}
	propMeshSpec :: {
		EgressFilter?: propEgressFilter
	}
}
Route :: {
	Type: "AWS::AppMesh::Route"
	Properties: {
		MeshName:  string | fn.Fn
		RouteName: string | fn.Fn
		Spec:      propRouteSpec
		Tags?: [...propTag]
		VirtualRouterName: string | fn.Fn
	}
	propDuration :: {
		Unit:  string | fn.Fn
		Value: int | fn.Fn
	}
	propGrpcRetryPolicy :: {
		GrpcRetryEvents?: [...(string | fn.Fn)]
		HttpRetryEvents?: [...(string | fn.Fn)]
		MaxRetries:      int | fn.Fn
		PerRetryTimeout: propDuration
		TcpRetryEvents?: [...(string | fn.Fn)]
	}
	propGrpcRoute :: {
		Action:       propGrpcRouteAction
		Match:        propGrpcRouteMatch
		RetryPolicy?: propGrpcRetryPolicy
	}
	propGrpcRouteAction :: {
		WeightedTargets: [...propWeightedTarget]
	}
	propGrpcRouteMatch :: {
		Metadata?: [...propGrpcRouteMetadata]
		MethodName?:  string | fn.Fn
		ServiceName?: string | fn.Fn
	}
	propGrpcRouteMetadata :: {
		Invert?: bool | fn.Fn
		Match?:  propGrpcRouteMetadataMatchMethod
		Name:    string | fn.Fn
	}
	propGrpcRouteMetadataMatchMethod :: {
		Exact?:  string | fn.Fn
		Prefix?: string | fn.Fn
		Range?:  propMatchRange
		Regex?:  string | fn.Fn
		Suffix?: string | fn.Fn
	}
	propHeaderMatchMethod :: {
		Exact?:  string | fn.Fn
		Prefix?: string | fn.Fn
		Range?:  propMatchRange
		Regex?:  string | fn.Fn
		Suffix?: string | fn.Fn
	}
	propHttpRetryPolicy :: {
		HttpRetryEvents?: [...(string | fn.Fn)]
		MaxRetries:      int | fn.Fn
		PerRetryTimeout: propDuration
		TcpRetryEvents?: [...(string | fn.Fn)]
	}
	propHttpRoute :: {
		Action:       propHttpRouteAction
		Match:        propHttpRouteMatch
		RetryPolicy?: propHttpRetryPolicy
	}
	propHttpRouteAction :: {
		WeightedTargets: [...propWeightedTarget]
	}
	propHttpRouteHeader :: {
		Invert?: bool | fn.Fn
		Match?:  propHeaderMatchMethod
		Name:    string | fn.Fn
	}
	propHttpRouteMatch :: {
		Headers?: [...propHttpRouteHeader]
		Method?: string | fn.Fn
		Prefix:  string | fn.Fn
		Scheme?: string | fn.Fn
	}
	propMatchRange :: {
		End:   int | fn.Fn
		Start: int | fn.Fn
	}
	propRouteSpec :: {
		GrpcRoute?:  propGrpcRoute
		Http2Route?: propHttpRoute
		HttpRoute?:  propHttpRoute
		Priority?:   int | fn.Fn
		TcpRoute?:   propTcpRoute
	}
	propTcpRoute :: {
		Action: propTcpRouteAction
	}
	propTcpRouteAction :: {
		WeightedTargets: [...propWeightedTarget]
	}
	propWeightedTarget :: {
		VirtualNode: string | fn.Fn
		Weight:      int | fn.Fn
	}
}
VirtualNode :: {
	Type: "AWS::AppMesh::VirtualNode"
	Properties: {
		MeshName: string | fn.Fn
		Spec:     propVirtualNodeSpec
		Tags?: [...propTag]
		VirtualNodeName: string | fn.Fn
	}
	propAccessLog :: {
		File?: propFileAccessLog
	}
	propAwsCloudMapInstanceAttribute :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	propAwsCloudMapServiceDiscovery :: {
		Attributes?: [...propAwsCloudMapInstanceAttribute]
		NamespaceName: string | fn.Fn
		ServiceName:   string | fn.Fn
	}
	propBackend :: {
		VirtualService?: propVirtualServiceBackend
	}
	propDnsServiceDiscovery :: {
		Hostname: string | fn.Fn
	}
	propFileAccessLog :: {
		Path: string | fn.Fn
	}
	propHealthCheck :: {
		HealthyThreshold:   int | fn.Fn
		IntervalMillis:     int | fn.Fn
		Path?:              string | fn.Fn
		Port?:              int | fn.Fn
		Protocol:           string | fn.Fn
		TimeoutMillis:      int | fn.Fn
		UnhealthyThreshold: int | fn.Fn
	}
	propListener :: {
		HealthCheck?: propHealthCheck
		PortMapping:  propPortMapping
	}
	propLogging :: {
		AccessLog?: propAccessLog
	}
	propPortMapping :: {
		Port:     int | fn.Fn
		Protocol: string | fn.Fn
	}
	propServiceDiscovery :: {
		AWSCloudMap?: propAwsCloudMapServiceDiscovery
		DNS?:         propDnsServiceDiscovery
	}
	propVirtualNodeSpec :: {
		Backends?: [...propBackend]
		Listeners?: [...propListener]
		Logging?:          propLogging
		ServiceDiscovery?: propServiceDiscovery
	}
	propVirtualServiceBackend :: {
		VirtualServiceName: string | fn.Fn
	}
}
VirtualRouter :: {
	Type: "AWS::AppMesh::VirtualRouter"
	Properties: {
		MeshName: string | fn.Fn
		Spec:     propVirtualRouterSpec
		Tags?: [...propTag]
		VirtualRouterName: string | fn.Fn
	}
	propPortMapping :: {
		Port:     int | fn.Fn
		Protocol: string | fn.Fn
	}
	propVirtualRouterListener :: {
		PortMapping: propPortMapping
	}
	propVirtualRouterSpec :: {
		Listeners: [...propVirtualRouterListener]
	}
}
VirtualService :: {
	Type: "AWS::AppMesh::VirtualService"
	Properties: {
		MeshName: string | fn.Fn
		Spec:     propVirtualServiceSpec
		Tags?: [...propTag]
		VirtualServiceName: string | fn.Fn
	}
	propVirtualNodeServiceProvider :: {
		VirtualNodeName: string | fn.Fn
	}
	propVirtualRouterServiceProvider :: {
		VirtualRouterName: string | fn.Fn
	}
	propVirtualServiceProvider :: {
		VirtualNode?:   propVirtualNodeServiceProvider
		VirtualRouter?: propVirtualRouterServiceProvider
	}
	propVirtualServiceSpec :: {
		Provider?: propVirtualServiceProvider
	}
}

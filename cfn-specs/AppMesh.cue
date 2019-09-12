package AppMesh

Mesh :: {
	Type: "AWS::AppMesh::Mesh"
	Properties: {
		MeshName: string
		Spec?:    __MeshSpec
		Tags?: [...__Tag]
	}
	__EgressFilter = {
		Type: string
	}
	__MeshSpec = {
		EgressFilter?: __EgressFilter
	}
}
Route :: {
	Type: "AWS::AppMesh::Route"
	Properties: {
		MeshName:  string
		RouteName: string
		Spec:      __RouteSpec
		Tags?: [...__Tag]
		VirtualRouterName: string
	}
	__HeaderMatchMethod = {
		Exact?:  string
		Prefix?: string
		Range?:  __MatchRange
		Regex?:  string
		Suffix?: string
	}
	__HttpRoute = {
		Action: __HttpRouteAction
		Match:  __HttpRouteMatch
	}
	__HttpRouteAction = {
		WeightedTargets: [...__WeightedTarget]
	}
	__HttpRouteHeader = {
		Invert?: bool
		Match?:  __HeaderMatchMethod
		Name:    string
	}
	__HttpRouteMatch = {
		Headers?: [...__HttpRouteHeader]
		Method?: string
		Prefix:  string
		Scheme?: string
	}
	__MatchRange = {
		End:   int
		Start: int
	}
	__RouteSpec = {
		HttpRoute?: __HttpRoute
		Priority?:  int
		TcpRoute?:  __TcpRoute
	}
	__TcpRoute = {
		Action: __TcpRouteAction
	}
	__TcpRouteAction = {
		WeightedTargets: [...__WeightedTarget]
	}
	__WeightedTarget = {
		VirtualNode: string
		Weight:      int
	}
}
VirtualNode :: {
	Type: "AWS::AppMesh::VirtualNode"
	Properties: {
		MeshName: string
		Spec:     __VirtualNodeSpec
		Tags?: [...__Tag]
		VirtualNodeName: string
	}
	__AccessLog = {
		File?: __FileAccessLog
	}
	__AwsCloudMapInstanceAttribute = {
		Key:   string
		Value: string
	}
	__AwsCloudMapServiceDiscovery = {
		Attributes?: [...__AwsCloudMapInstanceAttribute]
		NamespaceName: string
		ServiceName:   string
	}
	__Backend = {
		VirtualService?: __VirtualServiceBackend
	}
	__DnsServiceDiscovery = {
		Hostname: string
	}
	__FileAccessLog = {
		Path: string
	}
	__HealthCheck = {
		HealthyThreshold:   int
		IntervalMillis:     int
		Path?:              string
		Port?:              int
		Protocol:           string
		TimeoutMillis:      int
		UnhealthyThreshold: int
	}
	__Listener = {
		HealthCheck?: __HealthCheck
		PortMapping:  __PortMapping
	}
	__Logging = {
		AccessLog?: __AccessLog
	}
	__PortMapping = {
		Port:     int
		Protocol: string
	}
	__ServiceDiscovery = {
		AWSCloudMap?: __AwsCloudMapServiceDiscovery
		DNS?:         __DnsServiceDiscovery
	}
	__VirtualNodeSpec = {
		Backends?: [...__Backend]
		Listeners?: [...__Listener]
		Logging?:          __Logging
		ServiceDiscovery?: __ServiceDiscovery
	}
	__VirtualServiceBackend = {
		VirtualServiceName: string
	}
}
VirtualRouter :: {
	Type: "AWS::AppMesh::VirtualRouter"
	Properties: {
		MeshName: string
		Spec:     __VirtualRouterSpec
		Tags?: [...__Tag]
		VirtualRouterName: string
	}
	__PortMapping = {
		Port:     int
		Protocol: string
	}
	__VirtualRouterListener = {
		PortMapping: __PortMapping
	}
	__VirtualRouterSpec = {
		Listeners: [...__VirtualRouterListener]
	}
}
VirtualService :: {
	Type: "AWS::AppMesh::VirtualService"
	Properties: {
		MeshName: string
		Spec:     __VirtualServiceSpec
		Tags?: [...__Tag]
		VirtualServiceName: string
	}
	__VirtualNodeServiceProvider = {
		VirtualNodeName: string
	}
	__VirtualRouterServiceProvider = {
		VirtualRouterName: string
	}
	__VirtualServiceProvider = {
		VirtualNode?:   __VirtualNodeServiceProvider
		VirtualRouter?: __VirtualRouterServiceProvider
	}
	__VirtualServiceSpec = {
		Provider?: __VirtualServiceProvider
	}
}

package ServiceDiscovery

import "github.com/TangoGroup/fn"

HttpNamespace :: {
	Type: "AWS::ServiceDiscovery::HttpNamespace"
	Properties: {
		Description?: string | fn.Fn
		Name:         string | fn.Fn
	}
}
Instance :: {
	Type: "AWS::ServiceDiscovery::Instance"
	Properties: {
		InstanceAttributes: {
		}
		InstanceId?: string | fn.Fn
		ServiceId:   string | fn.Fn
	}
}
PrivateDnsNamespace :: {
	Type: "AWS::ServiceDiscovery::PrivateDnsNamespace"
	Properties: {
		Description?: string | fn.Fn
		Name:         string | fn.Fn
		Vpc:          string | fn.Fn
	}
}
PublicDnsNamespace :: {
	Type: "AWS::ServiceDiscovery::PublicDnsNamespace"
	Properties: {
		Description?: string | fn.Fn
		Name:         string | fn.Fn
	}
}
Service :: {
	Type: "AWS::ServiceDiscovery::Service"
	Properties: {
		Description?:             string | fn.Fn
		DnsConfig?:               __DnsConfig
		HealthCheckConfig?:       __HealthCheckConfig
		HealthCheckCustomConfig?: __HealthCheckCustomConfig
		Name?:                    string | fn.Fn
		NamespaceId?:             string | fn.Fn
	}
	__DnsConfig :: {
		DnsRecords: [...__DnsRecord]
		NamespaceId?:   string | fn.Fn
		RoutingPolicy?: string | fn.Fn
	}
	__DnsRecord :: {
		TTL:  float | fn.Fn
		Type: (string & ("A" | "AAAA" | "SRV")) | fn.Fn
	}
	__HealthCheckConfig :: {
		FailureThreshold?: float | fn.Fn
		ResourcePath?:     string | fn.Fn
		Type:              (string & ("HTTP" | "HTTPS" | "TCP")) | fn.Fn
	}
	__HealthCheckCustomConfig :: {
		FailureThreshold?: float | fn.Fn
	}
}

package ServiceDiscovery

HttpNamespace :: {
  Type: "AWS::ServiceDiscovery::HttpNamespace"
  Properties: {
    Description?: string
    Name:         string
  }
}
Instance :: {
  Type: "AWS::ServiceDiscovery::Instance"
  Properties: {
    InstanceAttributes: {
    }
    InstanceId?: string
    ServiceId:   string
  }
}
PrivateDnsNamespace :: {
  Type: "AWS::ServiceDiscovery::PrivateDnsNamespace"
  Properties: {
    Description?: string
    Name:         string
    Vpc:          string
  }
}
PublicDnsNamespace :: {
  Type: "AWS::ServiceDiscovery::PublicDnsNamespace"
  Properties: {
    Description?: string
    Name:         string
  }
}
Service :: {
  Type: "AWS::ServiceDiscovery::Service"
  Properties: {
    Description?:             string
    DnsConfig?:               __DnsConfig
    HealthCheckConfig?:       __HealthCheckConfig
    HealthCheckCustomConfig?: __HealthCheckCustomConfig
    Name?:                    string
    NamespaceId?:             string
  }
  __DnsConfig = {
    DnsRecords: [...__DnsRecord]
    NamespaceId?:   string
    RoutingPolicy?: string
  }
  __DnsRecord = {
    TTL:  float
    Type: string
  }
  __HealthCheckConfig = {
    FailureThreshold?: float
    ResourcePath?:     string
    Type:              string
  }
  __HealthCheckCustomConfig = {
    FailureThreshold?: float
  }
}

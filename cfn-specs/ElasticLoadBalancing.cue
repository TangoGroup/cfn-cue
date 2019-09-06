package ElasticLoadBalancing

LoadBalancer :: {
  Type: "AWS::ElasticLoadBalancing::LoadBalancer"
  Properties: {
    AccessLoggingPolicy?: __AccessLoggingPolicy
    AppCookieStickinessPolicy?: [...__AppCookieStickinessPolicy]
    AvailabilityZones?: [...string]
    ConnectionDrainingPolicy?: __ConnectionDrainingPolicy
    ConnectionSettings?:       __ConnectionSettings
    CrossZone?:                bool
    HealthCheck?:              __HealthCheck
    Instances?: [...string]
    LBCookieStickinessPolicy?: [...__LBCookieStickinessPolicy]
    Listeners: [...__Listeners]
    LoadBalancerName?: string
    Policies?: [...__Policies]
    Scheme?: string
    SecurityGroups?: [...string]
    Subnets?: [...string]
    Tags?: [...__Tag]
  }
  __AccessLoggingPolicy = {
    EmitInterval?:   int
    Enabled:         bool
    S3BucketName:    string
    S3BucketPrefix?: string
  }
  __AppCookieStickinessPolicy = {
    CookieName: string
    PolicyName: string
  }
  __ConnectionDrainingPolicy = {
    Enabled:  bool
    Timeout?: int
  }
  __ConnectionSettings = {
    IdleTimeout: int
  }
  __HealthCheck = {
    HealthyThreshold:   string
    Interval:           string
    Target:             string
    Timeout:            string
    UnhealthyThreshold: string
  }
  __LBCookieStickinessPolicy = {
    CookieExpirationPeriod?: string
    PolicyName?:             string
  }
  __Listeners = {
    InstancePort:      >=1 & <=65535
    InstancePort:      string
    InstanceProtocol?: string
    LoadBalancerPort:  >=1 & <=65535
    LoadBalancerPort:  string
    PolicyNames?: [...string]
    Protocol:          string
    SSLCertificateId?: string
  }
  __Policies = {
    Attributes: [...{
    }]
    InstancePorts?: [...string]
    LoadBalancerPorts?: [...string]
    PolicyName: string
    PolicyType: string
  }
}

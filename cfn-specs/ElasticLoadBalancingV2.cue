package ElasticLoadBalancingV2

Listener :: {
  Type: "AWS::ElasticLoadBalancingV2::Listener"
  Properties: {
    Certificates?: [...__Certificate]
    DefaultActions: [...__Action]
    LoadBalancerArn: string
    Port:            int
    Protocol:        string
    SslPolicy?:      string
  }
  __Action = {
    AuthenticateCognitoConfig?: __AuthenticateCognitoConfig
    AuthenticateOidcConfig?:    __AuthenticateOidcConfig
    FixedResponseConfig?:       __FixedResponseConfig
    Order?:                     int
    RedirectConfig?:            __RedirectConfig
    TargetGroupArn?:            string
    Type:                       string
  }
  __AuthenticateCognitoConfig = {
    AuthenticationRequestExtraParams?: {
    }
    OnUnauthenticatedRequest?: string
    Scope?:                    string
    SessionCookieName?:        string
    SessionTimeout?:           int
    UserPoolArn:               string
    UserPoolClientId:          string
    UserPoolDomain:            string
  }
  __AuthenticateOidcConfig = {
    AuthenticationRequestExtraParams?: {
    }
    AuthorizationEndpoint:     string
    ClientId:                  string
    ClientSecret:              string
    Issuer:                    string
    OnUnauthenticatedRequest?: string
    Scope?:                    string
    SessionCookieName?:        string
    SessionTimeout?:           int
    TokenEndpoint:             string
    UserInfoEndpoint:          string
  }
  __Certificate = {
    CertificateArn?: string
  }
  __FixedResponseConfig = {
    ContentType?: string
    MessageBody?: string
    StatusCode:   string
  }
  __RedirectConfig = {
    Host?:      string
    Path?:      string
    Port?:      string
    Protocol?:  string
    Query?:     string
    StatusCode: string
  }
}
ListenerCertificate :: {
  Type: "AWS::ElasticLoadBalancingV2::ListenerCertificate"
  Properties: {
    Certificates: [...__Certificate]
    ListenerArn: string
  }
  __Certificate = {
    CertificateArn?: string
  }
}
ListenerRule :: {
  Type: "AWS::ElasticLoadBalancingV2::ListenerRule"
  Properties: {
    Actions: [...__Action]
    Conditions: [...__RuleCondition]
    ListenerArn: string
    Priority:    int
  }
  __Action = {
    AuthenticateCognitoConfig?: __AuthenticateCognitoConfig
    AuthenticateOidcConfig?:    __AuthenticateOidcConfig
    FixedResponseConfig?:       __FixedResponseConfig
    Order?:                     int
    RedirectConfig?:            __RedirectConfig
    TargetGroupArn?:            string
    Type:                       string
  }
  __AuthenticateCognitoConfig = {
    AuthenticationRequestExtraParams?: {
    }
    OnUnauthenticatedRequest?: string
    Scope?:                    string
    SessionCookieName?:        string
    SessionTimeout?:           int
    UserPoolArn:               string
    UserPoolClientId:          string
    UserPoolDomain:            string
  }
  __AuthenticateOidcConfig = {
    AuthenticationRequestExtraParams?: {
    }
    AuthorizationEndpoint:     string
    ClientId:                  string
    ClientSecret:              string
    Issuer:                    string
    OnUnauthenticatedRequest?: string
    Scope?:                    string
    SessionCookieName?:        string
    SessionTimeout?:           int
    TokenEndpoint:             string
    UserInfoEndpoint:          string
  }
  __FixedResponseConfig = {
    ContentType?: string
    MessageBody?: string
    StatusCode:   string
  }
  __HostHeaderConfig = {
    Values?: [...string]
  }
  __HttpHeaderConfig = {
    HttpHeaderName?: string
    Values?: [...string]
  }
  __HttpRequestMethodConfig = {
    Values?: [...string]
  }
  __PathPatternConfig = {
    Values?: [...string]
  }
  __QueryStringConfig = {
    Values?: [...__QueryStringKeyValue]
  }
  __QueryStringKeyValue = {
    Key?:   string
    Value?: string
  }
  __RedirectConfig = {
    Host?:      string
    Path?:      string
    Port?:      string
    Protocol?:  string
    Query?:     string
    StatusCode: string
  }
  __RuleCondition = {
    Field?:                   string
    HostHeaderConfig?:        __HostHeaderConfig
    HttpHeaderConfig?:        __HttpHeaderConfig
    HttpRequestMethodConfig?: __HttpRequestMethodConfig
    PathPatternConfig?:       __PathPatternConfig
    QueryStringConfig?:       __QueryStringConfig
    SourceIpConfig?:          __SourceIpConfig
    Values?: [...string]
  }
  __SourceIpConfig = {
    Values?: [...string]
  }
}
LoadBalancer :: {
  Type: "AWS::ElasticLoadBalancingV2::LoadBalancer"
  Properties: {
    IpAddressType?: string
    LoadBalancerAttributes?: [...__LoadBalancerAttribute]
    Name?:   string
    Scheme?: string
    SecurityGroups?: [...string]
    SubnetMappings?: [...__SubnetMapping]
    Subnets?: [...string]
    Tags?: [...__Tag]
    Type?: string
  }
  __LoadBalancerAttribute = {
    Key?:   string
    Value?: string
  }
  __SubnetMapping = {
    AllocationId: string
    SubnetId:     string
  }
}
TargetGroup :: {
  Type: "AWS::ElasticLoadBalancingV2::TargetGroup"
  Properties: {
    HealthCheckEnabled?:         bool
    HealthCheckIntervalSeconds?: int
    HealthCheckPath?:            string
    HealthCheckPort?:            string
    HealthCheckProtocol?:        string
    HealthCheckTimeoutSeconds?:  int
    HealthyThresholdCount?:      int
    Matcher?:                    __Matcher
    Name?:                       string
    Port?:                       int
    Protocol?:                   string
    Tags?: [...__Tag]
    TargetGroupAttributes?: [...__TargetGroupAttribute]
    TargetType?: string
    Targets?: [...__TargetDescription]
    UnhealthyThresholdCount?: int
    VpcId?:                   string
  }
  __Matcher = {
    HttpCode: string
  }
  __TargetDescription = {
    AvailabilityZone?: string
    Id:                string
    Port?:             int
  }
  __TargetGroupAttribute = {
    Key?:   string
    Value?: string
  }
}

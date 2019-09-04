package Route53Resolver

ResolverEndpoint :: {
  Type: "AWS::Route53Resolver::ResolverEndpoint"
  Properties: {
    Direction: string
    IpAddresses: [...__IpAddressRequest]
    Name?: string
    SecurityGroupIds: [...string]
    Tags?: [...__Tag]
  }
  __IpAddressRequest = {
    Ip?:      string
    SubnetId: string
  }
}
ResolverRule :: {
  Type: "AWS::Route53Resolver::ResolverRule"
  Properties: {
    DomainName:          string
    Name?:               string
    ResolverEndpointId?: string
    RuleType:            string
    Tags?: [...__Tag]
    TargetIps?: [...__TargetAddress]
  }
  __TargetAddress = {
    Ip:    string
    Port?: string
  }
}
ResolverRuleAssociation :: {
  Type: "AWS::Route53Resolver::ResolverRuleAssociation"
  Properties: {
    Name?:          string
    ResolverRuleId: string
    VPCId:          string
  }
}

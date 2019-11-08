package Route53Resolver

import "github.com/TangoGroup/fn"

ResolverEndpoint :: {
	Type: "AWS::Route53Resolver::ResolverEndpoint"
	Properties: {
		Direction: (string & ("INBOUND" | "OUTBOUND")) | fn.Fn
		IpAddresses: [...propIpAddressRequest]
		Name?: string | fn.Fn
		SecurityGroupIds: [...(string | fn.Fn)]
		Tags?: [...propTag]
	}
	propIpAddressRequest :: {
		Ip?:      string | fn.Fn
		SubnetId: string | fn.Fn
	}
}
ResolverRule :: {
	Type: "AWS::Route53Resolver::ResolverRule"
	Properties: {
		DomainName:          string | fn.Fn
		Name?:               string | fn.Fn
		ResolverEndpointId?: string | fn.Fn
		RuleType:            (string & ("FORWARD" | "RECURSIVE" | "SYSTEM")) | fn.Fn
		Tags?: [...propTag]
		TargetIps?: [...propTargetAddress]
	}
	propTargetAddress :: {
		Ip:    string | fn.Fn
		Port?: string | fn.Fn
	}
}
ResolverRuleAssociation :: {
	Type: "AWS::Route53Resolver::ResolverRuleAssociation"
	Properties: {
		Name?:          string | fn.Fn
		ResolverRuleId: string | fn.Fn
		VPCId:          string | fn.Fn
	}
}

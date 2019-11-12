package cacentral1

import "github.com/TangoGroup/fn"

Route53Resolver :: {
	ResolverEndpoint :: {
		Type: "AWS::Route53Resolver::ResolverEndpoint"
		Properties: {
			Direction: string | fn.Fn
			IpAddresses: [...{
			}]
			Name?: string | fn.Fn
			SecurityGroupIds: [...(string | fn.Fn)]
			Tags?: [...{
			}]
		}
	}
	ResolverRule :: {
		Type: "AWS::Route53Resolver::ResolverRule"
		Properties: {
			DomainName:          string | fn.Fn
			Name?:               string | fn.Fn
			ResolverEndpointId?: string | fn.Fn
			RuleType:            string | fn.Fn
			Tags?: [...{
			}]
			TargetIps?: [...{
			}]
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
}

package euwest1

import "github.com/TangoGroup/aws/fn"

#Route53Resolver: {
	#ResolverEndpoint: {
		Type:       "AWS::Route53Resolver::ResolverEndpoint"
		Properties: close({
			Direction:   ("INBOUND" | "OUTBOUND") | fn.#Fn
			IpAddresses: [...close({
				Ip?:      string | fn.#Fn
				SubnetId: string | fn.#Fn
			})] | fn.If
			Name?:            string | fn.#Fn
			SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:            [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResolverRule: {
		Type:       "AWS::Route53Resolver::ResolverRule"
		Properties: close({
			DomainName:          string | fn.#Fn
			Name?:               string | fn.#Fn
			ResolverEndpointId?: string | fn.#Fn
			RuleType:            ("FORWARD" | "RECURSIVE" | "SYSTEM") | fn.#Fn
			Tags?:               [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			TargetIps?: [...close({
				Ip:    string | fn.#Fn
				Port?: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResolverRuleAssociation: {
		Type:       "AWS::Route53Resolver::ResolverRuleAssociation"
		Properties: close({
			Name?:          string | fn.#Fn
			ResolverRuleId: string | fn.#Fn
			VPCId:          string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

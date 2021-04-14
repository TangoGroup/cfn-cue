package mesouth1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Route53Resolver :: {
	FirewallDomainList :: {
		Type:       "AWS::Route53Resolver::FirewallDomainList"
		Properties: close({
			DomainFileUrl?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			Domains?:       [...((strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn)
			Name?:          (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)"#)) | fn.Fn
			Tags?:          [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FirewallRuleGroup :: {
		Type:       "AWS::Route53Resolver::FirewallRuleGroup"
		Properties: close({
			FirewallRules?: [...close({
				Action:                ("ALLOW" | "BLOCK" | "ALERT") | fn.Fn
				BlockOverrideDnsType?: ("CNAME") | fn.Fn
				BlockOverrideDomain?:  (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
				BlockOverrideTtl?:     int | fn.Fn
				BlockResponse?:        ("NODATA" | "NXDOMAIN" | "OVERRIDE") | fn.Fn
				FirewallDomainListId:  (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
				Priority:              int | fn.Fn
			})] | fn.If
			Name?: (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)"#)) | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FirewallRuleGroupAssociation :: {
		Type:       "AWS::Route53Resolver::FirewallRuleGroupAssociation"
		Properties: close({
			FirewallRuleGroupId: (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
			MutationProtection?: ("ENABLED" | "DISABLED") | fn.Fn
			Name?:               (=~#"(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)"#) | fn.Fn
			Priority:            int | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcId: (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ResolverDNSSECConfig :: {
		Type:       "AWS::Route53Resolver::ResolverDNSSECConfig"
		Properties: close({
			ResourceId?: (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ResolverEndpoint :: {
		Type:       "AWS::Route53Resolver::ResolverEndpoint"
		Properties: close({
			Direction:   ("INBOUND" | "OUTBOUND") | fn.Fn
			IpAddresses: [...close({
				Ip?:      string | fn.Fn
				SubnetId: string | fn.Fn
			})] | fn.If
			Name?:            string | fn.Fn
			SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:            [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ResolverQueryLoggingConfig :: {
		Type:       "AWS::Route53Resolver::ResolverQueryLoggingConfig"
		Properties: close({
			DestinationArn?: (strings.MinRunes(1) & strings.MaxRunes(600)) | fn.Fn
			Name?:           (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"(?!^[0-9]+$)([a-zA-Z0-9\-_' ']+)"#)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ResolverQueryLoggingConfigAssociation :: {
		Type:       "AWS::Route53Resolver::ResolverQueryLoggingConfigAssociation"
		Properties: close({
			ResolverQueryLogConfigId?: (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
			ResourceId?:               (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ResolverRule :: {
		Type:       "AWS::Route53Resolver::ResolverRule"
		Properties: close({
			DomainName:          string | fn.Fn
			Name?:               string | fn.Fn
			ResolverEndpointId?: string | fn.Fn
			RuleType:            ("FORWARD" | "RECURSIVE" | "SYSTEM") | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TargetIps?: [...close({
				Ip:    string | fn.Fn
				Port?: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ResolverRuleAssociation :: {
		Type:       "AWS::Route53Resolver::ResolverRuleAssociation"
		Properties: close({
			Name?:          string | fn.Fn
			ResolverRuleId: string | fn.Fn
			VPCId:          string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

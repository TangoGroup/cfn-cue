package cacentral1

import "github.com/TangoGroup/aws/fn"

WAFv2 :: {
	IPSet :: {
		Type: "AWS::WAFv2::IPSet"
		Properties: {
			Addresses?: IPAddresses?: [...(string | fn.Fn)] | fn.Fn
			Description?:      string | fn.Fn
			IPAddressVersion?: string | fn.Fn
			Name:              string | fn.Fn
			Scope:             string | fn.Fn
			Tags?: TagList?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RegexPatternSet :: {
		Type: "AWS::WAFv2::RegexPatternSet"
		Properties: {
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			RegularExpressionList?: RegularExpressionList?: [...{
				[string]: _
			}]
			Scope: string | fn.Fn
			Tags?: TagList?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RuleGroup :: {
		Type: "AWS::WAFv2::RuleGroup"
		Properties: {
			Capacity?:    int | fn.Fn
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			Rules?: Rules?: [...{
				[string]: _
			}]
			Scope: string | fn.Fn
			Tags?: TagList?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VisibilityConfig?: {
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	WebACL :: {
		Type: "AWS::WAFv2::WebACL"
		Properties: {
			DefaultAction?: {
				Allow?: {
				}
				Block?: {
				}
			}
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			Rules?: Rules?: [...{
				[string]: _
			}]
			Scope: string | fn.Fn
			Tags?: TagList?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VisibilityConfig?: {
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

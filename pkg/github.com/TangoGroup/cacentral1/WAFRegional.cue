package cacentral1

import "github.com/TangoGroup/fn"

WAFRegional :: {
	ByteMatchSet :: {
		Type: "AWS::WAFRegional::ByteMatchSet"
		Properties: {
			ByteMatchTuples?: [...{
			}]
			Name: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	GeoMatchSet :: {
		Type: "AWS::WAFRegional::GeoMatchSet"
		Properties: {
			GeoMatchConstraints?: [...{
			}]
			Name: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	IPSet :: {
		Type: "AWS::WAFRegional::IPSet"
		Properties: {
			IPSetDescriptors?: [...{
			}]
			Name: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RateBasedRule :: {
		Type: "AWS::WAFRegional::RateBasedRule"
		Properties: {
			MatchPredicates?: [...{
			}]
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			RateKey:    string | fn.Fn
			RateLimit:  int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RegexPatternSet :: {
		Type: "AWS::WAFRegional::RegexPatternSet"
		Properties: {
			Name: string | fn.Fn
			RegexPatternStrings: [...(string | fn.Fn)]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Rule :: {
		Type: "AWS::WAFRegional::Rule"
		Properties: {
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			Predicates?: [...{
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SizeConstraintSet :: {
		Type: "AWS::WAFRegional::SizeConstraintSet"
		Properties: {
			Name: string | fn.Fn
			SizeConstraints?: [...{
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SqlInjectionMatchSet :: {
		Type: "AWS::WAFRegional::SqlInjectionMatchSet"
		Properties: {
			Name: string | fn.Fn
			SqlInjectionMatchTuples?: [...{
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	WebACL :: {
		Type: "AWS::WAFRegional::WebACL"
		Properties: {
			DefaultAction: {
			}
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			Rules?: [...{
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	WebACLAssociation :: {
		Type: "AWS::WAFRegional::WebACLAssociation"
		Properties: {
			ResourceArn: string | fn.Fn
			WebACLId:    string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	XssMatchSet :: {
		Type: "AWS::WAFRegional::XssMatchSet"
		Properties: {
			Name: string | fn.Fn
			XssMatchTuples?: [...{
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

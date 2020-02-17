package usgovwest1

import "github.com/TangoGroup/aws/fn"

WAFRegional :: {
	ByteMatchSet :: {
		Type: "AWS::WAFRegional::ByteMatchSet"
		Properties: {
			ByteMatchTuples?: [...{
			}] | fn.If
			Name: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GeoMatchSet :: {
		Type: "AWS::WAFRegional::GeoMatchSet"
		Properties: {
			GeoMatchConstraints?: [...{
			}] | fn.If
			Name: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	IPSet :: {
		Type: "AWS::WAFRegional::IPSet"
		Properties: {
			IPSetDescriptors?: [...{
			}] | fn.If
			Name: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RateBasedRule :: {
		Type: "AWS::WAFRegional::RateBasedRule"
		Properties: {
			MatchPredicates?: [...{
			}] | fn.If
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			RateKey:    string | fn.Fn
			RateLimit:  int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RegexPatternSet :: {
		Type: "AWS::WAFRegional::RegexPatternSet"
		Properties: {
			Name:                string | fn.Fn
			RegexPatternStrings: [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Rule :: {
		Type: "AWS::WAFRegional::Rule"
		Properties: {
			MetricName:  string | fn.Fn
			Name:        string | fn.Fn
			Predicates?: [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SizeConstraintSet :: {
		Type: "AWS::WAFRegional::SizeConstraintSet"
		Properties: {
			Name:             string | fn.Fn
			SizeConstraints?: [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SqlInjectionMatchSet :: {
		Type: "AWS::WAFRegional::SqlInjectionMatchSet"
		Properties: {
			Name:                     string | fn.Fn
			SqlInjectionMatchTuples?: [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WebACL :: {
		Type: "AWS::WAFRegional::WebACL"
		Properties: {
			DefaultAction: {
			} | fn.If
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			Rules?:     [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
		Condition?: string
	}
	XssMatchSet :: {
		Type: "AWS::WAFRegional::XssMatchSet"
		Properties: {
			Name:            string | fn.Fn
			XssMatchTuples?: [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

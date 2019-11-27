package euwest2

import "github.com/TangoGroup/aws/fn"

WAFRegional :: {
	ByteMatchSet :: {
		Type: "AWS::WAFRegional::ByteMatchSet"
		Properties: {
			ByteMatchTuples?: [...{
				FieldToMatch: {
					Data?: string | fn.Fn
					Type:  string | fn.Fn
				}
				PositionalConstraint: string | fn.Fn
				TargetString?:        string | fn.Fn
				TargetStringBase64?:  string | fn.Fn
				TextTransformation:   string | fn.Fn
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
				Type:  string | fn.Fn
				Value: string | fn.Fn
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
				Type:  string | fn.Fn
				Value: string | fn.Fn
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
				DataId:  string | fn.Fn
				Negated: bool | fn.Fn
				Type:    string | fn.Fn
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
			Name:                string | fn.Fn
			RegexPatternStrings: [...(string | fn.Fn)] | fn.Fn
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
				DataId:  string | fn.Fn
				Negated: bool | fn.Fn
				Type:    (string & ("ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch")) | fn.Fn
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
				ComparisonOperator: string | fn.Fn
				FieldToMatch: {
					Data?: string | fn.Fn
					Type:  string | fn.Fn
				}
				Size:               int | fn.Fn
				TextTransformation: string | fn.Fn
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
				FieldToMatch: {
					Data?: string | fn.Fn
					Type:  string | fn.Fn
				}
				TextTransformation: string | fn.Fn
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
			DefaultAction: Type: string | fn.Fn
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			Rules?: [...{
				Action: Type: string | fn.Fn
				Priority: int | fn.Fn
				RuleId:   string | fn.Fn
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
				FieldToMatch: {
					Data?: string | fn.Fn
					Type:  string | fn.Fn
				}
				TextTransformation: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

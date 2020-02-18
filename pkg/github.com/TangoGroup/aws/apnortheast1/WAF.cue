package apnortheast1

import "github.com/TangoGroup/aws/fn"

WAF :: {
	ByteMatchSet :: {
		Type: "AWS::WAF::ByteMatchSet"
		Properties: {
			ByteMatchTuples?: [...close({
				FieldToMatch: close({
					Data?: string | fn.Fn
					Type:  string | fn.Fn
				}) | fn.If
				PositionalConstraint: string | fn.Fn
				TargetString?:        string | fn.Fn
				TargetStringBase64?:  string | fn.Fn
				TextTransformation:   string | fn.Fn
			})] | fn.If
			Name: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	IPSet :: {
		Type: "AWS::WAF::IPSet"
		Properties: {
			IPSetDescriptors?: [...close({
				Type:  string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Name: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Rule :: {
		Type: "AWS::WAF::Rule"
		Properties: {
			MetricName:  string | fn.Fn
			Name:        string | fn.Fn
			Predicates?: [...close({
				DataId:  string | fn.Fn
				Negated: bool | fn.Fn
				Type:    ("ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch") | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SizeConstraintSet :: {
		Type: "AWS::WAF::SizeConstraintSet"
		Properties: {
			Name:            string | fn.Fn
			SizeConstraints: [...close({
				ComparisonOperator: string | fn.Fn
				FieldToMatch:       close({
					Data?: string | fn.Fn
					Type:  string | fn.Fn
				}) | fn.If
				Size:               int | fn.Fn
				TextTransformation: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SqlInjectionMatchSet :: {
		Type: "AWS::WAF::SqlInjectionMatchSet"
		Properties: {
			Name:                     string | fn.Fn
			SqlInjectionMatchTuples?: [...close({
				FieldToMatch: close({
					Data?: string | fn.Fn
					Type:  string | fn.Fn
				}) | fn.If
				TextTransformation: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WebACL :: {
		Type: "AWS::WAF::WebACL"
		Properties: {
			DefaultAction: close({
				Type: string | fn.Fn
			}) | fn.If
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			Rules?:     [...close({
				Action?: close({
					Type: string | fn.Fn
				}) | fn.If
				Priority: int | fn.Fn
				RuleId:   string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	XssMatchSet :: {
		Type: "AWS::WAF::XssMatchSet"
		Properties: {
			Name:           string | fn.Fn
			XssMatchTuples: [...close({
				FieldToMatch: close({
					Data?: string | fn.Fn
					Type:  string | fn.Fn
				}) | fn.If
				TextTransformation: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package useast2

import "github.com/TangoGroup/aws/fn"

#WAFRegional: {
	#ByteMatchSet: {
		Type:       "AWS::WAFRegional::ByteMatchSet"
		Properties: close({
			ByteMatchTuples?: [...close({
				FieldToMatch: close({
					Data?: string | fn.#Fn
					Type:  string | fn.#Fn
				}) | fn.If
				PositionalConstraint: string | fn.#Fn
				TargetString?:        string | fn.#Fn
				TargetStringBase64?:  string | fn.#Fn
				TextTransformation:   string | fn.#Fn
			})] | fn.If
			Name: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#GeoMatchSet: {
		Type:       "AWS::WAFRegional::GeoMatchSet"
		Properties: close({
			GeoMatchConstraints?: [...close({
				Type:  string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			Name: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#IPSet: {
		Type:       "AWS::WAFRegional::IPSet"
		Properties: close({
			IPSetDescriptors?: [...close({
				Type:  string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			Name: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RateBasedRule: {
		Type:       "AWS::WAFRegional::RateBasedRule"
		Properties: close({
			MatchPredicates?: [...close({
				DataId:  string | fn.#Fn
				Negated: bool | fn.#Fn
				Type:    string | fn.#Fn
			})] | fn.If
			MetricName: string | fn.#Fn
			Name:       string | fn.#Fn
			RateKey:    string | fn.#Fn
			RateLimit:  int | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RegexPatternSet: {
		Type:       "AWS::WAFRegional::RegexPatternSet"
		Properties: close({
			Name:                string | fn.#Fn
			RegexPatternStrings: [...(string | fn.#Fn)] | (string | fn.#Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Rule: {
		Type:       "AWS::WAFRegional::Rule"
		Properties: close({
			MetricName:  string | fn.#Fn
			Name:        string | fn.#Fn
			Predicates?: [...close({
				DataId:  string | fn.#Fn
				Negated: bool | fn.#Fn
				Type:    ("ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch") | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SizeConstraintSet: {
		Type:       "AWS::WAFRegional::SizeConstraintSet"
		Properties: close({
			Name:             string | fn.#Fn
			SizeConstraints?: [...close({
				ComparisonOperator: string | fn.#Fn
				FieldToMatch:       close({
					Data?: string | fn.#Fn
					Type:  string | fn.#Fn
				}) | fn.If
				Size:               int | fn.#Fn
				TextTransformation: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SqlInjectionMatchSet: {
		Type:       "AWS::WAFRegional::SqlInjectionMatchSet"
		Properties: close({
			Name:                     string | fn.#Fn
			SqlInjectionMatchTuples?: [...close({
				FieldToMatch: close({
					Data?: string | fn.#Fn
					Type:  string | fn.#Fn
				}) | fn.If
				TextTransformation: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WebACL: {
		Type:       "AWS::WAFRegional::WebACL"
		Properties: close({
			DefaultAction: close({
				Type: string | fn.#Fn
			}) | fn.If
			MetricName: string | fn.#Fn
			Name:       string | fn.#Fn
			Rules?:     [...close({
				Action: close({
					Type: string | fn.#Fn
				}) | fn.If
				Priority: int | fn.#Fn
				RuleId:   string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WebACLAssociation: {
		Type:       "AWS::WAFRegional::WebACLAssociation"
		Properties: close({
			ResourceArn: string | fn.#Fn
			WebACLId:    string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#XssMatchSet: {
		Type:       "AWS::WAFRegional::XssMatchSet"
		Properties: close({
			Name:            string | fn.#Fn
			XssMatchTuples?: [...close({
				FieldToMatch: close({
					Data?: string | fn.#Fn
					Type:  string | fn.#Fn
				}) | fn.If
				TextTransformation: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

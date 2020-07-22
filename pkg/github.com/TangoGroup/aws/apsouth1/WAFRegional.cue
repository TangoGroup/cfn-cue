package apsouth1

import "github.com/TangoGroup/aws/fn"

#WAFRegional: {
	#ByteMatchSet: {
		Type:       "AWS::WAFRegional::ByteMatchSet"
		Properties: close({
			ByteMatchTuples?: [...close({})] | fn.If
			Name:             string | fn.#Fn
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
			GeoMatchConstraints?: [...close({})] | fn.If
			Name:                 string | fn.#Fn
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
			IPSetDescriptors?: [...close({})] | fn.If
			Name:              string | fn.#Fn
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
			MatchPredicates?: [...close({})] | fn.If
			MetricName:       string | fn.#Fn
			Name:             string | fn.#Fn
			RateKey:          string | fn.#Fn
			RateLimit:        int | fn.#Fn
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
			Predicates?: [...close({})] | fn.If
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
			SizeConstraints?: [...close({})] | fn.If
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
			SqlInjectionMatchTuples?: [...close({})] | fn.If
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
			DefaultAction: close({}) | fn.If
			MetricName:    string | fn.#Fn
			Name:          string | fn.#Fn
			Rules?:        [...close({})] | fn.If
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
			XssMatchTuples?: [...close({})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

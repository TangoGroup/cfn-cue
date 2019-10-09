package WAFRegional

import "github.com/TangoGroup/fn"

ByteMatchSet :: {
	Type: "AWS::WAFRegional::ByteMatchSet"
	Properties: {
		ByteMatchTuples?: [...__ByteMatchTuple]
		Name: string | fn.Fn
	}
	__ByteMatchTuple :: {
		FieldToMatch:         __FieldToMatch
		PositionalConstraint: string | fn.Fn
		TargetString?:        string | fn.Fn
		TargetStringBase64?:  string | fn.Fn
		TextTransformation:   string | fn.Fn
	}
	__FieldToMatch :: {
		Data?: string | fn.Fn
		Type:  string | fn.Fn
	}
}
GeoMatchSet :: {
	Type: "AWS::WAFRegional::GeoMatchSet"
	Properties: {
		GeoMatchConstraints?: [...__GeoMatchConstraint]
		Name: string | fn.Fn
	}
	__GeoMatchConstraint :: {
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
}
IPSet :: {
	Type: "AWS::WAFRegional::IPSet"
	Properties: {
		IPSetDescriptors?: [...__IPSetDescriptor]
		Name: string | fn.Fn
	}
	__IPSetDescriptor :: {
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
}
RateBasedRule :: {
	Type: "AWS::WAFRegional::RateBasedRule"
	Properties: {
		MatchPredicates?: [...__Predicate]
		MetricName: string | fn.Fn
		Name:       string | fn.Fn
		RateKey:    string | fn.Fn
		RateLimit:  int | fn.Fn
	}
	__Predicate :: {
		DataId:  string | fn.Fn
		Negated: bool | fn.Fn
		Type:    string | fn.Fn
	}
}
RegexPatternSet :: {
	Type: "AWS::WAFRegional::RegexPatternSet"
	Properties: {
		Name:                string | fn.Fn
		RegexPatternStrings: [...string] | fn.Fn
	}
}
Rule :: {
	Type: "AWS::WAFRegional::Rule"
	Properties: {
		MetricName: string | fn.Fn
		Name:       string | fn.Fn
		Predicates?: [...__Predicate]
	}
	__Predicate :: {
		DataId:  string | fn.Fn
		Negated: bool | fn.Fn
		Type:    (string & ("ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch")) | fn.Fn
	}
}
SizeConstraintSet :: {
	Type: "AWS::WAFRegional::SizeConstraintSet"
	Properties: {
		Name: string | fn.Fn
		SizeConstraints?: [...__SizeConstraint]
	}
	__FieldToMatch :: {
		Data?: string | fn.Fn
		Type:  string | fn.Fn
	}
	__SizeConstraint :: {
		ComparisonOperator: string | fn.Fn
		FieldToMatch:       __FieldToMatch
		Size:               int | fn.Fn
		TextTransformation: string | fn.Fn
	}
}
SqlInjectionMatchSet :: {
	Type: "AWS::WAFRegional::SqlInjectionMatchSet"
	Properties: {
		Name: string | fn.Fn
		SqlInjectionMatchTuples?: [...__SqlInjectionMatchTuple]
	}
	__FieldToMatch :: {
		Data?: string | fn.Fn
		Type:  string | fn.Fn
	}
	__SqlInjectionMatchTuple :: {
		FieldToMatch:       __FieldToMatch
		TextTransformation: string | fn.Fn
	}
}
WebACL :: {
	Type: "AWS::WAFRegional::WebACL"
	Properties: {
		DefaultAction: __Action
		MetricName:    string | fn.Fn
		Name:          string | fn.Fn
		Rules?: [...__Rule]
	}
	__Action :: {
		Type: string | fn.Fn
	}
	__Rule :: {
		Action:   __Action
		Priority: int | fn.Fn
		RuleId:   string | fn.Fn
	}
}
WebACLAssociation :: {
	Type: "AWS::WAFRegional::WebACLAssociation"
	Properties: {
		ResourceArn: string | fn.Fn
		WebACLId:    string | fn.Fn
	}
}
XssMatchSet :: {
	Type: "AWS::WAFRegional::XssMatchSet"
	Properties: {
		Name: string | fn.Fn
		XssMatchTuples?: [...__XssMatchTuple]
	}
	__FieldToMatch :: {
		Data?: string | fn.Fn
		Type:  string | fn.Fn
	}
	__XssMatchTuple :: {
		FieldToMatch:       __FieldToMatch
		TextTransformation: string | fn.Fn
	}
}

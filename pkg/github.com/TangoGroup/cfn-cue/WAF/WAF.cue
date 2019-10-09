package WAF

import "github.com/TangoGroup/fn"

ByteMatchSet :: {
	Type: "AWS::WAF::ByteMatchSet"
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
IPSet :: {
	Type: "AWS::WAF::IPSet"
	Properties: {
		IPSetDescriptors?: [...__IPSetDescriptor]
		Name: string | fn.Fn
	}
	__IPSetDescriptor :: {
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
}
Rule :: {
	Type: "AWS::WAF::Rule"
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
	Type: "AWS::WAF::SizeConstraintSet"
	Properties: {
		Name: string | fn.Fn
		SizeConstraints: [...__SizeConstraint]
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
	Type: "AWS::WAF::SqlInjectionMatchSet"
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
	Type: "AWS::WAF::WebACL"
	Properties: {
		DefaultAction: __WafAction
		MetricName:    string | fn.Fn
		Name:          string | fn.Fn
		Rules?: [...__ActivatedRule]
	}
	__ActivatedRule :: {
		Action?:  __WafAction
		Priority: int | fn.Fn
		RuleId:   string | fn.Fn
	}
	__WafAction :: {
		Type: string | fn.Fn
	}
}
XssMatchSet :: {
	Type: "AWS::WAF::XssMatchSet"
	Properties: {
		Name: string | fn.Fn
		XssMatchTuples: [...__XssMatchTuple]
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

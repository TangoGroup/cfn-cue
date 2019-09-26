package WAF

ByteMatchSet :: {
	Type: "AWS::WAF::ByteMatchSet"
	Properties: {
		ByteMatchTuples?: [...__ByteMatchTuple]
		Name: string
	}
	__ByteMatchTuple :: {
		FieldToMatch:         __FieldToMatch
		PositionalConstraint: string
		TargetString?:        string
		TargetStringBase64?:  string
		TextTransformation:   string
	}
	__FieldToMatch :: {
		Data?: string
		Type:  string
	}
}
IPSet :: {
	Type: "AWS::WAF::IPSet"
	Properties: {
		IPSetDescriptors?: [...__IPSetDescriptor]
		Name: string
	}
	__IPSetDescriptor :: {
		Type:  string
		Value: string
	}
}
Rule :: {
	Type: "AWS::WAF::Rule"
	Properties: {
		MetricName: string
		Name:       string
		Predicates?: [...__Predicate]
	}
	__Predicate :: {
		DataId:  string
		Negated: bool
		Type:    "ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch"
		Type:    string
	}
}
SizeConstraintSet :: {
	Type: "AWS::WAF::SizeConstraintSet"
	Properties: {
		Name: string
		SizeConstraints: [...__SizeConstraint]
	}
	__FieldToMatch :: {
		Data?: string
		Type:  string
	}
	__SizeConstraint :: {
		ComparisonOperator: string
		FieldToMatch:       __FieldToMatch
		Size:               int
		TextTransformation: string
	}
}
SqlInjectionMatchSet :: {
	Type: "AWS::WAF::SqlInjectionMatchSet"
	Properties: {
		Name: string
		SqlInjectionMatchTuples?: [...__SqlInjectionMatchTuple]
	}
	__FieldToMatch :: {
		Data?: string
		Type:  string
	}
	__SqlInjectionMatchTuple :: {
		FieldToMatch:       __FieldToMatch
		TextTransformation: string
	}
}
WebACL :: {
	Type: "AWS::WAF::WebACL"
	Properties: {
		DefaultAction: __WafAction
		MetricName:    string
		Name:          string
		Rules?: [...__ActivatedRule]
	}
	__ActivatedRule :: {
		Action?:  __WafAction
		Priority: int
		RuleId:   string
	}
	__WafAction :: {
		Type: string
	}
}
XssMatchSet :: {
	Type: "AWS::WAF::XssMatchSet"
	Properties: {
		Name: string
		XssMatchTuples: [...__XssMatchTuple]
	}
	__FieldToMatch :: {
		Data?: string
		Type:  string
	}
	__XssMatchTuple :: {
		FieldToMatch:       __FieldToMatch
		TextTransformation: string
	}
}

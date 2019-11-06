package WAF

import "github.com/TangoGroup/fn"

ByteMatchSet :: {
	Type: "AWS::WAF::ByteMatchSet"
	Properties: {
		ByteMatchTuples?: [...propByteMatchTuple]
		Name: string | fn.Fn
	}
	propByteMatchTuple :: {
		FieldToMatch:         propFieldToMatch
		PositionalConstraint: string | fn.Fn
		TargetString?:        string | fn.Fn
		TargetStringBase64?:  string | fn.Fn
		TextTransformation:   string | fn.Fn
	}
	propFieldToMatch :: {
		Data?: string | fn.Fn
		Type:  string | fn.Fn
	}
}
IPSet :: {
	Type: "AWS::WAF::IPSet"
	Properties: {
		IPSetDescriptors?: [...propIPSetDescriptor]
		Name: string | fn.Fn
	}
	propIPSetDescriptor :: {
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
}
Rule :: {
	Type: "AWS::WAF::Rule"
	Properties: {
		MetricName: string | fn.Fn
		Name:       string | fn.Fn
		Predicates?: [...propPredicate]
	}
	propPredicate :: {
		DataId:  string | fn.Fn
		Negated: bool | fn.Fn
		Type:    (string & ("ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch")) | fn.Fn
	}
}
SizeConstraintSet :: {
	Type: "AWS::WAF::SizeConstraintSet"
	Properties: {
		Name: string | fn.Fn
		SizeConstraints: [...propSizeConstraint]
	}
	propFieldToMatch :: {
		Data?: string | fn.Fn
		Type:  string | fn.Fn
	}
	propSizeConstraint :: {
		ComparisonOperator: string | fn.Fn
		FieldToMatch:       propFieldToMatch
		Size:               int | fn.Fn
		TextTransformation: string | fn.Fn
	}
}
SqlInjectionMatchSet :: {
	Type: "AWS::WAF::SqlInjectionMatchSet"
	Properties: {
		Name: string | fn.Fn
		SqlInjectionMatchTuples?: [...propSqlInjectionMatchTuple]
	}
	propFieldToMatch :: {
		Data?: string | fn.Fn
		Type:  string | fn.Fn
	}
	propSqlInjectionMatchTuple :: {
		FieldToMatch:       propFieldToMatch
		TextTransformation: string | fn.Fn
	}
}
WebACL :: {
	Type: "AWS::WAF::WebACL"
	Properties: {
		DefaultAction: propWafAction
		MetricName:    string | fn.Fn
		Name:          string | fn.Fn
		Rules?: [...propActivatedRule]
	}
	propActivatedRule :: {
		Action?:  propWafAction
		Priority: int | fn.Fn
		RuleId:   string | fn.Fn
	}
	propWafAction :: {
		Type: string | fn.Fn
	}
}
XssMatchSet :: {
	Type: "AWS::WAF::XssMatchSet"
	Properties: {
		Name: string | fn.Fn
		XssMatchTuples: [...propXssMatchTuple]
	}
	propFieldToMatch :: {
		Data?: string | fn.Fn
		Type:  string | fn.Fn
	}
	propXssMatchTuple :: {
		FieldToMatch:       propFieldToMatch
		TextTransformation: string | fn.Fn
	}
}

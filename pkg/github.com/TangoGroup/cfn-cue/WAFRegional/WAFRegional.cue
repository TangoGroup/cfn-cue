package WAFRegional

import "github.com/TangoGroup/fn"

ByteMatchSet :: {
	Type: "AWS::WAFRegional::ByteMatchSet"
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
GeoMatchSet :: {
	Type: "AWS::WAFRegional::GeoMatchSet"
	Properties: {
		GeoMatchConstraints?: [...propGeoMatchConstraint]
		Name: string | fn.Fn
	}
	propGeoMatchConstraint :: {
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
}
IPSet :: {
	Type: "AWS::WAFRegional::IPSet"
	Properties: {
		IPSetDescriptors?: [...propIPSetDescriptor]
		Name: string | fn.Fn
	}
	propIPSetDescriptor :: {
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
}
RateBasedRule :: {
	Type: "AWS::WAFRegional::RateBasedRule"
	Properties: {
		MatchPredicates?: [...propPredicate]
		MetricName: string | fn.Fn
		Name:       string | fn.Fn
		RateKey:    string | fn.Fn
		RateLimit:  int | fn.Fn
	}
	propPredicate :: {
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
		Predicates?: [...propPredicate]
	}
	propPredicate :: {
		DataId:  string | fn.Fn
		Negated: bool | fn.Fn
		Type:    (string & ("ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch")) | fn.Fn
	}
}
SizeConstraintSet :: {
	Type: "AWS::WAFRegional::SizeConstraintSet"
	Properties: {
		Name: string | fn.Fn
		SizeConstraints?: [...propSizeConstraint]
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
	Type: "AWS::WAFRegional::SqlInjectionMatchSet"
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
	Type: "AWS::WAFRegional::WebACL"
	Properties: {
		DefaultAction: propAction
		MetricName:    string | fn.Fn
		Name:          string | fn.Fn
		Rules?: [...propRule]
	}
	propAction :: {
		Type: string | fn.Fn
	}
	propRule :: {
		Action:   propAction
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
		XssMatchTuples?: [...propXssMatchTuple]
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

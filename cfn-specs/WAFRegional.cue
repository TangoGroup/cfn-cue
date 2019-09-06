package WAFRegional

ByteMatchSet :: {
  Type: "AWS::WAFRegional::ByteMatchSet"
  Properties: {
    ByteMatchTuples?: [...__ByteMatchTuple]
    Name: string
  }
  __ByteMatchTuple = {
    FieldToMatch:         __FieldToMatch
    PositionalConstraint: string
    TargetString?:        string
    TargetStringBase64?:  string
    TextTransformation:   string
  }
  __FieldToMatch = {
    Data?: string
    Type:  string
  }
}
GeoMatchSet :: {
  Type: "AWS::WAFRegional::GeoMatchSet"
  Properties: {
    GeoMatchConstraints?: [...__GeoMatchConstraint]
    Name: string
  }
  __GeoMatchConstraint = {
    Type:  string
    Value: string
  }
}
IPSet :: {
  Type: "AWS::WAFRegional::IPSet"
  Properties: {
    IPSetDescriptors?: [...__IPSetDescriptor]
    Name: string
  }
  __IPSetDescriptor = {
    Type:  string
    Value: string
  }
}
RateBasedRule :: {
  Type: "AWS::WAFRegional::RateBasedRule"
  Properties: {
    MatchPredicates?: [...__Predicate]
    MetricName: string
    Name:       string
    RateKey:    string
    RateLimit:  int
  }
  __Predicate = {
    DataId:  string
    Negated: bool
    Type:    string
  }
}
RegexPatternSet :: {
  Type: "AWS::WAFRegional::RegexPatternSet"
  Properties: {
    Name: string
    RegexPatternStrings: [...string]
  }
}
Rule :: {
  Type: "AWS::WAFRegional::Rule"
  Properties: {
    MetricName: string
    Name:       string
    Predicates?: [...__Predicate]
  }
  __Predicate = {
    DataId:  string
    Negated: bool
    Type:    "ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch"
    Type:    string
  }
}
SizeConstraintSet :: {
  Type: "AWS::WAFRegional::SizeConstraintSet"
  Properties: {
    Name: string
    SizeConstraints?: [...__SizeConstraint]
  }
  __FieldToMatch = {
    Data?: string
    Type:  string
  }
  __SizeConstraint = {
    ComparisonOperator: string
    FieldToMatch:       __FieldToMatch
    Size:               int
    TextTransformation: string
  }
}
SqlInjectionMatchSet :: {
  Type: "AWS::WAFRegional::SqlInjectionMatchSet"
  Properties: {
    Name: string
    SqlInjectionMatchTuples?: [...__SqlInjectionMatchTuple]
  }
  __FieldToMatch = {
    Data?: string
    Type:  string
  }
  __SqlInjectionMatchTuple = {
    FieldToMatch:       __FieldToMatch
    TextTransformation: string
  }
}
WebACL :: {
  Type: "AWS::WAFRegional::WebACL"
  Properties: {
    DefaultAction: __Action
    MetricName:    string
    Name:          string
    Rules?: [...__Rule]
  }
  __Action = {
    Type: string
  }
  __Rule = {
    Action:   __Action
    Priority: int
    RuleId:   string
  }
}
WebACLAssociation :: {
  Type: "AWS::WAFRegional::WebACLAssociation"
  Properties: {
    ResourceArn: string
    WebACLId:    string
  }
}
XssMatchSet :: {
  Type: "AWS::WAFRegional::XssMatchSet"
  Properties: {
    Name: string
    XssMatchTuples?: [...__XssMatchTuple]
  }
  __FieldToMatch = {
    Data?: string
    Type:  string
  }
  __XssMatchTuple = {
    FieldToMatch:       __FieldToMatch
    TextTransformation: string
  }
}

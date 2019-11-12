package euwest3

import "github.com/TangoGroup/fn"

WAFRegional :: {
	ByteMatchSet :: {
		Type: "AWS::WAFRegional::ByteMatchSet"
		Properties: {
			ByteMatchTuples?: [...{
			}]
			Name: string | fn.Fn
		}
	}
	GeoMatchSet :: {
		Type: "AWS::WAFRegional::GeoMatchSet"
		Properties: {
			GeoMatchConstraints?: [...{
			}]
			Name: string | fn.Fn
		}
	}
	IPSet :: {
		Type: "AWS::WAFRegional::IPSet"
		Properties: {
			IPSetDescriptors?: [...{
			}]
			Name: string | fn.Fn
		}
	}
	RateBasedRule :: {
		Type: "AWS::WAFRegional::RateBasedRule"
		Properties: {
			MatchPredicates?: [...{
			}]
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			RateKey:    string | fn.Fn
			RateLimit:  int | fn.Fn
		}
	}
	RegexPatternSet :: {
		Type: "AWS::WAFRegional::RegexPatternSet"
		Properties: {
			Name: string | fn.Fn
			RegexPatternStrings: [...(string | fn.Fn)]
		}
	}
	Rule :: {
		Type: "AWS::WAFRegional::Rule"
		Properties: {
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			Predicates?: [...{
			}]
		}
	}
	SizeConstraintSet :: {
		Type: "AWS::WAFRegional::SizeConstraintSet"
		Properties: {
			Name: string | fn.Fn
			SizeConstraints?: [...{
			}]
		}
	}
	SqlInjectionMatchSet :: {
		Type: "AWS::WAFRegional::SqlInjectionMatchSet"
		Properties: {
			Name: string | fn.Fn
			SqlInjectionMatchTuples?: [...{
			}]
		}
	}
	WebACL :: {
		Type: "AWS::WAFRegional::WebACL"
		Properties: {
			DefaultAction: {
			}
			MetricName: string | fn.Fn
			Name:       string | fn.Fn
			Rules?: [...{
			}]
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
			XssMatchTuples?: [...{
			}]
		}
	}
}

package euwest2

import "github.com/TangoGroup/aws/fn"

WAFv2 :: {
	IPSet :: {
		Type: "AWS::WAFv2::IPSet"
		Properties: {
			Addresses?:       [...(string | fn.Fn)] | (string | fn.Fn)
			Description?:     string | fn.Fn
			IPAddressVersion: string | fn.Fn
			Name?:            string | fn.Fn
			Scope:            string | fn.Fn
			Tags?:            [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RegexPatternSet :: {
		Type: "AWS::WAFv2::RegexPatternSet"
		Properties: {
			Description?:           string | fn.Fn
			Name?:                  string | fn.Fn
			RegularExpressionList?: [...close({
				RegexString?: string | fn.Fn
			})] | fn.If
			Scope: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RuleGroup :: {
		Type: "AWS::WAFv2::RuleGroup"
		Properties: {
			Capacity:     int | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Rules?:       [...close({
				Action?: close({
					Allow?: close({
					}) | fn.If
					Block?: close({
					}) | fn.If
					Count?: close({
					}) | fn.If
				}) | fn.If
				Name?:      string | fn.Fn
				Priority?:  int | fn.Fn
				Statement?: close({
					AndStatement?: close({
						Statements?: close({
							StatementTwos?: [...close({
								AndStatement?: close({
									Statements?: close({
										StatementThrees?: [...close({
											ByteMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											GeoMatchStatement?: close({
												CountryCodes?: close({
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
											}) | fn.If
											IPSetReferenceStatement?: close({
												Arn?: string | fn.Fn
											}) | fn.If
											RegexPatternSetReferenceStatement?: close({
												Arn?:          string | fn.Fn
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SizeConstraintStatement?: close({
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SqliMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											XssMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
										})] | fn.If
									}) | fn.If
								}) | fn.If
								ByteMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?:  close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								GeoMatchStatement?: close({
									CountryCodes?: close({
										CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									}) | fn.If
								}) | fn.If
								IPSetReferenceStatement?: close({
									Arn?: string | fn.Fn
								}) | fn.If
								NotStatement?: close({
									Statement?: close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
								OrStatement?: close({
									Statements?: close({
										StatementThrees?: [...close({
											ByteMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											GeoMatchStatement?: close({
												CountryCodes?: close({
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
											}) | fn.If
											IPSetReferenceStatement?: close({
												Arn?: string | fn.Fn
											}) | fn.If
											RegexPatternSetReferenceStatement?: close({
												Arn?:          string | fn.Fn
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SizeConstraintStatement?: close({
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SqliMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											XssMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
										})] | fn.If
									}) | fn.If
								}) | fn.If
								RateBasedStatement?: close({
									AggregateKeyType?:   string | fn.Fn
									Limit?:              int | fn.Fn
									ScopeDownStatement?: close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
								RegexPatternSetReferenceStatement?: close({
									Arn?:          string | fn.Fn
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								SizeConstraintStatement?: close({
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?:       close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									Size?:                int | fn.Fn
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								SqliMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								XssMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
							})] | fn.If
						}) | fn.If
					}) | fn.If
					ByteMatchStatement?: close({
						FieldToMatch?: close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						PositionalConstraint?: string | fn.Fn
						SearchString?:         string | fn.Fn
						SearchStringBase64?:   string | fn.Fn
						TextTransformations?:  close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					GeoMatchStatement?: close({
						CountryCodes?: close({
							CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
					}) | fn.If
					IPSetReferenceStatement?: close({
						Arn?: string | fn.Fn
					}) | fn.If
					NotStatement?: close({
						Statement?: close({
							AndStatement?: close({
								Statements?: close({
									StatementThrees?: [...close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									})] | fn.If
								}) | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?:  close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?: close({
									CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn?: string | fn.Fn
							}) | fn.If
							NotStatement?: close({
								Statement?: close({
									ByteMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?: close({
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn?: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn?:          string | fn.Fn
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements?: close({
									StatementThrees?: [...close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									})] | fn.If
								}) | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType?:   string | fn.Fn
								Limit?:              int | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?: close({
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn?: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn?:          string | fn.Fn
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn?:          string | fn.Fn
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?:       close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								Size?:                int | fn.Fn
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					OrStatement?: close({
						Statements?: close({
							StatementTwos?: [...close({
								AndStatement?: close({
									Statements?: close({
										StatementThrees?: [...close({
											ByteMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											GeoMatchStatement?: close({
												CountryCodes?: close({
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
											}) | fn.If
											IPSetReferenceStatement?: close({
												Arn?: string | fn.Fn
											}) | fn.If
											RegexPatternSetReferenceStatement?: close({
												Arn?:          string | fn.Fn
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SizeConstraintStatement?: close({
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SqliMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											XssMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
										})] | fn.If
									}) | fn.If
								}) | fn.If
								ByteMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?:  close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								GeoMatchStatement?: close({
									CountryCodes?: close({
										CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									}) | fn.If
								}) | fn.If
								IPSetReferenceStatement?: close({
									Arn?: string | fn.Fn
								}) | fn.If
								NotStatement?: close({
									Statement?: close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
								OrStatement?: close({
									Statements?: close({
										StatementThrees?: [...close({
											ByteMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											GeoMatchStatement?: close({
												CountryCodes?: close({
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
											}) | fn.If
											IPSetReferenceStatement?: close({
												Arn?: string | fn.Fn
											}) | fn.If
											RegexPatternSetReferenceStatement?: close({
												Arn?:          string | fn.Fn
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SizeConstraintStatement?: close({
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SqliMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											XssMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
										})] | fn.If
									}) | fn.If
								}) | fn.If
								RateBasedStatement?: close({
									AggregateKeyType?:   string | fn.Fn
									Limit?:              int | fn.Fn
									ScopeDownStatement?: close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
								RegexPatternSetReferenceStatement?: close({
									Arn?:          string | fn.Fn
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								SizeConstraintStatement?: close({
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?:       close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									Size?:                int | fn.Fn
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								SqliMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								XssMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
							})] | fn.If
						}) | fn.If
					}) | fn.If
					RateBasedStatement?: close({
						AggregateKeyType?:   string | fn.Fn
						Limit?:              int | fn.Fn
						ScopeDownStatement?: close({
							AndStatement?: close({
								Statements?: close({
									StatementThrees?: [...close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									})] | fn.If
								}) | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?:  close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?: close({
									CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn?: string | fn.Fn
							}) | fn.If
							NotStatement?: close({
								Statement?: close({
									ByteMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?: close({
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn?: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn?:          string | fn.Fn
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements?: close({
									StatementThrees?: [...close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									})] | fn.If
								}) | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType?:   string | fn.Fn
								Limit?:              int | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?: close({
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn?: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn?:          string | fn.Fn
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn?:          string | fn.Fn
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?:       close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								Size?:                int | fn.Fn
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					RegexPatternSetReferenceStatement?: close({
						Arn?:          string | fn.Fn
						FieldToMatch?: close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						TextTransformations?: close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					SizeConstraintStatement?: close({
						ComparisonOperator?: string | fn.Fn
						FieldToMatch?:       close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						Size?:                int | fn.Fn
						TextTransformations?: close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					SqliMatchStatement?: close({
						FieldToMatch?: close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						TextTransformations?: close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					XssMatchStatement?: close({
						FieldToMatch?: close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						TextTransformations?: close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
				}) | fn.If
				VisibilityConfig?: close({
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				}) | fn.If
			})] | fn.If
			Scope: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VisibilityConfig: close({
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WebACL :: {
		Type: "AWS::WAFv2::WebACL"
		Properties: {
			DefaultAction: close({
				Allow?: close({
				}) | fn.If
				Block?: close({
				}) | fn.If
			}) | fn.If
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Rules?:       [...close({
				Action?: close({
					Allow?: close({
					}) | fn.If
					Block?: close({
					}) | fn.If
					Count?: close({
					}) | fn.If
				}) | fn.If
				Name?:           string | fn.Fn
				OverrideAction?: close({
					Count?: close({
					}) | fn.If
					None?: close({
					}) | fn.If
				}) | fn.If
				Priority?:  int | fn.Fn
				Statement?: close({
					AndStatement?: close({
						Statements?: close({
							StatementTwos?: [...close({
								AndStatement?: close({
									Statements?: close({
										StatementThrees?: [...close({
											ByteMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											GeoMatchStatement?: close({
												CountryCodes?: close({
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
											}) | fn.If
											IPSetReferenceStatement?: close({
												Arn?: string | fn.Fn
											}) | fn.If
											ManagedRuleGroupStatement?: close({
												ExcludedRules?: [...close({
													Name?: string | fn.Fn
												})] | fn.If
												Name?:       string | fn.Fn
												VendorName?: string | fn.Fn
											}) | fn.If
											RegexPatternSetReferenceStatement?: close({
												Arn?:          string | fn.Fn
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											RuleGroupReferenceStatement?: close({
												Arn?:           string | fn.Fn
												ExcludedRules?: [...close({
													Name?: string | fn.Fn
												})] | fn.If
											}) | fn.If
											SizeConstraintStatement?: close({
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SqliMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											XssMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
										})] | fn.If
									}) | fn.If
								}) | fn.If
								ByteMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?:  close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								GeoMatchStatement?: close({
									CountryCodes?: close({
										CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									}) | fn.If
								}) | fn.If
								IPSetReferenceStatement?: close({
									Arn?: string | fn.Fn
								}) | fn.If
								ManagedRuleGroupStatement?: close({
									ExcludedRules?: [...close({
										Name?: string | fn.Fn
									})] | fn.If
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								}) | fn.If
								NotStatement?: close({
									Statement?: close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										ManagedRuleGroupStatement?: close({
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										RuleGroupReferenceStatement?: close({
											Arn?:           string | fn.Fn
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
								OrStatement?: close({
									Statements?: close({
										StatementThrees?: [...close({
											ByteMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											GeoMatchStatement?: close({
												CountryCodes?: close({
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
											}) | fn.If
											IPSetReferenceStatement?: close({
												Arn?: string | fn.Fn
											}) | fn.If
											ManagedRuleGroupStatement?: close({
												ExcludedRules?: [...close({
													Name?: string | fn.Fn
												})] | fn.If
												Name?:       string | fn.Fn
												VendorName?: string | fn.Fn
											}) | fn.If
											RegexPatternSetReferenceStatement?: close({
												Arn?:          string | fn.Fn
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											RuleGroupReferenceStatement?: close({
												Arn?:           string | fn.Fn
												ExcludedRules?: [...close({
													Name?: string | fn.Fn
												})] | fn.If
											}) | fn.If
											SizeConstraintStatement?: close({
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SqliMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											XssMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
										})] | fn.If
									}) | fn.If
								}) | fn.If
								RateBasedStatement?: close({
									AggregateKeyType?:   string | fn.Fn
									Limit?:              int | fn.Fn
									ScopeDownStatement?: close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										ManagedRuleGroupStatement?: close({
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										RuleGroupReferenceStatement?: close({
											Arn?:           string | fn.Fn
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
								RegexPatternSetReferenceStatement?: close({
									Arn?:          string | fn.Fn
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								RuleGroupReferenceStatement?: close({
									Arn?:           string | fn.Fn
									ExcludedRules?: [...close({
										Name?: string | fn.Fn
									})] | fn.If
								}) | fn.If
								SizeConstraintStatement?: close({
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?:       close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									Size?:                int | fn.Fn
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								SqliMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								XssMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
							})] | fn.If
						}) | fn.If
					}) | fn.If
					ByteMatchStatement?: close({
						FieldToMatch?: close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						PositionalConstraint?: string | fn.Fn
						SearchString?:         string | fn.Fn
						SearchStringBase64?:   string | fn.Fn
						TextTransformations?:  close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					GeoMatchStatement?: close({
						CountryCodes?: close({
							CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
					}) | fn.If
					IPSetReferenceStatement?: close({
						Arn?: string | fn.Fn
					}) | fn.If
					ManagedRuleGroupStatement?: close({
						ExcludedRules?: [...close({
							Name?: string | fn.Fn
						})] | fn.If
						Name?:       string | fn.Fn
						VendorName?: string | fn.Fn
					}) | fn.If
					NotStatement?: close({
						Statement?: close({
							AndStatement?: close({
								Statements?: close({
									StatementThrees?: [...close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										ManagedRuleGroupStatement?: close({
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										RuleGroupReferenceStatement?: close({
											Arn?:           string | fn.Fn
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									})] | fn.If
								}) | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?:  close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?: close({
									CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn?: string | fn.Fn
							}) | fn.If
							ManagedRuleGroupStatement?: close({
								ExcludedRules?: [...close({
									Name?: string | fn.Fn
								})] | fn.If
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}) | fn.If
							NotStatement?: close({
								Statement?: close({
									ByteMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?: close({
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn?: string | fn.Fn
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name?: string | fn.Fn
										})] | fn.If
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn?:          string | fn.Fn
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn?:           string | fn.Fn
										ExcludedRules?: [...close({
											Name?: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements?: close({
									StatementThrees?: [...close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										ManagedRuleGroupStatement?: close({
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										RuleGroupReferenceStatement?: close({
											Arn?:           string | fn.Fn
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									})] | fn.If
								}) | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType?:   string | fn.Fn
								Limit?:              int | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?: close({
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn?: string | fn.Fn
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name?: string | fn.Fn
										})] | fn.If
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn?:          string | fn.Fn
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn?:           string | fn.Fn
										ExcludedRules?: [...close({
											Name?: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn?:          string | fn.Fn
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn?:           string | fn.Fn
								ExcludedRules?: [...close({
									Name?: string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?:       close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								Size?:                int | fn.Fn
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					OrStatement?: close({
						Statements?: close({
							StatementTwos?: [...close({
								AndStatement?: close({
									Statements?: close({
										StatementThrees?: [...close({
											ByteMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											GeoMatchStatement?: close({
												CountryCodes?: close({
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
											}) | fn.If
											IPSetReferenceStatement?: close({
												Arn?: string | fn.Fn
											}) | fn.If
											ManagedRuleGroupStatement?: close({
												ExcludedRules?: [...close({
													Name?: string | fn.Fn
												})] | fn.If
												Name?:       string | fn.Fn
												VendorName?: string | fn.Fn
											}) | fn.If
											RegexPatternSetReferenceStatement?: close({
												Arn?:          string | fn.Fn
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											RuleGroupReferenceStatement?: close({
												Arn?:           string | fn.Fn
												ExcludedRules?: [...close({
													Name?: string | fn.Fn
												})] | fn.If
											}) | fn.If
											SizeConstraintStatement?: close({
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SqliMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											XssMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
										})] | fn.If
									}) | fn.If
								}) | fn.If
								ByteMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?:  close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								GeoMatchStatement?: close({
									CountryCodes?: close({
										CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									}) | fn.If
								}) | fn.If
								IPSetReferenceStatement?: close({
									Arn?: string | fn.Fn
								}) | fn.If
								ManagedRuleGroupStatement?: close({
									ExcludedRules?: [...close({
										Name?: string | fn.Fn
									})] | fn.If
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								}) | fn.If
								NotStatement?: close({
									Statement?: close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										ManagedRuleGroupStatement?: close({
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										RuleGroupReferenceStatement?: close({
											Arn?:           string | fn.Fn
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
								OrStatement?: close({
									Statements?: close({
										StatementThrees?: [...close({
											ByteMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											GeoMatchStatement?: close({
												CountryCodes?: close({
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
											}) | fn.If
											IPSetReferenceStatement?: close({
												Arn?: string | fn.Fn
											}) | fn.If
											ManagedRuleGroupStatement?: close({
												ExcludedRules?: [...close({
													Name?: string | fn.Fn
												})] | fn.If
												Name?:       string | fn.Fn
												VendorName?: string | fn.Fn
											}) | fn.If
											RegexPatternSetReferenceStatement?: close({
												Arn?:          string | fn.Fn
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											RuleGroupReferenceStatement?: close({
												Arn?:           string | fn.Fn
												ExcludedRules?: [...close({
													Name?: string | fn.Fn
												})] | fn.If
											}) | fn.If
											SizeConstraintStatement?: close({
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											SqliMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
											XssMatchStatement?: close({
												FieldToMatch?: close({
													AllQueryArguments?: close({
													}) | fn.If
													Body?: close({
													}) | fn.If
													Method?: close({
													}) | fn.If
													QueryString?: close({
													}) | fn.If
													SingleHeader?: close({
														Name?: string | fn.Fn
													}) | fn.If
													SingleQueryArgument?: close({
														Name?: string | fn.Fn
													}) | fn.If
													UriPath?: close({
													}) | fn.If
												}) | fn.If
												TextTransformations?: close({
													TextTransformations?: [...close({
														[string]: _
													})] | fn.If
												}) | fn.If
											}) | fn.If
										})] | fn.If
									}) | fn.If
								}) | fn.If
								RateBasedStatement?: close({
									AggregateKeyType?:   string | fn.Fn
									Limit?:              int | fn.Fn
									ScopeDownStatement?: close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										ManagedRuleGroupStatement?: close({
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										RuleGroupReferenceStatement?: close({
											Arn?:           string | fn.Fn
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
								RegexPatternSetReferenceStatement?: close({
									Arn?:          string | fn.Fn
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								RuleGroupReferenceStatement?: close({
									Arn?:           string | fn.Fn
									ExcludedRules?: [...close({
										Name?: string | fn.Fn
									})] | fn.If
								}) | fn.If
								SizeConstraintStatement?: close({
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?:       close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									Size?:                int | fn.Fn
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								SqliMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
								XssMatchStatement?: close({
									FieldToMatch?: close({
										AllQueryArguments?: close({
										}) | fn.If
										Body?: close({
										}) | fn.If
										Method?: close({
										}) | fn.If
										QueryString?: close({
										}) | fn.If
										SingleHeader?: close({
											Name?: string | fn.Fn
										}) | fn.If
										SingleQueryArgument?: close({
											Name?: string | fn.Fn
										}) | fn.If
										UriPath?: close({
										}) | fn.If
									}) | fn.If
									TextTransformations?: close({
										TextTransformations?: [...close({
											[string]: _
										})] | fn.If
									}) | fn.If
								}) | fn.If
							})] | fn.If
						}) | fn.If
					}) | fn.If
					RateBasedStatement?: close({
						AggregateKeyType?:   string | fn.Fn
						Limit?:              int | fn.Fn
						ScopeDownStatement?: close({
							AndStatement?: close({
								Statements?: close({
									StatementThrees?: [...close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										ManagedRuleGroupStatement?: close({
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										RuleGroupReferenceStatement?: close({
											Arn?:           string | fn.Fn
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									})] | fn.If
								}) | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?:  close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?: close({
									CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn?: string | fn.Fn
							}) | fn.If
							ManagedRuleGroupStatement?: close({
								ExcludedRules?: [...close({
									Name?: string | fn.Fn
								})] | fn.If
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}) | fn.If
							NotStatement?: close({
								Statement?: close({
									ByteMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?: close({
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn?: string | fn.Fn
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name?: string | fn.Fn
										})] | fn.If
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn?:          string | fn.Fn
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn?:           string | fn.Fn
										ExcludedRules?: [...close({
											Name?: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements?: close({
									StatementThrees?: [...close({
										ByteMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										GeoMatchStatement?: close({
											CountryCodes?: close({
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											}) | fn.If
										}) | fn.If
										IPSetReferenceStatement?: close({
											Arn?: string | fn.Fn
										}) | fn.If
										ManagedRuleGroupStatement?: close({
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										}) | fn.If
										RegexPatternSetReferenceStatement?: close({
											Arn?:          string | fn.Fn
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										RuleGroupReferenceStatement?: close({
											Arn?:           string | fn.Fn
											ExcludedRules?: [...close({
												Name?: string | fn.Fn
											})] | fn.If
										}) | fn.If
										SizeConstraintStatement?: close({
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										SqliMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
										XssMatchStatement?: close({
											FieldToMatch?: close({
												AllQueryArguments?: close({
												}) | fn.If
												Body?: close({
												}) | fn.If
												Method?: close({
												}) | fn.If
												QueryString?: close({
												}) | fn.If
												SingleHeader?: close({
													Name?: string | fn.Fn
												}) | fn.If
												SingleQueryArgument?: close({
													Name?: string | fn.Fn
												}) | fn.If
												UriPath?: close({
												}) | fn.If
											}) | fn.If
											TextTransformations?: close({
												TextTransformations?: [...close({
													[string]: _
												})] | fn.If
											}) | fn.If
										}) | fn.If
									})] | fn.If
								}) | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType?:   string | fn.Fn
								Limit?:              int | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?: close({
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn?: string | fn.Fn
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name?: string | fn.Fn
										})] | fn.If
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn?:          string | fn.Fn
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn?:           string | fn.Fn
										ExcludedRules?: [...close({
											Name?: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch?: close({
											AllQueryArguments?: close({
											}) | fn.If
											Body?: close({
											}) | fn.If
											Method?: close({
											}) | fn.If
											QueryString?: close({
											}) | fn.If
											SingleHeader?: close({
												Name?: string | fn.Fn
											}) | fn.If
											SingleQueryArgument?: close({
												Name?: string | fn.Fn
											}) | fn.If
											UriPath?: close({
											}) | fn.If
										}) | fn.If
										TextTransformations?: close({
											TextTransformations?: [...close({
												[string]: _
											})] | fn.If
										}) | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn?:          string | fn.Fn
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn?:           string | fn.Fn
								ExcludedRules?: [...close({
									Name?: string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?:       close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								Size?:                int | fn.Fn
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch?: close({
									AllQueryArguments?: close({
									}) | fn.If
									Body?: close({
									}) | fn.If
									Method?: close({
									}) | fn.If
									QueryString?: close({
									}) | fn.If
									SingleHeader?: close({
										Name?: string | fn.Fn
									}) | fn.If
									SingleQueryArgument?: close({
										Name?: string | fn.Fn
									}) | fn.If
									UriPath?: close({
									}) | fn.If
								}) | fn.If
								TextTransformations?: close({
									TextTransformations?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					RegexPatternSetReferenceStatement?: close({
						Arn?:          string | fn.Fn
						FieldToMatch?: close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						TextTransformations?: close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					RuleGroupReferenceStatement?: close({
						Arn?:           string | fn.Fn
						ExcludedRules?: [...close({
							Name?: string | fn.Fn
						})] | fn.If
					}) | fn.If
					SizeConstraintStatement?: close({
						ComparisonOperator?: string | fn.Fn
						FieldToMatch?:       close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						Size?:                int | fn.Fn
						TextTransformations?: close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					SqliMatchStatement?: close({
						FieldToMatch?: close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						TextTransformations?: close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					XssMatchStatement?: close({
						FieldToMatch?: close({
							AllQueryArguments?: close({
							}) | fn.If
							Body?: close({
							}) | fn.If
							Method?: close({
							}) | fn.If
							QueryString?: close({
							}) | fn.If
							SingleHeader?: close({
								Name?: string | fn.Fn
							}) | fn.If
							SingleQueryArgument?: close({
								Name?: string | fn.Fn
							}) | fn.If
							UriPath?: close({
							}) | fn.If
						}) | fn.If
						TextTransformations?: close({
							TextTransformations?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
				}) | fn.If
				VisibilityConfig?: close({
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				}) | fn.If
			})] | fn.If
			Scope: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VisibilityConfig: close({
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WebACLAssociation :: {
		Type: "AWS::WAFv2::WebACLAssociation"
		Properties: {
			ResourceArn: string | fn.Fn
			WebACLArn:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

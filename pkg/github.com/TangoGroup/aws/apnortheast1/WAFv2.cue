package apnortheast1

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
			Tags?:            [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
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
			RegularExpressionList?: [...{
				RegexString?: string | fn.Fn
			}] | fn.If
			Scope: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
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
			Rules?:       [...{
				Action?: {
					Allow?: {
					} | fn.If
					Block?: {
					} | fn.If
					Count?: {
					} | fn.If
				} | fn.If
				Name?:      string | fn.Fn
				Priority?:  int | fn.Fn
				Statement?: {
					AndStatement?: {
						Statements?: {
							StatementTwos?: [...{
								AndStatement?: {
									Statements?: {
										StatementThrees?: [...{
											ByteMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											GeoMatchStatement?: {
												CountryCodes?: {
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												} | fn.If
											} | fn.If
											IPSetReferenceStatement?: {
												Arn?: string | fn.Fn
											} | fn.If
											RegexPatternSetReferenceStatement?: {
												Arn?:          string | fn.Fn
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SizeConstraintStatement?: {
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SqliMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											XssMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
										}] | fn.If
									} | fn.If
								} | fn.If
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?:  {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								GeoMatchStatement?: {
									CountryCodes?: {
										CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									} | fn.If
								} | fn.If
								IPSetReferenceStatement?: {
									Arn?: string | fn.Fn
								} | fn.If
								NotStatement?: {
									Statement?: {
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
								OrStatement?: {
									Statements?: {
										StatementThrees?: [...{
											ByteMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											GeoMatchStatement?: {
												CountryCodes?: {
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												} | fn.If
											} | fn.If
											IPSetReferenceStatement?: {
												Arn?: string | fn.Fn
											} | fn.If
											RegexPatternSetReferenceStatement?: {
												Arn?:          string | fn.Fn
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SizeConstraintStatement?: {
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SqliMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											XssMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
										}] | fn.If
									} | fn.If
								} | fn.If
								RateBasedStatement?: {
									AggregateKeyType?:   string | fn.Fn
									Limit?:              int | fn.Fn
									ScopeDownStatement?: {
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
								RegexPatternSetReferenceStatement?: {
									Arn?:          string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?:       {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									Size?:                int | fn.Fn
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
							}] | fn.If
						} | fn.If
					} | fn.If
					ByteMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						PositionalConstraint?: string | fn.Fn
						SearchString?:         string | fn.Fn
						SearchStringBase64?:   string | fn.Fn
						TextTransformations?:  {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
					GeoMatchStatement?: {
						CountryCodes?: {
							CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						} | fn.If
					} | fn.If
					IPSetReferenceStatement?: {
						Arn?: string | fn.Fn
					} | fn.If
					NotStatement?: {
						Statement?: {
							AndStatement?: {
								Statements?: {
									StatementThrees?: [...{
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									}] | fn.If
								} | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?:  {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?: {
									CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn?: string | fn.Fn
							} | fn.If
							NotStatement?: {
								Statement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?: {
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn?: string | fn.Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn?:          string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements?: {
									StatementThrees?: [...{
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									}] | fn.If
								} | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType?:   string | fn.Fn
								Limit?:              int | fn.Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?: {
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn?: string | fn.Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn?:          string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn?:          string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?:       {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								Size?:                int | fn.Fn
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
					OrStatement?: {
						Statements?: {
							StatementTwos?: [...{
								AndStatement?: {
									Statements?: {
										StatementThrees?: [...{
											ByteMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											GeoMatchStatement?: {
												CountryCodes?: {
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												} | fn.If
											} | fn.If
											IPSetReferenceStatement?: {
												Arn?: string | fn.Fn
											} | fn.If
											RegexPatternSetReferenceStatement?: {
												Arn?:          string | fn.Fn
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SizeConstraintStatement?: {
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SqliMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											XssMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
										}] | fn.If
									} | fn.If
								} | fn.If
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?:  {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								GeoMatchStatement?: {
									CountryCodes?: {
										CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									} | fn.If
								} | fn.If
								IPSetReferenceStatement?: {
									Arn?: string | fn.Fn
								} | fn.If
								NotStatement?: {
									Statement?: {
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
								OrStatement?: {
									Statements?: {
										StatementThrees?: [...{
											ByteMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											GeoMatchStatement?: {
												CountryCodes?: {
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												} | fn.If
											} | fn.If
											IPSetReferenceStatement?: {
												Arn?: string | fn.Fn
											} | fn.If
											RegexPatternSetReferenceStatement?: {
												Arn?:          string | fn.Fn
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SizeConstraintStatement?: {
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SqliMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											XssMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
										}] | fn.If
									} | fn.If
								} | fn.If
								RateBasedStatement?: {
									AggregateKeyType?:   string | fn.Fn
									Limit?:              int | fn.Fn
									ScopeDownStatement?: {
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
								RegexPatternSetReferenceStatement?: {
									Arn?:          string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?:       {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									Size?:                int | fn.Fn
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
							}] | fn.If
						} | fn.If
					} | fn.If
					RateBasedStatement?: {
						AggregateKeyType?:   string | fn.Fn
						Limit?:              int | fn.Fn
						ScopeDownStatement?: {
							AndStatement?: {
								Statements?: {
									StatementThrees?: [...{
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									}] | fn.If
								} | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?:  {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?: {
									CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn?: string | fn.Fn
							} | fn.If
							NotStatement?: {
								Statement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?: {
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn?: string | fn.Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn?:          string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements?: {
									StatementThrees?: [...{
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									}] | fn.If
								} | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType?:   string | fn.Fn
								Limit?:              int | fn.Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?: {
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn?: string | fn.Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn?:          string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn?:          string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?:       {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								Size?:                int | fn.Fn
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
					RegexPatternSetReferenceStatement?: {
						Arn?:          string | fn.Fn
						FieldToMatch?: {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						TextTransformations?: {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
					SizeConstraintStatement?: {
						ComparisonOperator?: string | fn.Fn
						FieldToMatch?:       {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						Size?:                int | fn.Fn
						TextTransformations?: {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
					SqliMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						TextTransformations?: {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
					XssMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						TextTransformations?: {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
				} | fn.If
				VisibilityConfig?: {
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				} | fn.If
			}] | fn.If
			Scope: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VisibilityConfig: {
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			} | fn.If
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
			DefaultAction: {
				Allow?: {
				} | fn.If
				Block?: {
				} | fn.If
			} | fn.If
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Rules?:       [...{
				Action?: {
					Allow?: {
					} | fn.If
					Block?: {
					} | fn.If
					Count?: {
					} | fn.If
				} | fn.If
				Name?:           string | fn.Fn
				OverrideAction?: {
					Count?: {
					} | fn.If
					None?: {
					} | fn.If
				} | fn.If
				Priority?:  int | fn.Fn
				Statement?: {
					AndStatement?: {
						Statements?: {
							StatementTwos?: [...{
								AndStatement?: {
									Statements?: {
										StatementThrees?: [...{
											ByteMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											GeoMatchStatement?: {
												CountryCodes?: {
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												} | fn.If
											} | fn.If
											IPSetReferenceStatement?: {
												Arn?: string | fn.Fn
											} | fn.If
											ManagedRuleGroupStatement?: {
												ExcludedRules?: [...{
													Name?: string | fn.Fn
												}] | fn.If
												Name?:       string | fn.Fn
												VendorName?: string | fn.Fn
											} | fn.If
											RegexPatternSetReferenceStatement?: {
												Arn?:          string | fn.Fn
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											RuleGroupReferenceStatement?: {
												Arn?:           string | fn.Fn
												ExcludedRules?: [...{
													Name?: string | fn.Fn
												}] | fn.If
											} | fn.If
											SizeConstraintStatement?: {
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SqliMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											XssMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
										}] | fn.If
									} | fn.If
								} | fn.If
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?:  {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								GeoMatchStatement?: {
									CountryCodes?: {
										CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									} | fn.If
								} | fn.If
								IPSetReferenceStatement?: {
									Arn?: string | fn.Fn
								} | fn.If
								ManagedRuleGroupStatement?: {
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}] | fn.If
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								} | fn.If
								NotStatement?: {
									Statement?: {
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										ManagedRuleGroupStatement?: {
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										RuleGroupReferenceStatement?: {
											Arn?:           string | fn.Fn
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
								OrStatement?: {
									Statements?: {
										StatementThrees?: [...{
											ByteMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											GeoMatchStatement?: {
												CountryCodes?: {
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												} | fn.If
											} | fn.If
											IPSetReferenceStatement?: {
												Arn?: string | fn.Fn
											} | fn.If
											ManagedRuleGroupStatement?: {
												ExcludedRules?: [...{
													Name?: string | fn.Fn
												}] | fn.If
												Name?:       string | fn.Fn
												VendorName?: string | fn.Fn
											} | fn.If
											RegexPatternSetReferenceStatement?: {
												Arn?:          string | fn.Fn
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											RuleGroupReferenceStatement?: {
												Arn?:           string | fn.Fn
												ExcludedRules?: [...{
													Name?: string | fn.Fn
												}] | fn.If
											} | fn.If
											SizeConstraintStatement?: {
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SqliMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											XssMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
										}] | fn.If
									} | fn.If
								} | fn.If
								RateBasedStatement?: {
									AggregateKeyType?:   string | fn.Fn
									Limit?:              int | fn.Fn
									ScopeDownStatement?: {
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										ManagedRuleGroupStatement?: {
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										RuleGroupReferenceStatement?: {
											Arn?:           string | fn.Fn
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
								RegexPatternSetReferenceStatement?: {
									Arn?:          string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								RuleGroupReferenceStatement?: {
									Arn?:           string | fn.Fn
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}] | fn.If
								} | fn.If
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?:       {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									Size?:                int | fn.Fn
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
							}] | fn.If
						} | fn.If
					} | fn.If
					ByteMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						PositionalConstraint?: string | fn.Fn
						SearchString?:         string | fn.Fn
						SearchStringBase64?:   string | fn.Fn
						TextTransformations?:  {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
					GeoMatchStatement?: {
						CountryCodes?: {
							CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						} | fn.If
					} | fn.If
					IPSetReferenceStatement?: {
						Arn?: string | fn.Fn
					} | fn.If
					ManagedRuleGroupStatement?: {
						ExcludedRules?: [...{
							Name?: string | fn.Fn
						}] | fn.If
						Name?:       string | fn.Fn
						VendorName?: string | fn.Fn
					} | fn.If
					NotStatement?: {
						Statement?: {
							AndStatement?: {
								Statements?: {
									StatementThrees?: [...{
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										ManagedRuleGroupStatement?: {
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										RuleGroupReferenceStatement?: {
											Arn?:           string | fn.Fn
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									}] | fn.If
								} | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?:  {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?: {
									CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn?: string | fn.Fn
							} | fn.If
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}] | fn.If
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							} | fn.If
							NotStatement?: {
								Statement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?: {
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn?: string | fn.Fn
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}] | fn.If
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn?:          string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn?:           string | fn.Fn
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements?: {
									StatementThrees?: [...{
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										ManagedRuleGroupStatement?: {
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										RuleGroupReferenceStatement?: {
											Arn?:           string | fn.Fn
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									}] | fn.If
								} | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType?:   string | fn.Fn
								Limit?:              int | fn.Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?: {
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn?: string | fn.Fn
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}] | fn.If
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn?:          string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn?:           string | fn.Fn
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn?:          string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							RuleGroupReferenceStatement?: {
								Arn?:           string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?:       {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								Size?:                int | fn.Fn
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
					OrStatement?: {
						Statements?: {
							StatementTwos?: [...{
								AndStatement?: {
									Statements?: {
										StatementThrees?: [...{
											ByteMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											GeoMatchStatement?: {
												CountryCodes?: {
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												} | fn.If
											} | fn.If
											IPSetReferenceStatement?: {
												Arn?: string | fn.Fn
											} | fn.If
											ManagedRuleGroupStatement?: {
												ExcludedRules?: [...{
													Name?: string | fn.Fn
												}] | fn.If
												Name?:       string | fn.Fn
												VendorName?: string | fn.Fn
											} | fn.If
											RegexPatternSetReferenceStatement?: {
												Arn?:          string | fn.Fn
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											RuleGroupReferenceStatement?: {
												Arn?:           string | fn.Fn
												ExcludedRules?: [...{
													Name?: string | fn.Fn
												}] | fn.If
											} | fn.If
											SizeConstraintStatement?: {
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SqliMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											XssMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
										}] | fn.If
									} | fn.If
								} | fn.If
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?:  {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								GeoMatchStatement?: {
									CountryCodes?: {
										CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									} | fn.If
								} | fn.If
								IPSetReferenceStatement?: {
									Arn?: string | fn.Fn
								} | fn.If
								ManagedRuleGroupStatement?: {
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}] | fn.If
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								} | fn.If
								NotStatement?: {
									Statement?: {
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										ManagedRuleGroupStatement?: {
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										RuleGroupReferenceStatement?: {
											Arn?:           string | fn.Fn
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
								OrStatement?: {
									Statements?: {
										StatementThrees?: [...{
											ByteMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												PositionalConstraint?: string | fn.Fn
												SearchString?:         string | fn.Fn
												SearchStringBase64?:   string | fn.Fn
												TextTransformations?:  {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											GeoMatchStatement?: {
												CountryCodes?: {
													CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
												} | fn.If
											} | fn.If
											IPSetReferenceStatement?: {
												Arn?: string | fn.Fn
											} | fn.If
											ManagedRuleGroupStatement?: {
												ExcludedRules?: [...{
													Name?: string | fn.Fn
												}] | fn.If
												Name?:       string | fn.Fn
												VendorName?: string | fn.Fn
											} | fn.If
											RegexPatternSetReferenceStatement?: {
												Arn?:          string | fn.Fn
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											RuleGroupReferenceStatement?: {
												Arn?:           string | fn.Fn
												ExcludedRules?: [...{
													Name?: string | fn.Fn
												}] | fn.If
											} | fn.If
											SizeConstraintStatement?: {
												ComparisonOperator?: string | fn.Fn
												FieldToMatch?:       {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												Size?:                int | fn.Fn
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											SqliMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
											XssMatchStatement?: {
												FieldToMatch?: {
													AllQueryArguments?: {
													} | fn.If
													Body?: {
													} | fn.If
													Method?: {
													} | fn.If
													QueryString?: {
													} | fn.If
													SingleHeader?: {
														Name?: string | fn.Fn
													} | fn.If
													SingleQueryArgument?: {
														Name?: string | fn.Fn
													} | fn.If
													UriPath?: {
													} | fn.If
												} | fn.If
												TextTransformations?: {
													TextTransformations?: [...{
														[string]: _
													}] | fn.If
												} | fn.If
											} | fn.If
										}] | fn.If
									} | fn.If
								} | fn.If
								RateBasedStatement?: {
									AggregateKeyType?:   string | fn.Fn
									Limit?:              int | fn.Fn
									ScopeDownStatement?: {
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										ManagedRuleGroupStatement?: {
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										RuleGroupReferenceStatement?: {
											Arn?:           string | fn.Fn
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
								RegexPatternSetReferenceStatement?: {
									Arn?:          string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								RuleGroupReferenceStatement?: {
									Arn?:           string | fn.Fn
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}] | fn.If
								} | fn.If
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?:       {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									Size?:                int | fn.Fn
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										} | fn.If
										Body?: {
										} | fn.If
										Method?: {
										} | fn.If
										QueryString?: {
										} | fn.If
										SingleHeader?: {
											Name?: string | fn.Fn
										} | fn.If
										SingleQueryArgument?: {
											Name?: string | fn.Fn
										} | fn.If
										UriPath?: {
										} | fn.If
									} | fn.If
									TextTransformations?: {
										TextTransformations?: [...{
											[string]: _
										}] | fn.If
									} | fn.If
								} | fn.If
							}] | fn.If
						} | fn.If
					} | fn.If
					RateBasedStatement?: {
						AggregateKeyType?:   string | fn.Fn
						Limit?:              int | fn.Fn
						ScopeDownStatement?: {
							AndStatement?: {
								Statements?: {
									StatementThrees?: [...{
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										ManagedRuleGroupStatement?: {
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										RuleGroupReferenceStatement?: {
											Arn?:           string | fn.Fn
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									}] | fn.If
								} | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?:  {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?: {
									CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn?: string | fn.Fn
							} | fn.If
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}] | fn.If
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							} | fn.If
							NotStatement?: {
								Statement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?: {
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn?: string | fn.Fn
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}] | fn.If
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn?:          string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn?:           string | fn.Fn
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements?: {
									StatementThrees?: [...{
										ByteMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											PositionalConstraint?: string | fn.Fn
											SearchString?:         string | fn.Fn
											SearchStringBase64?:   string | fn.Fn
											TextTransformations?:  {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										GeoMatchStatement?: {
											CountryCodes?: {
												CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
											} | fn.If
										} | fn.If
										IPSetReferenceStatement?: {
											Arn?: string | fn.Fn
										} | fn.If
										ManagedRuleGroupStatement?: {
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
											Name?:       string | fn.Fn
											VendorName?: string | fn.Fn
										} | fn.If
										RegexPatternSetReferenceStatement?: {
											Arn?:          string | fn.Fn
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										RuleGroupReferenceStatement?: {
											Arn?:           string | fn.Fn
											ExcludedRules?: [...{
												Name?: string | fn.Fn
											}] | fn.If
										} | fn.If
										SizeConstraintStatement?: {
											ComparisonOperator?: string | fn.Fn
											FieldToMatch?:       {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											Size?:                int | fn.Fn
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										SqliMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
										XssMatchStatement?: {
											FieldToMatch?: {
												AllQueryArguments?: {
												} | fn.If
												Body?: {
												} | fn.If
												Method?: {
												} | fn.If
												QueryString?: {
												} | fn.If
												SingleHeader?: {
													Name?: string | fn.Fn
												} | fn.If
												SingleQueryArgument?: {
													Name?: string | fn.Fn
												} | fn.If
												UriPath?: {
												} | fn.If
											} | fn.If
											TextTransformations?: {
												TextTransformations?: [...{
													[string]: _
												}] | fn.If
											} | fn.If
										} | fn.If
									}] | fn.If
								} | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType?:   string | fn.Fn
								Limit?:              int | fn.Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?:  {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?: {
											CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn?: string | fn.Fn
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}] | fn.If
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn?:          string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn?:           string | fn.Fn
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?:       {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										Size?:                int | fn.Fn
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											} | fn.If
											Body?: {
											} | fn.If
											Method?: {
											} | fn.If
											QueryString?: {
											} | fn.If
											SingleHeader?: {
												Name?: string | fn.Fn
											} | fn.If
											SingleQueryArgument?: {
												Name?: string | fn.Fn
											} | fn.If
											UriPath?: {
											} | fn.If
										} | fn.If
										TextTransformations?: {
											TextTransformations?: [...{
												[string]: _
											}] | fn.If
										} | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn?:          string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							RuleGroupReferenceStatement?: {
								Arn?:           string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?:       {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								Size?:                int | fn.Fn
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									} | fn.If
									Body?: {
									} | fn.If
									Method?: {
									} | fn.If
									QueryString?: {
									} | fn.If
									SingleHeader?: {
										Name?: string | fn.Fn
									} | fn.If
									SingleQueryArgument?: {
										Name?: string | fn.Fn
									} | fn.If
									UriPath?: {
									} | fn.If
								} | fn.If
								TextTransformations?: {
									TextTransformations?: [...{
										[string]: _
									}] | fn.If
								} | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
					RegexPatternSetReferenceStatement?: {
						Arn?:          string | fn.Fn
						FieldToMatch?: {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						TextTransformations?: {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
					RuleGroupReferenceStatement?: {
						Arn?:           string | fn.Fn
						ExcludedRules?: [...{
							Name?: string | fn.Fn
						}] | fn.If
					} | fn.If
					SizeConstraintStatement?: {
						ComparisonOperator?: string | fn.Fn
						FieldToMatch?:       {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						Size?:                int | fn.Fn
						TextTransformations?: {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
					SqliMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						TextTransformations?: {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
					XssMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							} | fn.If
							Body?: {
							} | fn.If
							Method?: {
							} | fn.If
							QueryString?: {
							} | fn.If
							SingleHeader?: {
								Name?: string | fn.Fn
							} | fn.If
							SingleQueryArgument?: {
								Name?: string | fn.Fn
							} | fn.If
							UriPath?: {
							} | fn.If
						} | fn.If
						TextTransformations?: {
							TextTransformations?: [...{
								[string]: _
							}] | fn.If
						} | fn.If
					} | fn.If
				} | fn.If
				VisibilityConfig?: {
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				} | fn.If
			}] | fn.If
			Scope: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VisibilityConfig: {
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			} | fn.If
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

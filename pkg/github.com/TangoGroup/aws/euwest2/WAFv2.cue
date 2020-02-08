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
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
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
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			RegularExpressionList?: [...{
				RegexString?: string | fn.Fn
			}]
			Scope: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
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
			Rules?: [...{
				Action?: {
					Allow?: {
					}
					Block?: {
					}
					Count?: {
					}
				}
				Name?:     string | fn.Fn
				Priority?: int | fn.Fn
				Statement?: {
					AndStatement?: Statements?: StatementTwos?: [...{
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						IPSetReferenceStatement?: Arn?: string | fn.Fn
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							Arn?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}]
					ByteMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						PositionalConstraint?: string | fn.Fn
						SearchString?:         string | fn.Fn
						SearchStringBase64?:   string | fn.Fn
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
					IPSetReferenceStatement?: Arn?: string | fn.Fn
					NotStatement?: Statement?: {
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						IPSetReferenceStatement?: Arn?: string | fn.Fn
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							Arn?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}
					OrStatement?: Statements?: StatementTwos?: [...{
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						IPSetReferenceStatement?: Arn?: string | fn.Fn
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							Arn?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}]
					RateBasedStatement?: {
						AggregateKeyType?: string | fn.Fn
						Limit?:            int | fn.Fn
						ScopeDownStatement?: {
							AndStatement?: Statements?: StatementThrees?: [...{
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}]
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							NotStatement?: Statement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
							OrStatement?: Statements?: StatementThrees?: [...{
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}]
							RateBasedStatement?: {
								AggregateKeyType?: string | fn.Fn
								Limit?:            int | fn.Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									IPSetReferenceStatement?: Arn?: string | fn.Fn
									RegexPatternSetReferenceStatement?: {
										Arn?: string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										Size?: int | fn.Fn
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
								}
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
					}
					RegexPatternSetReferenceStatement?: {
						Arn?: string | fn.Fn
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					SizeConstraintStatement?: {
						ComparisonOperator?: string | fn.Fn
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						Size?: int | fn.Fn
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					SqliMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					XssMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
				}
				VisibilityConfig?: {
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				}
			}]
			Scope: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VisibilityConfig: {
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			}
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
				}
				Block?: {
				}
			}
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Rules?: [...{
				Action?: {
					Allow?: {
					}
					Block?: {
					}
					Count?: {
					}
				}
				Name?: string | fn.Fn
				OverrideAction?: {
					Count?: {
					}
					None?: {
					}
				}
				Priority?: int | fn.Fn
				Statement?: {
					AndStatement?: Statements?: StatementTwos?: [...{
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						IPSetReferenceStatement?: Arn?: string | fn.Fn
						ManagedRuleGroupStatement?: {
							ExcludedRules?: [...{
								Name?: string | fn.Fn
							}]
							Name?:       string | fn.Fn
							VendorName?: string | fn.Fn
						}
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								ManagedRuleGroupStatement?: {
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								}
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								RuleGroupReferenceStatement?: {
									Arn?: string | fn.Fn
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							Arn?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						RuleGroupReferenceStatement?: {
							Arn?: string | fn.Fn
							ExcludedRules?: [...{
								Name?: string | fn.Fn
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}]
					ByteMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						PositionalConstraint?: string | fn.Fn
						SearchString?:         string | fn.Fn
						SearchStringBase64?:   string | fn.Fn
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
					IPSetReferenceStatement?: Arn?: string | fn.Fn
					ManagedRuleGroupStatement?: {
						ExcludedRules?: [...{
							Name?: string | fn.Fn
						}]
						Name?:       string | fn.Fn
						VendorName?: string | fn.Fn
					}
					NotStatement?: Statement?: {
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						IPSetReferenceStatement?: Arn?: string | fn.Fn
						ManagedRuleGroupStatement?: {
							ExcludedRules?: [...{
								Name?: string | fn.Fn
							}]
							Name?:       string | fn.Fn
							VendorName?: string | fn.Fn
						}
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								ManagedRuleGroupStatement?: {
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								}
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								RuleGroupReferenceStatement?: {
									Arn?: string | fn.Fn
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							Arn?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						RuleGroupReferenceStatement?: {
							Arn?: string | fn.Fn
							ExcludedRules?: [...{
								Name?: string | fn.Fn
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}
					OrStatement?: Statements?: StatementTwos?: [...{
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
						IPSetReferenceStatement?: Arn?: string | fn.Fn
						ManagedRuleGroupStatement?: {
							ExcludedRules?: [...{
								Name?: string | fn.Fn
							}]
							Name?:       string | fn.Fn
							VendorName?: string | fn.Fn
						}
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								ManagedRuleGroupStatement?: {
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								}
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								RuleGroupReferenceStatement?: {
									Arn?: string | fn.Fn
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							Arn?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						RuleGroupReferenceStatement?: {
							Arn?: string | fn.Fn
							ExcludedRules?: [...{
								Name?: string | fn.Fn
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}]
					RateBasedStatement?: {
						AggregateKeyType?: string | fn.Fn
						Limit?:            int | fn.Fn
						ScopeDownStatement?: {
							AndStatement?: Statements?: StatementThrees?: [...{
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								ManagedRuleGroupStatement?: {
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								}
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								RuleGroupReferenceStatement?: {
									Arn?: string | fn.Fn
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}]
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
							IPSetReferenceStatement?: Arn?: string | fn.Fn
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
								Name?:       string | fn.Fn
								VendorName?: string | fn.Fn
							}
							NotStatement?: Statement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								ManagedRuleGroupStatement?: {
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								}
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								RuleGroupReferenceStatement?: {
									Arn?: string | fn.Fn
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
							OrStatement?: Statements?: StatementThrees?: [...{
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
								IPSetReferenceStatement?: Arn?: string | fn.Fn
								ManagedRuleGroupStatement?: {
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
									Name?:       string | fn.Fn
									VendorName?: string | fn.Fn
								}
								RegexPatternSetReferenceStatement?: {
									Arn?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								RuleGroupReferenceStatement?: {
									Arn?: string | fn.Fn
									ExcludedRules?: [...{
										Name?: string | fn.Fn
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}]
							RateBasedStatement?: {
								AggregateKeyType?: string | fn.Fn
								Limit?:            int | fn.Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | (string | fn.Fn)
									IPSetReferenceStatement?: Arn?: string | fn.Fn
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}]
										Name?:       string | fn.Fn
										VendorName?: string | fn.Fn
									}
									RegexPatternSetReferenceStatement?: {
										Arn?: string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									RuleGroupReferenceStatement?: {
										Arn?: string | fn.Fn
										ExcludedRules?: [...{
											Name?: string | fn.Fn
										}]
									}
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										Size?: int | fn.Fn
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
								}
							}
							RegexPatternSetReferenceStatement?: {
								Arn?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							RuleGroupReferenceStatement?: {
								Arn?: string | fn.Fn
								ExcludedRules?: [...{
									Name?: string | fn.Fn
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
					}
					RegexPatternSetReferenceStatement?: {
						Arn?: string | fn.Fn
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					RuleGroupReferenceStatement?: {
						Arn?: string | fn.Fn
						ExcludedRules?: [...{
							Name?: string | fn.Fn
						}]
					}
					SizeConstraintStatement?: {
						ComparisonOperator?: string | fn.Fn
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						Size?: int | fn.Fn
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					SqliMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					XssMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
				}
				VisibilityConfig?: {
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				}
			}]
			Scope: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VisibilityConfig: {
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

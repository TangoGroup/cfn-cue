package apeast1

import "github.com/TangoGroup/aws/fn"

WAFv2 :: {
	IPSet :: {
		Type:       "AWS::WAFv2::IPSet"
		Properties: close({
			Addresses:        [...(string | fn.Fn)] | (string | fn.Fn)
			Description?:     string | fn.Fn
			IPAddressVersion: string | fn.Fn
			Name?:            string | fn.Fn
			Scope:            string | fn.Fn
			Tags?:            [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RegexPatternSet :: {
		Type:       "AWS::WAFv2::RegexPatternSet"
		Properties: close({
			Description?:          string | fn.Fn
			Name?:                 string | fn.Fn
			RegularExpressionList: [...(string | fn.Fn)] | (string | fn.Fn)
			Scope:                 string | fn.Fn
			Tags?:                 [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RuleGroup :: {
		Type:       "AWS::WAFv2::RuleGroup"
		Properties: close({
			Capacity:     int | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Rules?:       [...close({
				Action?: close({
					Allow?: {
						[string]: _
					} | fn.Fn
					Block?: {
						[string]: _
					} | fn.Fn
					Count?: {
						[string]: _
					} | fn.Fn
				}) | fn.If
				Name:      string | fn.Fn
				Priority:  int | fn.Fn
				Statement: close({
					AndStatement?: close({
						Statements: [...close({
							AndStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								PositionalConstraint: string | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     string | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         string | fn.Fn
								}) | fn.If
							}) | fn.If
							NotStatement?: close({
								Statement: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=20000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          string | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: string | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								Size:                int | fn.Fn
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
					ByteMatchStatement?: close({
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						PositionalConstraint: string | fn.Fn
						SearchString?:        string | fn.Fn
						SearchStringBase64?:  string | fn.Fn
						TextTransformations:  [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
					GeoMatchStatement?: close({
						CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
						ForwardedIPConfig?: close({
							FallbackBehavior: string | fn.Fn
							HeaderName:       string | fn.Fn
						}) | fn.If
					}) | fn.If
					IPSetReferenceStatement?: close({
						Arn:                     string | fn.Fn
						IPSetForwardedIPConfig?: close({
							FallbackBehavior: string | fn.Fn
							HeaderName:       string | fn.Fn
							Position:         string | fn.Fn
						}) | fn.If
					}) | fn.If
					NotStatement?: close({
						Statement: close({
							AndStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								PositionalConstraint: string | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     string | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         string | fn.Fn
								}) | fn.If
							}) | fn.If
							NotStatement?: close({
								Statement: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=20000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          string | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: string | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								Size:                int | fn.Fn
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					OrStatement?: close({
						Statements: [...close({
							AndStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								PositionalConstraint: string | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     string | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         string | fn.Fn
								}) | fn.If
							}) | fn.If
							NotStatement?: close({
								Statement: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=20000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          string | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: string | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								Size:                int | fn.Fn
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
					RateBasedStatement?: close({
						AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
						ForwardedIPConfig?: close({
							FallbackBehavior: string | fn.Fn
							HeaderName:       string | fn.Fn
						}) | fn.If
						Limit:               (>=100 & <=20000000) | fn.Fn
						ScopeDownStatement?: close({
							AndStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								PositionalConstraint: string | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     string | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         string | fn.Fn
								}) | fn.If
							}) | fn.If
							NotStatement?: close({
								Statement: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=20000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          string | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: string | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								Size:                int | fn.Fn
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					RegexPatternSetReferenceStatement?: close({
						Arn:          string | fn.Fn
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						TextTransformations: [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
					SizeConstraintStatement?: close({
						ComparisonOperator: string | fn.Fn
						FieldToMatch:       close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						Size:                int | fn.Fn
						TextTransformations: [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
					SqliMatchStatement?: close({
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						TextTransformations: [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
					XssMatchStatement?: close({
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						TextTransformations: [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
				VisibilityConfig: close({
					CloudWatchMetricsEnabled: bool | fn.Fn
					MetricName:               string | fn.Fn
					SampledRequestsEnabled:   bool | fn.Fn
				}) | fn.If
			})] | fn.If
			Scope: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VisibilityConfig: close({
				CloudWatchMetricsEnabled: bool | fn.Fn
				MetricName:               string | fn.Fn
				SampledRequestsEnabled:   bool | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WebACL :: {
		Type:       "AWS::WAFv2::WebACL"
		Properties: close({
			DefaultAction: close({
				Allow?: {
					[string]: _
				} | fn.Fn
				Block?: {
					[string]: _
				} | fn.Fn
			}) | fn.If
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Rules?:       [...close({
				Action?: close({
					Allow?: {
						[string]: _
					} | fn.Fn
					Block?: {
						[string]: _
					} | fn.Fn
					Count?: {
						[string]: _
					} | fn.Fn
				}) | fn.If
				Name:            string | fn.Fn
				OverrideAction?: close({
					Count?: {
						[string]: _
					} | fn.Fn
					None?: {
						[string]: _
					} | fn.Fn
				}) | fn.If
				Priority:  int | fn.Fn
				Statement: close({
					AndStatement?: close({
						Statements: [...close({
							AndStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								PositionalConstraint: string | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     string | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         string | fn.Fn
								}) | fn.If
							}) | fn.If
							ManagedRuleGroupStatement?: close({
								ExcludedRules?: [...close({
									Name: string | fn.Fn
								})] | fn.If
								Name:       string | fn.Fn
								VendorName: string | fn.Fn
							}) | fn.If
							NotStatement?: close({
								Statement: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=20000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          string | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            string | fn.Fn
								ExcludedRules?: [...close({
									Name: string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: string | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								Size:                int | fn.Fn
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
					ByteMatchStatement?: close({
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						PositionalConstraint: string | fn.Fn
						SearchString?:        string | fn.Fn
						SearchStringBase64?:  string | fn.Fn
						TextTransformations:  [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
					GeoMatchStatement?: close({
						CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
						ForwardedIPConfig?: close({
							FallbackBehavior: string | fn.Fn
							HeaderName:       string | fn.Fn
						}) | fn.If
					}) | fn.If
					IPSetReferenceStatement?: close({
						Arn:                     string | fn.Fn
						IPSetForwardedIPConfig?: close({
							FallbackBehavior: string | fn.Fn
							HeaderName:       string | fn.Fn
							Position:         string | fn.Fn
						}) | fn.If
					}) | fn.If
					ManagedRuleGroupStatement?: close({
						ExcludedRules?: [...close({
							Name: string | fn.Fn
						})] | fn.If
						Name:       string | fn.Fn
						VendorName: string | fn.Fn
					}) | fn.If
					NotStatement?: close({
						Statement: close({
							AndStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								PositionalConstraint: string | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     string | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         string | fn.Fn
								}) | fn.If
							}) | fn.If
							ManagedRuleGroupStatement?: close({
								ExcludedRules?: [...close({
									Name: string | fn.Fn
								})] | fn.If
								Name:       string | fn.Fn
								VendorName: string | fn.Fn
							}) | fn.If
							NotStatement?: close({
								Statement: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=20000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          string | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            string | fn.Fn
								ExcludedRules?: [...close({
									Name: string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: string | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								Size:                int | fn.Fn
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					OrStatement?: close({
						Statements: [...close({
							AndStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								PositionalConstraint: string | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     string | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         string | fn.Fn
								}) | fn.If
							}) | fn.If
							ManagedRuleGroupStatement?: close({
								ExcludedRules?: [...close({
									Name: string | fn.Fn
								})] | fn.If
								Name:       string | fn.Fn
								VendorName: string | fn.Fn
							}) | fn.If
							NotStatement?: close({
								Statement: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=20000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          string | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            string | fn.Fn
								ExcludedRules?: [...close({
									Name: string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: string | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								Size:                int | fn.Fn
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
					RateBasedStatement?: close({
						AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
						ForwardedIPConfig?: close({
							FallbackBehavior: string | fn.Fn
							HeaderName:       string | fn.Fn
						}) | fn.If
						Limit:               (>=100 & <=20000000) | fn.Fn
						ScopeDownStatement?: close({
							AndStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							ByteMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								PositionalConstraint: string | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     string | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         string | fn.Fn
								}) | fn.If
							}) | fn.If
							ManagedRuleGroupStatement?: close({
								ExcludedRules?: [...close({
									Name: string | fn.Fn
								})] | fn.If
								Name:       string | fn.Fn
								VendorName: string | fn.Fn
							}) | fn.If
							NotStatement?: close({
								Statement: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							OrStatement?: close({
								Statements: [...close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: string | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=20000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										PositionalConstraint: string | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...(string | fn.Fn)] | (string | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     string | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: string | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         string | fn.Fn
										}) | fn.If
									}) | fn.If
									ManagedRuleGroupStatement?: close({
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
										Name:       string | fn.Fn
										VendorName: string | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          string | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            string | fn.Fn
										ExcludedRules?: [...close({
											Name: string | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: string | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										Size:                int | fn.Fn
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									SqliMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
									XssMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											Method?: {
												[string]: _
											} | fn.Fn
											QueryString?: {
												[string]: _
											} | fn.Fn
											SingleHeader?: {
												[string]: _
											} | fn.Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.Fn
											UriPath?: {
												[string]: _
											} | fn.Fn
										}) | fn.If
										TextTransformations: [...close({
											Priority: int | fn.Fn
											Type:     string | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          string | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            string | fn.Fn
								ExcludedRules?: [...close({
									Name: string | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: string | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								Size:                int | fn.Fn
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							SqliMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
							XssMatchStatement?: close({
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									Method?: {
										[string]: _
									} | fn.Fn
									QueryString?: {
										[string]: _
									} | fn.Fn
									SingleHeader?: {
										[string]: _
									} | fn.Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.Fn
									UriPath?: {
										[string]: _
									} | fn.Fn
								}) | fn.If
								TextTransformations: [...close({
									Priority: int | fn.Fn
									Type:     string | fn.Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					RegexPatternSetReferenceStatement?: close({
						Arn:          string | fn.Fn
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						TextTransformations: [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
					RuleGroupReferenceStatement?: close({
						Arn:            string | fn.Fn
						ExcludedRules?: [...close({
							Name: string | fn.Fn
						})] | fn.If
					}) | fn.If
					SizeConstraintStatement?: close({
						ComparisonOperator: string | fn.Fn
						FieldToMatch:       close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						Size:                int | fn.Fn
						TextTransformations: [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
					SqliMatchStatement?: close({
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						TextTransformations: [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
					XssMatchStatement?: close({
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							Method?: {
								[string]: _
							} | fn.Fn
							QueryString?: {
								[string]: _
							} | fn.Fn
							SingleHeader?: {
								[string]: _
							} | fn.Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.Fn
							UriPath?: {
								[string]: _
							} | fn.Fn
						}) | fn.If
						TextTransformations: [...close({
							Priority: int | fn.Fn
							Type:     string | fn.Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
				VisibilityConfig: close({
					CloudWatchMetricsEnabled: bool | fn.Fn
					MetricName:               string | fn.Fn
					SampledRequestsEnabled:   bool | fn.Fn
				}) | fn.If
			})] | fn.If
			Scope: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VisibilityConfig: close({
				CloudWatchMetricsEnabled: bool | fn.Fn
				MetricName:               string | fn.Fn
				SampledRequestsEnabled:   bool | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WebACLAssociation :: {
		Type:       "AWS::WAFv2::WebACLAssociation"
		Properties: close({
			ResourceArn: string | fn.Fn
			WebACLArn:   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

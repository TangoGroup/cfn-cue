package useast1

import "github.com/TangoGroup/aws/fn"

#WAFv2: {
	#IPSet: {
		Type: "AWS::WAFv2::IPSet"
		Properties: {
			Addresses:        [...(string | fn.#Fn)] | (string | fn.#Fn)
			Description?:     string | fn.#Fn
			IPAddressVersion: string | fn.#Fn
			Name?:            string | fn.#Fn
			Scope:            string | fn.#Fn
			Tags?:            [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RegexPatternSet: {
		Type: "AWS::WAFv2::RegexPatternSet"
		Properties: {
			Description?:          string | fn.#Fn
			Name?:                 string | fn.#Fn
			RegularExpressionList: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Scope:                 string | fn.#Fn
			Tags?:                 [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RuleGroup: {
		Type: "AWS::WAFv2::RuleGroup"
		Properties: {
			Capacity:     int | fn.#Fn
			Description?: string | fn.#Fn
			Name?:        string | fn.#Fn
			Rules?:       [...{
				Action?: {
					Allow?: {
						[string]: _
					} | fn.#Fn
					Block?: {
						[string]: _
					} | fn.#Fn
					Count?: {
						[string]: _
					} | fn.#Fn
				} | fn.If
				Name:      string | fn.#Fn
				Priority:  int | fn.#Fn
				Statement: {
					AndStatement?: {
						Statements: [...{
							AndStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								PositionalConstraint: string | fn.#Fn
								SearchString?:        string | fn.#Fn
								SearchStringBase64?:  string | fn.#Fn
								TextTransformations:  [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn:                     string | fn.#Fn
								IPSetForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
									Position:         string | fn.#Fn
								} | fn.If
							} | fn.If
							NotStatement?: {
								Statement: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
								Limit:               (>=100 & <=20000000) | fn.#Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn:          string | fn.#Fn
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator: string | fn.#Fn
								FieldToMatch:       {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								Size:                int | fn.#Fn
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
						}] | fn.If
					} | fn.If
					ByteMatchStatement?: {
						FieldToMatch: {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						PositionalConstraint: string | fn.#Fn
						SearchString?:        string | fn.#Fn
						SearchStringBase64?:  string | fn.#Fn
						TextTransformations:  [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
					GeoMatchStatement?: {
						CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
						ForwardedIPConfig?: {
							FallbackBehavior: string | fn.#Fn
							HeaderName:       string | fn.#Fn
						} | fn.If
					} | fn.If
					IPSetReferenceStatement?: {
						Arn:                     string | fn.#Fn
						IPSetForwardedIPConfig?: {
							FallbackBehavior: string | fn.#Fn
							HeaderName:       string | fn.#Fn
							Position:         string | fn.#Fn
						} | fn.If
					} | fn.If
					NotStatement?: {
						Statement: {
							AndStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								PositionalConstraint: string | fn.#Fn
								SearchString?:        string | fn.#Fn
								SearchStringBase64?:  string | fn.#Fn
								TextTransformations:  [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn:                     string | fn.#Fn
								IPSetForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
									Position:         string | fn.#Fn
								} | fn.If
							} | fn.If
							NotStatement?: {
								Statement: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
								Limit:               (>=100 & <=20000000) | fn.#Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn:          string | fn.#Fn
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator: string | fn.#Fn
								FieldToMatch:       {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								Size:                int | fn.#Fn
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
					OrStatement?: {
						Statements: [...{
							AndStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								PositionalConstraint: string | fn.#Fn
								SearchString?:        string | fn.#Fn
								SearchStringBase64?:  string | fn.#Fn
								TextTransformations:  [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn:                     string | fn.#Fn
								IPSetForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
									Position:         string | fn.#Fn
								} | fn.If
							} | fn.If
							NotStatement?: {
								Statement: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
								Limit:               (>=100 & <=20000000) | fn.#Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn:          string | fn.#Fn
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator: string | fn.#Fn
								FieldToMatch:       {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								Size:                int | fn.#Fn
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
						}] | fn.If
					} | fn.If
					RateBasedStatement?: {
						AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
						ForwardedIPConfig?: {
							FallbackBehavior: string | fn.#Fn
							HeaderName:       string | fn.#Fn
						} | fn.If
						Limit:               (>=100 & <=20000000) | fn.#Fn
						ScopeDownStatement?: {
							AndStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								PositionalConstraint: string | fn.#Fn
								SearchString?:        string | fn.#Fn
								SearchStringBase64?:  string | fn.#Fn
								TextTransformations:  [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn:                     string | fn.#Fn
								IPSetForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
									Position:         string | fn.#Fn
								} | fn.If
							} | fn.If
							NotStatement?: {
								Statement: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
								Limit:               (>=100 & <=20000000) | fn.#Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn:          string | fn.#Fn
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator: string | fn.#Fn
								FieldToMatch:       {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								Size:                int | fn.#Fn
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
					RegexPatternSetReferenceStatement?: {
						Arn:          string | fn.#Fn
						FieldToMatch: {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						TextTransformations: [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
					SizeConstraintStatement?: {
						ComparisonOperator: string | fn.#Fn
						FieldToMatch:       {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						Size:                int | fn.#Fn
						TextTransformations: [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
					SqliMatchStatement?: {
						FieldToMatch: {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						TextTransformations: [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
					XssMatchStatement?: {
						FieldToMatch: {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						TextTransformations: [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
				} | fn.If
				VisibilityConfig: {
					CloudWatchMetricsEnabled: bool | fn.#Fn
					MetricName:               string | fn.#Fn
					SampledRequestsEnabled:   bool | fn.#Fn
				} | fn.If
			}] | fn.If
			Scope: string | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VisibilityConfig: {
				CloudWatchMetricsEnabled: bool | fn.#Fn
				MetricName:               string | fn.#Fn
				SampledRequestsEnabled:   bool | fn.#Fn
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WebACL: {
		Type: "AWS::WAFv2::WebACL"
		Properties: {
			DefaultAction: {
				Allow?: {
					[string]: _
				} | fn.#Fn
				Block?: {
					[string]: _
				} | fn.#Fn
			} | fn.If
			Description?: string | fn.#Fn
			Name?:        string | fn.#Fn
			Rules?:       [...{
				Action?: {
					Allow?: {
						[string]: _
					} | fn.#Fn
					Block?: {
						[string]: _
					} | fn.#Fn
					Count?: {
						[string]: _
					} | fn.#Fn
				} | fn.If
				Name:            string | fn.#Fn
				OverrideAction?: {
					Count?: {
						[string]: _
					} | fn.#Fn
					None?: {
						[string]: _
					} | fn.#Fn
				} | fn.If
				Priority:  int | fn.#Fn
				Statement: {
					AndStatement?: {
						Statements: [...{
							AndStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								PositionalConstraint: string | fn.#Fn
								SearchString?:        string | fn.#Fn
								SearchStringBase64?:  string | fn.#Fn
								TextTransformations:  [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn:                     string | fn.#Fn
								IPSetForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
									Position:         string | fn.#Fn
								} | fn.If
							} | fn.If
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name: string | fn.#Fn
								}] | fn.If
								Name:       string | fn.#Fn
								VendorName: string | fn.#Fn
							} | fn.If
							NotStatement?: {
								Statement: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
								Limit:               (>=100 & <=20000000) | fn.#Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn:          string | fn.#Fn
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							RuleGroupReferenceStatement?: {
								Arn:            string | fn.#Fn
								ExcludedRules?: [...{
									Name: string | fn.#Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator: string | fn.#Fn
								FieldToMatch:       {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								Size:                int | fn.#Fn
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
						}] | fn.If
					} | fn.If
					ByteMatchStatement?: {
						FieldToMatch: {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						PositionalConstraint: string | fn.#Fn
						SearchString?:        string | fn.#Fn
						SearchStringBase64?:  string | fn.#Fn
						TextTransformations:  [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
					GeoMatchStatement?: {
						CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
						ForwardedIPConfig?: {
							FallbackBehavior: string | fn.#Fn
							HeaderName:       string | fn.#Fn
						} | fn.If
					} | fn.If
					IPSetReferenceStatement?: {
						Arn:                     string | fn.#Fn
						IPSetForwardedIPConfig?: {
							FallbackBehavior: string | fn.#Fn
							HeaderName:       string | fn.#Fn
							Position:         string | fn.#Fn
						} | fn.If
					} | fn.If
					ManagedRuleGroupStatement?: {
						ExcludedRules?: [...{
							Name: string | fn.#Fn
						}] | fn.If
						Name:       string | fn.#Fn
						VendorName: string | fn.#Fn
					} | fn.If
					NotStatement?: {
						Statement: {
							AndStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								PositionalConstraint: string | fn.#Fn
								SearchString?:        string | fn.#Fn
								SearchStringBase64?:  string | fn.#Fn
								TextTransformations:  [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn:                     string | fn.#Fn
								IPSetForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
									Position:         string | fn.#Fn
								} | fn.If
							} | fn.If
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name: string | fn.#Fn
								}] | fn.If
								Name:       string | fn.#Fn
								VendorName: string | fn.#Fn
							} | fn.If
							NotStatement?: {
								Statement: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
								Limit:               (>=100 & <=20000000) | fn.#Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn:          string | fn.#Fn
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							RuleGroupReferenceStatement?: {
								Arn:            string | fn.#Fn
								ExcludedRules?: [...{
									Name: string | fn.#Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator: string | fn.#Fn
								FieldToMatch:       {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								Size:                int | fn.#Fn
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
					OrStatement?: {
						Statements: [...{
							AndStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								PositionalConstraint: string | fn.#Fn
								SearchString?:        string | fn.#Fn
								SearchStringBase64?:  string | fn.#Fn
								TextTransformations:  [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn:                     string | fn.#Fn
								IPSetForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
									Position:         string | fn.#Fn
								} | fn.If
							} | fn.If
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name: string | fn.#Fn
								}] | fn.If
								Name:       string | fn.#Fn
								VendorName: string | fn.#Fn
							} | fn.If
							NotStatement?: {
								Statement: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
								Limit:               (>=100 & <=20000000) | fn.#Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn:          string | fn.#Fn
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							RuleGroupReferenceStatement?: {
								Arn:            string | fn.#Fn
								ExcludedRules?: [...{
									Name: string | fn.#Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator: string | fn.#Fn
								FieldToMatch:       {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								Size:                int | fn.#Fn
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
						}] | fn.If
					} | fn.If
					RateBasedStatement?: {
						AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
						ForwardedIPConfig?: {
							FallbackBehavior: string | fn.#Fn
							HeaderName:       string | fn.#Fn
						} | fn.If
						Limit:               (>=100 & <=20000000) | fn.#Fn
						ScopeDownStatement?: {
							AndStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							ByteMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								PositionalConstraint: string | fn.#Fn
								SearchString?:        string | fn.#Fn
								SearchStringBase64?:  string | fn.#Fn
								TextTransformations:  [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							GeoMatchStatement?: {
								CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
							} | fn.If
							IPSetReferenceStatement?: {
								Arn:                     string | fn.#Fn
								IPSetForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
									Position:         string | fn.#Fn
								} | fn.If
							} | fn.If
							ManagedRuleGroupStatement?: {
								ExcludedRules?: [...{
									Name: string | fn.#Fn
								}] | fn.If
								Name:       string | fn.#Fn
								VendorName: string | fn.#Fn
							} | fn.If
							NotStatement?: {
								Statement: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							OrStatement?: {
								Statements: [...{
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								}] | fn.If
							} | fn.If
							RateBasedStatement?: {
								AggregateKeyType:   ("FORWARDED_IP" | "IP") | fn.#Fn
								ForwardedIPConfig?: {
									FallbackBehavior: string | fn.#Fn
									HeaderName:       string | fn.#Fn
								} | fn.If
								Limit:               (>=100 & <=20000000) | fn.#Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										PositionalConstraint: string | fn.#Fn
										SearchString?:        string | fn.#Fn
										SearchStringBase64?:  string | fn.#Fn
										TextTransformations:  [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									GeoMatchStatement?: {
										CountryCodes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
										ForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
										} | fn.If
									} | fn.If
									IPSetReferenceStatement?: {
										Arn:                     string | fn.#Fn
										IPSetForwardedIPConfig?: {
											FallbackBehavior: string | fn.#Fn
											HeaderName:       string | fn.#Fn
											Position:         string | fn.#Fn
										} | fn.If
									} | fn.If
									ManagedRuleGroupStatement?: {
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
										Name:       string | fn.#Fn
										VendorName: string | fn.#Fn
									} | fn.If
									RegexPatternSetReferenceStatement?: {
										Arn:          string | fn.#Fn
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									RuleGroupReferenceStatement?: {
										Arn:            string | fn.#Fn
										ExcludedRules?: [...{
											Name: string | fn.#Fn
										}] | fn.If
									} | fn.If
									SizeConstraintStatement?: {
										ComparisonOperator: string | fn.#Fn
										FieldToMatch:       {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										Size:                int | fn.#Fn
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									SqliMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
									XssMatchStatement?: {
										FieldToMatch: {
											AllQueryArguments?: {
												[string]: _
											} | fn.#Fn
											Body?: {
												[string]: _
											} | fn.#Fn
											Method?: {
												[string]: _
											} | fn.#Fn
											QueryString?: {
												[string]: _
											} | fn.#Fn
											SingleHeader?: {
												[string]: _
											} | fn.#Fn
											SingleQueryArgument?: {
												[string]: _
											} | fn.#Fn
											UriPath?: {
												[string]: _
											} | fn.#Fn
										} | fn.If
										TextTransformations: [...{
											Priority: int | fn.#Fn
											Type:     string | fn.#Fn
										}] | fn.If
									} | fn.If
								} | fn.If
							} | fn.If
							RegexPatternSetReferenceStatement?: {
								Arn:          string | fn.#Fn
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							RuleGroupReferenceStatement?: {
								Arn:            string | fn.#Fn
								ExcludedRules?: [...{
									Name: string | fn.#Fn
								}] | fn.If
							} | fn.If
							SizeConstraintStatement?: {
								ComparisonOperator: string | fn.#Fn
								FieldToMatch:       {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								Size:                int | fn.#Fn
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							SqliMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
							XssMatchStatement?: {
								FieldToMatch: {
									AllQueryArguments?: {
										[string]: _
									} | fn.#Fn
									Body?: {
										[string]: _
									} | fn.#Fn
									Method?: {
										[string]: _
									} | fn.#Fn
									QueryString?: {
										[string]: _
									} | fn.#Fn
									SingleHeader?: {
										[string]: _
									} | fn.#Fn
									SingleQueryArgument?: {
										[string]: _
									} | fn.#Fn
									UriPath?: {
										[string]: _
									} | fn.#Fn
								} | fn.If
								TextTransformations: [...{
									Priority: int | fn.#Fn
									Type:     string | fn.#Fn
								}] | fn.If
							} | fn.If
						} | fn.If
					} | fn.If
					RegexPatternSetReferenceStatement?: {
						Arn:          string | fn.#Fn
						FieldToMatch: {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						TextTransformations: [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
					RuleGroupReferenceStatement?: {
						Arn:            string | fn.#Fn
						ExcludedRules?: [...{
							Name: string | fn.#Fn
						}] | fn.If
					} | fn.If
					SizeConstraintStatement?: {
						ComparisonOperator: string | fn.#Fn
						FieldToMatch:       {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						Size:                int | fn.#Fn
						TextTransformations: [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
					SqliMatchStatement?: {
						FieldToMatch: {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						TextTransformations: [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
					XssMatchStatement?: {
						FieldToMatch: {
							AllQueryArguments?: {
								[string]: _
							} | fn.#Fn
							Body?: {
								[string]: _
							} | fn.#Fn
							Method?: {
								[string]: _
							} | fn.#Fn
							QueryString?: {
								[string]: _
							} | fn.#Fn
							SingleHeader?: {
								[string]: _
							} | fn.#Fn
							SingleQueryArgument?: {
								[string]: _
							} | fn.#Fn
							UriPath?: {
								[string]: _
							} | fn.#Fn
						} | fn.If
						TextTransformations: [...{
							Priority: int | fn.#Fn
							Type:     string | fn.#Fn
						}] | fn.If
					} | fn.If
				} | fn.If
				VisibilityConfig: {
					CloudWatchMetricsEnabled: bool | fn.#Fn
					MetricName:               string | fn.#Fn
					SampledRequestsEnabled:   bool | fn.#Fn
				} | fn.If
			}] | fn.If
			Scope: string | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VisibilityConfig: {
				CloudWatchMetricsEnabled: bool | fn.#Fn
				MetricName:               string | fn.#Fn
				SampledRequestsEnabled:   bool | fn.#Fn
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WebACLAssociation: {
		Type: "AWS::WAFv2::WebACLAssociation"
		Properties: {
			ResourceArn: string | fn.#Fn
			WebACLArn:   string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

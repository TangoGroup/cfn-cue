package usgovwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

WAFv2 :: {
	IPSet :: {
		Type:       "AWS::WAFv2::IPSet"
		Properties: close({
			Addresses:        [...((strings.MinRunes(1) & strings.MaxRunes(50)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(50)) | fn.Fn)
			Description?:     (=~#"^[a-zA-Z0-9=:#@/\-,.][a-zA-Z0-9+=:#@/\-,.\s]+[a-zA-Z0-9+=:#@/\-,.]{1,256}$"#) | fn.Fn
			IPAddressVersion: ("IPV4" | "IPV6") | fn.Fn
			Name?:            (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
			Scope:            ("CLOUDFRONT" | "REGIONAL") | fn.Fn
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
			Description?:          (=~#"^[a-zA-Z0-9=:#@/\-,.][a-zA-Z0-9+=:#@/\-,.\s]+[a-zA-Z0-9+=:#@/\-,.]{1,256}$"#) | fn.Fn
			Name?:                 (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
			RegularExpressionList: [...(string | fn.Fn)] | (string | fn.Fn)
			Scope:                 ("CLOUDFRONT" | "REGIONAL") | fn.Fn
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
			Capacity:              int | fn.Fn
			CustomResponseBodies?: {
				[string]: close({
					Content:     string | fn.Fn
					ContentType: string | fn.Fn
				})
			} | fn.If
			Description?: (=~#"^[a-zA-Z0-9=:#@/\-,.][a-zA-Z0-9+=:#@/\-,.\s]+[a-zA-Z0-9+=:#@/\-,.]{1,256}$"#) | fn.Fn
			Name?:        (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
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
				Name:        (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
				Priority:    int | fn.Fn
				RuleLabels?: [...close({
					Name: (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
				})] | fn.If
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
						PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
						SearchString?:        string | fn.Fn
						SearchStringBase64?:  string | fn.Fn
						TextTransformations:  [...close({
							Priority: int | fn.Fn
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
						})] | fn.If
					}) | fn.If
					GeoMatchStatement?: close({
						CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
						ForwardedIPConfig?: close({
							FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
							HeaderName:       string | fn.Fn
						}) | fn.If
					}) | fn.If
					IPSetReferenceStatement?: close({
						Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
						IPSetForwardedIPConfig?: close({
							FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
							HeaderName:       string | fn.Fn
							Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
						}) | fn.If
					}) | fn.If
					LabelMatchStatement?: close({
						Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
						Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
					RateBasedStatement?: close({
						AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
						ForwardedIPConfig?: close({
							FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
							HeaderName:       string | fn.Fn
						}) | fn.If
						Limit:               (>=100 & <=2000000000) | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					RegexPatternSetReferenceStatement?: close({
						Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
						})] | fn.If
					}) | fn.If
					SizeConstraintStatement?: close({
						ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
						FieldToMatch:       close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
				VisibilityConfig: close({
					CloudWatchMetricsEnabled: bool | fn.Fn
					MetricName:               (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
					SampledRequestsEnabled:   bool | fn.Fn
				}) | fn.If
			})] | fn.If
			Scope: ("CLOUDFRONT" | "REGIONAL") | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VisibilityConfig: close({
				CloudWatchMetricsEnabled: bool | fn.Fn
				MetricName:               (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
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
			CustomResponseBodies?: {
				[string]: close({
					Content:     string | fn.Fn
					ContentType: string | fn.Fn
				})
			} | fn.If
			DefaultAction: close({
				Allow?: close({
					CustomRequestHandling?: close({
						InsertHeaders: [...close({
							Name:  (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
							Value: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
				Block?: close({
					CustomResponse?: close({
						CustomResponseBodyKey?: (=~#"^[\w\-]+$"#) | fn.Fn
						ResponseCode:           (>=200 & <=600) | fn.Fn
						ResponseHeaders?:       [...close({
							Name:  (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
							Value: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Description?: (=~#"^[a-zA-Z0-9=:#@/\-,.][a-zA-Z0-9+=:#@/\-,.\s]+[a-zA-Z0-9+=:#@/\-,.]{1,256}$"#) | fn.Fn
			Name?:        (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
			Rules?:       [...close({
				Action?: close({
					Allow?: close({
						CustomRequestHandling?: close({
							InsertHeaders: [...close({
								Name:  (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
								Value: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					Block?: close({
						CustomResponse?: close({
							CustomResponseBodyKey?: (=~#"^[\w\-]+$"#) | fn.Fn
							ResponseCode:           (>=200 & <=600) | fn.Fn
							ResponseHeaders?:       [...close({
								Name:  (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
								Value: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					Count?: close({
						CustomRequestHandling?: close({
							InsertHeaders: [...close({
								Name:  (strings.MinRunes(1) & strings.MaxRunes(64)) | fn.Fn
								Value: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
				}) | fn.If
				Name:            (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
				OverrideAction?: close({
					Count?: {
						[string]: _
					} | fn.Fn
					None?: {
						[string]: _
					} | fn.Fn
				}) | fn.If
				Priority:    int | fn.Fn
				RuleLabels?: [...close({
					Name: (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
				})] | fn.If
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								ExcludedRules?: [...close({
									Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
						PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
						SearchString?:        string | fn.Fn
						SearchStringBase64?:  string | fn.Fn
						TextTransformations:  [...close({
							Priority: int | fn.Fn
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
						})] | fn.If
					}) | fn.If
					GeoMatchStatement?: close({
						CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
						ForwardedIPConfig?: close({
							FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
							HeaderName:       string | fn.Fn
						}) | fn.If
					}) | fn.If
					IPSetReferenceStatement?: close({
						Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
						IPSetForwardedIPConfig?: close({
							FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
							HeaderName:       string | fn.Fn
							Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
						}) | fn.If
					}) | fn.If
					LabelMatchStatement?: close({
						Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
						Scope: ("LABEL" | "NAMESPACE") | fn.Fn
					}) | fn.If
					ManagedRuleGroupStatement?: close({
						ExcludedRules?: [...close({
							Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
						})] | fn.If
						Name:                (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								ExcludedRules?: [...close({
									Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								ExcludedRules?: [...close({
									Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								ExcludedRules?: [...close({
									Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
					RateBasedStatement?: close({
						AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
						ForwardedIPConfig?: close({
							FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
							HeaderName:       string | fn.Fn
						}) | fn.If
						Limit:               (>=100 & <=2000000000) | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
								PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
								SearchString?:        string | fn.Fn
								SearchStringBase64?:  string | fn.Fn
								TextTransformations:  [...close({
									Priority: int | fn.Fn
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							GeoMatchStatement?: close({
								CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
							}) | fn.If
							IPSetReferenceStatement?: close({
								Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								IPSetForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
									Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
								}) | fn.If
							}) | fn.If
							LabelMatchStatement?: close({
								Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
								Scope: ("LABEL" | "NAMESPACE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								})] | fn.If
							}) | fn.If
							RateBasedStatement?: close({
								AggregateKeyType:   ("IP" | "FORWARDED_IP") | fn.Fn
								ForwardedIPConfig?: close({
									FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
									HeaderName:       string | fn.Fn
								}) | fn.If
								Limit:               (>=100 & <=2000000000) | fn.Fn
								ScopeDownStatement?: close({
									ByteMatchStatement?: close({
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
										PositionalConstraint: ("EXACTLY" | "STARTS_WITH" | "ENDS_WITH" | "CONTAINS" | "CONTAINS_WORD") | fn.Fn
										SearchString?:        string | fn.Fn
										SearchStringBase64?:  string | fn.Fn
										TextTransformations:  [...close({
											Priority: int | fn.Fn
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									GeoMatchStatement?: close({
										CountryCodes?:      [...((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2)) | fn.Fn)
										ForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
										}) | fn.If
									}) | fn.If
									IPSetReferenceStatement?: close({
										Arn:                     (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										IPSetForwardedIPConfig?: close({
											FallbackBehavior: ("MATCH" | "NO_MATCH") | fn.Fn
											HeaderName:       string | fn.Fn
											Position:         ("FIRST" | "LAST" | "ANY") | fn.Fn
										}) | fn.If
									}) | fn.If
									LabelMatchStatement?: close({
										Key:   (=~#"^[0-9A-Za-z_:-]{1,1024}$"#) | fn.Fn
										Scope: ("LABEL" | "NAMESPACE") | fn.Fn
									}) | fn.If
									RegexPatternSetReferenceStatement?: close({
										Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										FieldToMatch: close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
									RuleGroupReferenceStatement?: close({
										Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
										ExcludedRules?: [...close({
											Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
										})] | fn.If
									}) | fn.If
									SizeConstraintStatement?: close({
										ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
										FieldToMatch:       close({
											AllQueryArguments?: {
												[string]: _
											} | fn.Fn
											Body?: {
												[string]: _
											} | fn.Fn
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
											JsonBody?: close({
												InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
												MatchPattern:             close({
													All?: {
														[string]: _
													} | fn.Fn
													IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
												}) | fn.If
												MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
											}) | fn.If
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
											Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
										})] | fn.If
									}) | fn.If
								}) | fn.If
							}) | fn.If
							RegexPatternSetReferenceStatement?: close({
								Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								FieldToMatch: close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
							RuleGroupReferenceStatement?: close({
								Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
								ExcludedRules?: [...close({
									Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
								})] | fn.If
							}) | fn.If
							SizeConstraintStatement?: close({
								ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
								FieldToMatch:       close({
									AllQueryArguments?: {
										[string]: _
									} | fn.Fn
									Body?: {
										[string]: _
									} | fn.Fn
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
									JsonBody?: close({
										InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
										MatchPattern:             close({
											All?: {
												[string]: _
											} | fn.Fn
											IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
										}) | fn.If
										MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
									}) | fn.If
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
									Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					RegexPatternSetReferenceStatement?: close({
						Arn:          (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
						FieldToMatch: close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
						})] | fn.If
					}) | fn.If
					RuleGroupReferenceStatement?: close({
						Arn:            (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
						ExcludedRules?: [...close({
							Name: (=~#"^[0-9A-Za-z_-]{1,128}$"#) | fn.Fn
						})] | fn.If
					}) | fn.If
					SizeConstraintStatement?: close({
						ComparisonOperator: ("EQ" | "NE" | "LE" | "LT" | "GE" | "GT") | fn.Fn
						FieldToMatch:       close({
							AllQueryArguments?: {
								[string]: _
							} | fn.Fn
							Body?: {
								[string]: _
							} | fn.Fn
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
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
							JsonBody?: close({
								InvalidFallbackBehavior?: ("MATCH" | "NO_MATCH" | "EVALUATE_AS_STRING") | fn.Fn
								MatchPattern:             close({
									All?: {
										[string]: _
									} | fn.Fn
									IncludedPaths?: [...(string | fn.Fn)] | (string | fn.Fn)
								}) | fn.If
								MatchScope: ("ALL" | "KEY" | "VALUE") | fn.Fn
							}) | fn.If
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
							Type:     ("NONE" | "COMPRESS_WHITE_SPACE" | "HTML_ENTITY_DECODE" | "LOWERCASE" | "CMD_LINE" | "URL_DECODE") | fn.Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
				VisibilityConfig: close({
					CloudWatchMetricsEnabled: bool | fn.Fn
					MetricName:               (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
					SampledRequestsEnabled:   bool | fn.Fn
				}) | fn.If
			})] | fn.If
			Scope: ("CLOUDFRONT" | "REGIONAL") | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VisibilityConfig: close({
				CloudWatchMetricsEnabled: bool | fn.Fn
				MetricName:               (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
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
			ResourceArn: (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
			WebACLArn:   (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package euwest2

import "github.com/TangoGroup/aws/fn"

WAFv2 :: {
	IPSet :: {
		Type: "AWS::WAFv2::IPSet"
		Properties: {
			Addresses?: IPAddresses?: [...(string | fn.Fn)]
			Description?:      string | fn.Fn
			IPAddressVersion?: string | fn.Fn
			IPSet?: {
				ARN?: string | fn.Fn
				Addresses?: IPAddresses?: [...(string | fn.Fn)]
				Description?:      string | fn.Fn
				IPAddressVersion?: string | fn.Fn
				Id?:               string | fn.Fn
				Name?:             string | fn.Fn
			}
			IPSetSummary?: {
				ARN?:         string | fn.Fn
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				LockToken?:   string | fn.Fn
				Name?:        string | fn.Fn
			}
			IPSets?: IPSets?: [...{
				[string]: _
			}]
			Id?:            string | fn.Fn
			Limit?:         int | fn.Fn
			LockToken?:     string | fn.Fn
			Name:           string | fn.Fn
			NextLockToken?: string | fn.Fn
			NextMarker?:    string | fn.Fn
			Scope:          string | fn.Fn
			Summary?: {
				ARN?:         string | fn.Fn
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				LockToken?:   string | fn.Fn
				Name?:        string | fn.Fn
			}
			Tags?: TagList?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RegexPatternSet :: {
		Type: "AWS::WAFv2::RegexPatternSet"
		Properties: {
			Description?:   string | fn.Fn
			Id?:            string | fn.Fn
			Limit?:         int | fn.Fn
			LockToken?:     string | fn.Fn
			Name:           string | fn.Fn
			NextLockToken?: string | fn.Fn
			NextMarker?:    string | fn.Fn
			RegexPatternSet?: {
				ARN?:         string | fn.Fn
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				Name?:        string | fn.Fn
				RegularExpressionList?: RegularExpressionList?: [...{
					[string]: _
				}]
			}
			RegexPatternSets?: RegexPatternSets?: [...{
				[string]: _
			}]
			RegularExpressionList?: RegularExpressionList?: [...{
				[string]: _
			}]
			Scope: string | fn.Fn
			Summary?: {
				ARN?:         string | fn.Fn
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				LockToken?:   string | fn.Fn
				Name?:        string | fn.Fn
			}
			Tags?: TagList?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RuleGroup :: {
		Type: "AWS::WAFv2::RuleGroup"
		Properties: {
			Capacity?:      int | fn.Fn
			Description?:   string | fn.Fn
			Id?:            string | fn.Fn
			Limit?:         int | fn.Fn
			LockToken?:     string | fn.Fn
			Name:           string | fn.Fn
			NextLockToken?: string | fn.Fn
			NextMarker?:    string | fn.Fn
			RuleGroup?: {
				ARN?:         string | fn.Fn
				Capacity?:    int | fn.Fn
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				Name?:        string | fn.Fn
				Rules?: Rules?: [...{
					[string]: _
				}]
				VisibilityConfig?: {
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				}
			}
			RuleGroupSummary?: {
				ARN?:         string | fn.Fn
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				LockToken?:   string | fn.Fn
				Name?:        string | fn.Fn
			}
			RuleGroups?: RuleGroups?: [...{
				[string]: _
			}]
			Rules?: Rules?: [...{
				[string]: _
			}]
			Scope: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
					GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
					IPSetReferenceStatement?: ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
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
						ARN?: string | fn.Fn
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
				GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
				IPSetReferenceStatement?: ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
					GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
					IPSetReferenceStatement?: ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
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
						ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
					GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
					IPSetReferenceStatement?: ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
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
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
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
						ARN?: string | fn.Fn
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
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
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
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
						IPSetReferenceStatement?: ARN?: string | fn.Fn
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
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
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
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
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
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)]
								IPSetReferenceStatement?: ARN?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									ARN?: string | fn.Fn
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
							ARN?: string | fn.Fn
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
					ARN?: string | fn.Fn
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
			Summary?: {
				ARN?:         string | fn.Fn
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				LockToken?:   string | fn.Fn
				Name?:        string | fn.Fn
			}
			Tags?: TagList?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VisibilityConfig?: {
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	WebACL :: {
		Type: "AWS::WAFv2::WebACL"
		Properties: {
			DefaultAction?: {
				Allow?: {
				}
				Block?: {
				}
			}
			Description?:   string | fn.Fn
			Id?:            string | fn.Fn
			Limit?:         int | fn.Fn
			LockToken?:     string | fn.Fn
			Name:           string | fn.Fn
			NextLockToken?: string | fn.Fn
			NextMarker?:    string | fn.Fn
			Rules?: Rules?: [...{
				[string]: _
			}]
			Scope: string | fn.Fn
			Summary?: {
				ARN?:         string | fn.Fn
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				LockToken?:   string | fn.Fn
				Name?:        string | fn.Fn
			}
			Tags?: TagList?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VisibilityConfig?: {
				CloudWatchMetricsEnabled?: bool | fn.Fn
				MetricName?:               string | fn.Fn
				SampledRequestsEnabled?:   bool | fn.Fn
			}
			WebACL?: {
				ARN?:      string | fn.Fn
				Capacity?: int | fn.Fn
				DefaultAction?: {
					Allow?: {
					}
					Block?: {
					}
				}
				Description?: string | fn.Fn
				Id?:          string | fn.Fn
				Name?:        string | fn.Fn
				Rules?: Rules?: [...{
					[string]: _
				}]
				VisibilityConfig?: {
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				}
			}
			WebACLs?: WebACLs?: [...{
				[string]: _
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

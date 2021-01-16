package euwest1

import "github.com/TangoGroup/aws/fn"

NetworkFirewall :: {
	Firewall :: {
		Type:       "AWS::NetworkFirewall::Firewall"
		Properties: close({
			DeleteProtection?:               bool | fn.Fn
			Description?:                    string | fn.Fn
			FirewallName:                    string | fn.Fn
			FirewallPolicyArn:               string | fn.Fn
			FirewallPolicyChangeProtection?: bool | fn.Fn
			SubnetChangeProtection?:         bool | fn.Fn
			SubnetMappings:                  [...close({
				SubnetId: string | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FirewallPolicy :: {
		Type:       "AWS::NetworkFirewall::FirewallPolicy"
		Properties: close({
			Description?:   string | fn.Fn
			FirewallPolicy: close({
				StatefulRuleGroupReferences?: [...close({
					ResourceArn: string | fn.Fn
				})] | fn.If
				StatelessCustomActions?: [...close({
					ActionDefinition: close({
						PublishMetricAction?: close({
							Dimensions: [...close({
								Value: string | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					ActionName: string | fn.Fn
				})] | fn.If
				StatelessDefaultActions:         [...(string | fn.Fn)] | (string | fn.Fn)
				StatelessFragmentDefaultActions: [...(string | fn.Fn)] | (string | fn.Fn)
				StatelessRuleGroupReferences?:   [...close({
					Priority:    int | fn.Fn
					ResourceArn: string | fn.Fn
				})] | fn.If
			}) | fn.If
			FirewallPolicyName: string | fn.Fn
			Tags?:              [...close({
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
	LoggingConfiguration :: {
		Type:       "AWS::NetworkFirewall::LoggingConfiguration"
		Properties: close({
			FirewallArn:          string | fn.Fn
			FirewallName?:        string | fn.Fn
			LoggingConfiguration: close({
				LogDestinationConfigs: [...close({
					LogDestination: {
						[string]: string | fn.Fn
					} | fn.If
					LogDestinationType: string | fn.Fn
					LogType:            string | fn.Fn
				})] | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RuleGroup :: {
		Type:       "AWS::NetworkFirewall::RuleGroup"
		Properties: close({
			Capacity:     int | fn.Fn
			Description?: string | fn.Fn
			RuleGroup?:   close({
				RuleVariables?: close({
					IPSets?: {
						[string]: close({
							Definition?: [...(string | fn.Fn)] | (string | fn.Fn)
						})
					} | fn.If
					PortSets?: {
						[string]: close({
							Definition?: [...(string | fn.Fn)] | (string | fn.Fn)
						})
					} | fn.If
				}) | fn.If
				RulesSource: close({
					RulesSourceList?: close({
						GeneratedRulesType: string | fn.Fn
						TargetTypes:        [...(string | fn.Fn)] | (string | fn.Fn)
						Targets:            [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					RulesString?:   string | fn.Fn
					StatefulRules?: [...close({
						Action: string | fn.Fn
						Header: close({
							Destination:     string | fn.Fn
							DestinationPort: string | fn.Fn
							Direction:       string | fn.Fn
							Protocol:        string | fn.Fn
							Source:          string | fn.Fn
							SourcePort:      string | fn.Fn
						}) | fn.If
						RuleOptions: [...close({
							Keyword:   string | fn.Fn
							Settings?: [...(string | fn.Fn)] | (string | fn.Fn)
						})] | fn.If
					})] | fn.If
					StatelessRulesAndCustomActions?: close({
						CustomActions?: [...close({
							ActionDefinition: close({
								PublishMetricAction?: close({
									Dimensions: [...close({
										Value: string | fn.Fn
									})] | fn.If
								}) | fn.If
							}) | fn.If
							ActionName: string | fn.Fn
						})] | fn.If
						StatelessRules: [...close({
							Priority:       int | fn.Fn
							RuleDefinition: close({
								Actions:         [...(string | fn.Fn)] | (string | fn.Fn)
								MatchAttributes: close({
									DestinationPorts?: [...close({
										FromPort: int | fn.Fn
										ToPort:   int | fn.Fn
									})] | fn.If
									Destinations?: [...close({
										AddressDefinition: string | fn.Fn
									})] | fn.If
									Protocols?:   [...(int | fn.Fn)] | (int | fn.Fn)
									SourcePorts?: [...close({
										FromPort: int | fn.Fn
										ToPort:   int | fn.Fn
									})] | fn.If
									Sources?: [...close({
										AddressDefinition: string | fn.Fn
									})] | fn.If
									TCPFlags?: [...close({
										Flags:  [...(string | fn.Fn)] | (string | fn.Fn)
										Masks?: [...(string | fn.Fn)] | (string | fn.Fn)
									})] | fn.If
								}) | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
				}) | fn.If
			}) | fn.If
			RuleGroupName: string | fn.Fn
			Tags?:         [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

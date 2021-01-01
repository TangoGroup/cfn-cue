package euwest1

import "github.com/TangoGroup/aws/fn"

#NetworkFirewall: {
	#Firewall: {
		Type:       "AWS::NetworkFirewall::Firewall"
		Properties: close({
			DeleteProtection?:               bool | fn.#Fn
			Description?:                    string | fn.#Fn
			FirewallName:                    string | fn.#Fn
			FirewallPolicyArn:               string | fn.#Fn
			FirewallPolicyChangeProtection?: bool | fn.#Fn
			SubnetChangeProtection?:         bool | fn.#Fn
			SubnetMappings:                  [...close({
				SubnetId: string | fn.#Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			VpcId: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#FirewallPolicy: {
		Type:       "AWS::NetworkFirewall::FirewallPolicy"
		Properties: close({
			Description?:   string | fn.#Fn
			FirewallPolicy: close({
				StatefulRuleGroupReferences?: close({
					StatefulRuleGroupReferences?: [...close({
						[string]: _
					})] | fn.If
				}) | fn.If
				StatelessCustomActions?: close({
					CustomActions?: [...close({
						ActionDefinition: close({
							PublishMetricAction?: close({
								Dimensions: close({
									Dimensions?: [...close({
										[string]: _
									})] | fn.If
								}) | fn.If
							}) | fn.If
						}) | fn.If
						ActionName: string | fn.#Fn
					})] | fn.If
				}) | fn.If
				StatelessDefaultActions: close({
					StatelessActions?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}) | fn.If
				StatelessFragmentDefaultActions: close({
					StatelessActions?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}) | fn.If
				StatelessRuleGroupReferences?: close({
					StatelessRuleGroupReferences?: [...close({
						[string]: _
					})] | fn.If
				}) | fn.If
			}) | fn.If
			FirewallPolicyName: string | fn.#Fn
			Tags?:              [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LoggingConfiguration: {
		Type:       "AWS::NetworkFirewall::LoggingConfiguration"
		Properties: close({
			FirewallArn:          string | fn.#Fn
			FirewallName?:        string | fn.#Fn
			LoggingConfiguration: close({
				LogDestinationConfigs: close({
					LogDestinationConfigs?: [...close({
						[string]: _
					})] | fn.If
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RuleGroup: {
		Type:       "AWS::NetworkFirewall::RuleGroup"
		Properties: close({
			Capacity:     int | fn.#Fn
			Description?: string | fn.#Fn
			RuleGroup?:   close({
				RuleVariables?: close({
					IPSets?: {
						[string]: close({
							Definition?: close({
								VariableDefinitionList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
							}) | fn.If
						})
					} | fn.If
					PortSets?: {
						[string]: close({
							Definition?: close({
								VariableDefinitionList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
							}) | fn.If
						})
					} | fn.If
				}) | fn.If
				RulesSource: close({
					RulesSourceList?: close({
						GeneratedRulesType: string | fn.#Fn
						TargetTypes:        close({
							TargetTypes?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
						Targets: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					RulesString?:   string | fn.#Fn
					StatefulRules?: close({
						StatefulRules?: [...close({
							[string]: _
						})] | fn.If
					}) | fn.If
					StatelessRulesAndCustomActions?: close({
						CustomActions?: close({
							CustomActions?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
						StatelessRules: close({
							StatelessRules?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
				}) | fn.If
			}) | fn.If
			RuleGroupName: string | fn.#Fn
			Tags?:         [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			Type: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

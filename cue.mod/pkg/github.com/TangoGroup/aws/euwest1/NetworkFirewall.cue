package euwest1

import "github.com/TangoGroup/aws/fn"

#NetworkFirewall: {
	#Firewall: {
		Type: "AWS::NetworkFirewall::Firewall"
		Properties: {
			DeleteProtection?:               bool | fn.#Fn
			Description?:                    string | fn.#Fn
			FirewallName:                    string | fn.#Fn
			FirewallPolicyArn:               string | fn.#Fn
			FirewallPolicyChangeProtection?: bool | fn.#Fn
			SubnetChangeProtection?:         bool | fn.#Fn
			SubnetMappings:                  [...{
				SubnetId: string | fn.#Fn
			}] | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			VpcId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#FirewallPolicy: {
		Type: "AWS::NetworkFirewall::FirewallPolicy"
		Properties: {
			Description?:   string | fn.#Fn
			FirewallPolicy: {
				StatefulRuleGroupReferences?: {
					StatefulRuleGroupReferences?: [...{
						[string]: _
					}] | fn.#If
				} | fn.#If
				StatelessCustomActions?: {
					CustomActions?: [...{
						ActionDefinition: {
							PublishMetricAction?: {
								Dimensions: {
									Dimensions?: [...{
										[string]: _
									}] | fn.#If
								} | fn.#If
							} | fn.#If
						} | fn.#If
						ActionName: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				StatelessDefaultActions: {
					StatelessActions?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
				StatelessFragmentDefaultActions: {
					StatelessActions?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
				StatelessRuleGroupReferences?: {
					StatelessRuleGroupReferences?: [...{
						[string]: _
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			FirewallPolicyName: string | fn.#Fn
			Tags?:              [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LoggingConfiguration: {
		Type: "AWS::NetworkFirewall::LoggingConfiguration"
		Properties: {
			FirewallArn:          string | fn.#Fn
			FirewallName?:        string | fn.#Fn
			LoggingConfiguration: {
				LogDestinationConfigs: {
					LogDestinationConfigs?: [...{
						[string]: _
					}] | fn.#If
				} | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RuleGroup: {
		Type: "AWS::NetworkFirewall::RuleGroup"
		Properties: {
			Capacity:     int | fn.#Fn
			Description?: string | fn.#Fn
			RuleGroup?:   {
				RuleVariables?: {
					IPSets?: {
						[string]: Definition?: {
							VariableDefinitionList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
					} | fn.#If
					PortSets?: {
						[string]: Definition?: {
							VariableDefinitionList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
					} | fn.#If
				} | fn.#If
				RulesSource: {
					RulesSourceList?: {
						GeneratedRulesType: string | fn.#Fn
						TargetTypes:        {
							TargetTypes?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
						Targets: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					RulesString?:   string | fn.#Fn
					StatefulRules?: {
						StatefulRules?: [...{
							[string]: _
						}] | fn.#If
					} | fn.#If
					StatelessRulesAndCustomActions?: {
						CustomActions?: {
							CustomActions?: [...{
								[string]: _
							}] | fn.#If
						} | fn.#If
						StatelessRules: {
							StatelessRules?: [...{
								[string]: _
							}] | fn.#If
						} | fn.#If
					} | fn.#If
				} | fn.#If
			} | fn.#If
			RuleGroupName: string | fn.#Fn
			Tags?:         [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			Type: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

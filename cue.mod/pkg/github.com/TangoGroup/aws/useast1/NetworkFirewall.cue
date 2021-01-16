package useast1

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
				StatefulRuleGroupReferences?: [...{
					ResourceArn: string | fn.#Fn
				}] | fn.#If
				StatelessCustomActions?: [...{
					ActionDefinition: {
						PublishMetricAction?: {
							Dimensions: [...{
								Value: string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					ActionName: string | fn.#Fn
				}] | fn.#If
				StatelessDefaultActions:         [...(string | fn.#Fn)] | (string | fn.#Fn)
				StatelessFragmentDefaultActions: [...(string | fn.#Fn)] | (string | fn.#Fn)
				StatelessRuleGroupReferences?:   [...{
					Priority:    int | fn.#Fn
					ResourceArn: string | fn.#Fn
				}] | fn.#If
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
				LogDestinationConfigs: [...{
					LogDestination: {
						[string]: string | fn.#Fn
					} | fn.#If
					LogDestinationType: string | fn.#Fn
					LogType:            string | fn.#Fn
				}] | fn.#If
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
						[string]: Definition?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					PortSets?: {
						[string]: Definition?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
				} | fn.#If
				RulesSource: {
					RulesSourceList?: {
						GeneratedRulesType: string | fn.#Fn
						TargetTypes:        [...(string | fn.#Fn)] | (string | fn.#Fn)
						Targets:            [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					RulesString?:   string | fn.#Fn
					StatefulRules?: [...{
						Action: string | fn.#Fn
						Header: {
							Destination:     string | fn.#Fn
							DestinationPort: string | fn.#Fn
							Direction:       string | fn.#Fn
							Protocol:        string | fn.#Fn
							Source:          string | fn.#Fn
							SourcePort:      string | fn.#Fn
						} | fn.#If
						RuleOptions: [...{
							Keyword:   string | fn.#Fn
							Settings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}] | fn.#If
					}] | fn.#If
					StatelessRulesAndCustomActions?: {
						CustomActions?: [...{
							ActionDefinition: {
								PublishMetricAction?: {
									Dimensions: [...{
										Value: string | fn.#Fn
									}] | fn.#If
								} | fn.#If
							} | fn.#If
							ActionName: string | fn.#Fn
						}] | fn.#If
						StatelessRules: [...{
							Priority:       int | fn.#Fn
							RuleDefinition: {
								Actions:         [...(string | fn.#Fn)] | (string | fn.#Fn)
								MatchAttributes: {
									DestinationPorts?: [...{
										FromPort: int | fn.#Fn
										ToPort:   int | fn.#Fn
									}] | fn.#If
									Destinations?: [...{
										AddressDefinition: string | fn.#Fn
									}] | fn.#If
									Protocols?:   [...(int | fn.#Fn)] | (int | fn.#Fn)
									SourcePorts?: [...{
										FromPort: int | fn.#Fn
										ToPort:   int | fn.#Fn
									}] | fn.#If
									Sources?: [...{
										AddressDefinition: string | fn.#Fn
									}] | fn.#If
									TCPFlags?: [...{
										Flags:  [...(string | fn.#Fn)] | (string | fn.#Fn)
										Masks?: [...(string | fn.#Fn)] | (string | fn.#Fn)
									}] | fn.#If
								} | fn.#If
							} | fn.#If
						}] | fn.#If
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

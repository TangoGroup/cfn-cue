package apnortheast1

import "github.com/TangoGroup/aws/fn"

SES :: {
	ConfigurationSet :: {
		Type:       "AWS::SES::ConfigurationSet"
		Properties: close({
			Name?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ConfigurationSetEventDestination :: {
		Type:       "AWS::SES::ConfigurationSetEventDestination"
		Properties: close({
			ConfigurationSetName: string | fn.Fn
			EventDestination:     close({}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReceiptFilter :: {
		Type:       "AWS::SES::ReceiptFilter"
		Properties: close({
			Filter: close({}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReceiptRule :: {
		Type:       "AWS::SES::ReceiptRule"
		Properties: close({
			After?:      string | fn.Fn
			Rule:        close({}) | fn.If
			RuleSetName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReceiptRuleSet :: {
		Type:       "AWS::SES::ReceiptRuleSet"
		Properties: close({
			RuleSetName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Template :: {
		Type:       "AWS::SES::Template"
		Properties: close({
			Template?: close({}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

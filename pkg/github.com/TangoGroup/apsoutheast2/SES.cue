package apsoutheast2

import "github.com/TangoGroup/fn"

SES :: {
	ConfigurationSet :: {
		Type: "AWS::SES::ConfigurationSet"
		Properties: Name?: string | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ConfigurationSetEventDestination :: {
		Type: "AWS::SES::ConfigurationSetEventDestination"
		Properties: {
			ConfigurationSetName: string | fn.Fn
			EventDestination: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ReceiptFilter :: {
		Type: "AWS::SES::ReceiptFilter"
		Properties: Filter: {
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ReceiptRule :: {
		Type: "AWS::SES::ReceiptRule"
		Properties: {
			After?: string | fn.Fn
			Rule: {
			}
			RuleSetName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ReceiptRuleSet :: {
		Type: "AWS::SES::ReceiptRuleSet"
		Properties: RuleSetName?: string | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Template :: {
		Type: "AWS::SES::Template"
		Properties: Template?: {
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

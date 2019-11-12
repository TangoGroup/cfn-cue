package eucentral1

import "github.com/TangoGroup/fn"

SES :: {
	ConfigurationSet :: {
		Type: "AWS::SES::ConfigurationSet"
		Properties: Name?: string | fn.Fn
	}
	ConfigurationSetEventDestination :: {
		Type: "AWS::SES::ConfigurationSetEventDestination"
		Properties: {
			ConfigurationSetName: string | fn.Fn
			EventDestination: {
			}
		}
	}
	ReceiptFilter :: {
		Type: "AWS::SES::ReceiptFilter"
		Properties: Filter: {
		}
	}
	ReceiptRule :: {
		Type: "AWS::SES::ReceiptRule"
		Properties: {
			After?: string | fn.Fn
			Rule: {
			}
			RuleSetName: string | fn.Fn
		}
	}
	ReceiptRuleSet :: {
		Type: "AWS::SES::ReceiptRuleSet"
		Properties: RuleSetName?: string | fn.Fn
	}
	Template :: {
		Type: "AWS::SES::Template"
		Properties: Template?: {
		}
	}
}

package useast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

SES :: {
	ConfigurationSet :: {
		Type:       "AWS::SES::ConfigurationSet"
		Properties: close({
			Name?: (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9_-]{1,64}$"#)) | fn.Fn
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
			EventDestination:     close({
				CloudWatchDestination?: close({
					DimensionConfigurations?: [...close({
						DefaultDimensionValue: string | fn.Fn
						DimensionName:         string | fn.Fn
						DimensionValueSource:  string | fn.Fn
					})] | fn.If
				}) | fn.If
				Enabled?:                    bool | fn.Fn
				KinesisFirehoseDestination?: close({
					DeliveryStreamARN: string | fn.Fn
					IAMRoleARN:        string | fn.Fn
				}) | fn.If
				MatchingEventTypes: [...(string | fn.Fn)] | (string | fn.Fn)
				Name?:              string | fn.Fn
			}) | fn.If
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
			Filter: close({
				IpFilter: close({
					Cidr:   (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$"#) | fn.Fn
					Policy: string | fn.Fn
				}) | fn.If
				Name?: string | fn.Fn
			}) | fn.If
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
			After?: string | fn.Fn
			Rule:   close({
				Actions?: [...close({
					AddHeaderAction?: close({
						HeaderName:  string | fn.Fn
						HeaderValue: string | fn.Fn
					}) | fn.If
					BounceAction?: close({
						Message:       string | fn.Fn
						Sender:        string | fn.Fn
						SmtpReplyCode: string | fn.Fn
						StatusCode?:   string | fn.Fn
						TopicArn?:     string | fn.Fn
					}) | fn.If
					LambdaAction?: close({
						FunctionArn:     string | fn.Fn
						InvocationType?: string | fn.Fn
						TopicArn?:       string | fn.Fn
					}) | fn.If
					S3Action?: close({
						BucketName:       string | fn.Fn
						KmsKeyArn?:       string | fn.Fn
						ObjectKeyPrefix?: string | fn.Fn
						TopicArn?:        string | fn.Fn
					}) | fn.If
					SNSAction?: close({
						Encoding?: string | fn.Fn
						TopicArn?: string | fn.Fn
					}) | fn.If
					StopAction?: close({
						Scope:     string | fn.Fn
						TopicArn?: string | fn.Fn
					}) | fn.If
					WorkmailAction?: close({
						OrganizationArn: string | fn.Fn
						TopicArn?:       string | fn.Fn
					}) | fn.If
				})] | fn.If
				Enabled?:     bool | fn.Fn
				Name?:        string | fn.Fn
				Recipients?:  [...(string | fn.Fn)] | (string | fn.Fn)
				ScanEnabled?: bool | fn.Fn
				TlsPolicy?:   ("Optional" | "Require") | fn.Fn
			}) | fn.If
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
			Template?: close({
				HtmlPart?:     string | fn.Fn
				SubjectPart?:  string | fn.Fn
				TemplateName?: string | fn.Fn
				TextPart?:     string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

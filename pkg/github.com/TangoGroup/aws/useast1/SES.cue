package useast1

import "github.com/TangoGroup/aws/fn"

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
				CloudWatchDestination?: DimensionConfigurations?: [...{
					DefaultDimensionValue: string | fn.Fn
					DimensionName:         string | fn.Fn
					DimensionValueSource:  string | fn.Fn
				}]
				Enabled?: bool | fn.Fn
				KinesisFirehoseDestination?: {
					DeliveryStreamARN: string | fn.Fn
					IAMRoleARN:        string | fn.Fn
				}
				MatchingEventTypes: [...(string | fn.Fn)]
				Name?: string | fn.Fn
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
			IpFilter: {
				Cidr:   string | fn.Fn
				Policy: string | fn.Fn
			}
			Name?: string | fn.Fn
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
				Actions?: [...{
					AddHeaderAction?: {
						HeaderName:  string | fn.Fn
						HeaderValue: string | fn.Fn
					}
					BounceAction?: {
						Message:       string | fn.Fn
						Sender:        string | fn.Fn
						SmtpReplyCode: string | fn.Fn
						StatusCode?:   string | fn.Fn
						TopicArn?:     string | fn.Fn
					}
					LambdaAction?: {
						FunctionArn:     string | fn.Fn
						InvocationType?: string | fn.Fn
						TopicArn?:       string | fn.Fn
					}
					S3Action?: {
						BucketName:       string | fn.Fn
						KmsKeyArn?:       string | fn.Fn
						ObjectKeyPrefix?: string | fn.Fn
						TopicArn?:        string | fn.Fn
					}
					SNSAction?: {
						Encoding?: string | fn.Fn
						TopicArn?: string | fn.Fn
					}
					StopAction?: {
						Scope:     string | fn.Fn
						TopicArn?: string | fn.Fn
					}
					WorkmailAction?: {
						OrganizationArn: string | fn.Fn
						TopicArn?:       string | fn.Fn
					}
				}]
				Enabled?: bool | fn.Fn
				Name?:    string | fn.Fn
				Recipients?: [...(string | fn.Fn)]
				ScanEnabled?: bool | fn.Fn
				TlsPolicy?:   (string & ("Optional" | "Require")) | fn.Fn
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
			HtmlPart?:     string | fn.Fn
			SubjectPart?:  string | fn.Fn
			TemplateName?: string | fn.Fn
			TextPart?:     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

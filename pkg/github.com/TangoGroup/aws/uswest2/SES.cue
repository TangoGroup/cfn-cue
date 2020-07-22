package uswest2

import "github.com/TangoGroup/aws/fn"

#SES: {
	#ConfigurationSet: {
		Type:       "AWS::SES::ConfigurationSet"
		Properties: close({
			Name?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ConfigurationSetEventDestination: {
		Type:       "AWS::SES::ConfigurationSetEventDestination"
		Properties: close({
			ConfigurationSetName: string | fn.#Fn
			EventDestination:     close({
				CloudWatchDestination?: close({
					DimensionConfigurations?: [...close({
						DefaultDimensionValue: string | fn.#Fn
						DimensionName:         string | fn.#Fn
						DimensionValueSource:  string | fn.#Fn
					})] | fn.If
				}) | fn.If
				Enabled?:                    bool | fn.#Fn
				KinesisFirehoseDestination?: close({
					DeliveryStreamARN: string | fn.#Fn
					IAMRoleARN:        string | fn.#Fn
				}) | fn.If
				MatchingEventTypes: [...(string | fn.#Fn)] | (string | fn.#Fn)
				Name?:              string | fn.#Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ReceiptFilter: {
		Type:       "AWS::SES::ReceiptFilter"
		Properties: close({
			Filter: close({
				IpFilter: close({
					Cidr:   string | fn.#Fn
					Policy: string | fn.#Fn
				}) | fn.If
				Name?: string | fn.#Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ReceiptRule: {
		Type:       "AWS::SES::ReceiptRule"
		Properties: close({
			After?: string | fn.#Fn
			Rule:   close({
				Actions?: [...close({
					AddHeaderAction?: close({
						HeaderName:  string | fn.#Fn
						HeaderValue: string | fn.#Fn
					}) | fn.If
					BounceAction?: close({
						Message:       string | fn.#Fn
						Sender:        string | fn.#Fn
						SmtpReplyCode: string | fn.#Fn
						StatusCode?:   string | fn.#Fn
						TopicArn?:     string | fn.#Fn
					}) | fn.If
					LambdaAction?: close({
						FunctionArn:     string | fn.#Fn
						InvocationType?: string | fn.#Fn
						TopicArn?:       string | fn.#Fn
					}) | fn.If
					S3Action?: close({
						BucketName:       string | fn.#Fn
						KmsKeyArn?:       string | fn.#Fn
						ObjectKeyPrefix?: string | fn.#Fn
						TopicArn?:        string | fn.#Fn
					}) | fn.If
					SNSAction?: close({
						Encoding?: string | fn.#Fn
						TopicArn?: string | fn.#Fn
					}) | fn.If
					StopAction?: close({
						Scope:     string | fn.#Fn
						TopicArn?: string | fn.#Fn
					}) | fn.If
					WorkmailAction?: close({
						OrganizationArn: string | fn.#Fn
						TopicArn?:       string | fn.#Fn
					}) | fn.If
				})] | fn.If
				Enabled?:     bool | fn.#Fn
				Name?:        string | fn.#Fn
				Recipients?:  [...(string | fn.#Fn)] | (string | fn.#Fn)
				ScanEnabled?: bool | fn.#Fn
				TlsPolicy?:   ("Optional" | "Require") | fn.#Fn
			}) | fn.If
			RuleSetName: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ReceiptRuleSet: {
		Type:       "AWS::SES::ReceiptRuleSet"
		Properties: close({
			RuleSetName?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Template: {
		Type:       "AWS::SES::Template"
		Properties: close({
			Template?: close({
				HtmlPart?:     string | fn.#Fn
				SubjectPart?:  string | fn.#Fn
				TemplateName?: string | fn.#Fn
				TextPart?:     string | fn.#Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

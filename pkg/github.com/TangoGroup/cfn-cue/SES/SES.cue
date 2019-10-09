package SES

import "github.com/TangoGroup/fn"

ConfigurationSet :: {
	Type: "AWS::SES::ConfigurationSet"
	Properties: {
		Name?: string | fn.Fn
	}
}
ConfigurationSetEventDestination :: {
	Type: "AWS::SES::ConfigurationSetEventDestination"
	Properties: {
		ConfigurationSetName: string | fn.Fn
		EventDestination:     __EventDestination
	}
	__CloudWatchDestination :: {
		DimensionConfigurations?: [...__DimensionConfiguration]
	}
	__DimensionConfiguration :: {
		DefaultDimensionValue: string | fn.Fn
		DimensionName:         string | fn.Fn
		DimensionValueSource:  string | fn.Fn
	}
	__EventDestination :: {
		CloudWatchDestination?:      __CloudWatchDestination
		Enabled?:                    bool | fn.Fn
		KinesisFirehoseDestination?: __KinesisFirehoseDestination
		MatchingEventTypes:          [...string] | fn.Fn
		Name?:                       string | fn.Fn
	}
	__KinesisFirehoseDestination :: {
		DeliveryStreamARN: string | fn.Fn
		IAMRoleARN:        string | fn.Fn
	}
}
ReceiptFilter :: {
	Type: "AWS::SES::ReceiptFilter"
	Properties: {
		Filter: __Filter
	}
	__Filter :: {
		IpFilter: __IpFilter
		Name?:    string | fn.Fn
	}
	__IpFilter :: {
		Cidr:   string | fn.Fn
		Policy: string | fn.Fn
	}
}
ReceiptRule :: {
	Type: "AWS::SES::ReceiptRule"
	Properties: {
		After?:      string | fn.Fn
		Rule:        __Rule
		RuleSetName: string | fn.Fn
	}
	__Action :: {
		AddHeaderAction?: __AddHeaderAction
		BounceAction?:    __BounceAction
		LambdaAction?:    __LambdaAction
		S3Action?:        __S3Action
		SNSAction?:       __SNSAction
		StopAction?:      __StopAction
		WorkmailAction?:  __WorkmailAction
	}
	__AddHeaderAction :: {
		HeaderName:  string | fn.Fn
		HeaderValue: string | fn.Fn
	}
	__BounceAction :: {
		Message:       string | fn.Fn
		Sender:        string | fn.Fn
		SmtpReplyCode: string | fn.Fn
		StatusCode?:   string | fn.Fn
		TopicArn?:     string | fn.Fn
	}
	__LambdaAction :: {
		FunctionArn:     string | fn.Fn
		InvocationType?: string | fn.Fn
		TopicArn?:       string | fn.Fn
	}
	__Rule :: {
		Actions?: [...__Action]
		Enabled?:     bool | fn.Fn
		Name?:        string | fn.Fn
		Recipients?:  [...string] | fn.Fn
		ScanEnabled?: bool | fn.Fn
		TlsPolicy?:   (string & ("Optional" | "Require")) | fn.Fn
	}
	__S3Action :: {
		BucketName:       string | fn.Fn
		KmsKeyArn?:       string | fn.Fn
		ObjectKeyPrefix?: string | fn.Fn
		TopicArn?:        string | fn.Fn
	}
	__SNSAction :: {
		Encoding?: string | fn.Fn
		TopicArn?: string | fn.Fn
	}
	__StopAction :: {
		Scope:     string | fn.Fn
		TopicArn?: string | fn.Fn
	}
	__WorkmailAction :: {
		OrganizationArn: string | fn.Fn
		TopicArn?:       string | fn.Fn
	}
}
ReceiptRuleSet :: {
	Type: "AWS::SES::ReceiptRuleSet"
	Properties: {
		RuleSetName?: string | fn.Fn
	}
}
Template :: {
	Type: "AWS::SES::Template"
	Properties: {
		Template?: __Template
	}
	__Template :: {
		HtmlPart?:     string | fn.Fn
		SubjectPart?:  string | fn.Fn
		TemplateName?: string | fn.Fn
		TextPart?:     string | fn.Fn
	}
}

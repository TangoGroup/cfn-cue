package SES

import "github.com/TangoGroup/fn"

ConfigurationSet :: {
	Type: "AWS::SES::ConfigurationSet"
	Properties: Name?: string | fn.Fn
}
ConfigurationSetEventDestination :: {
	Type: "AWS::SES::ConfigurationSetEventDestination"
	Properties: {
		ConfigurationSetName: string | fn.Fn
		EventDestination:     propEventDestination
	}
	propCloudWatchDestination :: {
		DimensionConfigurations?: [...propDimensionConfiguration]
	}
	propDimensionConfiguration :: {
		DefaultDimensionValue: string | fn.Fn
		DimensionName:         string | fn.Fn
		DimensionValueSource:  string | fn.Fn
	}
	propEventDestination :: {
		CloudWatchDestination?:      propCloudWatchDestination
		Enabled?:                    bool | fn.Fn
		KinesisFirehoseDestination?: propKinesisFirehoseDestination
		MatchingEventTypes: [...(string | fn.Fn)]
		Name?: string | fn.Fn
	}
	propKinesisFirehoseDestination :: {
		DeliveryStreamARN: string | fn.Fn
		IAMRoleARN:        string | fn.Fn
	}
}
ReceiptFilter :: {
	Type: "AWS::SES::ReceiptFilter"
	Properties: Filter: propFilter
	propFilter :: {
		IpFilter: propIpFilter
		Name?:    string | fn.Fn
	}
	propIpFilter :: {
		Cidr:   string | fn.Fn
		Policy: string | fn.Fn
	}
}
ReceiptRule :: {
	Type: "AWS::SES::ReceiptRule"
	Properties: {
		After?:      string | fn.Fn
		Rule:        propRule
		RuleSetName: string | fn.Fn
	}
	propAction :: {
		AddHeaderAction?: propAddHeaderAction
		BounceAction?:    propBounceAction
		LambdaAction?:    propLambdaAction
		S3Action?:        propS3Action
		SNSAction?:       propSNSAction
		StopAction?:      propStopAction
		WorkmailAction?:  propWorkmailAction
	}
	propAddHeaderAction :: {
		HeaderName:  string | fn.Fn
		HeaderValue: string | fn.Fn
	}
	propBounceAction :: {
		Message:       string | fn.Fn
		Sender:        string | fn.Fn
		SmtpReplyCode: string | fn.Fn
		StatusCode?:   string | fn.Fn
		TopicArn?:     string | fn.Fn
	}
	propLambdaAction :: {
		FunctionArn:     string | fn.Fn
		InvocationType?: string | fn.Fn
		TopicArn?:       string | fn.Fn
	}
	propRule :: {
		Actions?: [...propAction]
		Enabled?: bool | fn.Fn
		Name?:    string | fn.Fn
		Recipients?: [...(string | fn.Fn)]
		ScanEnabled?: bool | fn.Fn
		TlsPolicy?:   (string & ("Optional" | "Require")) | fn.Fn
	}
	propS3Action :: {
		BucketName:       string | fn.Fn
		KmsKeyArn?:       string | fn.Fn
		ObjectKeyPrefix?: string | fn.Fn
		TopicArn?:        string | fn.Fn
	}
	propSNSAction :: {
		Encoding?: string | fn.Fn
		TopicArn?: string | fn.Fn
	}
	propStopAction :: {
		Scope:     string | fn.Fn
		TopicArn?: string | fn.Fn
	}
	propWorkmailAction :: {
		OrganizationArn: string | fn.Fn
		TopicArn?:       string | fn.Fn
	}
}
ReceiptRuleSet :: {
	Type: "AWS::SES::ReceiptRuleSet"
	Properties: RuleSetName?: string | fn.Fn
}
Template :: {
	Type: "AWS::SES::Template"
	Properties: Template?: propTemplate
	propTemplate :: {
		HtmlPart?:     string | fn.Fn
		SubjectPart?:  string | fn.Fn
		TemplateName?: string | fn.Fn
		TextPart?:     string | fn.Fn
	}
}

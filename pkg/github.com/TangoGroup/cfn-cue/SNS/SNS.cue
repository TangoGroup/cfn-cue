package SNS

import "github.com/TangoGroup/fn"

Subscription :: {
	Type: "AWS::SNS::Subscription"
	Properties: {
		DeliveryPolicy?: {
		} | fn.Fn
		Endpoint?:     string | fn.Fn
		FilterPolicy?: {
		} | fn.Fn
		Protocol:            (string & ("application" | "email-json" | "email" | "http" | "https" | "lambda" | "sms" | "sqs")) | fn.Fn
		RawMessageDelivery?: bool | fn.Fn
		Region?:             string | fn.Fn
		TopicArn:            string | fn.Fn
	}
}
Topic :: {
	Type: "AWS::SNS::Topic"
	Properties: {
		DisplayName?:    string | fn.Fn
		KmsMasterKeyId?: string | fn.Fn
		Subscription?: [...__Subscription]
		Tags?: [...__Tag]
		TopicName?: string | fn.Fn
	}
	__Subscription :: {
		Endpoint: string | fn.Fn
		Protocol: string | fn.Fn
	}
}
TopicPolicy :: {
	Type: "AWS::SNS::TopicPolicy"
	Properties: {
		PolicyDocument: {
		} | fn.Fn
		Topics: [...string] | fn.Fn
	}
}

package IoT

import "github.com/TangoGroup/fn"

Certificate :: {
	Type: "AWS::IoT::Certificate"
	Properties: {
		CertificateSigningRequest: string | fn.Fn
		Status:                    string | fn.Fn
	}
}
Policy :: {
	Type: "AWS::IoT::Policy"
	Properties: {
		PolicyDocument: {
		} | fn.Fn
		PolicyName?: string | fn.Fn
	}
}
PolicyPrincipalAttachment :: {
	Type: "AWS::IoT::PolicyPrincipalAttachment"
	Properties: {
		PolicyName: string | fn.Fn
		Principal:  string | fn.Fn
	}
}
Thing :: {
	Type: "AWS::IoT::Thing"
	Properties: {
		AttributePayload?: __AttributePayload
		ThingName?:        string | fn.Fn
	}
	__AttributePayload :: {
		Attributes?: {
		}
	}
}
ThingPrincipalAttachment :: {
	Type: "AWS::IoT::ThingPrincipalAttachment"
	Properties: {
		Principal: string | fn.Fn
		ThingName: string | fn.Fn
	}
}
TopicRule :: {
	Type: "AWS::IoT::TopicRule"
	Properties: {
		RuleName?:        string | fn.Fn
		TopicRulePayload: __TopicRulePayload
	}
	__Action :: {
		CloudwatchAlarm?:  __CloudwatchAlarmAction
		CloudwatchMetric?: __CloudwatchMetricAction
		DynamoDB?:         __DynamoDBAction
		DynamoDBv2?:       __DynamoDBv2Action
		Elasticsearch?:    __ElasticsearchAction
		Firehose?:         __FirehoseAction
		IotAnalytics?:     __IotAnalyticsAction
		Kinesis?:          __KinesisAction
		Lambda?:           __LambdaAction
		Republish?:        __RepublishAction
		S3?:               __S3Action
		Sns?:              __SnsAction
		Sqs?:              __SqsAction
		StepFunctions?:    __StepFunctionsAction
	}
	__CloudwatchAlarmAction :: {
		AlarmName:   string | fn.Fn
		RoleArn:     string | fn.Fn
		StateReason: string | fn.Fn
		StateValue:  string | fn.Fn
	}
	__CloudwatchMetricAction :: {
		MetricName:       string | fn.Fn
		MetricNamespace:  string | fn.Fn
		MetricTimestamp?: string | fn.Fn
		MetricUnit:       string | fn.Fn
		MetricValue:      string | fn.Fn
		RoleArn:          string | fn.Fn
	}
	__DynamoDBAction :: {
		HashKeyField:   string | fn.Fn
		HashKeyType?:   string | fn.Fn
		HashKeyValue:   string | fn.Fn
		PayloadField?:  string | fn.Fn
		RangeKeyField?: string | fn.Fn
		RangeKeyType?:  string | fn.Fn
		RangeKeyValue?: string | fn.Fn
		RoleArn:        string | fn.Fn
		TableName:      string | fn.Fn
	}
	__DynamoDBv2Action :: {
		PutItem?: __PutItemInput
		RoleArn?: string | fn.Fn
	}
	__ElasticsearchAction :: {
		Endpoint: string | fn.Fn
		Id:       string | fn.Fn
		Index:    string | fn.Fn
		RoleArn:  string | fn.Fn
		Type:     string | fn.Fn
	}
	__FirehoseAction :: {
		DeliveryStreamName: string | fn.Fn
		RoleArn:            string | fn.Fn
		Separator?:         string | fn.Fn
	}
	__IotAnalyticsAction :: {
		ChannelName: string | fn.Fn
		RoleArn:     string | fn.Fn
	}
	__KinesisAction :: {
		PartitionKey?: string | fn.Fn
		RoleArn:       string | fn.Fn
		StreamName:    string | fn.Fn
	}
	__LambdaAction :: {
		FunctionArn?: string | fn.Fn
	}
	__PutItemInput :: {
		TableName: string | fn.Fn
	}
	__RepublishAction :: {
		RoleArn: string | fn.Fn
		Topic:   string | fn.Fn
	}
	__S3Action :: {
		BucketName: string | fn.Fn
		Key:        string | fn.Fn
		RoleArn:    string | fn.Fn
	}
	__SnsAction :: {
		MessageFormat?: string | fn.Fn
		RoleArn:        string | fn.Fn
		TargetArn:      string | fn.Fn
	}
	__SqsAction :: {
		QueueUrl:   string | fn.Fn
		RoleArn:    string | fn.Fn
		UseBase64?: bool | fn.Fn
	}
	__StepFunctionsAction :: {
		ExecutionNamePrefix?: string | fn.Fn
		RoleArn:              string | fn.Fn
		StateMachineName:     string | fn.Fn
	}
	__TopicRulePayload :: {
		Actions: [...__Action]
		AwsIotSqlVersion?: string | fn.Fn
		Description?:      string | fn.Fn
		ErrorAction?:      __Action
		RuleDisabled:      bool | fn.Fn
		Sql:               string | fn.Fn
	}
}

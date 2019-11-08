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
		AttributePayload?: propAttributePayload
		ThingName?:        string | fn.Fn
	}
	propAttributePayload :: {
		Attributes?: [string]: string | fn.Fn
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
		TopicRulePayload: propTopicRulePayload
	}
	propAction :: {
		CloudwatchAlarm?:  propCloudwatchAlarmAction
		CloudwatchMetric?: propCloudwatchMetricAction
		DynamoDB?:         propDynamoDBAction
		DynamoDBv2?:       propDynamoDBv2Action
		Elasticsearch?:    propElasticsearchAction
		Firehose?:         propFirehoseAction
		IotAnalytics?:     propIotAnalyticsAction
		Kinesis?:          propKinesisAction
		Lambda?:           propLambdaAction
		Republish?:        propRepublishAction
		S3?:               propS3Action
		Sns?:              propSnsAction
		Sqs?:              propSqsAction
		StepFunctions?:    propStepFunctionsAction
	}
	propCloudwatchAlarmAction :: {
		AlarmName:   string | fn.Fn
		RoleArn:     string | fn.Fn
		StateReason: string | fn.Fn
		StateValue:  string | fn.Fn
	}
	propCloudwatchMetricAction :: {
		MetricName:       string | fn.Fn
		MetricNamespace:  string | fn.Fn
		MetricTimestamp?: string | fn.Fn
		MetricUnit:       string | fn.Fn
		MetricValue:      string | fn.Fn
		RoleArn:          string | fn.Fn
	}
	propDynamoDBAction :: {
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
	propDynamoDBv2Action :: {
		PutItem?: propPutItemInput
		RoleArn?: string | fn.Fn
	}
	propElasticsearchAction :: {
		Endpoint: string | fn.Fn
		Id:       string | fn.Fn
		Index:    string | fn.Fn
		RoleArn:  string | fn.Fn
		Type:     string | fn.Fn
	}
	propFirehoseAction :: {
		DeliveryStreamName: string | fn.Fn
		RoleArn:            string | fn.Fn
		Separator?:         string | fn.Fn
	}
	propIotAnalyticsAction :: {
		ChannelName: string | fn.Fn
		RoleArn:     string | fn.Fn
	}
	propKinesisAction :: {
		PartitionKey?: string | fn.Fn
		RoleArn:       string | fn.Fn
		StreamName:    string | fn.Fn
	}
	propLambdaAction :: {
		FunctionArn?: string | fn.Fn
	}
	propPutItemInput :: {
		TableName: string | fn.Fn
	}
	propRepublishAction :: {
		RoleArn: string | fn.Fn
		Topic:   string | fn.Fn
	}
	propS3Action :: {
		BucketName: string | fn.Fn
		Key:        string | fn.Fn
		RoleArn:    string | fn.Fn
	}
	propSnsAction :: {
		MessageFormat?: string | fn.Fn
		RoleArn:        string | fn.Fn
		TargetArn:      string | fn.Fn
	}
	propSqsAction :: {
		QueueUrl:   string | fn.Fn
		RoleArn:    string | fn.Fn
		UseBase64?: bool | fn.Fn
	}
	propStepFunctionsAction :: {
		ExecutionNamePrefix?: string | fn.Fn
		RoleArn:              string | fn.Fn
		StateMachineName:     string | fn.Fn
	}
	propTopicRulePayload :: {
		Actions: [...propAction]
		AwsIotSqlVersion?: string | fn.Fn
		Description?:      string | fn.Fn
		ErrorAction?:      propAction
		RuleDisabled:      bool | fn.Fn
		Sql:               string | fn.Fn
	}
}

package IoT

Certificate :: {
	Type: "AWS::IoT::Certificate"
	Properties: {
		CertificateSigningRequest: string
		Status:                    string
	}
}
Policy :: {
	Type: "AWS::IoT::Policy"
	Properties: {
		PolicyDocument: {
		}
		PolicyName?: string
	}
}
PolicyPrincipalAttachment :: {
	Type: "AWS::IoT::PolicyPrincipalAttachment"
	Properties: {
		PolicyName: string
		Principal:  string
	}
}
Thing :: {
	Type: "AWS::IoT::Thing"
	Properties: {
		AttributePayload?: __AttributePayload
		ThingName?:        string
	}
	__AttributePayload = {
		Attributes?: {
		}
	}
}
ThingPrincipalAttachment :: {
	Type: "AWS::IoT::ThingPrincipalAttachment"
	Properties: {
		Principal: string
		ThingName: string
	}
}
TopicRule :: {
	Type: "AWS::IoT::TopicRule"
	Properties: {
		RuleName?:        string
		TopicRulePayload: __TopicRulePayload
	}
	__Action = {
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
	__CloudwatchAlarmAction = {
		AlarmName:   string
		RoleArn:     string
		StateReason: string
		StateValue:  string
	}
	__CloudwatchMetricAction = {
		MetricName:       string
		MetricNamespace:  string
		MetricTimestamp?: string
		MetricUnit:       string
		MetricValue:      string
		RoleArn:          string
	}
	__DynamoDBAction = {
		HashKeyField:   string
		HashKeyType?:   string
		HashKeyValue:   string
		PayloadField?:  string
		RangeKeyField?: string
		RangeKeyType?:  string
		RangeKeyValue?: string
		RoleArn:        string
		TableName:      string
	}
	__DynamoDBv2Action = {
		PutItem?: __PutItemInput
		RoleArn?: string
	}
	__ElasticsearchAction = {
		Endpoint: string
		Id:       string
		Index:    string
		RoleArn:  string
		Type:     string
	}
	__FirehoseAction = {
		DeliveryStreamName: string
		RoleArn:            string
		Separator?:         string
	}
	__IotAnalyticsAction = {
		ChannelName: string
		RoleArn:     string
	}
	__KinesisAction = {
		PartitionKey?: string
		RoleArn:       string
		StreamName:    string
	}
	__LambdaAction = {
		FunctionArn?: string
	}
	__PutItemInput = {
		TableName: string
	}
	__RepublishAction = {
		RoleArn: string
		Topic:   string
	}
	__S3Action = {
		BucketName: string
		Key:        string
		RoleArn:    string
	}
	__SnsAction = {
		MessageFormat?: string
		RoleArn:        string
		TargetArn:      string
	}
	__SqsAction = {
		QueueUrl:   string
		RoleArn:    string
		UseBase64?: bool
	}
	__StepFunctionsAction = {
		ExecutionNamePrefix?: string
		RoleArn:              string
		StateMachineName:     string
	}
	__TopicRulePayload = {
		Actions: [...__Action]
		AwsIotSqlVersion?: string
		Description?:      string
		ErrorAction?:      __Action
		RuleDisabled:      bool
		Sql:               string
	}
}

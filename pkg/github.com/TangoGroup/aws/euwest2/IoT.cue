package euwest2

import "github.com/TangoGroup/aws/fn"

IoT :: {
	Certificate :: {
		Type: "AWS::IoT::Certificate"
		Properties: {
			CertificateSigningRequest: string | fn.Fn
			Status:                    string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Policy :: {
		Type: "AWS::IoT::Policy"
		Properties: {
			PolicyDocument: {
				[string]: _
				Version:  string | *"2012-10-17"
			} | fn.Fn
			PolicyName?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PolicyPrincipalAttachment :: {
		Type: "AWS::IoT::PolicyPrincipalAttachment"
		Properties: {
			PolicyName: string | fn.Fn
			Principal:  string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Thing :: {
		Type: "AWS::IoT::Thing"
		Properties: {
			AttributePayload?: close({
				Attributes?: {
					[string]: string | fn.Fn
				} | fn.If
			}) | fn.If
			ThingName?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ThingPrincipalAttachment :: {
		Type: "AWS::IoT::ThingPrincipalAttachment"
		Properties: {
			Principal: string | fn.Fn
			ThingName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TopicRule :: {
		Type: "AWS::IoT::TopicRule"
		Properties: {
			RuleName?:        string | fn.Fn
			TopicRulePayload: close({
				Actions: [...close({
					CloudwatchAlarm?: close({
						AlarmName:   string | fn.Fn
						RoleArn:     string | fn.Fn
						StateReason: string | fn.Fn
						StateValue:  string | fn.Fn
					}) | fn.If
					CloudwatchMetric?: close({
						MetricName:       string | fn.Fn
						MetricNamespace:  string | fn.Fn
						MetricTimestamp?: string | fn.Fn
						MetricUnit:       string | fn.Fn
						MetricValue:      string | fn.Fn
						RoleArn:          string | fn.Fn
					}) | fn.If
					DynamoDB?: close({
						HashKeyField:   string | fn.Fn
						HashKeyType?:   string | fn.Fn
						HashKeyValue:   string | fn.Fn
						PayloadField?:  string | fn.Fn
						RangeKeyField?: string | fn.Fn
						RangeKeyType?:  string | fn.Fn
						RangeKeyValue?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TableName:      string | fn.Fn
					}) | fn.If
					DynamoDBv2?: close({
						PutItem?: close({
							TableName: string | fn.Fn
						}) | fn.If
						RoleArn?: string | fn.Fn
					}) | fn.If
					Elasticsearch?: close({
						Endpoint: string | fn.Fn
						Id:       string | fn.Fn
						Index:    string | fn.Fn
						RoleArn:  string | fn.Fn
						Type:     string | fn.Fn
					}) | fn.If
					Firehose?: close({
						DeliveryStreamName: string | fn.Fn
						RoleArn:            string | fn.Fn
						Separator?:         string | fn.Fn
					}) | fn.If
					IotAnalytics?: close({
						ChannelName: string | fn.Fn
						RoleArn:     string | fn.Fn
					}) | fn.If
					Kinesis?: close({
						PartitionKey?: string | fn.Fn
						RoleArn:       string | fn.Fn
						StreamName:    string | fn.Fn
					}) | fn.If
					Lambda?: close({
						FunctionArn?: string | fn.Fn
					}) | fn.If
					Republish?: close({
						RoleArn: string | fn.Fn
						Topic:   string | fn.Fn
					}) | fn.If
					S3?: close({
						BucketName: string | fn.Fn
						Key:        string | fn.Fn
						RoleArn:    string | fn.Fn
					}) | fn.If
					Sns?: close({
						MessageFormat?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TargetArn:      string | fn.Fn
					}) | fn.If
					Sqs?: close({
						QueueUrl:   string | fn.Fn
						RoleArn:    string | fn.Fn
						UseBase64?: bool | fn.Fn
					}) | fn.If
					StepFunctions?: close({
						ExecutionNamePrefix?: string | fn.Fn
						RoleArn:              string | fn.Fn
						StateMachineName:     string | fn.Fn
					}) | fn.If
				})] | fn.If
				AwsIotSqlVersion?: string | fn.Fn
				Description?:      string | fn.Fn
				ErrorAction?:      close({
					CloudwatchAlarm?: close({
						AlarmName:   string | fn.Fn
						RoleArn:     string | fn.Fn
						StateReason: string | fn.Fn
						StateValue:  string | fn.Fn
					}) | fn.If
					CloudwatchMetric?: close({
						MetricName:       string | fn.Fn
						MetricNamespace:  string | fn.Fn
						MetricTimestamp?: string | fn.Fn
						MetricUnit:       string | fn.Fn
						MetricValue:      string | fn.Fn
						RoleArn:          string | fn.Fn
					}) | fn.If
					DynamoDB?: close({
						HashKeyField:   string | fn.Fn
						HashKeyType?:   string | fn.Fn
						HashKeyValue:   string | fn.Fn
						PayloadField?:  string | fn.Fn
						RangeKeyField?: string | fn.Fn
						RangeKeyType?:  string | fn.Fn
						RangeKeyValue?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TableName:      string | fn.Fn
					}) | fn.If
					DynamoDBv2?: close({
						PutItem?: close({
							TableName: string | fn.Fn
						}) | fn.If
						RoleArn?: string | fn.Fn
					}) | fn.If
					Elasticsearch?: close({
						Endpoint: string | fn.Fn
						Id:       string | fn.Fn
						Index:    string | fn.Fn
						RoleArn:  string | fn.Fn
						Type:     string | fn.Fn
					}) | fn.If
					Firehose?: close({
						DeliveryStreamName: string | fn.Fn
						RoleArn:            string | fn.Fn
						Separator?:         string | fn.Fn
					}) | fn.If
					IotAnalytics?: close({
						ChannelName: string | fn.Fn
						RoleArn:     string | fn.Fn
					}) | fn.If
					Kinesis?: close({
						PartitionKey?: string | fn.Fn
						RoleArn:       string | fn.Fn
						StreamName:    string | fn.Fn
					}) | fn.If
					Lambda?: close({
						FunctionArn?: string | fn.Fn
					}) | fn.If
					Republish?: close({
						RoleArn: string | fn.Fn
						Topic:   string | fn.Fn
					}) | fn.If
					S3?: close({
						BucketName: string | fn.Fn
						Key:        string | fn.Fn
						RoleArn:    string | fn.Fn
					}) | fn.If
					Sns?: close({
						MessageFormat?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TargetArn:      string | fn.Fn
					}) | fn.If
					Sqs?: close({
						QueueUrl:   string | fn.Fn
						RoleArn:    string | fn.Fn
						UseBase64?: bool | fn.Fn
					}) | fn.If
					StepFunctions?: close({
						ExecutionNamePrefix?: string | fn.Fn
						RoleArn:              string | fn.Fn
						StateMachineName:     string | fn.Fn
					}) | fn.If
				}) | fn.If
				RuleDisabled: bool | fn.Fn
				Sql:          string | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

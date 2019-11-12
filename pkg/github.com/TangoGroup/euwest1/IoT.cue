package euwest1

import "github.com/TangoGroup/fn"

IoT :: {
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
				[string]: _
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
			AttributePayload?: Attributes?: [string]: string | fn.Fn
			ThingName?: string | fn.Fn
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
			RuleName?: string | fn.Fn
			TopicRulePayload: {
				Actions: [...{
					CloudwatchAlarm?: {
						AlarmName:   string | fn.Fn
						RoleArn:     string | fn.Fn
						StateReason: string | fn.Fn
						StateValue:  string | fn.Fn
					}
					CloudwatchMetric?: {
						MetricName:       string | fn.Fn
						MetricNamespace:  string | fn.Fn
						MetricTimestamp?: string | fn.Fn
						MetricUnit:       string | fn.Fn
						MetricValue:      string | fn.Fn
						RoleArn:          string | fn.Fn
					}
					DynamoDB?: {
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
					DynamoDBv2?: {
						PutItem?: TableName: string | fn.Fn
						RoleArn?: string | fn.Fn
					}
					Elasticsearch?: {
						Endpoint: string | fn.Fn
						Id:       string | fn.Fn
						Index:    string | fn.Fn
						RoleArn:  string | fn.Fn
						Type:     string | fn.Fn
					}
					Firehose?: {
						DeliveryStreamName: string | fn.Fn
						RoleArn:            string | fn.Fn
						Separator?:         string | fn.Fn
					}
					IotAnalytics?: {
						ChannelName: string | fn.Fn
						RoleArn:     string | fn.Fn
					}
					Kinesis?: {
						PartitionKey?: string | fn.Fn
						RoleArn:       string | fn.Fn
						StreamName:    string | fn.Fn
					}
					Lambda?: FunctionArn?: string | fn.Fn
					Republish?: {
						RoleArn: string | fn.Fn
						Topic:   string | fn.Fn
					}
					S3?: {
						BucketName: string | fn.Fn
						Key:        string | fn.Fn
						RoleArn:    string | fn.Fn
					}
					Sns?: {
						MessageFormat?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TargetArn:      string | fn.Fn
					}
					Sqs?: {
						QueueUrl:   string | fn.Fn
						RoleArn:    string | fn.Fn
						UseBase64?: bool | fn.Fn
					}
					StepFunctions?: {
						ExecutionNamePrefix?: string | fn.Fn
						RoleArn:              string | fn.Fn
						StateMachineName:     string | fn.Fn
					}
				}]
				AwsIotSqlVersion?: string | fn.Fn
				Description?:      string | fn.Fn
				ErrorAction?: {
					CloudwatchAlarm?: {
						AlarmName:   string | fn.Fn
						RoleArn:     string | fn.Fn
						StateReason: string | fn.Fn
						StateValue:  string | fn.Fn
					}
					CloudwatchMetric?: {
						MetricName:       string | fn.Fn
						MetricNamespace:  string | fn.Fn
						MetricTimestamp?: string | fn.Fn
						MetricUnit:       string | fn.Fn
						MetricValue:      string | fn.Fn
						RoleArn:          string | fn.Fn
					}
					DynamoDB?: {
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
					DynamoDBv2?: {
						PutItem?: TableName: string | fn.Fn
						RoleArn?: string | fn.Fn
					}
					Elasticsearch?: {
						Endpoint: string | fn.Fn
						Id:       string | fn.Fn
						Index:    string | fn.Fn
						RoleArn:  string | fn.Fn
						Type:     string | fn.Fn
					}
					Firehose?: {
						DeliveryStreamName: string | fn.Fn
						RoleArn:            string | fn.Fn
						Separator?:         string | fn.Fn
					}
					IotAnalytics?: {
						ChannelName: string | fn.Fn
						RoleArn:     string | fn.Fn
					}
					Kinesis?: {
						PartitionKey?: string | fn.Fn
						RoleArn:       string | fn.Fn
						StreamName:    string | fn.Fn
					}
					Lambda?: FunctionArn?: string | fn.Fn
					Republish?: {
						RoleArn: string | fn.Fn
						Topic:   string | fn.Fn
					}
					S3?: {
						BucketName: string | fn.Fn
						Key:        string | fn.Fn
						RoleArn:    string | fn.Fn
					}
					Sns?: {
						MessageFormat?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TargetArn:      string | fn.Fn
					}
					Sqs?: {
						QueueUrl:   string | fn.Fn
						RoleArn:    string | fn.Fn
						UseBase64?: bool | fn.Fn
					}
					StepFunctions?: {
						ExecutionNamePrefix?: string | fn.Fn
						RoleArn:              string | fn.Fn
						StateMachineName:     string | fn.Fn
					}
				}
				RuleDisabled: bool | fn.Fn
				Sql:          string | fn.Fn
			}
		}
	}
}

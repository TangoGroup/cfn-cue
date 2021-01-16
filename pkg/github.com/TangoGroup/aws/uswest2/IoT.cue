package uswest2

import "github.com/TangoGroup/aws/fn"

IoT :: {
	Authorizer :: {
		Type:       "AWS::IoT::Authorizer"
		Properties: close({
			AuthorizerFunctionArn: string | fn.Fn
			AuthorizerName?:       string | fn.Fn
			SigningDisabled?:      bool | fn.Fn
			Status?:               string | fn.Fn
			Tags?:                 [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TokenKeyName?:           string | fn.Fn
			TokenSigningPublicKeys?: {
				[string]: string | fn.Fn
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Certificate :: {
		Type:       "AWS::IoT::Certificate"
		Properties: close({
			CACertificatePem?:          string | fn.Fn
			CertificateMode?:           string | fn.Fn
			CertificatePem?:            string | fn.Fn
			CertificateSigningRequest?: string | fn.Fn
			Status:                     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Policy :: {
		Type:       "AWS::IoT::Policy"
		Properties: close({
			PolicyDocument: {
				[string]: _
				Version:  string | *"2012-10-17"
			} | fn.Fn
			PolicyName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PolicyPrincipalAttachment :: {
		Type:       "AWS::IoT::PolicyPrincipalAttachment"
		Properties: close({
			PolicyName: string | fn.Fn
			Principal:  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ProvisioningTemplate :: {
		Type:       "AWS::IoT::ProvisioningTemplate"
		Properties: close({
			Description?:         string | fn.Fn
			Enabled?:             bool | fn.Fn
			PreProvisioningHook?: close({
				PayloadVersion?: string | fn.Fn
				TargetArn?:      string | fn.Fn
			}) | fn.If
			ProvisioningRoleArn: string | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TemplateBody:  string | fn.Fn
			TemplateName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Thing :: {
		Type:       "AWS::IoT::Thing"
		Properties: close({
			AttributePayload?: close({
				Attributes?: {
					[string]: string | fn.Fn
				} | fn.If
			}) | fn.If
			ThingName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ThingPrincipalAttachment :: {
		Type:       "AWS::IoT::ThingPrincipalAttachment"
		Properties: close({
			Principal: string | fn.Fn
			ThingName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TopicRule :: {
		Type:       "AWS::IoT::TopicRule"
		Properties: close({
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
					Http?: close({
						Auth?: close({
							Sigv4?: close({
								RoleArn:       string | fn.Fn
								ServiceName:   string | fn.Fn
								SigningRegion: string | fn.Fn
							}) | fn.If
						}) | fn.If
						ConfirmationUrl?: string | fn.Fn
						Headers?:         [...close({
							Key:   string | fn.Fn
							Value: string | fn.Fn
						})] | fn.If
						Url: string | fn.Fn
					}) | fn.If
					IotAnalytics?: close({
						ChannelName: string | fn.Fn
						RoleArn:     string | fn.Fn
					}) | fn.If
					IotEvents?: close({
						InputName:  string | fn.Fn
						MessageId?: string | fn.Fn
						RoleArn:    string | fn.Fn
					}) | fn.If
					IotSiteWise?: close({
						PutAssetPropertyValueEntries: [...close({
							AssetId?:       string | fn.Fn
							EntryId?:       string | fn.Fn
							PropertyAlias?: string | fn.Fn
							PropertyId?:    string | fn.Fn
							PropertyValues: [...close({
								Quality?:  string | fn.Fn
								Timestamp: close({
									OffsetInNanos?: string | fn.Fn
									TimeInSeconds:  string | fn.Fn
								}) | fn.If
								Value: close({
									BooleanValue?: string | fn.Fn
									DoubleValue?:  string | fn.Fn
									IntegerValue?: string | fn.Fn
									StringValue?:  string | fn.Fn
								}) | fn.If
							})] | fn.If
						})] | fn.If
						RoleArn: string | fn.Fn
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
						Qos?:    int | fn.Fn
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
					Http?: close({
						Auth?: close({
							Sigv4?: close({
								RoleArn:       string | fn.Fn
								ServiceName:   string | fn.Fn
								SigningRegion: string | fn.Fn
							}) | fn.If
						}) | fn.If
						ConfirmationUrl?: string | fn.Fn
						Headers?:         [...close({
							Key:   string | fn.Fn
							Value: string | fn.Fn
						})] | fn.If
						Url: string | fn.Fn
					}) | fn.If
					IotAnalytics?: close({
						ChannelName: string | fn.Fn
						RoleArn:     string | fn.Fn
					}) | fn.If
					IotEvents?: close({
						InputName:  string | fn.Fn
						MessageId?: string | fn.Fn
						RoleArn:    string | fn.Fn
					}) | fn.If
					IotSiteWise?: close({
						PutAssetPropertyValueEntries: [...close({
							AssetId?:       string | fn.Fn
							EntryId?:       string | fn.Fn
							PropertyAlias?: string | fn.Fn
							PropertyId?:    string | fn.Fn
							PropertyValues: [...close({
								Quality?:  string | fn.Fn
								Timestamp: close({
									OffsetInNanos?: string | fn.Fn
									TimeInSeconds:  string | fn.Fn
								}) | fn.If
								Value: close({
									BooleanValue?: string | fn.Fn
									DoubleValue?:  string | fn.Fn
									IntegerValue?: string | fn.Fn
									StringValue?:  string | fn.Fn
								}) | fn.If
							})] | fn.If
						})] | fn.If
						RoleArn: string | fn.Fn
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
						Qos?:    int | fn.Fn
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
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TopicRuleDestination :: {
		Type:       "AWS::IoT::TopicRuleDestination"
		Properties: close({
			HttpUrlProperties?: close({
				ConfirmationUrl?: string | fn.Fn
			}) | fn.If
			Status?:        string | fn.Fn
			VpcProperties?: close({
				RoleArn?:        string | fn.Fn
				SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetIds?:      [...(string | fn.Fn)] | (string | fn.Fn)
				VpcId?:          string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

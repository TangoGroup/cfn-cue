package apnortheast1

import "github.com/TangoGroup/aws/fn"

#IoTEvents: {
	#DetectorModel: {
		Type:       "AWS::IoTEvents::DetectorModel"
		Properties: close({
			DetectorModelDefinition?: close({
				InitialStateName?: string | fn.#Fn
				States?:           [...close({
					OnEnter?: close({
						Events?: [...close({
							Actions?: [...close({
								ClearTimer?: close({
									TimerName?: string | fn.#Fn
								}) | fn.If
								DynamoDB?: close({
									HashKeyField?: string | fn.#Fn
									HashKeyType?:  string | fn.#Fn
									HashKeyValue?: string | fn.#Fn
									Operation?:    string | fn.#Fn
									Payload?:      close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									PayloadField?:  string | fn.#Fn
									RangeKeyField?: string | fn.#Fn
									RangeKeyType?:  string | fn.#Fn
									RangeKeyValue?: string | fn.#Fn
									TableName?:     string | fn.#Fn
								}) | fn.If
								DynamoDBv2?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									TableName?: string | fn.#Fn
								}) | fn.If
								Firehose?: close({
									DeliveryStreamName?: string | fn.#Fn
									Payload?:            close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									Separator?: string | fn.#Fn
								}) | fn.If
								IotEvents?: close({
									InputName?: string | fn.#Fn
									Payload?:   close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								IotSiteWise?: close({
									AssetId?:       string | fn.#Fn
									EntryId?:       string | fn.#Fn
									PropertyAlias?: string | fn.#Fn
									PropertyId?:    string | fn.#Fn
									PropertyValue?: close({
										Quality?:   string | fn.#Fn
										Timestamp?: close({
											OffsetInNanos?: string | fn.#Fn
											TimeInSeconds?: string | fn.#Fn
										}) | fn.If
										Value?: close({
											BooleanValue?: string | fn.#Fn
											DoubleValue?:  string | fn.#Fn
											IntegerValue?: string | fn.#Fn
											StringValue?:  string | fn.#Fn
										}) | fn.If
									}) | fn.If
								}) | fn.If
								IotTopicPublish?: close({
									MqttTopic?: string | fn.#Fn
									Payload?:   close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								Lambda?: close({
									FunctionArn?: string | fn.#Fn
									Payload?:     close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								ResetTimer?: close({
									TimerName?: string | fn.#Fn
								}) | fn.If
								SetTimer?: close({
									DurationExpression?: string | fn.#Fn
									Seconds?:            int | fn.#Fn
									TimerName?:          string | fn.#Fn
								}) | fn.If
								SetVariable?: close({
									Value?:        string | fn.#Fn
									VariableName?: string | fn.#Fn
								}) | fn.If
								Sns?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									TargetArn?: string | fn.#Fn
								}) | fn.If
								Sqs?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									QueueUrl?:  string | fn.#Fn
									UseBase64?: bool | fn.#Fn
								}) | fn.If
							})] | fn.If
							Condition?: string | fn.#Fn
							EventName?: string | fn.#Fn
						})] | fn.If
					}) | fn.If
					OnExit?: close({
						Events?: [...close({
							Actions?: [...close({
								ClearTimer?: close({
									TimerName?: string | fn.#Fn
								}) | fn.If
								DynamoDB?: close({
									HashKeyField?: string | fn.#Fn
									HashKeyType?:  string | fn.#Fn
									HashKeyValue?: string | fn.#Fn
									Operation?:    string | fn.#Fn
									Payload?:      close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									PayloadField?:  string | fn.#Fn
									RangeKeyField?: string | fn.#Fn
									RangeKeyType?:  string | fn.#Fn
									RangeKeyValue?: string | fn.#Fn
									TableName?:     string | fn.#Fn
								}) | fn.If
								DynamoDBv2?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									TableName?: string | fn.#Fn
								}) | fn.If
								Firehose?: close({
									DeliveryStreamName?: string | fn.#Fn
									Payload?:            close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									Separator?: string | fn.#Fn
								}) | fn.If
								IotEvents?: close({
									InputName?: string | fn.#Fn
									Payload?:   close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								IotSiteWise?: close({
									AssetId?:       string | fn.#Fn
									EntryId?:       string | fn.#Fn
									PropertyAlias?: string | fn.#Fn
									PropertyId?:    string | fn.#Fn
									PropertyValue?: close({
										Quality?:   string | fn.#Fn
										Timestamp?: close({
											OffsetInNanos?: string | fn.#Fn
											TimeInSeconds?: string | fn.#Fn
										}) | fn.If
										Value?: close({
											BooleanValue?: string | fn.#Fn
											DoubleValue?:  string | fn.#Fn
											IntegerValue?: string | fn.#Fn
											StringValue?:  string | fn.#Fn
										}) | fn.If
									}) | fn.If
								}) | fn.If
								IotTopicPublish?: close({
									MqttTopic?: string | fn.#Fn
									Payload?:   close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								Lambda?: close({
									FunctionArn?: string | fn.#Fn
									Payload?:     close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								ResetTimer?: close({
									TimerName?: string | fn.#Fn
								}) | fn.If
								SetTimer?: close({
									DurationExpression?: string | fn.#Fn
									Seconds?:            int | fn.#Fn
									TimerName?:          string | fn.#Fn
								}) | fn.If
								SetVariable?: close({
									Value?:        string | fn.#Fn
									VariableName?: string | fn.#Fn
								}) | fn.If
								Sns?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									TargetArn?: string | fn.#Fn
								}) | fn.If
								Sqs?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									QueueUrl?:  string | fn.#Fn
									UseBase64?: bool | fn.#Fn
								}) | fn.If
							})] | fn.If
							Condition?: string | fn.#Fn
							EventName?: string | fn.#Fn
						})] | fn.If
					}) | fn.If
					OnInput?: close({
						Events?: [...close({
							Actions?: [...close({
								ClearTimer?: close({
									TimerName?: string | fn.#Fn
								}) | fn.If
								DynamoDB?: close({
									HashKeyField?: string | fn.#Fn
									HashKeyType?:  string | fn.#Fn
									HashKeyValue?: string | fn.#Fn
									Operation?:    string | fn.#Fn
									Payload?:      close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									PayloadField?:  string | fn.#Fn
									RangeKeyField?: string | fn.#Fn
									RangeKeyType?:  string | fn.#Fn
									RangeKeyValue?: string | fn.#Fn
									TableName?:     string | fn.#Fn
								}) | fn.If
								DynamoDBv2?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									TableName?: string | fn.#Fn
								}) | fn.If
								Firehose?: close({
									DeliveryStreamName?: string | fn.#Fn
									Payload?:            close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									Separator?: string | fn.#Fn
								}) | fn.If
								IotEvents?: close({
									InputName?: string | fn.#Fn
									Payload?:   close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								IotSiteWise?: close({
									AssetId?:       string | fn.#Fn
									EntryId?:       string | fn.#Fn
									PropertyAlias?: string | fn.#Fn
									PropertyId?:    string | fn.#Fn
									PropertyValue?: close({
										Quality?:   string | fn.#Fn
										Timestamp?: close({
											OffsetInNanos?: string | fn.#Fn
											TimeInSeconds?: string | fn.#Fn
										}) | fn.If
										Value?: close({
											BooleanValue?: string | fn.#Fn
											DoubleValue?:  string | fn.#Fn
											IntegerValue?: string | fn.#Fn
											StringValue?:  string | fn.#Fn
										}) | fn.If
									}) | fn.If
								}) | fn.If
								IotTopicPublish?: close({
									MqttTopic?: string | fn.#Fn
									Payload?:   close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								Lambda?: close({
									FunctionArn?: string | fn.#Fn
									Payload?:     close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								ResetTimer?: close({
									TimerName?: string | fn.#Fn
								}) | fn.If
								SetTimer?: close({
									DurationExpression?: string | fn.#Fn
									Seconds?:            int | fn.#Fn
									TimerName?:          string | fn.#Fn
								}) | fn.If
								SetVariable?: close({
									Value?:        string | fn.#Fn
									VariableName?: string | fn.#Fn
								}) | fn.If
								Sns?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									TargetArn?: string | fn.#Fn
								}) | fn.If
								Sqs?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									QueueUrl?:  string | fn.#Fn
									UseBase64?: bool | fn.#Fn
								}) | fn.If
							})] | fn.If
							Condition?: string | fn.#Fn
							EventName?: string | fn.#Fn
						})] | fn.If
						TransitionEvents?: [...close({
							Actions?: [...close({
								ClearTimer?: close({
									TimerName?: string | fn.#Fn
								}) | fn.If
								DynamoDB?: close({
									HashKeyField?: string | fn.#Fn
									HashKeyType?:  string | fn.#Fn
									HashKeyValue?: string | fn.#Fn
									Operation?:    string | fn.#Fn
									Payload?:      close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									PayloadField?:  string | fn.#Fn
									RangeKeyField?: string | fn.#Fn
									RangeKeyType?:  string | fn.#Fn
									RangeKeyValue?: string | fn.#Fn
									TableName?:     string | fn.#Fn
								}) | fn.If
								DynamoDBv2?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									TableName?: string | fn.#Fn
								}) | fn.If
								Firehose?: close({
									DeliveryStreamName?: string | fn.#Fn
									Payload?:            close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									Separator?: string | fn.#Fn
								}) | fn.If
								IotEvents?: close({
									InputName?: string | fn.#Fn
									Payload?:   close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								IotSiteWise?: close({
									AssetId?:       string | fn.#Fn
									EntryId?:       string | fn.#Fn
									PropertyAlias?: string | fn.#Fn
									PropertyId?:    string | fn.#Fn
									PropertyValue?: close({
										Quality?:   string | fn.#Fn
										Timestamp?: close({
											OffsetInNanos?: string | fn.#Fn
											TimeInSeconds?: string | fn.#Fn
										}) | fn.If
										Value?: close({
											BooleanValue?: string | fn.#Fn
											DoubleValue?:  string | fn.#Fn
											IntegerValue?: string | fn.#Fn
											StringValue?:  string | fn.#Fn
										}) | fn.If
									}) | fn.If
								}) | fn.If
								IotTopicPublish?: close({
									MqttTopic?: string | fn.#Fn
									Payload?:   close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								Lambda?: close({
									FunctionArn?: string | fn.#Fn
									Payload?:     close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
								}) | fn.If
								ResetTimer?: close({
									TimerName?: string | fn.#Fn
								}) | fn.If
								SetTimer?: close({
									DurationExpression?: string | fn.#Fn
									Seconds?:            int | fn.#Fn
									TimerName?:          string | fn.#Fn
								}) | fn.If
								SetVariable?: close({
									Value?:        string | fn.#Fn
									VariableName?: string | fn.#Fn
								}) | fn.If
								Sns?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									TargetArn?: string | fn.#Fn
								}) | fn.If
								Sqs?: close({
									Payload?: close({
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									}) | fn.If
									QueueUrl?:  string | fn.#Fn
									UseBase64?: bool | fn.#Fn
								}) | fn.If
							})] | fn.If
							Condition?: string | fn.#Fn
							EventName?: string | fn.#Fn
							NextState?: string | fn.#Fn
						})] | fn.If
					}) | fn.If
					StateName?: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			DetectorModelDescription?: string | fn.#Fn
			DetectorModelName?:        string | fn.#Fn
			EvaluationMethod?:         string | fn.#Fn
			Key?:                      string | fn.#Fn
			RoleArn?:                  string | fn.#Fn
			Tags?:                     [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Input: {
		Type:       "AWS::IoTEvents::Input"
		Properties: close({
			InputDefinition?: close({
				Attributes?: [...close({
					JsonPath?: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			InputDescription?: string | fn.#Fn
			InputName?:        string | fn.#Fn
			Tags?:             [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

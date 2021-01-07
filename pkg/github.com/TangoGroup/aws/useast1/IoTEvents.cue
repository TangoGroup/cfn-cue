package useast1

import "github.com/TangoGroup/aws/fn"

#IoTEvents: {
	#DetectorModel: {
		Type: "AWS::IoTEvents::DetectorModel"
		Properties: {
			DetectorModelDefinition?: {
				InitialStateName?: string | fn.#Fn
				States?:           [...{
					OnEnter?: {
						Events?: [...{
							Actions?: [...{
								ClearTimer?: {
									TimerName?: string | fn.#Fn
								} | fn.#If
								DynamoDB?: {
									HashKeyField?: string | fn.#Fn
									HashKeyType?:  string | fn.#Fn
									HashKeyValue?: string | fn.#Fn
									Operation?:    string | fn.#Fn
									Payload?:      {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									PayloadField?:  string | fn.#Fn
									RangeKeyField?: string | fn.#Fn
									RangeKeyType?:  string | fn.#Fn
									RangeKeyValue?: string | fn.#Fn
									TableName?:     string | fn.#Fn
								} | fn.#If
								DynamoDBv2?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									TableName?: string | fn.#Fn
								} | fn.#If
								Firehose?: {
									DeliveryStreamName?: string | fn.#Fn
									Payload?:            {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									Separator?: string | fn.#Fn
								} | fn.#If
								IotEvents?: {
									InputName?: string | fn.#Fn
									Payload?:   {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								IotSiteWise?: {
									AssetId?:       string | fn.#Fn
									EntryId?:       string | fn.#Fn
									PropertyAlias?: string | fn.#Fn
									PropertyId?:    string | fn.#Fn
									PropertyValue?: {
										Quality?:   string | fn.#Fn
										Timestamp?: {
											OffsetInNanos?: string | fn.#Fn
											TimeInSeconds?: string | fn.#Fn
										} | fn.#If
										Value?: {
											BooleanValue?: string | fn.#Fn
											DoubleValue?:  string | fn.#Fn
											IntegerValue?: string | fn.#Fn
											StringValue?:  string | fn.#Fn
										} | fn.#If
									} | fn.#If
								} | fn.#If
								IotTopicPublish?: {
									MqttTopic?: string | fn.#Fn
									Payload?:   {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								Lambda?: {
									FunctionArn?: string | fn.#Fn
									Payload?:     {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								ResetTimer?: {
									TimerName?: string | fn.#Fn
								} | fn.#If
								SetTimer?: {
									DurationExpression?: string | fn.#Fn
									Seconds?:            int | fn.#Fn
									TimerName?:          string | fn.#Fn
								} | fn.#If
								SetVariable?: {
									Value?:        string | fn.#Fn
									VariableName?: string | fn.#Fn
								} | fn.#If
								Sns?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									TargetArn?: string | fn.#Fn
								} | fn.#If
								Sqs?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									QueueUrl?:  string | fn.#Fn
									UseBase64?: bool | fn.#Fn
								} | fn.#If
							}] | fn.#If
							Condition?: string | fn.#Fn
							EventName?: string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					OnExit?: {
						Events?: [...{
							Actions?: [...{
								ClearTimer?: {
									TimerName?: string | fn.#Fn
								} | fn.#If
								DynamoDB?: {
									HashKeyField?: string | fn.#Fn
									HashKeyType?:  string | fn.#Fn
									HashKeyValue?: string | fn.#Fn
									Operation?:    string | fn.#Fn
									Payload?:      {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									PayloadField?:  string | fn.#Fn
									RangeKeyField?: string | fn.#Fn
									RangeKeyType?:  string | fn.#Fn
									RangeKeyValue?: string | fn.#Fn
									TableName?:     string | fn.#Fn
								} | fn.#If
								DynamoDBv2?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									TableName?: string | fn.#Fn
								} | fn.#If
								Firehose?: {
									DeliveryStreamName?: string | fn.#Fn
									Payload?:            {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									Separator?: string | fn.#Fn
								} | fn.#If
								IotEvents?: {
									InputName?: string | fn.#Fn
									Payload?:   {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								IotSiteWise?: {
									AssetId?:       string | fn.#Fn
									EntryId?:       string | fn.#Fn
									PropertyAlias?: string | fn.#Fn
									PropertyId?:    string | fn.#Fn
									PropertyValue?: {
										Quality?:   string | fn.#Fn
										Timestamp?: {
											OffsetInNanos?: string | fn.#Fn
											TimeInSeconds?: string | fn.#Fn
										} | fn.#If
										Value?: {
											BooleanValue?: string | fn.#Fn
											DoubleValue?:  string | fn.#Fn
											IntegerValue?: string | fn.#Fn
											StringValue?:  string | fn.#Fn
										} | fn.#If
									} | fn.#If
								} | fn.#If
								IotTopicPublish?: {
									MqttTopic?: string | fn.#Fn
									Payload?:   {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								Lambda?: {
									FunctionArn?: string | fn.#Fn
									Payload?:     {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								ResetTimer?: {
									TimerName?: string | fn.#Fn
								} | fn.#If
								SetTimer?: {
									DurationExpression?: string | fn.#Fn
									Seconds?:            int | fn.#Fn
									TimerName?:          string | fn.#Fn
								} | fn.#If
								SetVariable?: {
									Value?:        string | fn.#Fn
									VariableName?: string | fn.#Fn
								} | fn.#If
								Sns?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									TargetArn?: string | fn.#Fn
								} | fn.#If
								Sqs?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									QueueUrl?:  string | fn.#Fn
									UseBase64?: bool | fn.#Fn
								} | fn.#If
							}] | fn.#If
							Condition?: string | fn.#Fn
							EventName?: string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					OnInput?: {
						Events?: [...{
							Actions?: [...{
								ClearTimer?: {
									TimerName?: string | fn.#Fn
								} | fn.#If
								DynamoDB?: {
									HashKeyField?: string | fn.#Fn
									HashKeyType?:  string | fn.#Fn
									HashKeyValue?: string | fn.#Fn
									Operation?:    string | fn.#Fn
									Payload?:      {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									PayloadField?:  string | fn.#Fn
									RangeKeyField?: string | fn.#Fn
									RangeKeyType?:  string | fn.#Fn
									RangeKeyValue?: string | fn.#Fn
									TableName?:     string | fn.#Fn
								} | fn.#If
								DynamoDBv2?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									TableName?: string | fn.#Fn
								} | fn.#If
								Firehose?: {
									DeliveryStreamName?: string | fn.#Fn
									Payload?:            {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									Separator?: string | fn.#Fn
								} | fn.#If
								IotEvents?: {
									InputName?: string | fn.#Fn
									Payload?:   {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								IotSiteWise?: {
									AssetId?:       string | fn.#Fn
									EntryId?:       string | fn.#Fn
									PropertyAlias?: string | fn.#Fn
									PropertyId?:    string | fn.#Fn
									PropertyValue?: {
										Quality?:   string | fn.#Fn
										Timestamp?: {
											OffsetInNanos?: string | fn.#Fn
											TimeInSeconds?: string | fn.#Fn
										} | fn.#If
										Value?: {
											BooleanValue?: string | fn.#Fn
											DoubleValue?:  string | fn.#Fn
											IntegerValue?: string | fn.#Fn
											StringValue?:  string | fn.#Fn
										} | fn.#If
									} | fn.#If
								} | fn.#If
								IotTopicPublish?: {
									MqttTopic?: string | fn.#Fn
									Payload?:   {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								Lambda?: {
									FunctionArn?: string | fn.#Fn
									Payload?:     {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								ResetTimer?: {
									TimerName?: string | fn.#Fn
								} | fn.#If
								SetTimer?: {
									DurationExpression?: string | fn.#Fn
									Seconds?:            int | fn.#Fn
									TimerName?:          string | fn.#Fn
								} | fn.#If
								SetVariable?: {
									Value?:        string | fn.#Fn
									VariableName?: string | fn.#Fn
								} | fn.#If
								Sns?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									TargetArn?: string | fn.#Fn
								} | fn.#If
								Sqs?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									QueueUrl?:  string | fn.#Fn
									UseBase64?: bool | fn.#Fn
								} | fn.#If
							}] | fn.#If
							Condition?: string | fn.#Fn
							EventName?: string | fn.#Fn
						}] | fn.#If
						TransitionEvents?: [...{
							Actions?: [...{
								ClearTimer?: {
									TimerName?: string | fn.#Fn
								} | fn.#If
								DynamoDB?: {
									HashKeyField?: string | fn.#Fn
									HashKeyType?:  string | fn.#Fn
									HashKeyValue?: string | fn.#Fn
									Operation?:    string | fn.#Fn
									Payload?:      {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									PayloadField?:  string | fn.#Fn
									RangeKeyField?: string | fn.#Fn
									RangeKeyType?:  string | fn.#Fn
									RangeKeyValue?: string | fn.#Fn
									TableName?:     string | fn.#Fn
								} | fn.#If
								DynamoDBv2?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									TableName?: string | fn.#Fn
								} | fn.#If
								Firehose?: {
									DeliveryStreamName?: string | fn.#Fn
									Payload?:            {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									Separator?: string | fn.#Fn
								} | fn.#If
								IotEvents?: {
									InputName?: string | fn.#Fn
									Payload?:   {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								IotSiteWise?: {
									AssetId?:       string | fn.#Fn
									EntryId?:       string | fn.#Fn
									PropertyAlias?: string | fn.#Fn
									PropertyId?:    string | fn.#Fn
									PropertyValue?: {
										Quality?:   string | fn.#Fn
										Timestamp?: {
											OffsetInNanos?: string | fn.#Fn
											TimeInSeconds?: string | fn.#Fn
										} | fn.#If
										Value?: {
											BooleanValue?: string | fn.#Fn
											DoubleValue?:  string | fn.#Fn
											IntegerValue?: string | fn.#Fn
											StringValue?:  string | fn.#Fn
										} | fn.#If
									} | fn.#If
								} | fn.#If
								IotTopicPublish?: {
									MqttTopic?: string | fn.#Fn
									Payload?:   {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								Lambda?: {
									FunctionArn?: string | fn.#Fn
									Payload?:     {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
								} | fn.#If
								ResetTimer?: {
									TimerName?: string | fn.#Fn
								} | fn.#If
								SetTimer?: {
									DurationExpression?: string | fn.#Fn
									Seconds?:            int | fn.#Fn
									TimerName?:          string | fn.#Fn
								} | fn.#If
								SetVariable?: {
									Value?:        string | fn.#Fn
									VariableName?: string | fn.#Fn
								} | fn.#If
								Sns?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									TargetArn?: string | fn.#Fn
								} | fn.#If
								Sqs?: {
									Payload?: {
										ContentExpression?: string | fn.#Fn
										Type?:              string | fn.#Fn
									} | fn.#If
									QueueUrl?:  string | fn.#Fn
									UseBase64?: bool | fn.#Fn
								} | fn.#If
							}] | fn.#If
							Condition?: string | fn.#Fn
							EventName?: string | fn.#Fn
							NextState?: string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					StateName?: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			DetectorModelDescription?: string | fn.#Fn
			DetectorModelName?:        string | fn.#Fn
			EvaluationMethod?:         string | fn.#Fn
			Key?:                      string | fn.#Fn
			RoleArn?:                  string | fn.#Fn
			Tags?:                     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Input: {
		Type: "AWS::IoTEvents::Input"
		Properties: {
			InputDefinition?: {
				Attributes?: [...{
					JsonPath?: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			InputDescription?: string | fn.#Fn
			InputName?:        string | fn.#Fn
			Tags?:             [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

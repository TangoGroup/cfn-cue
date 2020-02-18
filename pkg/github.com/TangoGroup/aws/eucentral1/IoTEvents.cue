package eucentral1

import "github.com/TangoGroup/aws/fn"

IoTEvents :: {
	DetectorModel :: {
		Type: "AWS::IoTEvents::DetectorModel"
		Properties: {
			DetectorModelDefinition?: close({
				InitialStateName?: string | fn.Fn
				States?:           [...close({
					OnEnter?: close({
						Events?: [...close({
							Actions?: [...close({
								ClearTimer?: close({
									TimerName?: string | fn.Fn
								}) | fn.If
								Firehose?: close({
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								}) | fn.If
								IotEvents?: close({
									InputName?: string | fn.Fn
								}) | fn.If
								IotTopicPublish?: close({
									MqttTopic?: string | fn.Fn
								}) | fn.If
								Lambda?: close({
									FunctionArn?: string | fn.Fn
								}) | fn.If
								ResetTimer?: close({
									TimerName?: string | fn.Fn
								}) | fn.If
								SetTimer?: close({
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								}) | fn.If
								SetVariable?: close({
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								}) | fn.If
								Sns?: close({
									TargetArn?: string | fn.Fn
								}) | fn.If
								Sqs?: close({
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								}) | fn.If
							})] | fn.If
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						})] | fn.If
					}) | fn.If
					OnExit?: close({
						Events?: [...close({
							Actions?: [...close({
								ClearTimer?: close({
									TimerName?: string | fn.Fn
								}) | fn.If
								Firehose?: close({
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								}) | fn.If
								IotEvents?: close({
									InputName?: string | fn.Fn
								}) | fn.If
								IotTopicPublish?: close({
									MqttTopic?: string | fn.Fn
								}) | fn.If
								Lambda?: close({
									FunctionArn?: string | fn.Fn
								}) | fn.If
								ResetTimer?: close({
									TimerName?: string | fn.Fn
								}) | fn.If
								SetTimer?: close({
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								}) | fn.If
								SetVariable?: close({
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								}) | fn.If
								Sns?: close({
									TargetArn?: string | fn.Fn
								}) | fn.If
								Sqs?: close({
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								}) | fn.If
							})] | fn.If
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						})] | fn.If
					}) | fn.If
					OnInput?: close({
						Events?: [...close({
							Actions?: [...close({
								ClearTimer?: close({
									TimerName?: string | fn.Fn
								}) | fn.If
								Firehose?: close({
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								}) | fn.If
								IotEvents?: close({
									InputName?: string | fn.Fn
								}) | fn.If
								IotTopicPublish?: close({
									MqttTopic?: string | fn.Fn
								}) | fn.If
								Lambda?: close({
									FunctionArn?: string | fn.Fn
								}) | fn.If
								ResetTimer?: close({
									TimerName?: string | fn.Fn
								}) | fn.If
								SetTimer?: close({
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								}) | fn.If
								SetVariable?: close({
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								}) | fn.If
								Sns?: close({
									TargetArn?: string | fn.Fn
								}) | fn.If
								Sqs?: close({
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								}) | fn.If
							})] | fn.If
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						})] | fn.If
						TransitionEvents?: [...close({
							Actions?: [...close({
								ClearTimer?: close({
									TimerName?: string | fn.Fn
								}) | fn.If
								Firehose?: close({
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								}) | fn.If
								IotEvents?: close({
									InputName?: string | fn.Fn
								}) | fn.If
								IotTopicPublish?: close({
									MqttTopic?: string | fn.Fn
								}) | fn.If
								Lambda?: close({
									FunctionArn?: string | fn.Fn
								}) | fn.If
								ResetTimer?: close({
									TimerName?: string | fn.Fn
								}) | fn.If
								SetTimer?: close({
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								}) | fn.If
								SetVariable?: close({
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								}) | fn.If
								Sns?: close({
									TargetArn?: string | fn.Fn
								}) | fn.If
								Sqs?: close({
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								}) | fn.If
							})] | fn.If
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
							NextState?: string | fn.Fn
						})] | fn.If
					}) | fn.If
					StateName?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			DetectorModelDescription?: string | fn.Fn
			DetectorModelName?:        string | fn.Fn
			EvaluationMethod?:         string | fn.Fn
			Key?:                      string | fn.Fn
			RoleArn?:                  string | fn.Fn
			Tags?:                     [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Input :: {
		Type: "AWS::IoTEvents::Input"
		Properties: {
			InputDefinition?: close({
				Attributes?: [...close({
					JsonPath?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			InputDescription?: string | fn.Fn
			InputName?:        string | fn.Fn
			Tags?:             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

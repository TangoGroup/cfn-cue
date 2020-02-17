package apnortheast1

import "github.com/TangoGroup/aws/fn"

IoTEvents :: {
	DetectorModel :: {
		Type: "AWS::IoTEvents::DetectorModel"
		Properties: {
			DetectorModelDefinition?: {
				InitialStateName?: string | fn.Fn
				States?:           [...{
					OnEnter?: {
						Events?: [...{
							Actions?: [...{
								ClearTimer?: {
									TimerName?: string | fn.Fn
								} | fn.If
								Firehose?: {
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								} | fn.If
								IotEvents?: {
									InputName?: string | fn.Fn
								} | fn.If
								IotTopicPublish?: {
									MqttTopic?: string | fn.Fn
								} | fn.If
								Lambda?: {
									FunctionArn?: string | fn.Fn
								} | fn.If
								ResetTimer?: {
									TimerName?: string | fn.Fn
								} | fn.If
								SetTimer?: {
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								} | fn.If
								SetVariable?: {
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								} | fn.If
								Sns?: {
									TargetArn?: string | fn.Fn
								} | fn.If
								Sqs?: {
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								} | fn.If
							}] | fn.If
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						}] | fn.If
					} | fn.If
					OnExit?: {
						Events?: [...{
							Actions?: [...{
								ClearTimer?: {
									TimerName?: string | fn.Fn
								} | fn.If
								Firehose?: {
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								} | fn.If
								IotEvents?: {
									InputName?: string | fn.Fn
								} | fn.If
								IotTopicPublish?: {
									MqttTopic?: string | fn.Fn
								} | fn.If
								Lambda?: {
									FunctionArn?: string | fn.Fn
								} | fn.If
								ResetTimer?: {
									TimerName?: string | fn.Fn
								} | fn.If
								SetTimer?: {
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								} | fn.If
								SetVariable?: {
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								} | fn.If
								Sns?: {
									TargetArn?: string | fn.Fn
								} | fn.If
								Sqs?: {
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								} | fn.If
							}] | fn.If
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						}] | fn.If
					} | fn.If
					OnInput?: {
						Events?: [...{
							Actions?: [...{
								ClearTimer?: {
									TimerName?: string | fn.Fn
								} | fn.If
								Firehose?: {
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								} | fn.If
								IotEvents?: {
									InputName?: string | fn.Fn
								} | fn.If
								IotTopicPublish?: {
									MqttTopic?: string | fn.Fn
								} | fn.If
								Lambda?: {
									FunctionArn?: string | fn.Fn
								} | fn.If
								ResetTimer?: {
									TimerName?: string | fn.Fn
								} | fn.If
								SetTimer?: {
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								} | fn.If
								SetVariable?: {
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								} | fn.If
								Sns?: {
									TargetArn?: string | fn.Fn
								} | fn.If
								Sqs?: {
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								} | fn.If
							}] | fn.If
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						}] | fn.If
						TransitionEvents?: [...{
							Actions?: [...{
								ClearTimer?: {
									TimerName?: string | fn.Fn
								} | fn.If
								Firehose?: {
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								} | fn.If
								IotEvents?: {
									InputName?: string | fn.Fn
								} | fn.If
								IotTopicPublish?: {
									MqttTopic?: string | fn.Fn
								} | fn.If
								Lambda?: {
									FunctionArn?: string | fn.Fn
								} | fn.If
								ResetTimer?: {
									TimerName?: string | fn.Fn
								} | fn.If
								SetTimer?: {
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								} | fn.If
								SetVariable?: {
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								} | fn.If
								Sns?: {
									TargetArn?: string | fn.Fn
								} | fn.If
								Sqs?: {
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								} | fn.If
							}] | fn.If
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
							NextState?: string | fn.Fn
						}] | fn.If
					} | fn.If
					StateName?: string | fn.Fn
				}] | fn.If
			} | fn.If
			DetectorModelDescription?: string | fn.Fn
			DetectorModelName?:        string | fn.Fn
			EvaluationMethod?:         string | fn.Fn
			Key?:                      string | fn.Fn
			RoleArn?:                  string | fn.Fn
			Tags?:                     [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
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
			InputDefinition?: {
				Attributes?: [...{
					JsonPath?: string | fn.Fn
				}] | fn.If
			} | fn.If
			InputDescription?: string | fn.Fn
			InputName?:        string | fn.Fn
			Tags?:             [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

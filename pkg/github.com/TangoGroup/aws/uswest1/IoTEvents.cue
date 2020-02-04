package uswest1

import "github.com/TangoGroup/aws/fn"

IoTEvents :: {
	DetectorModel :: {
		Type: "AWS::IoTEvents::DetectorModel"
		Properties: {
			DetectorModelDefinition?: {
				InitialStateName?: string | fn.Fn
				States?: [...{
					OnEnter?: Events?: [...{
						Actions?: [...{
							ClearTimer?: TimerName?: string | fn.Fn
							Firehose?: {
								DeliveryStreamName?: string | fn.Fn
								Separator?:          string | fn.Fn
							}
							IotEvents?: InputName?:       string | fn.Fn
							IotTopicPublish?: MqttTopic?: string | fn.Fn
							Lambda?: FunctionArn?:        string | fn.Fn
							ResetTimer?: TimerName?:      string | fn.Fn
							SetTimer?: {
								Seconds?:   int | fn.Fn
								TimerName?: string | fn.Fn
							}
							SetVariable?: {
								Value?:        string | fn.Fn
								VariableName?: string | fn.Fn
							}
							Sns?: TargetArn?: string | fn.Fn
							Sqs?: {
								QueueUrl?:  string | fn.Fn
								UseBase64?: bool | fn.Fn
							}
						}]
						Condition?: string | fn.Fn
						EventName?: string | fn.Fn
					}]
					OnExit?: Events?: [...{
						Actions?: [...{
							ClearTimer?: TimerName?: string | fn.Fn
							Firehose?: {
								DeliveryStreamName?: string | fn.Fn
								Separator?:          string | fn.Fn
							}
							IotEvents?: InputName?:       string | fn.Fn
							IotTopicPublish?: MqttTopic?: string | fn.Fn
							Lambda?: FunctionArn?:        string | fn.Fn
							ResetTimer?: TimerName?:      string | fn.Fn
							SetTimer?: {
								Seconds?:   int | fn.Fn
								TimerName?: string | fn.Fn
							}
							SetVariable?: {
								Value?:        string | fn.Fn
								VariableName?: string | fn.Fn
							}
							Sns?: TargetArn?: string | fn.Fn
							Sqs?: {
								QueueUrl?:  string | fn.Fn
								UseBase64?: bool | fn.Fn
							}
						}]
						Condition?: string | fn.Fn
						EventName?: string | fn.Fn
					}]
					OnInput?: {
						Events?: [...{
							Actions?: [...{
								ClearTimer?: TimerName?: string | fn.Fn
								Firehose?: {
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								}
								IotEvents?: InputName?:       string | fn.Fn
								IotTopicPublish?: MqttTopic?: string | fn.Fn
								Lambda?: FunctionArn?:        string | fn.Fn
								ResetTimer?: TimerName?:      string | fn.Fn
								SetTimer?: {
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								}
								SetVariable?: {
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								}
								Sns?: TargetArn?: string | fn.Fn
								Sqs?: {
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								}
							}]
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						}]
						TransitionEvents?: [...{
							Actions?: [...{
								ClearTimer?: TimerName?: string | fn.Fn
								Firehose?: {
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								}
								IotEvents?: InputName?:       string | fn.Fn
								IotTopicPublish?: MqttTopic?: string | fn.Fn
								Lambda?: FunctionArn?:        string | fn.Fn
								ResetTimer?: TimerName?:      string | fn.Fn
								SetTimer?: {
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								}
								SetVariable?: {
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								}
								Sns?: TargetArn?: string | fn.Fn
								Sqs?: {
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								}
							}]
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
							NextState?: string | fn.Fn
						}]
					}
					StateName?: string | fn.Fn
				}]
			}
			DetectorModelDescription?: string | fn.Fn
			DetectorModelName?:        string | fn.Fn
			EvaluationMethod?:         string | fn.Fn
			Key?:                      string | fn.Fn
			RoleArn?:                  string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Input :: {
		Type: "AWS::IoTEvents::Input"
		Properties: {
			InputDefinition?: Attributes?: [...{
				JsonPath?: string | fn.Fn
			}]
			InputDescription?: string | fn.Fn
			InputName?:        string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

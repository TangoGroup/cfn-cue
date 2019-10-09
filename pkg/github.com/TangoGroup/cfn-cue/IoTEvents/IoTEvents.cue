package IoTEvents

import "github.com/TangoGroup/fn"

DetectorModel :: {
	Type: "AWS::IoTEvents::DetectorModel"
	Properties: {
		DetectorModelDefinition?:  __DetectorModelDefinition
		DetectorModelDescription?: string | fn.Fn
		DetectorModelName?:        string | fn.Fn
		Key?:                      string | fn.Fn
		RoleArn?:                  string | fn.Fn
		Tags?: [...__Tag]
	}
	__Action :: {
		ClearTimer?:      __ClearTimer
		Firehose?:        __Firehose
		IotEvents?:       __IotEvents
		IotTopicPublish?: __IotTopicPublish
		Lambda?:          __Lambda
		ResetTimer?:      __ResetTimer
		SetTimer?:        __SetTimer
		SetVariable?:     __SetVariable
		Sns?:             __Sns
		Sqs?:             __Sqs
	}
	__ClearTimer :: {
		TimerName?: string | fn.Fn
	}
	__DetectorModelDefinition :: {
		InitialStateName?: string | fn.Fn
		States?: [...__State]
	}
	__Event :: {
		Actions?: [...__Action]
		Condition?: string | fn.Fn
		EventName?: string | fn.Fn
	}
	__Firehose :: {
		DeliveryStreamName?: string | fn.Fn
		Separator?:          string | fn.Fn
	}
	__IotEvents :: {
		InputName?: string | fn.Fn
	}
	__IotTopicPublish :: {
		MqttTopic?: string | fn.Fn
	}
	__Lambda :: {
		FunctionArn?: string | fn.Fn
	}
	__OnEnter :: {
		Events?: [...__Event]
	}
	__OnExit :: {
		Events?: [...__Event]
	}
	__OnInput :: {
		Events?: [...__Event]
		TransitionEvents?: [...__TransitionEvent]
	}
	__ResetTimer :: {
		TimerName?: string | fn.Fn
	}
	__SetTimer :: {
		Seconds?:   int | fn.Fn
		TimerName?: string | fn.Fn
	}
	__SetVariable :: {
		Value?:        string | fn.Fn
		VariableName?: string | fn.Fn
	}
	__Sns :: {
		TargetArn?: string | fn.Fn
	}
	__Sqs :: {
		QueueUrl?:  string | fn.Fn
		UseBase64?: bool | fn.Fn
	}
	__State :: {
		OnEnter?:   __OnEnter
		OnExit?:    __OnExit
		OnInput?:   __OnInput
		StateName?: string | fn.Fn
	}
	__TransitionEvent :: {
		Actions?: [...__Action]
		Condition?: string | fn.Fn
		EventName?: string | fn.Fn
		NextState?: string | fn.Fn
	}
}
Input :: {
	Type: "AWS::IoTEvents::Input"
	Properties: {
		InputDefinition?:  __InputDefinition
		InputDescription?: string | fn.Fn
		InputName?:        string | fn.Fn
		Tags?: [...__Tag]
	}
	__Attribute :: {
		JsonPath?: string | fn.Fn
	}
	__InputDefinition :: {
		Attributes?: [...__Attribute]
	}
}

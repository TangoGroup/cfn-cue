package IoTEvents

DetectorModel :: {
	Type: "AWS::IoTEvents::DetectorModel"
	Properties: {
		DetectorModelDefinition?:  __DetectorModelDefinition
		DetectorModelDescription?: string
		DetectorModelName?:        string
		Key?:                      string
		RoleArn?:                  string
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
		TimerName?: string
	}
	__DetectorModelDefinition :: {
		InitialStateName?: string
		States?: [...__State]
	}
	__Event :: {
		Actions?: [...__Action]
		Condition?: string
		EventName?: string
	}
	__Firehose :: {
		DeliveryStreamName?: string
		Separator?:          string
	}
	__IotEvents :: {
		InputName?: string
	}
	__IotTopicPublish :: {
		MqttTopic?: string
	}
	__Lambda :: {
		FunctionArn?: string
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
		TimerName?: string
	}
	__SetTimer :: {
		Seconds?:   int
		TimerName?: string
	}
	__SetVariable :: {
		Value?:        string
		VariableName?: string
	}
	__Sns :: {
		TargetArn?: string
	}
	__Sqs :: {
		QueueUrl?:  string
		UseBase64?: bool
	}
	__State :: {
		OnEnter?:   __OnEnter
		OnExit?:    __OnExit
		OnInput?:   __OnInput
		StateName?: string
	}
	__TransitionEvent :: {
		Actions?: [...__Action]
		Condition?: string
		EventName?: string
		NextState?: string
	}
}
Input :: {
	Type: "AWS::IoTEvents::Input"
	Properties: {
		InputDefinition?:  __InputDefinition
		InputDescription?: string
		InputName?:        string
		Tags?: [...__Tag]
	}
	__Attribute :: {
		JsonPath?: string
	}
	__InputDefinition :: {
		Attributes?: [...__Attribute]
	}
}

package IoTEvents

import "github.com/TangoGroup/fn"

DetectorModel :: {
	Type: "AWS::IoTEvents::DetectorModel"
	Properties: {
		DetectorModelDefinition?:  propDetectorModelDefinition
		DetectorModelDescription?: string | fn.Fn
		DetectorModelName?:        string | fn.Fn
		Key?:                      string | fn.Fn
		RoleArn?:                  string | fn.Fn
		Tags?: [...propTag]
	}
	propAction :: {
		ClearTimer?:      propClearTimer
		Firehose?:        propFirehose
		IotEvents?:       propIotEvents
		IotTopicPublish?: propIotTopicPublish
		Lambda?:          propLambda
		ResetTimer?:      propResetTimer
		SetTimer?:        propSetTimer
		SetVariable?:     propSetVariable
		Sns?:             propSns
		Sqs?:             propSqs
	}
	propClearTimer :: {
		TimerName?: string | fn.Fn
	}
	propDetectorModelDefinition :: {
		InitialStateName?: string | fn.Fn
		States?: [...propState]
	}
	propEvent :: {
		Actions?: [...propAction]
		Condition?: string | fn.Fn
		EventName?: string | fn.Fn
	}
	propFirehose :: {
		DeliveryStreamName?: string | fn.Fn
		Separator?:          string | fn.Fn
	}
	propIotEvents :: {
		InputName?: string | fn.Fn
	}
	propIotTopicPublish :: {
		MqttTopic?: string | fn.Fn
	}
	propLambda :: {
		FunctionArn?: string | fn.Fn
	}
	propOnEnter :: {
		Events?: [...propEvent]
	}
	propOnExit :: {
		Events?: [...propEvent]
	}
	propOnInput :: {
		Events?: [...propEvent]
		TransitionEvents?: [...propTransitionEvent]
	}
	propResetTimer :: {
		TimerName?: string | fn.Fn
	}
	propSetTimer :: {
		Seconds?:   int | fn.Fn
		TimerName?: string | fn.Fn
	}
	propSetVariable :: {
		Value?:        string | fn.Fn
		VariableName?: string | fn.Fn
	}
	propSns :: {
		TargetArn?: string | fn.Fn
	}
	propSqs :: {
		QueueUrl?:  string | fn.Fn
		UseBase64?: bool | fn.Fn
	}
	propState :: {
		OnEnter?:   propOnEnter
		OnExit?:    propOnExit
		OnInput?:   propOnInput
		StateName?: string | fn.Fn
	}
	propTransitionEvent :: {
		Actions?: [...propAction]
		Condition?: string | fn.Fn
		EventName?: string | fn.Fn
		NextState?: string | fn.Fn
	}
}
Input :: {
	Type: "AWS::IoTEvents::Input"
	Properties: {
		InputDefinition?:  propInputDefinition
		InputDescription?: string | fn.Fn
		InputName?:        string | fn.Fn
		Tags?: [...propTag]
	}
	propAttribute :: {
		JsonPath?: string | fn.Fn
	}
	propInputDefinition :: {
		Attributes?: [...propAttribute]
	}
}

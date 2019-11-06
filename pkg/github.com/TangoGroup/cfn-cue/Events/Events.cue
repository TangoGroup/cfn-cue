package Events

import "github.com/TangoGroup/fn"

EventBus :: {
	Type: "AWS::Events::EventBus"
	Properties: {
		EventSourceName?: string | fn.Fn
		Name:             string | fn.Fn
	}
}
EventBusPolicy :: {
	Type: "AWS::Events::EventBusPolicy"
	Properties: {
		Action:        (string & ("events:PutEvents")) | fn.Fn
		Condition?:    __Condition
		EventBusName?: string | fn.Fn
		Principal:     string | fn.Fn
		StatementId:   string | fn.Fn
	}
	__Condition :: {
		Key?:   (string & ("aws:PrincipalOrgID")) | fn.Fn
		Type?:  (string & ("StringEquals")) | fn.Fn
		Value?: string | fn.Fn
	}
}
Rule :: {
	Type: "AWS::Events::Rule"
	Properties: {
		Description?:  string | fn.Fn
		EventPattern?: {
		} | fn.Fn
		Name?:               string | fn.Fn
		RoleArn?:            string | fn.Fn
		ScheduleExpression?: string | fn.Fn
		State?:              (string & ("DISABLED" | "ENABLED")) | fn.Fn
		Targets?: [...__Target]
	}
	__AwsVpcConfiguration :: {
		AssignPublicIp?: string | fn.Fn
		SecurityGroups?: [...string] | fn.Fn
		Subnets:         [...string] | fn.Fn
	}
	__EcsParameters :: {
		Group?:                string | fn.Fn
		LaunchType?:           string | fn.Fn
		NetworkConfiguration?: __NetworkConfiguration
		PlatformVersion?:      string | fn.Fn
		TaskCount?:            int | fn.Fn
		TaskDefinitionArn:     string | fn.Fn
	}
	__InputTransformer :: {
		InputPathsMap?: {
		}
		InputTemplate: string | fn.Fn
	}
	__KinesisParameters :: {
		PartitionKeyPath: string | fn.Fn
	}
	__NetworkConfiguration :: {
		AwsVpcConfiguration?: __AwsVpcConfiguration
	}
	__RunCommandParameters :: {
		RunCommandTargets: [...__RunCommandTarget]
	}
	__RunCommandTarget :: {
		Key:    string | fn.Fn
		Values: [...string] | fn.Fn
	}
	__SqsParameters :: {
		MessageGroupId: string | fn.Fn
	}
	__Target :: {
		Arn:                   string | fn.Fn
		EcsParameters?:        __EcsParameters
		Id:                    string | fn.Fn
		Input?:                string | fn.Fn
		InputPath?:            string | fn.Fn
		InputTransformer?:     __InputTransformer
		KinesisParameters?:    __KinesisParameters
		RoleArn?:              string | fn.Fn
		RunCommandParameters?: __RunCommandParameters
		SqsParameters?:        __SqsParameters
	}
}

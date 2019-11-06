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
		Condition?:    propCondition
		EventBusName?: string | fn.Fn
		Principal:     string | fn.Fn
		StatementId:   string | fn.Fn
	}
	propCondition :: {
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
		Targets?: [...propTarget]
	}
	propAwsVpcConfiguration :: {
		AssignPublicIp?: string | fn.Fn
		SecurityGroups?: [...string] | fn.Fn
		Subnets:         [...string] | fn.Fn
	}
	propEcsParameters :: {
		Group?:                string | fn.Fn
		LaunchType?:           string | fn.Fn
		NetworkConfiguration?: propNetworkConfiguration
		PlatformVersion?:      string | fn.Fn
		TaskCount?:            int | fn.Fn
		TaskDefinitionArn:     string | fn.Fn
	}
	propInputTransformer :: {
		InputPathsMap?: {
		}
		InputTemplate: string | fn.Fn
	}
	propKinesisParameters :: {
		PartitionKeyPath: string | fn.Fn
	}
	propNetworkConfiguration :: {
		AwsVpcConfiguration?: propAwsVpcConfiguration
	}
	propRunCommandParameters :: {
		RunCommandTargets: [...propRunCommandTarget]
	}
	propRunCommandTarget :: {
		Key:    string | fn.Fn
		Values: [...string] | fn.Fn
	}
	propSqsParameters :: {
		MessageGroupId: string | fn.Fn
	}
	propTarget :: {
		Arn:                   string | fn.Fn
		EcsParameters?:        propEcsParameters
		Id:                    string | fn.Fn
		Input?:                string | fn.Fn
		InputPath?:            string | fn.Fn
		InputTransformer?:     propInputTransformer
		KinesisParameters?:    propKinesisParameters
		RoleArn?:              string | fn.Fn
		RunCommandParameters?: propRunCommandParameters
		SqsParameters?:        propSqsParameters
	}
}

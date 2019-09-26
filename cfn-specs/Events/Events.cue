package Events

EventBusPolicy :: {
	Type: "AWS::Events::EventBusPolicy"
	Properties: {
		Action:      "events:PutEvents"
		Action:      string
		Condition?:  __Condition
		Principal:   string
		StatementId: string
	}
	__Condition :: {
		Key?:   "aws:PrincipalOrgID"
		Key?:   string
		Type?:  "StringEquals"
		Type?:  string
		Value?: string
	}
}
Rule :: {
	Type: "AWS::Events::Rule"
	Properties: {
		Description?: string
		EventPattern?: {
		}
		Name?:               string
		RoleArn?:            string
		ScheduleExpression?: string
		State?:              "DISABLED" | "ENABLED"
		State?:              string
		Targets?: [...__Target]
	}
	__AwsVpcConfiguration :: {
		AssignPublicIp?: string
		SecurityGroups?: [...string]
		Subnets: [...string]
	}
	__EcsParameters :: {
		Group?:                string
		LaunchType?:           string
		NetworkConfiguration?: __NetworkConfiguration
		PlatformVersion?:      string
		TaskCount?:            int
		TaskDefinitionArn:     string
	}
	__InputTransformer :: {
		InputPathsMap?: {
		}
		InputTemplate: string
	}
	__KinesisParameters :: {
		PartitionKeyPath: string
	}
	__NetworkConfiguration :: {
		AwsVpcConfiguration?: __AwsVpcConfiguration
	}
	__RunCommandParameters :: {
		RunCommandTargets: [...__RunCommandTarget]
	}
	__RunCommandTarget :: {
		Key: string
		Values: [...string]
	}
	__SqsParameters :: {
		MessageGroupId: string
	}
	__Target :: {
		Arn:                   string
		EcsParameters?:        __EcsParameters
		Id:                    string
		Input?:                string
		InputPath?:            string
		InputTransformer?:     __InputTransformer
		KinesisParameters?:    __KinesisParameters
		RoleArn?:              string
		RunCommandParameters?: __RunCommandParameters
		SqsParameters?:        __SqsParameters
	}
}

package useast2

import "github.com/TangoGroup/aws/fn"

Events :: {
	EventBus :: {
		Type: "AWS::Events::EventBus"
		Properties: {
			EventSourceName?: string | fn.Fn
			Name:             string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EventBusPolicy :: {
		Type: "AWS::Events::EventBusPolicy"
		Properties: {
			Action: ("events:PutEvents") | fn.Fn
			Condition?: {
				Key?:   ("aws:PrincipalOrgID") | fn.Fn
				Type?:  ("StringEquals") | fn.Fn
				Value?: string | fn.Fn
			}
			EventBusName?: string | fn.Fn
			Principal:     string | fn.Fn
			StatementId:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Rule :: {
		Type: "AWS::Events::Rule"
		Properties: {
			Description?:  string | fn.Fn
			EventBusName?: string | fn.Fn
			EventPattern?: {
				[string]: _
			} | fn.Fn
			Name?:               string | fn.Fn
			RoleArn?:            string | fn.Fn
			ScheduleExpression?: string | fn.Fn
			State?:              ("DISABLED" | "ENABLED") | fn.Fn
			Targets?: [...{
				Arn: string | fn.Fn
				BatchParameters?: {
					ArrayProperties?: Size?: int | fn.Fn
					JobDefinition: string | fn.Fn
					JobName:       string | fn.Fn
					RetryStrategy?: Attempts?: int | fn.Fn
				}
				EcsParameters?: {
					Group?:      string | fn.Fn
					LaunchType?: string | fn.Fn
					NetworkConfiguration?: AwsVpcConfiguration?: {
						AssignPublicIp?: string | fn.Fn
						SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
						Subnets:         [...(string | fn.Fn)] | (string | fn.Fn)
					}
					PlatformVersion?:  string | fn.Fn
					TaskCount?:        int | fn.Fn
					TaskDefinitionArn: string | fn.Fn
				}
				Id:         string | fn.Fn
				Input?:     string | fn.Fn
				InputPath?: string | fn.Fn
				InputTransformer?: {
					InputPathsMap?: [string]: string | fn.Fn
					InputTemplate: string | fn.Fn
				}
				KinesisParameters?: PartitionKeyPath: string | fn.Fn
				RoleArn?: string | fn.Fn
				RunCommandParameters?: RunCommandTargets: [...{
					Key:    string | fn.Fn
					Values: [...(string | fn.Fn)] | (string | fn.Fn)
				}]
				SqsParameters?: MessageGroupId: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

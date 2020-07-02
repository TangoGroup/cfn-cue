package apnortheast3

import "github.com/TangoGroup/aws/fn"

Events :: {
	Rule :: {
		Type:       "AWS::Events::Rule"
		Properties: close({
			Description?:  string | fn.Fn
			EventBusName?: string | fn.Fn
			EventPattern?: {
				[string]: _
			} | fn.Fn
			Name?:               string | fn.Fn
			RoleArn?:            string | fn.Fn
			ScheduleExpression?: string | fn.Fn
			State?:              ("DISABLED" | "ENABLED") | fn.Fn
			Targets?:            [...close({
				Arn:              string | fn.Fn
				BatchParameters?: close({
					ArrayProperties?: close({
						Size?: int | fn.Fn
					}) | fn.If
					JobDefinition:  string | fn.Fn
					JobName:        string | fn.Fn
					RetryStrategy?: close({
						Attempts?: int | fn.Fn
					}) | fn.If
				}) | fn.If
				EcsParameters?: close({
					Group?:                string | fn.Fn
					LaunchType?:           string | fn.Fn
					NetworkConfiguration?: close({
						AwsVpcConfiguration?: close({
							AssignPublicIp?: string | fn.Fn
							SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
							Subnets:         [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
					}) | fn.If
					PlatformVersion?:  string | fn.Fn
					TaskCount?:        int | fn.Fn
					TaskDefinitionArn: string | fn.Fn
				}) | fn.If
				HttpParameters?: close({
					HeaderParameters?: {
						[string]: string | fn.Fn
					} | fn.If
					PathParameterValues?:   [...(string | fn.Fn)] | (string | fn.Fn)
					QueryStringParameters?: {
						[string]: string | fn.Fn
					} | fn.If
				}) | fn.If
				Id:                string | fn.Fn
				Input?:            string | fn.Fn
				InputPath?:        string | fn.Fn
				InputTransformer?: close({
					InputPathsMap?: {
						[string]: string | fn.Fn
					} | fn.If
					InputTemplate: string | fn.Fn
				}) | fn.If
				KinesisParameters?: close({
					PartitionKeyPath: string | fn.Fn
				}) | fn.If
				RoleArn?:              string | fn.Fn
				RunCommandParameters?: close({
					RunCommandTargets: [...close({
						Key:    string | fn.Fn
						Values: [...(string | fn.Fn)] | (string | fn.Fn)
					})] | fn.If
				}) | fn.If
				SqsParameters?: close({
					MessageGroupId: string | fn.Fn
				}) | fn.If
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

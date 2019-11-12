package apnortheast2

import "github.com/TangoGroup/fn"

CloudFormation :: {
	CustomResource :: {
		Type: "AWS::CloudFormation::CustomResource"
		Properties: ServiceToken: string | fn.Fn
	}
	Macro :: {
		Type: "AWS::CloudFormation::Macro"
		Properties: {
			Description?:  string | fn.Fn
			FunctionName:  string | fn.Fn
			LogGroupName?: string | fn.Fn
			LogRoleARN?:   string | fn.Fn
			Name:          string | fn.Fn
		}
	}
	Stack :: {
		Type: "AWS::CloudFormation::Stack"
		Properties: {
			NotificationARNs?: [...(string | fn.Fn)]
			Parameters?: [string]: string | fn.Fn
			Tags?: [...{
			}]
			TemplateURL:       string | fn.Fn
			TimeoutInMinutes?: int | fn.Fn
		}
	}
	WaitCondition :: {
		Type: "AWS::CloudFormation::WaitCondition"
		Properties: {
			Count?:   int | fn.Fn
			Handle?:  string | fn.Fn
			Timeout?: (string & (>=0 & <=43200)) | fn.Fn
		}
	}
	WaitConditionHandle :: {
		Type: "AWS::CloudFormation::WaitConditionHandle"
		Properties: {
		}
	}
}

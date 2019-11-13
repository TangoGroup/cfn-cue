package euwest1

import "github.com/TangoGroup/aws/fn"

CloudFormation :: {
	CustomResource :: {
		Type: "AWS::CloudFormation::CustomResource" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
		Properties: {
			ServiceToken: string | fn.Fn
			[string]:     _
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Stack :: {
		Type: "AWS::CloudFormation::Stack"
		Properties: {
			NotificationARNs?: [...(string | fn.Fn)]
			Parameters?: [string]: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TemplateURL:       string | fn.Fn
			TimeoutInMinutes?: int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	WaitCondition :: {
		Type: "AWS::CloudFormation::WaitCondition"
		Properties: {
			Count?:   int | fn.Fn
			Handle?:  string | fn.Fn
			Timeout?: (string & (>=0 & <=43200)) | fn.Fn
		}
		DependsOn?: string | [...string]
		CreationPolicy?: {
			AutoScalingCreationPolicy?: MinSuccessfulInstancesPercent?: int
			ResourceSignal?: {
				Count?:   int
				Timeout?: string
			}
		}
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	WaitConditionHandle :: {
		Type: "AWS::CloudFormation::WaitConditionHandle"
		Properties: {
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

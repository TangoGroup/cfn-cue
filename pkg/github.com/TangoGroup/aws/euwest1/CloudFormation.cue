package euwest1

import "github.com/TangoGroup/aws/fn"

CloudFormation :: {
	CustomResource :: {
		Type:       "AWS::CloudFormation::CustomResource" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
		Properties: close({
			ServiceToken: string | fn.Fn
			[string]:     _
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Macro :: {
		Type:       "AWS::CloudFormation::Macro"
		Properties: close({
			Description?:  string | fn.Fn
			FunctionName:  string | fn.Fn
			LogGroupName?: string | fn.Fn
			LogRoleARN?:   string | fn.Fn
			Name:          string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Stack :: {
		Type:       "AWS::CloudFormation::Stack"
		Properties: close({
			NotificationARNs?: [...(string | fn.Fn)] | (string | fn.Fn)
			Parameters?:       {
				[string]: string | fn.Fn
			} | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TemplateURL:       string | fn.Fn
			TimeoutInMinutes?: int | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	StackSet :: {
		Type:       "AWS::CloudFormation::StackSet"
		Properties: close({
			AdministrationRoleARN?: string | fn.Fn
			AutoDeployment?:        close({
				Enabled?:                      bool | fn.Fn
				RetainStacksOnAccountRemoval?: bool | fn.Fn
			}) | fn.If
			Capabilities?:         [...(string | fn.Fn)] | (string | fn.Fn)
			Description?:          string | fn.Fn
			ExecutionRoleName?:    string | fn.Fn
			OperationPreferences?: close({
				FailureToleranceCount?:      int | fn.Fn
				FailureTolerancePercentage?: int | fn.Fn
				MaxConcurrentCount?:         int | fn.Fn
				MaxConcurrentPercentage?:    int | fn.Fn
				RegionOrder?:                [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			Parameters?: [...close({
				ParameterKey:   string | fn.Fn
				ParameterValue: string | fn.Fn
			})] | fn.If
			PermissionModel?:     ("SELF_MANAGED" | "SERVICE_MANAGED") | fn.Fn
			StackInstancesGroup?: [...close({
				DeploymentTargets: close({
					Accounts?:              [...(string | fn.Fn)] | (string | fn.Fn)
					OrganizationalUnitIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				ParameterOverrides?: [...close({
					ParameterKey:   string | fn.Fn
					ParameterValue: string | fn.Fn
				})] | fn.If
				Regions: [...(string | fn.Fn)] | (string | fn.Fn)
			})] | fn.If
			StackSetName?: string | fn.Fn
			Tags?:         [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TemplateBody?: string | fn.Fn
			TemplateURL?:  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WaitCondition :: {
		Type:       "AWS::CloudFormation::WaitCondition"
		Properties: close({
			Count?:   int | fn.Fn
			Handle?:  string | fn.Fn
			Timeout?: (>=0 & <=43200) | fn.Fn
		})
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
		Condition?: string
	}
	WaitConditionHandle :: {
		Type:       "AWS::CloudFormation::WaitConditionHandle"
		Properties: close({
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

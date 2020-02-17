package apsoutheast2

import "github.com/TangoGroup/aws/fn"

SageMaker :: {
	CodeRepository :: {
		Type: "AWS::SageMaker::CodeRepository"
		Properties: {
			CodeRepositoryName?: string | fn.Fn
			GitConfig:           {
				Branch?:       string | fn.Fn
				RepositoryUrl: string | fn.Fn
				SecretArn?:    string | fn.Fn
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Model :: {
		Type: "AWS::SageMaker::Model"
		Properties: {
			Containers?: [...{
				ContainerHostname?: string | fn.Fn
				Environment?:       {
					[string]: _
				} | fn.Fn
				Image:         string | fn.Fn
				Mode?:         string | fn.Fn
				ModelDataUrl?: string | fn.Fn
			}] | fn.If
			ExecutionRoleArn:  string | fn.Fn
			ModelName?:        string | fn.Fn
			PrimaryContainer?: {
				ContainerHostname?: string | fn.Fn
				Environment?:       {
					[string]: _
				} | fn.Fn
				Image:         string | fn.Fn
				Mode?:         string | fn.Fn
				ModelDataUrl?: string | fn.Fn
			} | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VpcConfig?: {
				SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
				Subnets:          [...(string | fn.Fn)] | (string | fn.Fn)
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NotebookInstance :: {
		Type: "AWS::SageMaker::NotebookInstance"
		Properties: {
			AcceleratorTypes?:           [...(string | fn.Fn)] | (string | fn.Fn)
			AdditionalCodeRepositories?: [...(string | fn.Fn)] | (string | fn.Fn)
			DefaultCodeRepository?:      string | fn.Fn
			DirectInternetAccess?:       string | fn.Fn
			InstanceType:                string | fn.Fn
			KmsKeyId?:                   string | fn.Fn
			LifecycleConfigName?:        string | fn.Fn
			NotebookInstanceName?:       string | fn.Fn
			RoleArn:                     string | fn.Fn
			RootAccess?:                 string | fn.Fn
			SecurityGroupIds?:           [...(string | fn.Fn)] | (string | fn.Fn)
			SubnetId?:                   string | fn.Fn
			Tags?:                       [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VolumeSizeInGB?: (>=5 & <=16384) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Workteam :: {
		Type: "AWS::SageMaker::Workteam"
		Properties: {
			Description?:       string | fn.Fn
			MemberDefinitions?: [...{
				CognitoMemberDefinition: {
					CognitoClientId:  string | fn.Fn
					CognitoUserGroup: string | fn.Fn
					CognitoUserPool:  string | fn.Fn
				} | fn.If
			}] | fn.If
			NotificationConfiguration?: {
				NotificationTopicArn: string | fn.Fn
			} | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			WorkteamName?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

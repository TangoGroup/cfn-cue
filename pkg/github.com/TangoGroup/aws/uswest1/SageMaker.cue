package uswest1

import "github.com/TangoGroup/aws/fn"

SageMaker :: {
	CodeRepository :: {
		Type: "AWS::SageMaker::CodeRepository"
		Properties: {
			CodeRepositoryName?: string | fn.Fn
			GitConfig: {
				Branch?:       string | fn.Fn
				RepositoryUrl: string | fn.Fn
				SecretArn?:    string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Endpoint :: {
		Type: "AWS::SageMaker::Endpoint"
		Properties: {
			EndpointConfigName: string | fn.Fn
			EndpointName?:      string | fn.Fn
			ExcludeRetainedVariantProperties?: [...{
				VariantPropertyType?: string | fn.Fn
			}]
			RetainAllVariantProperties?: bool | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	EndpointConfig :: {
		Type: "AWS::SageMaker::EndpointConfig"
		Properties: {
			EndpointConfigName?: string | fn.Fn
			KmsKeyId?:           string | fn.Fn
			ProductionVariants: [...{
				AcceleratorType?:     string | fn.Fn
				InitialInstanceCount: int | fn.Fn
				InitialVariantWeight: float | fn.Fn
				InstanceType:         string | fn.Fn
				ModelName:            string | fn.Fn
				VariantName:          string | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
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
			}]
			ExecutionRoleArn: string | fn.Fn
			ModelName?:       string | fn.Fn
			PrimaryContainer?: {
				ContainerHostname?: string | fn.Fn
				Environment?:       {
					[string]: _
				} | fn.Fn
				Image:         string | fn.Fn
				Mode?:         string | fn.Fn
				ModelDataUrl?: string | fn.Fn
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcConfig?: {
				SecurityGroupIds: [...(string | fn.Fn)] | fn.Fn
				Subnets:          [...(string | fn.Fn)] | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	NotebookInstance :: {
		Type: "AWS::SageMaker::NotebookInstance"
		Properties: {
			AcceleratorTypes?:           [...(string | fn.Fn)] | fn.Fn
			AdditionalCodeRepositories?: [...(string | fn.Fn)] | fn.Fn
			DefaultCodeRepository?:      string | fn.Fn
			DirectInternetAccess?:       string | fn.Fn
			InstanceType:                string | fn.Fn
			KmsKeyId?:                   string | fn.Fn
			LifecycleConfigName?:        string | fn.Fn
			NotebookInstanceName?:       string | fn.Fn
			RoleArn:                     string | fn.Fn
			RootAccess?:                 string | fn.Fn
			SecurityGroupIds?:           [...(string | fn.Fn)] | fn.Fn
			SubnetId?:                   string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VolumeSizeInGB?: (>=5 & <=16384) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	NotebookInstanceLifecycleConfig :: {
		Type: "AWS::SageMaker::NotebookInstanceLifecycleConfig"
		Properties: {
			NotebookInstanceLifecycleConfigName?: string | fn.Fn
			OnCreate?: [...{
				Content?: string | fn.Fn
			}]
			OnStart?: [...{
				Content?: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Workteam :: {
		Type: "AWS::SageMaker::Workteam"
		Properties: {
			Description?: string | fn.Fn
			MemberDefinitions?: [...{
				CognitoMemberDefinition: {
					CognitoClientId:  string | fn.Fn
					CognitoUserGroup: string | fn.Fn
					CognitoUserPool:  string | fn.Fn
				}
			}]
			NotificationConfiguration?: NotificationTopicArn: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			WorkteamName?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

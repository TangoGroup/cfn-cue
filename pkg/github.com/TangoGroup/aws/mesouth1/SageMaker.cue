package mesouth1

import "github.com/TangoGroup/aws/fn"

SageMaker :: {
	CodeRepository :: {
		Type: "AWS::SageMaker::CodeRepository"
		Properties: {
			CodeRepositoryName?: string | fn.Fn
			GitConfig: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Endpoint :: {
		Type: "AWS::SageMaker::Endpoint"
		Properties: {
			EndpointConfigName: string | fn.Fn
			EndpointName?:      string | fn.Fn
			ExcludeRetainedVariantProperties?: [...{
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
		Condition?: string
	}
	EndpointConfig :: {
		Type: "AWS::SageMaker::EndpointConfig"
		Properties: {
			EndpointConfigName?: string | fn.Fn
			KmsKeyId?:           string | fn.Fn
			ProductionVariants: [...{
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
		Condition?: string
	}
	Model :: {
		Type: "AWS::SageMaker::Model"
		Properties: {
			Containers?: [...{
			}]
			ExecutionRoleArn: string | fn.Fn
			ModelName?:       string | fn.Fn
			PrimaryContainer?: {
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcConfig?: {
			}
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
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VolumeSizeInGB?: int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NotebookInstanceLifecycleConfig :: {
		Type: "AWS::SageMaker::NotebookInstanceLifecycleConfig"
		Properties: {
			NotebookInstanceLifecycleConfigName?: string | fn.Fn
			OnCreate?: [...{
			}]
			OnStart?: [...{
			}]
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
			Description?: string | fn.Fn
			MemberDefinitions?: [...{
			}]
			NotificationConfiguration?: {
			}
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
		Condition?: string
	}
}

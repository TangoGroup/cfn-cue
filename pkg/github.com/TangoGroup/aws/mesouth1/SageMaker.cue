package mesouth1

import "github.com/TangoGroup/aws/fn"

SageMaker :: {
	CodeRepository :: {
		Type:       "AWS::SageMaker::CodeRepository"
		Properties: close({
			CodeRepositoryName?: string | fn.Fn
			GitConfig:           close({}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Endpoint :: {
		Type:       "AWS::SageMaker::Endpoint"
		Properties: close({
			EndpointConfigName:                string | fn.Fn
			EndpointName?:                     string | fn.Fn
			ExcludeRetainedVariantProperties?: [...close({})] | fn.If
			RetainAllVariantProperties?:       bool | fn.Fn
			Tags?:                             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EndpointConfig :: {
		Type:       "AWS::SageMaker::EndpointConfig"
		Properties: close({
			EndpointConfigName?: string | fn.Fn
			KmsKeyId?:           string | fn.Fn
			ProductionVariants:  [...close({})] | fn.If
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Model :: {
		Type:       "AWS::SageMaker::Model"
		Properties: close({
			Containers?:       [...close({})] | fn.If
			ExecutionRoleArn:  string | fn.Fn
			ModelName?:        string | fn.Fn
			PrimaryContainer?: close({}) | fn.If
			Tags?:             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcConfig?: close({}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NotebookInstance :: {
		Type:       "AWS::SageMaker::NotebookInstance"
		Properties: close({
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
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VolumeSizeInGB?: int | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NotebookInstanceLifecycleConfig :: {
		Type:       "AWS::SageMaker::NotebookInstanceLifecycleConfig"
		Properties: close({
			NotebookInstanceLifecycleConfigName?: string | fn.Fn
			OnCreate?:                            [...close({})] | fn.If
			OnStart?:                             [...close({})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Workteam :: {
		Type:       "AWS::SageMaker::Workteam"
		Properties: close({
			Description?:               string | fn.Fn
			MemberDefinitions?:         [...close({})] | fn.If
			NotificationConfiguration?: close({}) | fn.If
			Tags?:                      [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			WorkteamName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

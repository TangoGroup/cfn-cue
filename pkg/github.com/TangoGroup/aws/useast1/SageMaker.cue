package useast1

import "github.com/TangoGroup/aws/fn"

SageMaker :: {
	CodeRepository :: {
		Type:       "AWS::SageMaker::CodeRepository"
		Properties: close({
			CodeRepositoryName?: string | fn.Fn
			GitConfig:           close({
				Branch?:       string | fn.Fn
				RepositoryUrl: string | fn.Fn
				SecretArn?:    string | fn.Fn
			}) | fn.If
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
			ExcludeRetainedVariantProperties?: [...close({
				VariantPropertyType?: string | fn.Fn
			})] | fn.If
			RetainAllVariantProperties?: bool | fn.Fn
			Tags?:                       [...close({
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
			DataCaptureConfig?: close({
				CaptureContentTypeHeader?: close({
					CsvContentTypes?:  [...(string | fn.Fn)] | (string | fn.Fn)
					JsonContentTypes?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				CaptureOptions: [...close({
					CaptureMode: string | fn.Fn
				})] | fn.If
				DestinationS3Uri:          string | fn.Fn
				EnableCapture?:            bool | fn.Fn
				InitialSamplingPercentage: int | fn.Fn
				KmsKeyId?:                 string | fn.Fn
			}) | fn.If
			EndpointConfigName?: string | fn.Fn
			KmsKeyId?:           string | fn.Fn
			ProductionVariants:  [...close({
				AcceleratorType?:     string | fn.Fn
				InitialInstanceCount: int | fn.Fn
				InitialVariantWeight: number | fn.Fn
				InstanceType:         string | fn.Fn
				ModelName:            string | fn.Fn
				VariantName:          string | fn.Fn
			})] | fn.If
			Tags?: [...close({
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
			Containers?: [...close({
				ContainerHostname?: string | fn.Fn
				Environment?:       {
					[string]: _
				} | fn.Fn
				Image?:            string | fn.Fn
				Mode?:             string | fn.Fn
				ModelDataUrl?:     string | fn.Fn
				ModelPackageName?: string | fn.Fn
			})] | fn.If
			ExecutionRoleArn:  string | fn.Fn
			ModelName?:        string | fn.Fn
			PrimaryContainer?: close({
				ContainerHostname?: string | fn.Fn
				Environment?:       {
					[string]: _
				} | fn.Fn
				Image?:            string | fn.Fn
				Mode?:             string | fn.Fn
				ModelDataUrl?:     string | fn.Fn
				ModelPackageName?: string | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcConfig?: close({
				SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
				Subnets:          [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
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
			VolumeSizeInGB?: (>=5 & <=16384) | fn.Fn
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
			OnCreate?:                            [...close({
				Content?: string | fn.Fn
			})] | fn.If
			OnStart?: [...close({
				Content?: string | fn.Fn
			})] | fn.If
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
			Description?:       string | fn.Fn
			MemberDefinitions?: [...close({
				CognitoMemberDefinition: close({
					CognitoClientId:  string | fn.Fn
					CognitoUserGroup: string | fn.Fn
					CognitoUserPool:  string | fn.Fn
				}) | fn.If
			})] | fn.If
			NotificationConfiguration?: close({
				NotificationTopicArn: string | fn.Fn
			}) | fn.If
			Tags?: [...close({
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

package apnortheast1

import "github.com/TangoGroup/fn"

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
	}
	Endpoint :: {
		Type: "AWS::SageMaker::Endpoint"
		Properties: {
			EndpointConfigName: string | fn.Fn
			EndpointName?:      string | fn.Fn
			Tags?: [...{
			}]
		}
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
				ModelDataUrl?: string | fn.Fn
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VpcConfig?: {
				SecurityGroupIds: [...(string | fn.Fn)]
				Subnets: [...(string | fn.Fn)]
			}
		}
	}
	NotebookInstance :: {
		Type: "AWS::SageMaker::NotebookInstance"
		Properties: {
			AcceleratorTypes?: [...(string | fn.Fn)]
			AdditionalCodeRepositories?: [...(string | fn.Fn)]
			DefaultCodeRepository?: string | fn.Fn
			DirectInternetAccess?:  string | fn.Fn
			InstanceType:           string | fn.Fn
			KmsKeyId?:              string | fn.Fn
			LifecycleConfigName?:   string | fn.Fn
			NotebookInstanceName?:  string | fn.Fn
			RoleArn:                string | fn.Fn
			RootAccess?:            string | fn.Fn
			SecurityGroupIds?: [...(string | fn.Fn)]
			SubnetId?: string | fn.Fn
			Tags?: [...{
			}]
			VolumeSizeInGB?: (int & (>=5 & <=16384)) | fn.Fn
		}
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
	}
}

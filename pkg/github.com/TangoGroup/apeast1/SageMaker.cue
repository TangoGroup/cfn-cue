package apeast1

import "github.com/TangoGroup/fn"

SageMaker :: {
	CodeRepository :: {
		Type: "AWS::SageMaker::CodeRepository"
		Properties: {
			CodeRepositoryName?: string | fn.Fn
			GitConfig: {
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
			}]
			Tags?: [...{
			}]
		}
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
			}]
			VpcConfig?: {
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
			VolumeSizeInGB?: int | fn.Fn
		}
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
			}]
			WorkteamName?: string | fn.Fn
		}
	}
}

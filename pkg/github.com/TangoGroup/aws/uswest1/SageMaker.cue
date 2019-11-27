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
			VolumeSizeInGB?: (int & (>=5 & <=16384)) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

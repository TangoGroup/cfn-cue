package SageMaker

import "github.com/TangoGroup/fn"

CodeRepository :: {
	Type: "AWS::SageMaker::CodeRepository"
	Properties: {
		CodeRepositoryName?: string | fn.Fn
		GitConfig:           propGitConfig
	}
	propGitConfig :: {
		Branch?:       string | fn.Fn
		RepositoryUrl: string | fn.Fn
		SecretArn?:    string | fn.Fn
	}
}
Endpoint :: {
	Type: "AWS::SageMaker::Endpoint"
	Properties: {
		EndpointConfigName: string | fn.Fn
		EndpointName?:      string | fn.Fn
		Tags?: [...propTag]
	}
}
EndpointConfig :: {
	Type: "AWS::SageMaker::EndpointConfig"
	Properties: {
		EndpointConfigName?: string | fn.Fn
		KmsKeyId?:           string | fn.Fn
		ProductionVariants: [...propProductionVariant]
		Tags?: [...propTag]
	}
	propProductionVariant :: {
		AcceleratorType?:     string | fn.Fn
		InitialInstanceCount: int | fn.Fn
		InitialVariantWeight: float | fn.Fn
		InstanceType:         string | fn.Fn
		ModelName:            string | fn.Fn
		VariantName:          string | fn.Fn
	}
}
Model :: {
	Type: "AWS::SageMaker::Model"
	Properties: {
		Containers?: [...propContainerDefinition]
		ExecutionRoleArn:  string | fn.Fn
		ModelName?:        string | fn.Fn
		PrimaryContainer?: propContainerDefinition
		Tags?: [...propTag]
		VpcConfig?: propVpcConfig
	}
	propContainerDefinition :: {
		ContainerHostname?: string | fn.Fn
		Environment?:       {
		} | fn.Fn
		Image:         string | fn.Fn
		ModelDataUrl?: string | fn.Fn
	}
	propVpcConfig :: {
		SecurityGroupIds: [...string] | fn.Fn
		Subnets:          [...string] | fn.Fn
	}
}
NotebookInstance :: {
	Type: "AWS::SageMaker::NotebookInstance"
	Properties: {
		AcceleratorTypes?:           [...string] | fn.Fn
		AdditionalCodeRepositories?: [...string] | fn.Fn
		DefaultCodeRepository?:      string | fn.Fn
		DirectInternetAccess?:       string | fn.Fn
		InstanceType:                string | fn.Fn
		KmsKeyId?:                   string | fn.Fn
		LifecycleConfigName?:        string | fn.Fn
		NotebookInstanceName?:       string | fn.Fn
		RoleArn:                     string | fn.Fn
		RootAccess?:                 string | fn.Fn
		SecurityGroupIds?:           [...string] | fn.Fn
		SubnetId?:                   string | fn.Fn
		Tags?: [...propTag]
		VolumeSizeInGB?: (int & (>=5 & <=16384)) | fn.Fn
	}
}
NotebookInstanceLifecycleConfig :: {
	Type: "AWS::SageMaker::NotebookInstanceLifecycleConfig"
	Properties: {
		NotebookInstanceLifecycleConfigName?: string | fn.Fn
		OnCreate?: [...propNotebookInstanceLifecycleHook]
		OnStart?: [...propNotebookInstanceLifecycleHook]
	}
	propNotebookInstanceLifecycleHook :: {
		Content?: string | fn.Fn
	}
}
Workteam :: {
	Type: "AWS::SageMaker::Workteam"
	Properties: {
		Description?: string | fn.Fn
		MemberDefinitions?: [...propMemberDefinition]
		NotificationConfiguration?: propNotificationConfiguration
		Tags?: [...propTag]
		WorkteamName?: string | fn.Fn
	}
	propCognitoMemberDefinition :: {
		CognitoClientId:  string | fn.Fn
		CognitoUserGroup: string | fn.Fn
		CognitoUserPool:  string | fn.Fn
	}
	propMemberDefinition :: {
		CognitoMemberDefinition: propCognitoMemberDefinition
	}
	propNotificationConfiguration :: {
		NotificationTopicArn: string | fn.Fn
	}
}

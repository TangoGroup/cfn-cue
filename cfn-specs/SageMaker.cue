package SageMaker

CodeRepository :: {
	Type: "AWS::SageMaker::CodeRepository"
	Properties: {
		CodeRepositoryName?: string
		GitConfig:           __GitConfig
	}
	__GitConfig = {
		Branch?:       string
		RepositoryUrl: string
		SecretArn?:    string
	}
}
Endpoint :: {
	Type: "AWS::SageMaker::Endpoint"
	Properties: {
		EndpointConfigName: string
		EndpointName?:      string
		Tags?: [...__Tag]
	}
}
EndpointConfig :: {
	Type: "AWS::SageMaker::EndpointConfig"
	Properties: {
		EndpointConfigName?: string
		KmsKeyId?:           string
		ProductionVariants: [...__ProductionVariant]
		Tags?: [...__Tag]
	}
	__ProductionVariant = {
		AcceleratorType?:     string
		InitialInstanceCount: int
		InitialVariantWeight: float
		InstanceType:         string
		ModelName:            string
		VariantName:          string
	}
}
Model :: {
	Type: "AWS::SageMaker::Model"
	Properties: {
		Containers?: [...__ContainerDefinition]
		ExecutionRoleArn:  string
		ModelName?:        string
		PrimaryContainer?: __ContainerDefinition
		Tags?: [...__Tag]
		VpcConfig?: __VpcConfig
	}
	__ContainerDefinition = {
		ContainerHostname?: string
		Environment?: {
		}
		Image:         string
		ModelDataUrl?: string
	}
	__VpcConfig = {
		SecurityGroupIds: [...string]
		Subnets: [...string]
	}
}
NotebookInstance :: {
	Type: "AWS::SageMaker::NotebookInstance"
	Properties: {
		AcceleratorTypes?: [...string]
		AdditionalCodeRepositories?: [...string]
		DefaultCodeRepository?: string
		DirectInternetAccess?:  string
		InstanceType:           string
		KmsKeyId?:              string
		LifecycleConfigName?:   string
		NotebookInstanceName?:  string
		RoleArn:                string
		RootAccess?:            string
		SecurityGroupIds?: [...string]
		SubnetId?: string
		Tags?: [...__Tag]
		VolumeSizeInGB?: >=5 & <=16384
		VolumeSizeInGB?: int
	}
}
NotebookInstanceLifecycleConfig :: {
	Type: "AWS::SageMaker::NotebookInstanceLifecycleConfig"
	Properties: {
		NotebookInstanceLifecycleConfigName?: string
		OnCreate?: [...__NotebookInstanceLifecycleHook]
		OnStart?: [...__NotebookInstanceLifecycleHook]
	}
	__NotebookInstanceLifecycleHook = {
		Content?: string
	}
}
Workteam :: {
	Type: "AWS::SageMaker::Workteam"
	Properties: {
		Description?: string
		MemberDefinitions?: [...__MemberDefinition]
		NotificationConfiguration?: __NotificationConfiguration
		Tags?: [...__Tag]
		WorkteamName?: string
	}
	__CognitoMemberDefinition = {
		CognitoClientId:  string
		CognitoUserGroup: string
		CognitoUserPool:  string
	}
	__MemberDefinition = {
		CognitoMemberDefinition: __CognitoMemberDefinition
	}
	__NotificationConfiguration = {
		NotificationTopicArn: string
	}
}

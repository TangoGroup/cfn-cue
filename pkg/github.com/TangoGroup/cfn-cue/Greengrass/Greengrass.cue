package Greengrass

import "github.com/TangoGroup/fn"

ConnectorDefinition :: {
	Type: "AWS::Greengrass::ConnectorDefinition"
	Properties: {
		InitialVersion?: __ConnectorDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	__Connector :: {
		ConnectorArn: string | fn.Fn
		Id:           string | fn.Fn
		Parameters?:  {
		} | fn.Fn
	}
	__ConnectorDefinitionVersion :: {
		Connectors: [...__Connector]
	}
}
ConnectorDefinitionVersion :: {
	Type: "AWS::Greengrass::ConnectorDefinitionVersion"
	Properties: {
		ConnectorDefinitionId: string | fn.Fn
		Connectors: [...__Connector]
	}
	__Connector :: {
		ConnectorArn: string | fn.Fn
		Id:           string | fn.Fn
		Parameters?:  {
		} | fn.Fn
	}
}
CoreDefinition :: {
	Type: "AWS::Greengrass::CoreDefinition"
	Properties: {
		InitialVersion?: __CoreDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	__Core :: {
		CertificateArn: string | fn.Fn
		Id:             string | fn.Fn
		SyncShadow?:    bool | fn.Fn
		ThingArn:       string | fn.Fn
	}
	__CoreDefinitionVersion :: {
		Cores: [...__Core]
	}
}
CoreDefinitionVersion :: {
	Type: "AWS::Greengrass::CoreDefinitionVersion"
	Properties: {
		CoreDefinitionId: string | fn.Fn
		Cores: [...__Core]
	}
	__Core :: {
		CertificateArn: string | fn.Fn
		Id:             string | fn.Fn
		SyncShadow?:    bool | fn.Fn
		ThingArn:       string | fn.Fn
	}
}
DeviceDefinition :: {
	Type: "AWS::Greengrass::DeviceDefinition"
	Properties: {
		InitialVersion?: __DeviceDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	__Device :: {
		CertificateArn: string | fn.Fn
		Id:             string | fn.Fn
		SyncShadow?:    bool | fn.Fn
		ThingArn:       string | fn.Fn
	}
	__DeviceDefinitionVersion :: {
		Devices: [...__Device]
	}
}
DeviceDefinitionVersion :: {
	Type: "AWS::Greengrass::DeviceDefinitionVersion"
	Properties: {
		DeviceDefinitionId: string | fn.Fn
		Devices: [...__Device]
	}
	__Device :: {
		CertificateArn: string | fn.Fn
		Id:             string | fn.Fn
		SyncShadow?:    bool | fn.Fn
		ThingArn:       string | fn.Fn
	}
}
FunctionDefinition :: {
	Type: "AWS::Greengrass::FunctionDefinition"
	Properties: {
		InitialVersion?: __FunctionDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	__DefaultConfig :: {
		Execution: __Execution
	}
	__Environment :: {
		AccessSysfs?: bool | fn.Fn
		Execution?:   __Execution
		ResourceAccessPolicies?: [...__ResourceAccessPolicy]
		Variables?: {
		} | fn.Fn
	}
	__Execution :: {
		IsolationMode?: string | fn.Fn
		RunAs?:         __RunAs
	}
	__Function :: {
		FunctionArn:           string | fn.Fn
		FunctionConfiguration: __FunctionConfiguration
		Id:                    string | fn.Fn
	}
	__FunctionConfiguration :: {
		EncodingType?: string | fn.Fn
		Environment?:  __Environment
		ExecArgs?:     string | fn.Fn
		Executable?:   string | fn.Fn
		MemorySize?:   int | fn.Fn
		Pinned?:       bool | fn.Fn
		Timeout?:      int | fn.Fn
	}
	__FunctionDefinitionVersion :: {
		DefaultConfig?: __DefaultConfig
		Functions: [...__Function]
	}
	__ResourceAccessPolicy :: {
		Permission?: string | fn.Fn
		ResourceId:  string | fn.Fn
	}
	__RunAs :: {
		Gid?: int | fn.Fn
		Uid?: int | fn.Fn
	}
}
FunctionDefinitionVersion :: {
	Type: "AWS::Greengrass::FunctionDefinitionVersion"
	Properties: {
		DefaultConfig?:       __DefaultConfig
		FunctionDefinitionId: string | fn.Fn
		Functions: [...__Function]
	}
	__DefaultConfig :: {
		Execution: __Execution
	}
	__Environment :: {
		AccessSysfs?: bool | fn.Fn
		Execution?:   __Execution
		ResourceAccessPolicies?: [...__ResourceAccessPolicy]
		Variables?: {
		} | fn.Fn
	}
	__Execution :: {
		IsolationMode?: string | fn.Fn
		RunAs?:         __RunAs
	}
	__Function :: {
		FunctionArn:           string | fn.Fn
		FunctionConfiguration: __FunctionConfiguration
		Id:                    string | fn.Fn
	}
	__FunctionConfiguration :: {
		EncodingType?: string | fn.Fn
		Environment?:  __Environment
		ExecArgs?:     string | fn.Fn
		Executable?:   string | fn.Fn
		MemorySize?:   int | fn.Fn
		Pinned?:       bool | fn.Fn
		Timeout?:      int | fn.Fn
	}
	__ResourceAccessPolicy :: {
		Permission?: string | fn.Fn
		ResourceId:  string | fn.Fn
	}
	__RunAs :: {
		Gid?: int | fn.Fn
		Uid?: int | fn.Fn
	}
}
Group :: {
	Type: "AWS::Greengrass::Group"
	Properties: {
		InitialVersion?: __GroupVersion
		Name:            string | fn.Fn
		RoleArn?:        string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	__GroupVersion :: {
		ConnectorDefinitionVersionArn?:    string | fn.Fn
		CoreDefinitionVersionArn?:         string | fn.Fn
		DeviceDefinitionVersionArn?:       string | fn.Fn
		FunctionDefinitionVersionArn?:     string | fn.Fn
		LoggerDefinitionVersionArn?:       string | fn.Fn
		ResourceDefinitionVersionArn?:     string | fn.Fn
		SubscriptionDefinitionVersionArn?: string | fn.Fn
	}
}
GroupVersion :: {
	Type: "AWS::Greengrass::GroupVersion"
	Properties: {
		ConnectorDefinitionVersionArn?:    string | fn.Fn
		CoreDefinitionVersionArn?:         string | fn.Fn
		DeviceDefinitionVersionArn?:       string | fn.Fn
		FunctionDefinitionVersionArn?:     string | fn.Fn
		GroupId:                           string | fn.Fn
		LoggerDefinitionVersionArn?:       string | fn.Fn
		ResourceDefinitionVersionArn?:     string | fn.Fn
		SubscriptionDefinitionVersionArn?: string | fn.Fn
	}
}
LoggerDefinition :: {
	Type: "AWS::Greengrass::LoggerDefinition"
	Properties: {
		InitialVersion?: __LoggerDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	__Logger :: {
		Component: string | fn.Fn
		Id:        string | fn.Fn
		Level:     string | fn.Fn
		Space?:    int | fn.Fn
		Type:      string | fn.Fn
	}
	__LoggerDefinitionVersion :: {
		Loggers: [...__Logger]
	}
}
LoggerDefinitionVersion :: {
	Type: "AWS::Greengrass::LoggerDefinitionVersion"
	Properties: {
		LoggerDefinitionId: string | fn.Fn
		Loggers: [...__Logger]
	}
	__Logger :: {
		Component: string | fn.Fn
		Id:        string | fn.Fn
		Level:     string | fn.Fn
		Space?:    int | fn.Fn
		Type:      string | fn.Fn
	}
}
ResourceDefinition :: {
	Type: "AWS::Greengrass::ResourceDefinition"
	Properties: {
		InitialVersion?: __ResourceDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	__GroupOwnerSetting :: {
		AutoAddGroupOwner: bool | fn.Fn
		GroupOwner?:       string | fn.Fn
	}
	__LocalDeviceResourceData :: {
		GroupOwnerSetting?: __GroupOwnerSetting
		SourcePath:         string | fn.Fn
	}
	__LocalVolumeResourceData :: {
		DestinationPath:    string | fn.Fn
		GroupOwnerSetting?: __GroupOwnerSetting
		SourcePath:         string | fn.Fn
	}
	__ResourceDataContainer :: {
		LocalDeviceResourceData?:                   __LocalDeviceResourceData
		LocalVolumeResourceData?:                   __LocalVolumeResourceData
		S3MachineLearningModelResourceData?:        __S3MachineLearningModelResourceData
		SageMakerMachineLearningModelResourceData?: __SageMakerMachineLearningModelResourceData
		SecretsManagerSecretResourceData?:          __SecretsManagerSecretResourceData
	}
	__ResourceDefinitionVersion :: {
		Resources: [...__ResourceInstance]
	}
	__ResourceInstance :: {
		Id:                    string | fn.Fn
		Name:                  string | fn.Fn
		ResourceDataContainer: __ResourceDataContainer
	}
	__S3MachineLearningModelResourceData :: {
		DestinationPath: string | fn.Fn
		S3Uri:           string | fn.Fn
	}
	__SageMakerMachineLearningModelResourceData :: {
		DestinationPath: string | fn.Fn
		SageMakerJobArn: string | fn.Fn
	}
	__SecretsManagerSecretResourceData :: {
		ARN:                                string | fn.Fn
		AdditionalStagingLabelsToDownload?: [...string] | fn.Fn
	}
}
ResourceDefinitionVersion :: {
	Type: "AWS::Greengrass::ResourceDefinitionVersion"
	Properties: {
		ResourceDefinitionId: string | fn.Fn
		Resources: [...__ResourceInstance]
	}
	__GroupOwnerSetting :: {
		AutoAddGroupOwner: bool | fn.Fn
		GroupOwner?:       string | fn.Fn
	}
	__LocalDeviceResourceData :: {
		GroupOwnerSetting?: __GroupOwnerSetting
		SourcePath:         string | fn.Fn
	}
	__LocalVolumeResourceData :: {
		DestinationPath:    string | fn.Fn
		GroupOwnerSetting?: __GroupOwnerSetting
		SourcePath:         string | fn.Fn
	}
	__ResourceDataContainer :: {
		LocalDeviceResourceData?:                   __LocalDeviceResourceData
		LocalVolumeResourceData?:                   __LocalVolumeResourceData
		S3MachineLearningModelResourceData?:        __S3MachineLearningModelResourceData
		SageMakerMachineLearningModelResourceData?: __SageMakerMachineLearningModelResourceData
		SecretsManagerSecretResourceData?:          __SecretsManagerSecretResourceData
	}
	__ResourceInstance :: {
		Id:                    string | fn.Fn
		Name:                  string | fn.Fn
		ResourceDataContainer: __ResourceDataContainer
	}
	__S3MachineLearningModelResourceData :: {
		DestinationPath: string | fn.Fn
		S3Uri:           string | fn.Fn
	}
	__SageMakerMachineLearningModelResourceData :: {
		DestinationPath: string | fn.Fn
		SageMakerJobArn: string | fn.Fn
	}
	__SecretsManagerSecretResourceData :: {
		ARN:                                string | fn.Fn
		AdditionalStagingLabelsToDownload?: [...string] | fn.Fn
	}
}
SubscriptionDefinition :: {
	Type: "AWS::Greengrass::SubscriptionDefinition"
	Properties: {
		InitialVersion?: __SubscriptionDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	__Subscription :: {
		Id:      string | fn.Fn
		Source:  string | fn.Fn
		Subject: string | fn.Fn
		Target:  string | fn.Fn
	}
	__SubscriptionDefinitionVersion :: {
		Subscriptions: [...__Subscription]
	}
}
SubscriptionDefinitionVersion :: {
	Type: "AWS::Greengrass::SubscriptionDefinitionVersion"
	Properties: {
		SubscriptionDefinitionId: string | fn.Fn
		Subscriptions: [...__Subscription]
	}
	__Subscription :: {
		Id:      string | fn.Fn
		Source:  string | fn.Fn
		Subject: string | fn.Fn
		Target:  string | fn.Fn
	}
}

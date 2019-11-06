package Greengrass

import "github.com/TangoGroup/fn"

ConnectorDefinition :: {
	Type: "AWS::Greengrass::ConnectorDefinition"
	Properties: {
		InitialVersion?: propConnectorDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	propConnector :: {
		ConnectorArn: string | fn.Fn
		Id:           string | fn.Fn
		Parameters?:  {
		} | fn.Fn
	}
	propConnectorDefinitionVersion :: {
		Connectors: [...propConnector]
	}
}
ConnectorDefinitionVersion :: {
	Type: "AWS::Greengrass::ConnectorDefinitionVersion"
	Properties: {
		ConnectorDefinitionId: string | fn.Fn
		Connectors: [...propConnector]
	}
	propConnector :: {
		ConnectorArn: string | fn.Fn
		Id:           string | fn.Fn
		Parameters?:  {
		} | fn.Fn
	}
}
CoreDefinition :: {
	Type: "AWS::Greengrass::CoreDefinition"
	Properties: {
		InitialVersion?: propCoreDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	propCore :: {
		CertificateArn: string | fn.Fn
		Id:             string | fn.Fn
		SyncShadow?:    bool | fn.Fn
		ThingArn:       string | fn.Fn
	}
	propCoreDefinitionVersion :: {
		Cores: [...propCore]
	}
}
CoreDefinitionVersion :: {
	Type: "AWS::Greengrass::CoreDefinitionVersion"
	Properties: {
		CoreDefinitionId: string | fn.Fn
		Cores: [...propCore]
	}
	propCore :: {
		CertificateArn: string | fn.Fn
		Id:             string | fn.Fn
		SyncShadow?:    bool | fn.Fn
		ThingArn:       string | fn.Fn
	}
}
DeviceDefinition :: {
	Type: "AWS::Greengrass::DeviceDefinition"
	Properties: {
		InitialVersion?: propDeviceDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	propDevice :: {
		CertificateArn: string | fn.Fn
		Id:             string | fn.Fn
		SyncShadow?:    bool | fn.Fn
		ThingArn:       string | fn.Fn
	}
	propDeviceDefinitionVersion :: {
		Devices: [...propDevice]
	}
}
DeviceDefinitionVersion :: {
	Type: "AWS::Greengrass::DeviceDefinitionVersion"
	Properties: {
		DeviceDefinitionId: string | fn.Fn
		Devices: [...propDevice]
	}
	propDevice :: {
		CertificateArn: string | fn.Fn
		Id:             string | fn.Fn
		SyncShadow?:    bool | fn.Fn
		ThingArn:       string | fn.Fn
	}
}
FunctionDefinition :: {
	Type: "AWS::Greengrass::FunctionDefinition"
	Properties: {
		InitialVersion?: propFunctionDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	propDefaultConfig :: {
		Execution: propExecution
	}
	propEnvironment :: {
		AccessSysfs?: bool | fn.Fn
		Execution?:   propExecution
		ResourceAccessPolicies?: [...propResourceAccessPolicy]
		Variables?: {
		} | fn.Fn
	}
	propExecution :: {
		IsolationMode?: string | fn.Fn
		RunAs?:         propRunAs
	}
	propFunction :: {
		FunctionArn:           string | fn.Fn
		FunctionConfiguration: propFunctionConfiguration
		Id:                    string | fn.Fn
	}
	propFunctionConfiguration :: {
		EncodingType?: string | fn.Fn
		Environment?:  propEnvironment
		ExecArgs?:     string | fn.Fn
		Executable?:   string | fn.Fn
		MemorySize?:   int | fn.Fn
		Pinned?:       bool | fn.Fn
		Timeout?:      int | fn.Fn
	}
	propFunctionDefinitionVersion :: {
		DefaultConfig?: propDefaultConfig
		Functions: [...propFunction]
	}
	propResourceAccessPolicy :: {
		Permission?: string | fn.Fn
		ResourceId:  string | fn.Fn
	}
	propRunAs :: {
		Gid?: int | fn.Fn
		Uid?: int | fn.Fn
	}
}
FunctionDefinitionVersion :: {
	Type: "AWS::Greengrass::FunctionDefinitionVersion"
	Properties: {
		DefaultConfig?:       propDefaultConfig
		FunctionDefinitionId: string | fn.Fn
		Functions: [...propFunction]
	}
	propDefaultConfig :: {
		Execution: propExecution
	}
	propEnvironment :: {
		AccessSysfs?: bool | fn.Fn
		Execution?:   propExecution
		ResourceAccessPolicies?: [...propResourceAccessPolicy]
		Variables?: {
		} | fn.Fn
	}
	propExecution :: {
		IsolationMode?: string | fn.Fn
		RunAs?:         propRunAs
	}
	propFunction :: {
		FunctionArn:           string | fn.Fn
		FunctionConfiguration: propFunctionConfiguration
		Id:                    string | fn.Fn
	}
	propFunctionConfiguration :: {
		EncodingType?: string | fn.Fn
		Environment?:  propEnvironment
		ExecArgs?:     string | fn.Fn
		Executable?:   string | fn.Fn
		MemorySize?:   int | fn.Fn
		Pinned?:       bool | fn.Fn
		Timeout?:      int | fn.Fn
	}
	propResourceAccessPolicy :: {
		Permission?: string | fn.Fn
		ResourceId:  string | fn.Fn
	}
	propRunAs :: {
		Gid?: int | fn.Fn
		Uid?: int | fn.Fn
	}
}
Group :: {
	Type: "AWS::Greengrass::Group"
	Properties: {
		InitialVersion?: propGroupVersion
		Name:            string | fn.Fn
		RoleArn?:        string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	propGroupVersion :: {
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
		InitialVersion?: propLoggerDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	propLogger :: {
		Component: string | fn.Fn
		Id:        string | fn.Fn
		Level:     string | fn.Fn
		Space?:    int | fn.Fn
		Type:      string | fn.Fn
	}
	propLoggerDefinitionVersion :: {
		Loggers: [...propLogger]
	}
}
LoggerDefinitionVersion :: {
	Type: "AWS::Greengrass::LoggerDefinitionVersion"
	Properties: {
		LoggerDefinitionId: string | fn.Fn
		Loggers: [...propLogger]
	}
	propLogger :: {
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
		InitialVersion?: propResourceDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	propGroupOwnerSetting :: {
		AutoAddGroupOwner: bool | fn.Fn
		GroupOwner?:       string | fn.Fn
	}
	propLocalDeviceResourceData :: {
		GroupOwnerSetting?: propGroupOwnerSetting
		SourcePath:         string | fn.Fn
	}
	propLocalVolumeResourceData :: {
		DestinationPath:    string | fn.Fn
		GroupOwnerSetting?: propGroupOwnerSetting
		SourcePath:         string | fn.Fn
	}
	propResourceDataContainer :: {
		LocalDeviceResourceData?:                   propLocalDeviceResourceData
		LocalVolumeResourceData?:                   propLocalVolumeResourceData
		S3MachineLearningModelResourceData?:        propS3MachineLearningModelResourceData
		SageMakerMachineLearningModelResourceData?: propSageMakerMachineLearningModelResourceData
		SecretsManagerSecretResourceData?:          propSecretsManagerSecretResourceData
	}
	propResourceDefinitionVersion :: {
		Resources: [...propResourceInstance]
	}
	propResourceInstance :: {
		Id:                    string | fn.Fn
		Name:                  string | fn.Fn
		ResourceDataContainer: propResourceDataContainer
	}
	propS3MachineLearningModelResourceData :: {
		DestinationPath: string | fn.Fn
		S3Uri:           string | fn.Fn
	}
	propSageMakerMachineLearningModelResourceData :: {
		DestinationPath: string | fn.Fn
		SageMakerJobArn: string | fn.Fn
	}
	propSecretsManagerSecretResourceData :: {
		ARN:                                string | fn.Fn
		AdditionalStagingLabelsToDownload?: [...string] | fn.Fn
	}
}
ResourceDefinitionVersion :: {
	Type: "AWS::Greengrass::ResourceDefinitionVersion"
	Properties: {
		ResourceDefinitionId: string | fn.Fn
		Resources: [...propResourceInstance]
	}
	propGroupOwnerSetting :: {
		AutoAddGroupOwner: bool | fn.Fn
		GroupOwner?:       string | fn.Fn
	}
	propLocalDeviceResourceData :: {
		GroupOwnerSetting?: propGroupOwnerSetting
		SourcePath:         string | fn.Fn
	}
	propLocalVolumeResourceData :: {
		DestinationPath:    string | fn.Fn
		GroupOwnerSetting?: propGroupOwnerSetting
		SourcePath:         string | fn.Fn
	}
	propResourceDataContainer :: {
		LocalDeviceResourceData?:                   propLocalDeviceResourceData
		LocalVolumeResourceData?:                   propLocalVolumeResourceData
		S3MachineLearningModelResourceData?:        propS3MachineLearningModelResourceData
		SageMakerMachineLearningModelResourceData?: propSageMakerMachineLearningModelResourceData
		SecretsManagerSecretResourceData?:          propSecretsManagerSecretResourceData
	}
	propResourceInstance :: {
		Id:                    string | fn.Fn
		Name:                  string | fn.Fn
		ResourceDataContainer: propResourceDataContainer
	}
	propS3MachineLearningModelResourceData :: {
		DestinationPath: string | fn.Fn
		S3Uri:           string | fn.Fn
	}
	propSageMakerMachineLearningModelResourceData :: {
		DestinationPath: string | fn.Fn
		SageMakerJobArn: string | fn.Fn
	}
	propSecretsManagerSecretResourceData :: {
		ARN:                                string | fn.Fn
		AdditionalStagingLabelsToDownload?: [...string] | fn.Fn
	}
}
SubscriptionDefinition :: {
	Type: "AWS::Greengrass::SubscriptionDefinition"
	Properties: {
		InitialVersion?: propSubscriptionDefinitionVersion
		Name:            string | fn.Fn
		Tags?:           {
		} | fn.Fn
	}
	propSubscription :: {
		Id:      string | fn.Fn
		Source:  string | fn.Fn
		Subject: string | fn.Fn
		Target:  string | fn.Fn
	}
	propSubscriptionDefinitionVersion :: {
		Subscriptions: [...propSubscription]
	}
}
SubscriptionDefinitionVersion :: {
	Type: "AWS::Greengrass::SubscriptionDefinitionVersion"
	Properties: {
		SubscriptionDefinitionId: string | fn.Fn
		Subscriptions: [...propSubscription]
	}
	propSubscription :: {
		Id:      string | fn.Fn
		Source:  string | fn.Fn
		Subject: string | fn.Fn
		Target:  string | fn.Fn
	}
}

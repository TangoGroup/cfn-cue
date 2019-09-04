package Greengrass

ConnectorDefinition :: {
  Type: "AWS::Greengrass::ConnectorDefinition"
  Properties: {
    InitialVersion?: __ConnectorDefinitionVersion
    Name:            string
    Tags?: {
    }
  }
  __Connector = {
    ConnectorArn: string
    Id:           string
    Parameters?: {
    }
  }
  __ConnectorDefinitionVersion = {
    Connectors: [...__Connector]
  }
}
ConnectorDefinitionVersion :: {
  Type: "AWS::Greengrass::ConnectorDefinitionVersion"
  Properties: {
    ConnectorDefinitionId: string
    Connectors: [...__Connector]
  }
  __Connector = {
    ConnectorArn: string
    Id:           string
    Parameters?: {
    }
  }
}
CoreDefinition :: {
  Type: "AWS::Greengrass::CoreDefinition"
  Properties: {
    InitialVersion?: __CoreDefinitionVersion
    Name:            string
    Tags?: {
    }
  }
  __Core = {
    CertificateArn: string
    Id:             string
    SyncShadow?:    bool
    ThingArn:       string
  }
  __CoreDefinitionVersion = {
    Cores: [...__Core]
  }
}
CoreDefinitionVersion :: {
  Type: "AWS::Greengrass::CoreDefinitionVersion"
  Properties: {
    CoreDefinitionId: string
    Cores: [...__Core]
  }
  __Core = {
    CertificateArn: string
    Id:             string
    SyncShadow?:    bool
    ThingArn:       string
  }
}
DeviceDefinition :: {
  Type: "AWS::Greengrass::DeviceDefinition"
  Properties: {
    InitialVersion?: __DeviceDefinitionVersion
    Name:            string
    Tags?: {
    }
  }
  __Device = {
    CertificateArn: string
    Id:             string
    SyncShadow?:    bool
    ThingArn:       string
  }
  __DeviceDefinitionVersion = {
    Devices: [...__Device]
  }
}
DeviceDefinitionVersion :: {
  Type: "AWS::Greengrass::DeviceDefinitionVersion"
  Properties: {
    DeviceDefinitionId: string
    Devices: [...__Device]
  }
  __Device = {
    CertificateArn: string
    Id:             string
    SyncShadow?:    bool
    ThingArn:       string
  }
}
FunctionDefinition :: {
  Type: "AWS::Greengrass::FunctionDefinition"
  Properties: {
    InitialVersion?: __FunctionDefinitionVersion
    Name:            string
    Tags?: {
    }
  }
  __DefaultConfig = {
    Execution: __Execution
  }
  __Environment = {
    AccessSysfs?: bool
    Execution?:   __Execution
    ResourceAccessPolicies?: [...__ResourceAccessPolicy]
    Variables?: {
    }
  }
  __Execution = {
    IsolationMode?: string
    RunAs?:         __RunAs
  }
  __Function = {
    FunctionArn:           string
    FunctionConfiguration: __FunctionConfiguration
    Id:                    string
  }
  __FunctionConfiguration = {
    EncodingType?: string
    Environment?:  __Environment
    ExecArgs?:     string
    Executable?:   string
    MemorySize?:   int
    Pinned?:       bool
    Timeout?:      int
  }
  __FunctionDefinitionVersion = {
    DefaultConfig?: __DefaultConfig
    Functions: [...__Function]
  }
  __ResourceAccessPolicy = {
    Permission?: string
    ResourceId:  string
  }
  __RunAs = {
    Gid?: int
    Uid?: int
  }
}
FunctionDefinitionVersion :: {
  Type: "AWS::Greengrass::FunctionDefinitionVersion"
  Properties: {
    DefaultConfig?:       __DefaultConfig
    FunctionDefinitionId: string
    Functions: [...__Function]
  }
  __DefaultConfig = {
    Execution: __Execution
  }
  __Environment = {
    AccessSysfs?: bool
    Execution?:   __Execution
    ResourceAccessPolicies?: [...__ResourceAccessPolicy]
    Variables?: {
    }
  }
  __Execution = {
    IsolationMode?: string
    RunAs?:         __RunAs
  }
  __Function = {
    FunctionArn:           string
    FunctionConfiguration: __FunctionConfiguration
    Id:                    string
  }
  __FunctionConfiguration = {
    EncodingType?: string
    Environment?:  __Environment
    ExecArgs?:     string
    Executable?:   string
    MemorySize?:   int
    Pinned?:       bool
    Timeout?:      int
  }
  __ResourceAccessPolicy = {
    Permission?: string
    ResourceId:  string
  }
  __RunAs = {
    Gid?: int
    Uid?: int
  }
}
Group :: {
  Type: "AWS::Greengrass::Group"
  Properties: {
    InitialVersion?: __GroupVersion
    Name:            string
    RoleArn?:        string
    Tags?: {
    }
  }
  __GroupVersion = {
    ConnectorDefinitionVersionArn?:    string
    CoreDefinitionVersionArn?:         string
    DeviceDefinitionVersionArn?:       string
    FunctionDefinitionVersionArn?:     string
    LoggerDefinitionVersionArn?:       string
    ResourceDefinitionVersionArn?:     string
    SubscriptionDefinitionVersionArn?: string
  }
}
GroupVersion :: {
  Type: "AWS::Greengrass::GroupVersion"
  Properties: {
    ConnectorDefinitionVersionArn?:    string
    CoreDefinitionVersionArn?:         string
    DeviceDefinitionVersionArn?:       string
    FunctionDefinitionVersionArn?:     string
    GroupId:                           string
    LoggerDefinitionVersionArn?:       string
    ResourceDefinitionVersionArn?:     string
    SubscriptionDefinitionVersionArn?: string
  }
}
LoggerDefinition :: {
  Type: "AWS::Greengrass::LoggerDefinition"
  Properties: {
    InitialVersion?: __LoggerDefinitionVersion
    Name:            string
    Tags?: {
    }
  }
  __Logger = {
    Component: string
    Id:        string
    Level:     string
    Space?:    int
    Type:      string
  }
  __LoggerDefinitionVersion = {
    Loggers: [...__Logger]
  }
}
LoggerDefinitionVersion :: {
  Type: "AWS::Greengrass::LoggerDefinitionVersion"
  Properties: {
    LoggerDefinitionId: string
    Loggers: [...__Logger]
  }
  __Logger = {
    Component: string
    Id:        string
    Level:     string
    Space?:    int
    Type:      string
  }
}
ResourceDefinition :: {
  Type: "AWS::Greengrass::ResourceDefinition"
  Properties: {
    InitialVersion?: __ResourceDefinitionVersion
    Name:            string
  }
  __GroupOwnerSetting = {
    AutoAddGroupOwner: bool
    GroupOwner?:       string
  }
  __LocalDeviceResourceData = {
    GroupOwnerSetting?: __GroupOwnerSetting
    SourcePath:         string
  }
  __LocalVolumeResourceData = {
    DestinationPath:    string
    GroupOwnerSetting?: __GroupOwnerSetting
    SourcePath:         string
  }
  __ResourceDataContainer = {
    LocalDeviceResourceData?:                   __LocalDeviceResourceData
    LocalVolumeResourceData?:                   __LocalVolumeResourceData
    S3MachineLearningModelResourceData?:        __S3MachineLearningModelResourceData
    SageMakerMachineLearningModelResourceData?: __SageMakerMachineLearningModelResourceData
    SecretsManagerSecretResourceData?:          __SecretsManagerSecretResourceData
  }
  __ResourceDefinitionVersion = {
    Resources: [...__ResourceInstance]
  }
  __ResourceInstance = {
    Id:                    string
    Name:                  string
    ResourceDataContainer: __ResourceDataContainer
  }
  __S3MachineLearningModelResourceData = {
    DestinationPath: string
    S3Uri:           string
  }
  __SageMakerMachineLearningModelResourceData = {
    DestinationPath: string
    SageMakerJobArn: string
  }
  __SecretsManagerSecretResourceData = {
    ARN: string
    AdditionalStagingLabelsToDownload?: [...string]
  }
}
ResourceDefinitionVersion :: {
  Type: "AWS::Greengrass::ResourceDefinitionVersion"
  Properties: {
    ResourceDefinitionId: string
    Resources: [...__ResourceInstance]
  }
  __GroupOwnerSetting = {
    AutoAddGroupOwner: bool
    GroupOwner?:       string
  }
  __LocalDeviceResourceData = {
    GroupOwnerSetting?: __GroupOwnerSetting
    SourcePath:         string
  }
  __LocalVolumeResourceData = {
    DestinationPath:    string
    GroupOwnerSetting?: __GroupOwnerSetting
    SourcePath:         string
  }
  __ResourceDataContainer = {
    LocalDeviceResourceData?:                   __LocalDeviceResourceData
    LocalVolumeResourceData?:                   __LocalVolumeResourceData
    S3MachineLearningModelResourceData?:        __S3MachineLearningModelResourceData
    SageMakerMachineLearningModelResourceData?: __SageMakerMachineLearningModelResourceData
    SecretsManagerSecretResourceData?:          __SecretsManagerSecretResourceData
  }
  __ResourceInstance = {
    Id:                    string
    Name:                  string
    ResourceDataContainer: __ResourceDataContainer
  }
  __S3MachineLearningModelResourceData = {
    DestinationPath: string
    S3Uri:           string
  }
  __SageMakerMachineLearningModelResourceData = {
    DestinationPath: string
    SageMakerJobArn: string
  }
  __SecretsManagerSecretResourceData = {
    ARN: string
    AdditionalStagingLabelsToDownload?: [...string]
  }
}
SubscriptionDefinition :: {
  Type: "AWS::Greengrass::SubscriptionDefinition"
  Properties: {
    InitialVersion?: __SubscriptionDefinitionVersion
    Name:            string
    Tags?: {
    }
  }
  __Subscription = {
    Id:      string
    Source:  string
    Subject: string
    Target:  string
  }
  __SubscriptionDefinitionVersion = {
    Subscriptions: [...__Subscription]
  }
}
SubscriptionDefinitionVersion :: {
  Type: "AWS::Greengrass::SubscriptionDefinitionVersion"
  Properties: {
    SubscriptionDefinitionId: string
    Subscriptions: [...__Subscription]
  }
  __Subscription = {
    Id:      string
    Source:  string
    Subject: string
    Target:  string
  }
}

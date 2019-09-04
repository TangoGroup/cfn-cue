package AmazonMQ

Broker :: {
  Type: "AWS::AmazonMQ::Broker"
  Properties: {
    AutoMinorVersionUpgrade:     bool
    BrokerName:                  string
    Configuration?:              __ConfigurationId
    DeploymentMode:              string
    EncryptionOptions?:          __EncryptionOptions
    EngineType:                  string
    EngineVersion:               string
    HostInstanceType:            string
    Logs?:                       __LogList
    MaintenanceWindowStartTime?: __MaintenanceWindow
    PubliclyAccessible:          bool
    SecurityGroups?: [...string]
    SubnetIds?: [...string]
    Tags?: [...__TagsEntry]
    Users: [...__User]
  }
  __ConfigurationId = {
    Id:       string
    Revision: int
  }
  __EncryptionOptions = {
    KmsKeyId?:      string
    UseAwsOwnedKey: bool
  }
  __LogList = {
    Audit?:   bool
    General?: bool
  }
  __MaintenanceWindow = {
    DayOfWeek: string
    TimeOfDay: string
    TimeZone:  string
  }
  __TagsEntry = {
    Key:   string
    Value: string
  }
  __User = {
    ConsoleAccess?: bool
    Groups?: [...string]
    Password: string
    Username: string
  }
}
Configuration :: {
  Type: "AWS::AmazonMQ::Configuration"
  Properties: {
    Data:          string
    Description?:  string
    EngineType:    string
    EngineVersion: string
    Name:          string
    Tags?: [...__TagsEntry]
  }
  __TagsEntry = {
    Key:   string
    Value: string
  }
}
ConfigurationAssociation :: {
  Type: "AWS::AmazonMQ::ConfigurationAssociation"
  Properties: {
    Broker:        string
    Configuration: __ConfigurationId
  }
  __ConfigurationId = {
    Id:       string
    Revision: int
  }
}

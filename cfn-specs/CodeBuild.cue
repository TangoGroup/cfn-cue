package CodeBuild

Project :: {
  Type: "AWS::CodeBuild::Project"
  Properties: {
    Artifacts:               __Artifacts
    BadgeEnabled?:           bool
    Cache?:                  __ProjectCache
    Description?:            string
    EncryptionKey?:          string
    Environment:             __Environment
    LogsConfig?:             __LogsConfig
    Name?:                   string
    QueuedTimeoutInMinutes?: int
    SecondaryArtifacts?: [...__Artifacts]
    SecondarySourceVersions?: [...__ProjectSourceVersion]
    SecondarySources?: [...__Source]
    ServiceRole:    string
    Source:         __Source
    SourceVersion?: string
    Tags?: [...__Tag]
    TimeoutInMinutes?: int
    Triggers?:         __ProjectTriggers
    VpcConfig?:        __VpcConfig
  }
  __Artifacts = {
    ArtifactIdentifier?:   string
    EncryptionDisabled?:   bool
    Location?:             string
    Name?:                 string
    NamespaceType?:        string
    OverrideArtifactName?: bool
    Packaging?:            string
    Path?:                 string
    Type:                  string
  }
  __CloudWatchLogsConfig = {
    GroupName?:  string
    Status:      string
    StreamName?: string
  }
  __Environment = {
    Certificate?: string
    ComputeType:  string
    EnvironmentVariables?: [...__EnvironmentVariable]
    Image:                     string
    ImagePullCredentialsType?: string
    PrivilegedMode?:           bool
    RegistryCredential?:       __RegistryCredential
    Type:                      string
  }
  __EnvironmentVariable = {
    Name:  string
    Type?: string
    Value: string
  }
  __FilterGroup = {
  }
  __GitSubmodulesConfig = {
    FetchSubmodules: bool
  }
  __LogsConfig = {
    CloudWatchLogs?: __CloudWatchLogsConfig
    S3Logs?:         __S3LogsConfig
  }
  __ProjectCache = {
    Location?: string
    Modes?: [...string]
    Type: string
  }
  __ProjectSourceVersion = {
    SourceIdentifier: string
    SourceVersion?:   string
  }
  __ProjectTriggers = {
    FilterGroups?: [...__FilterGroup]
    Webhook?: bool
  }
  __RegistryCredential = {
    Credential:         string
    CredentialProvider: string
  }
  __S3LogsConfig = {
    EncryptionDisabled?: bool
    Location?:           string
    Status:              string
  }
  __Source = {
    Auth?:                __SourceAuth
    BuildSpec?:           string
    GitCloneDepth?:       int
    GitSubmodulesConfig?: __GitSubmodulesConfig
    InsecureSsl?:         bool
    Location?:            string
    ReportBuildStatus?:   bool
    SourceIdentifier?:    string
    Type:                 string
  }
  __SourceAuth = {
    Resource?: string
    Type:      string
  }
  __VpcConfig = {
    SecurityGroupIds?: [...string]
    Subnets?: [...string]
    VpcId?: string
  }
  __WebhookFilter = {
    ExcludeMatchedPattern?: bool
    Pattern:                string
    Type:                   string
  }
}
SourceCredential :: {
  Type: "AWS::CodeBuild::SourceCredential"
  Properties: {
    AuthType:   string
    ServerType: string
    Token:      string
    Username?:  string
  }
}

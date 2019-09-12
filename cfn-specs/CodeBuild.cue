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
		QueuedTimeoutInMinutes?: >=5 & <=480
		QueuedTimeoutInMinutes?: int
		SecondaryArtifacts?: [...__Artifacts]
		SecondarySourceVersions?: [...__ProjectSourceVersion]
		SecondarySources?: [...__Source]
		ServiceRole:    string
		Source:         __Source
		SourceVersion?: string
		Tags?: [...__Tag]
		TimeoutInMinutes?: >=5 & <=480
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
		Packaging?:            "NONE" | "ZIP"
		Packaging?:            string
		Path?:                 string
		Type:                  "CODEPIPELINE" | "NO_ARTIFACTS" | "S3"
		Type:                  string
	}
	__CloudWatchLogsConfig = {
		GroupName?:  string
		Status:      "DISABLED" | "ENABLED"
		Status:      string
		StreamName?: string
	}
	__Environment = {
		Certificate?: string
		ComputeType:  "BUILD_GENERAL1_LARGE" | "BUILD_GENERAL1_MEDIUM" | "BUILD_GENERAL1_SMALL"
		ComputeType:  string
		EnvironmentVariables?: [...__EnvironmentVariable]
		Image:                     string
		ImagePullCredentialsType?: "CODEBUILD" | "SERVICE_ROLE"
		ImagePullCredentialsType?: string
		PrivilegedMode?:           bool
		RegistryCredential?:       __RegistryCredential
		Type:                      "LINUX_CONTAINER" | "WINDOWS_CONTAINER"
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
		Type: "LOCAL" | "NO_CACHE" | "S3"
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
		Status:              "DISABLED" | "ENABLED"
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
		Type:                 "BITBUCKET" | "CODECOMMIT" | "CODEPIPELINE" | "GITHUB" | "GITHUB_ENTERPRISE" | "NO_SOURCE" | "S3"
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

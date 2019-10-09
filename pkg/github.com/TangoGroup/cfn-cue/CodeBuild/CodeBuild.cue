package CodeBuild

import "github.com/TangoGroup/fn"

Project :: {
	Type: "AWS::CodeBuild::Project"
	Properties: {
		Artifacts:               __Artifacts
		BadgeEnabled?:           bool | fn.Fn
		Cache?:                  __ProjectCache
		Description?:            string | fn.Fn
		EncryptionKey?:          string | fn.Fn
		Environment:             __Environment
		LogsConfig?:             __LogsConfig
		Name?:                   string | fn.Fn
		QueuedTimeoutInMinutes?: (int & (>=5 & <=480)) | fn.Fn
		SecondaryArtifacts?: [...__Artifacts]
		SecondarySourceVersions?: [...__ProjectSourceVersion]
		SecondarySources?: [...__Source]
		ServiceRole:    string | fn.Fn
		Source:         __Source
		SourceVersion?: string | fn.Fn
		Tags?: [...__Tag]
		TimeoutInMinutes?: (int & (>=5 & <=480)) | fn.Fn
		Triggers?:         __ProjectTriggers
		VpcConfig?:        __VpcConfig
	}
	__Artifacts :: {
		ArtifactIdentifier?:   string | fn.Fn
		EncryptionDisabled?:   bool | fn.Fn
		Location?:             string | fn.Fn
		Name?:                 string | fn.Fn
		NamespaceType?:        string | fn.Fn
		OverrideArtifactName?: bool | fn.Fn
		Packaging?:            (string & ("NONE" | "ZIP")) | fn.Fn
		Path?:                 string | fn.Fn
		Type:                  (string & ("CODEPIPELINE" | "NO_ARTIFACTS" | "S3")) | fn.Fn
	}
	__CloudWatchLogsConfig :: {
		GroupName?:  string | fn.Fn
		Status:      (string & ("DISABLED" | "ENABLED")) | fn.Fn
		StreamName?: string | fn.Fn
	}
	__Environment :: {
		Certificate?: string | fn.Fn
		ComputeType:  (string & ("BUILD_GENERAL1_LARGE" | "BUILD_GENERAL1_MEDIUM" | "BUILD_GENERAL1_SMALL")) | fn.Fn
		EnvironmentVariables?: [...__EnvironmentVariable]
		Image:                     string | fn.Fn
		ImagePullCredentialsType?: (string & ("CODEBUILD" | "SERVICE_ROLE")) | fn.Fn
		PrivilegedMode?:           bool | fn.Fn
		RegistryCredential?:       __RegistryCredential
		Type:                      (string & ("LINUX_CONTAINER" | "WINDOWS_CONTAINER")) | fn.Fn
	}
	__EnvironmentVariable :: {
		Name:  string | fn.Fn
		Type?: string | fn.Fn
		Value: string | fn.Fn
	}
	__FilterGroup :: {
	}
	__GitSubmodulesConfig :: {
		FetchSubmodules: bool | fn.Fn
	}
	__LogsConfig :: {
		CloudWatchLogs?: __CloudWatchLogsConfig
		S3Logs?:         __S3LogsConfig
	}
	__ProjectCache :: {
		Location?: string | fn.Fn
		Modes?:    [...string] | fn.Fn
		Type:      (string & ("LOCAL" | "NO_CACHE" | "S3")) | fn.Fn
	}
	__ProjectSourceVersion :: {
		SourceIdentifier: string | fn.Fn
		SourceVersion?:   string | fn.Fn
	}
	__ProjectTriggers :: {
		FilterGroups?: [...__FilterGroup]
		Webhook?: bool | fn.Fn
	}
	__RegistryCredential :: {
		Credential:         string | fn.Fn
		CredentialProvider: string | fn.Fn
	}
	__S3LogsConfig :: {
		EncryptionDisabled?: bool | fn.Fn
		Location?:           string | fn.Fn
		Status:              (string & ("DISABLED" | "ENABLED")) | fn.Fn
	}
	__Source :: {
		Auth?:                __SourceAuth
		BuildSpec?:           string | fn.Fn
		GitCloneDepth?:       int | fn.Fn
		GitSubmodulesConfig?: __GitSubmodulesConfig
		InsecureSsl?:         bool | fn.Fn
		Location?:            string | fn.Fn
		ReportBuildStatus?:   bool | fn.Fn
		SourceIdentifier?:    string | fn.Fn
		Type:                 (string & ("BITBUCKET" | "CODECOMMIT" | "CODEPIPELINE" | "GITHUB" | "GITHUB_ENTERPRISE" | "NO_SOURCE" | "S3")) | fn.Fn
	}
	__SourceAuth :: {
		Resource?: string | fn.Fn
		Type:      string | fn.Fn
	}
	__VpcConfig :: {
		SecurityGroupIds?: [...string] | fn.Fn
		Subnets?:          [...string] | fn.Fn
		VpcId?:            string | fn.Fn
	}
	__WebhookFilter :: {
		ExcludeMatchedPattern?: bool | fn.Fn
		Pattern:                string | fn.Fn
		Type:                   string | fn.Fn
	}
}
SourceCredential :: {
	Type: "AWS::CodeBuild::SourceCredential"
	Properties: {
		AuthType:   string | fn.Fn
		ServerType: string | fn.Fn
		Token:      string | fn.Fn
		Username?:  string | fn.Fn
	}
}

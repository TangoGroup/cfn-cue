package CodeBuild

import "github.com/TangoGroup/fn"

Project :: {
	Type: "AWS::CodeBuild::Project"
	Properties: {
		Artifacts:               propArtifacts
		BadgeEnabled?:           bool | fn.Fn
		Cache?:                  propProjectCache
		Description?:            string | fn.Fn
		EncryptionKey?:          string | fn.Fn
		Environment:             propEnvironment
		LogsConfig?:             propLogsConfig
		Name?:                   string | fn.Fn
		QueuedTimeoutInMinutes?: (int & (>=5 & <=480)) | fn.Fn
		SecondaryArtifacts?: [...propArtifacts]
		SecondarySourceVersions?: [...propProjectSourceVersion]
		SecondarySources?: [...propSource]
		ServiceRole:    string | fn.Fn
		Source:         propSource
		SourceVersion?: string | fn.Fn
		Tags?: [...propTag]
		TimeoutInMinutes?: (int & (>=5 & <=480)) | fn.Fn
		Triggers?:         propProjectTriggers
		VpcConfig?:        propVpcConfig
	}
	propArtifacts :: {
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
	propCloudWatchLogsConfig :: {
		GroupName?:  string | fn.Fn
		Status:      (string & ("DISABLED" | "ENABLED")) | fn.Fn
		StreamName?: string | fn.Fn
	}
	propEnvironment :: {
		Certificate?: string | fn.Fn
		ComputeType:  (string & ("BUILD_GENERAL1_LARGE" | "BUILD_GENERAL1_MEDIUM" | "BUILD_GENERAL1_SMALL")) | fn.Fn
		EnvironmentVariables?: [...propEnvironmentVariable]
		Image:                     string | fn.Fn
		ImagePullCredentialsType?: (string & ("CODEBUILD" | "SERVICE_ROLE")) | fn.Fn
		PrivilegedMode?:           bool | fn.Fn
		RegistryCredential?:       propRegistryCredential
		Type:                      (string & ("LINUX_CONTAINER" | "WINDOWS_CONTAINER")) | fn.Fn
	}
	propEnvironmentVariable :: {
		Name:  string | fn.Fn
		Type?: string | fn.Fn
		Value: string | fn.Fn
	}
	propFilterGroup :: {
	}
	propGitSubmodulesConfig :: {
		FetchSubmodules: bool | fn.Fn
	}
	propLogsConfig :: {
		CloudWatchLogs?: propCloudWatchLogsConfig
		S3Logs?:         propS3LogsConfig
	}
	propProjectCache :: {
		Location?: string | fn.Fn
		Modes?: [...(string | fn.Fn)]
		Type: (string & ("LOCAL" | "NO_CACHE" | "S3")) | fn.Fn
	}
	propProjectSourceVersion :: {
		SourceIdentifier: string | fn.Fn
		SourceVersion?:   string | fn.Fn
	}
	propProjectTriggers :: {
		FilterGroups?: [...propFilterGroup]
		Webhook?: bool | fn.Fn
	}
	propRegistryCredential :: {
		Credential:         string | fn.Fn
		CredentialProvider: string | fn.Fn
	}
	propS3LogsConfig :: {
		EncryptionDisabled?: bool | fn.Fn
		Location?:           string | fn.Fn
		Status:              (string & ("DISABLED" | "ENABLED")) | fn.Fn
	}
	propSource :: {
		Auth?:                propSourceAuth
		BuildSpec?:           string | fn.Fn
		GitCloneDepth?:       int | fn.Fn
		GitSubmodulesConfig?: propGitSubmodulesConfig
		InsecureSsl?:         bool | fn.Fn
		Location?:            string | fn.Fn
		ReportBuildStatus?:   bool | fn.Fn
		SourceIdentifier?:    string | fn.Fn
		Type:                 (string & ("BITBUCKET" | "CODECOMMIT" | "CODEPIPELINE" | "GITHUB" | "GITHUB_ENTERPRISE" | "NO_SOURCE" | "S3")) | fn.Fn
	}
	propSourceAuth :: {
		Resource?: string | fn.Fn
		Type:      string | fn.Fn
	}
	propVpcConfig :: {
		SecurityGroupIds?: [...(string | fn.Fn)]
		Subnets?: [...(string | fn.Fn)]
		VpcId?: string | fn.Fn
	}
	propWebhookFilter :: {
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

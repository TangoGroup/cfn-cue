package euwest3

import "github.com/TangoGroup/aws/fn"

CodeBuild :: {
	Project :: {
		Type: "AWS::CodeBuild::Project"
		Properties: {
			Artifacts: {
				ArtifactIdentifier?:   string | fn.Fn
				EncryptionDisabled?:   bool | fn.Fn
				Location?:             string | fn.Fn
				Name?:                 string | fn.Fn
				NamespaceType?:        string | fn.Fn
				OverrideArtifactName?: bool | fn.Fn
				Packaging?:            ("NONE" | "ZIP") | fn.Fn
				Path?:                 string | fn.Fn
				Type:                  ("CODEPIPELINE" | "NO_ARTIFACTS" | "S3") | fn.Fn
			}
			BadgeEnabled?: bool | fn.Fn
			Cache?: {
				Location?: string | fn.Fn
				Modes?:    [...(string | fn.Fn)] | (string | fn.Fn)
				Type:      ("LOCAL" | "NO_CACHE" | "S3") | fn.Fn
			}
			Description?:   string | fn.Fn
			EncryptionKey?: string | fn.Fn
			Environment: {
				Certificate?: string | fn.Fn
				ComputeType:  ("BUILD_GENERAL1_LARGE" | "BUILD_GENERAL1_MEDIUM" | "BUILD_GENERAL1_SMALL") | fn.Fn
				EnvironmentVariables?: [...{
					Name:  string | fn.Fn
					Type?: string | fn.Fn
					Value: string | fn.Fn
				}]
				Image:                     string | fn.Fn
				ImagePullCredentialsType?: ("CODEBUILD" | "SERVICE_ROLE") | fn.Fn
				PrivilegedMode?:           bool | fn.Fn
				RegistryCredential?: {
					Credential:         string | fn.Fn
					CredentialProvider: string | fn.Fn
				}
				Type: ("LINUX_CONTAINER" | "WINDOWS_CONTAINER") | fn.Fn
			}
			LogsConfig?: {
				CloudWatchLogs?: {
					GroupName?:  string | fn.Fn
					Status:      ("DISABLED" | "ENABLED") | fn.Fn
					StreamName?: string | fn.Fn
				}
				S3Logs?: {
					EncryptionDisabled?: bool | fn.Fn
					Location?:           string | fn.Fn
					Status:              ("DISABLED" | "ENABLED") | fn.Fn
				}
			}
			Name?:                   string | fn.Fn
			QueuedTimeoutInMinutes?: (>=5 & <=480) | fn.Fn
			SecondaryArtifacts?: [...{
				ArtifactIdentifier?:   string | fn.Fn
				EncryptionDisabled?:   bool | fn.Fn
				Location?:             string | fn.Fn
				Name?:                 string | fn.Fn
				NamespaceType?:        string | fn.Fn
				OverrideArtifactName?: bool | fn.Fn
				Packaging?:            ("NONE" | "ZIP") | fn.Fn
				Path?:                 string | fn.Fn
				Type:                  ("CODEPIPELINE" | "NO_ARTIFACTS" | "S3") | fn.Fn
			}]
			SecondarySourceVersions?: [...{
				SourceIdentifier: string | fn.Fn
				SourceVersion?:   string | fn.Fn
			}]
			SecondarySources?: [...{
				Auth?: {
					Resource?: string | fn.Fn
					Type:      string | fn.Fn
				}
				BuildSpec?:     string | fn.Fn
				GitCloneDepth?: int | fn.Fn
				GitSubmodulesConfig?: FetchSubmodules: bool | fn.Fn
				InsecureSsl?:       bool | fn.Fn
				Location?:          string | fn.Fn
				ReportBuildStatus?: bool | fn.Fn
				SourceIdentifier?:  string | fn.Fn
				Type:               ("BITBUCKET" | "CODECOMMIT" | "CODEPIPELINE" | "GITHUB" | "GITHUB_ENTERPRISE" | "NO_SOURCE" | "S3") | fn.Fn
			}]
			ServiceRole: string | fn.Fn
			Source: {
				Auth?: {
					Resource?: string | fn.Fn
					Type:      string | fn.Fn
				}
				BuildSpec?:     string | fn.Fn
				GitCloneDepth?: int | fn.Fn
				GitSubmodulesConfig?: FetchSubmodules: bool | fn.Fn
				InsecureSsl?:       bool | fn.Fn
				Location?:          string | fn.Fn
				ReportBuildStatus?: bool | fn.Fn
				SourceIdentifier?:  string | fn.Fn
				Type:               ("BITBUCKET" | "CODECOMMIT" | "CODEPIPELINE" | "GITHUB" | "GITHUB_ENTERPRISE" | "NO_SOURCE" | "S3") | fn.Fn
			}
			SourceVersion?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TimeoutInMinutes?: (>=5 & <=480) | fn.Fn
			Triggers?: {
				FilterGroups?: [...[...{
					ExcludeMatchedPattern?: bool | fn.Fn
					Pattern:                string | fn.Fn
					Type:                   string | fn.Fn
				}]]
				Webhook?: bool | fn.Fn
			}
			VpcConfig?: {
				SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				Subnets?:          [...(string | fn.Fn)] | (string | fn.Fn)
				VpcId?:            string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ReportGroup :: {
		Type: "AWS::CodeBuild::ReportGroup"
		Properties: {
			ExportConfig: {
				ExportConfigType: string | fn.Fn
				S3Destination?: {
					Bucket:              string | fn.Fn
					EncryptionDisabled?: bool | fn.Fn
					EncryptionKey?:      string | fn.Fn
					Packaging?:          string | fn.Fn
					Path?:               string | fn.Fn
				}
			}
			Name?: string | fn.Fn
			Type:  string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SourceCredential :: {
		Type: "AWS::CodeBuild::SourceCredential"
		Properties: {
			AuthType:   string | fn.Fn
			ServerType: string | fn.Fn
			Token:      string | fn.Fn
			Username?:  string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

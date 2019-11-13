package useast2

import "github.com/TangoGroup/fn"

CodePipeline :: {
	CustomActionType :: {
		Type: "AWS::CodePipeline::CustomActionType"
		Properties: {
			Category: (string & ("Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test")) | fn.Fn
			ConfigurationProperties?: [...{
				Description?: string | fn.Fn
				Key:          bool | fn.Fn
				Name:         string | fn.Fn
				Queryable?:   bool | fn.Fn
				Required:     bool | fn.Fn
				Secret:       bool | fn.Fn
				Type?:        (string & ("Boolean" | "Number" | "String")) | fn.Fn
			}]
			InputArtifactDetails: {
				MaximumCount: int | fn.Fn
				MinimumCount: int | fn.Fn
			}
			OutputArtifactDetails: {
				MaximumCount: int | fn.Fn
				MinimumCount: int | fn.Fn
			}
			Provider: string | fn.Fn
			Settings?: {
				EntityUrlTemplate?:          string | fn.Fn
				ExecutionUrlTemplate?:       string | fn.Fn
				RevisionUrlTemplate?:        string | fn.Fn
				ThirdPartyConfigurationUrl?: string | fn.Fn
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Version: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Pipeline :: {
		Type: "AWS::CodePipeline::Pipeline"
		Properties: {
			ArtifactStore?: {
				EncryptionKey?: {
					Id:   string | fn.Fn
					Type: string | fn.Fn
				}
				Location: string | fn.Fn
				Type:     (string & ("S3")) | fn.Fn
			}
			ArtifactStores?: [...{
				ArtifactStore: {
					EncryptionKey?: {
						Id:   string | fn.Fn
						Type: string | fn.Fn
					}
					Location: string | fn.Fn
					Type:     (string & ("S3")) | fn.Fn
				}
				Region: string | fn.Fn
			}]
			DisableInboundStageTransitions?: [...{
				Reason:    string | fn.Fn
				StageName: string | fn.Fn
			}]
			Name?:                     string | fn.Fn
			RestartExecutionOnUpdate?: bool | fn.Fn
			RoleArn:                   string | fn.Fn
			Stages: [...{
				Actions: [...{
					ActionTypeId: {
						Category: (string & ("Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test")) | fn.Fn
						Owner:    (string & ("AWS" | "Custom" | "ThirdParty")) | fn.Fn
						Provider: string | fn.Fn
						Version:  string | fn.Fn
					}
					Configuration?: {
						[string]: _
					} | fn.Fn
					InputArtifacts?: [...{
						Name: string | fn.Fn
					}]
					Name: string | fn.Fn
					OutputArtifacts?: [...{
						Name: string | fn.Fn
					}]
					Region?:   string | fn.Fn
					RoleArn?:  string | fn.Fn
					RunOrder?: int | fn.Fn
				}]
				Blockers?: [...{
					Name: string | fn.Fn
					Type: (string & ("Schedule")) | fn.Fn
				}]
				Name: string | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Webhook :: {
		Type: "AWS::CodePipeline::Webhook"
		Properties: {
			Authentication: (string & ("GITHUB_HMAC" | "IP" | "UNAUTHENTICATED")) | fn.Fn
			AuthenticationConfiguration: {
				AllowedIPRange?: string | fn.Fn
				SecretToken?:    string | fn.Fn
			}
			Filters: [...{
				JsonPath:     string | fn.Fn
				MatchEquals?: string | fn.Fn
			}]
			Name?:                   string | fn.Fn
			RegisterWithThirdParty?: bool | fn.Fn
			TargetAction:            string | fn.Fn
			TargetPipeline:          string | fn.Fn
			TargetPipelineVersion:   int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

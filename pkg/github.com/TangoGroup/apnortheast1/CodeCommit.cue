package apnortheast1

import "github.com/TangoGroup/fn"

CodeCommit :: {
	Repository :: {
		Type: "AWS::CodeCommit::Repository"
		Properties: {
			Code?: {
			}
			RepositoryDescription?: string | fn.Fn
			RepositoryName:         string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Triggers?: [...{
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

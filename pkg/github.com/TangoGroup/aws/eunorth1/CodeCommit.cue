package eunorth1

import "github.com/TangoGroup/aws/fn"

CodeCommit :: {
	Repository :: {
		Type: "AWS::CodeCommit::Repository"
		Properties: {
			Code?: {
			} | fn.If
			RepositoryDescription?: string | fn.Fn
			RepositoryName:         string | fn.Fn
			Tags?:                  [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			Triggers?: [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

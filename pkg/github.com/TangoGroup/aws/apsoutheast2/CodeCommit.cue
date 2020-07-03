package apsoutheast2

import "github.com/TangoGroup/aws/fn"

CodeCommit :: {
	Repository :: {
		Type:       "AWS::CodeCommit::Repository"
		Properties: close({
			Code?:                  close({}) | fn.If
			RepositoryDescription?: string | fn.Fn
			RepositoryName:         string | fn.Fn
			Tags?:                  [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Triggers?: [...close({})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

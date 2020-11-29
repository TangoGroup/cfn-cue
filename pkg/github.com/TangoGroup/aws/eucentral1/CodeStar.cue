package eucentral1

import "github.com/TangoGroup/aws/fn"

CodeStar :: {
	GitHubRepository :: {
		Type:       "AWS::CodeStar::GitHubRepository"
		Properties: close({
			Code?: close({
				S3: close({
					Bucket:         string | fn.Fn
					Key:            string | fn.Fn
					ObjectVersion?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			EnableIssues?:          bool | fn.Fn
			IsPrivate?:             bool | fn.Fn
			RepositoryAccessToken:  string | fn.Fn
			RepositoryDescription?: string | fn.Fn
			RepositoryName:         string | fn.Fn
			RepositoryOwner:        string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

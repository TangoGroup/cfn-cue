package uswest2

import "github.com/TangoGroup/fn"

CodeStar :: {
	GitHubRepository :: {
		Type: "AWS::CodeStar::GitHubRepository"
		Properties: {
			Code?: S3: {
				Bucket:         string | fn.Fn
				Key:            string | fn.Fn
				ObjectVersion?: string | fn.Fn
			}
			EnableIssues?:          bool | fn.Fn
			IsPrivate?:             bool | fn.Fn
			RepositoryAccessToken:  string | fn.Fn
			RepositoryDescription?: string | fn.Fn
			RepositoryName:         string | fn.Fn
			RepositoryOwner:        string | fn.Fn
		}
		DependsOn?:      string | [...string]
		DeletionPolicy?: "Delete" | "Retain"
	}
}

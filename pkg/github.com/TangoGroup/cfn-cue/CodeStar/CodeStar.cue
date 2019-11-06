package CodeStar

import "github.com/TangoGroup/fn"

GitHubRepository :: {
	Type: "AWS::CodeStar::GitHubRepository"
	Properties: {
		Code?:                  propCode
		EnableIssues?:          bool | fn.Fn
		IsPrivate?:             bool | fn.Fn
		RepositoryAccessToken:  string | fn.Fn
		RepositoryDescription?: string | fn.Fn
		RepositoryName:         string | fn.Fn
		RepositoryOwner:        string | fn.Fn
	}
	propCode :: {
		S3: propS3
	}
	propS3 :: {
		Bucket:         string | fn.Fn
		Key:            string | fn.Fn
		ObjectVersion?: string | fn.Fn
	}
}

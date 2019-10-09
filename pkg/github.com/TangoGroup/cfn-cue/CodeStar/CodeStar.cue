package CodeStar

import "github.com/TangoGroup/fn"

GitHubRepository :: {
	Type: "AWS::CodeStar::GitHubRepository"
	Properties: {
		Code?:                  __Code
		EnableIssues?:          bool | fn.Fn
		IsPrivate?:             bool | fn.Fn
		RepositoryAccessToken:  string | fn.Fn
		RepositoryDescription?: string | fn.Fn
		RepositoryName:         string | fn.Fn
		RepositoryOwner:        string | fn.Fn
	}
	__Code :: {
		S3: __S3
	}
	__S3 :: {
		Bucket:         string | fn.Fn
		Key:            string | fn.Fn
		ObjectVersion?: string | fn.Fn
	}
}

package uswest1

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
			}]
			Triggers?: [...{
			}]
		}
	}
}

package euwest2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

CodeGuruReviewer :: {
	RepositoryAssociation :: {
		Type:       "AWS::CodeGuruReviewer::RepositoryAssociation"
		Properties: close({
			ConnectionArn?: (=~#"arn:aws(-[\w]+)*:.+:.+:[0-9]{12}:.+"#) | fn.Fn
			Name:           (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^\S[\w.-]*$"#)) | fn.Fn
			Owner?:         (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^\S(.*\S)?$"#)) | fn.Fn
			Tags?:          [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: ("CodeCommit" | "Bitbucket" | "GitHubEnterpriseServer" | "S3Bucket") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package usgovwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

CodeCommit :: {
	Repository :: {
		Type: "AWS::CodeCommit::Repository"
		Properties: {
			Code?: S3: {
				Bucket:         string | fn.Fn
				Key:            string | fn.Fn
				ObjectVersion?: string | fn.Fn
			}
			RepositoryDescription?: string | fn.Fn
			RepositoryName:         (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z0-9._\-]+(?<!\.git)$"#)) | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Triggers?: [...{
				Branches?:      [...(string | fn.Fn)] | fn.Fn
				CustomData?:    string | fn.Fn
				DestinationArn: string | fn.Fn
				Events:         [...(("all" | "createReference" | "deleteReference" | "updateReference") | fn.Fn)] | fn.Fn
				Name:           string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

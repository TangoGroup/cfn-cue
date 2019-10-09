package CodeCommit

import "github.com/TangoGroup/fn"

Repository :: {
	Type: "AWS::CodeCommit::Repository"
	Properties: {
		Code?:                  __Code
		RepositoryDescription?: string | fn.Fn
		RepositoryName:         (string & (strings.MinRunes(1) & strings.MaxRunes(100)) & (=~#"^[a-zA-Z0-9._\-]+(?<!\.git)$"#)) | fn.Fn
		Tags?: [...__Tag]
		Triggers?: [...__RepositoryTrigger]
	}
	__Code :: {
		S3: __S3
	}
	__RepositoryTrigger :: {
		Branches?:      [...string] | fn.Fn
		CustomData?:    string | fn.Fn
		DestinationArn: string | fn.Fn
		Events:         ([...string] & ("all" | "createReference" | "deleteReference" | "updateReference")) | fn.Fn
		Name:           string | fn.Fn
	}
	__S3 :: {
		Bucket:         string | fn.Fn
		Key:            string | fn.Fn
		ObjectVersion?: string | fn.Fn
	}
}

package CodeCommit

Repository :: {
	Type: "AWS::CodeCommit::Repository"
	Properties: {
		Code?:                  __Code
		RepositoryDescription?: string
		RepositoryName:         strings.MinRunes(1) & strings.MaxRunes(100)
		RepositoryName:         =~"^[a-zA-Z0-9._\-]+(?<!\.git)$"
		RepositoryName:         string
		Tags?: [...__Tag]
		Triggers?: [...__RepositoryTrigger]
	}
	__Code :: {
		S3: __S3
	}
	__RepositoryTrigger :: {
		Branches?: [...string]
		CustomData?:    string
		DestinationArn: string
		Events:         "all" | "createReference" | "deleteReference" | "updateReference"
		Events: [...string]
		Name: string
	}
	__S3 :: {
		Bucket:         string
		Key:            string
		ObjectVersion?: string
	}
}

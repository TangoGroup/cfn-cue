package IAM

AccessKey :: {
	Type: "AWS::IAM::AccessKey"
	Properties: {
		Serial?:  int
		Status?:  "Active" | "Inactive"
		Status?:  string
		UserName: string
	}
}
Group :: {
	Type: "AWS::IAM::Group"
	Properties: {
		GroupName?: string
		ManagedPolicyArns?: [...string]
		Path?: =~"^/(.+/)*$"
		Path?: string
		Policies?: [...__Policy]
	}
	__Policy :: {
		PolicyDocument: {
		}
		PolicyName: strings.MinRunes(1) & strings.MaxRunes(128)
		PolicyName: =~"^[a-zA-Z0-9+=,.@\-_]+$"
		PolicyName: string
	}
}
InstanceProfile :: {
	Type: "AWS::IAM::InstanceProfile"
	Properties: {
		InstanceProfileName?: string
		Path?:                =~"^/(.+/)*$"
		Path?:                string
		Roles: [...string]
	}
}
ManagedPolicy :: {
	Type: "AWS::IAM::ManagedPolicy"
	Properties: {
		Description?: string
		Groups?: [...string]
		ManagedPolicyName?: string
		Path?:              =~"^/(.+/)*$"
		Path?:              string
		PolicyDocument: {
		}
		Roles?: [...string]
		Users?: [...string]
	}
}
Policy :: {
	Type: "AWS::IAM::Policy"
	Properties: {
		Groups?: [...string]
		PolicyDocument: {
		}
		PolicyName: strings.MinRunes(1) & strings.MaxRunes(128)
		PolicyName: =~"^[a-zA-Z0-9+=,.@\-_]+$"
		PolicyName: string
		Roles?: [...string]
		Users?: [...string]
	}
}
Role :: {
	Type: "AWS::IAM::Role"
	Properties: {
		AssumeRolePolicyDocument: {
		}
		Description?: string
		ManagedPolicyArns?: [...string]
		MaxSessionDuration?:  >=3600 & <=43200
		MaxSessionDuration?:  int
		Path?:                =~"^/(.+/)*$"
		Path?:                string
		PermissionsBoundary?: string
		Policies?: [...__Policy]
		RoleName?: string
		Tags?: [...__Tag]
	}
	__Policy :: {
		PolicyDocument: {
		}
		PolicyName: strings.MinRunes(1) & strings.MaxRunes(128)
		PolicyName: =~"^[a-zA-Z0-9+=,.@\-_]+$"
		PolicyName: string
	}
}
ServiceLinkedRole :: {
	Type: "AWS::IAM::ServiceLinkedRole"
	Properties: {
		AWSServiceName: string
		CustomSuffix?:  string
		Description?:   string
	}
}
User :: {
	Type: "AWS::IAM::User"
	Properties: {
		Groups?: [...string]
		LoginProfile?: __LoginProfile
		ManagedPolicyArns?: [...string]
		Path?:                =~"^/(.+/)*$"
		Path?:                string
		PermissionsBoundary?: string
		Policies?: [...__Policy]
		UserName?: string
	}
	__LoginProfile :: {
		Password:               string
		PasswordResetRequired?: bool
	}
	__Policy :: {
		PolicyDocument: {
		}
		PolicyName: strings.MinRunes(1) & strings.MaxRunes(128)
		PolicyName: =~"^[a-zA-Z0-9+=,.@\-_]+$"
		PolicyName: string
	}
}
UserToGroupAddition :: {
	Type: "AWS::IAM::UserToGroupAddition"
	Properties: {
		GroupName: string
		Users: [...string]
	}
}

package IAM

import "github.com/TangoGroup/fn"

AccessKey :: {
	Type: "AWS::IAM::AccessKey"
	Properties: {
		Serial?:  int | fn.Fn
		Status?:  (string & ("Active" | "Inactive")) | fn.Fn
		UserName: string | fn.Fn
	}
}
Group :: {
	Type: "AWS::IAM::Group"
	Properties: {
		GroupName?:         string | fn.Fn
		ManagedPolicyArns?: [...string] | fn.Fn
		Path?:              (string & (=~#"^/(.+/)*$"#)) | fn.Fn
		Policies?: [...__Policy]
	}
	__Policy :: {
		PolicyDocument: {
		} | fn.Fn
		PolicyName: (string & (strings.MinRunes(1) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.Fn
	}
}
InstanceProfile :: {
	Type: "AWS::IAM::InstanceProfile"
	Properties: {
		InstanceProfileName?: string | fn.Fn
		Path?:                (string & (=~#"^/(.+/)*$"#)) | fn.Fn
		Roles:                [...string] | fn.Fn
	}
}
ManagedPolicy :: {
	Type: "AWS::IAM::ManagedPolicy"
	Properties: {
		Description?:       string | fn.Fn
		Groups?:            [...string] | fn.Fn
		ManagedPolicyName?: string | fn.Fn
		Path?:              (string & (=~#"^/(.+/)*$"#)) | fn.Fn
		PolicyDocument:     {
		} | fn.Fn
		Roles?: [...string] | fn.Fn
		Users?: [...string] | fn.Fn
	}
}
Policy :: {
	Type: "AWS::IAM::Policy"
	Properties: {
		Groups?:        [...string] | fn.Fn
		PolicyDocument: {
		} | fn.Fn
		PolicyName: (string & (strings.MinRunes(1) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.Fn
		Roles?:     [...string] | fn.Fn
		Users?:     [...string] | fn.Fn
	}
}
Role :: {
	Type: "AWS::IAM::Role"
	Properties: {
		AssumeRolePolicyDocument: {
		} | fn.Fn
		Description?:         string | fn.Fn
		ManagedPolicyArns?:   [...string] | fn.Fn
		MaxSessionDuration?:  (int & (>=3600 & <=43200)) | fn.Fn
		Path?:                (string & (=~#"^/(.+/)*$"#)) | fn.Fn
		PermissionsBoundary?: string | fn.Fn
		Policies?: [...__Policy]
		RoleName?: string | fn.Fn
		Tags?: [...__Tag]
	}
	__Policy :: {
		PolicyDocument: {
		} | fn.Fn
		PolicyName: (string & (strings.MinRunes(1) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.Fn
	}
}
ServiceLinkedRole :: {
	Type: "AWS::IAM::ServiceLinkedRole"
	Properties: {
		AWSServiceName: string | fn.Fn
		CustomSuffix?:  string | fn.Fn
		Description?:   string | fn.Fn
	}
}
User :: {
	Type: "AWS::IAM::User"
	Properties: {
		Groups?:              [...string] | fn.Fn
		LoginProfile?:        __LoginProfile
		ManagedPolicyArns?:   [...string] | fn.Fn
		Path?:                (string & (=~#"^/(.+/)*$"#)) | fn.Fn
		PermissionsBoundary?: string | fn.Fn
		Policies?: [...__Policy]
		UserName?: string | fn.Fn
	}
	__LoginProfile :: {
		Password:               string | fn.Fn
		PasswordResetRequired?: bool | fn.Fn
	}
	__Policy :: {
		PolicyDocument: {
		} | fn.Fn
		PolicyName: (string & (strings.MinRunes(1) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.Fn
	}
}
UserToGroupAddition :: {
	Type: "AWS::IAM::UserToGroupAddition"
	Properties: {
		GroupName: string | fn.Fn
		Users:     [...string] | fn.Fn
	}
}

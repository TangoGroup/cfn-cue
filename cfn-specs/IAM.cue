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
    Path?: string
    Policies?: [...__Policy]
  }
  __Policy = {
    PolicyDocument: {
    }
    PolicyName: string
  }
}
InstanceProfile :: {
  Type: "AWS::IAM::InstanceProfile"
  Properties: {
    InstanceProfileName?: string
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
    MaxSessionDuration?:  int
    Path?:                string
    PermissionsBoundary?: string
    Policies?: [...__Policy]
    RoleName?: string
    Tags?: [...__Tag]
  }
  __Policy = {
    PolicyDocument: {
    }
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
    Path?:                string
    PermissionsBoundary?: string
    Policies?: [...__Policy]
    UserName?: string
  }
  __LoginProfile = {
    Password:               string
    PasswordResetRequired?: bool
  }
  __Policy = {
    PolicyDocument: {
    }
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

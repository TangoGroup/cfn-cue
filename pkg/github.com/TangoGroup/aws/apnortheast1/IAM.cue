package apnortheast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

#IAM: {
	#AccessKey: {
		Type: "AWS::IAM::AccessKey"
		Properties: {
			Serial?:  int | fn.#Fn
			Status?:  ("Active" | "Inactive") | fn.#Fn
			UserName: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Group: {
		Type: "AWS::IAM::Group"
		Properties: {
			GroupName?:         string | fn.#Fn
			ManagedPolicyArns?: [...((=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn)] | ((=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn)
			Path?:              (=~#"^/(.+/)*$"#) | fn.#Fn
			Policies?:          [...{
				PolicyDocument: {
					{
						[string]: _
					}
					Version: string | *"2012-10-17"
				} | fn.#Fn
				PolicyName: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#InstanceProfile: {
		Type: "AWS::IAM::InstanceProfile"
		Properties: {
			InstanceProfileName?: string | fn.#Fn
			Path?:                (=~#"^/(.+/)*$"#) | fn.#Fn
			Roles:                [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ManagedPolicy: {
		Type: "AWS::IAM::ManagedPolicy"
		Properties: {
			Description?:       string | fn.#Fn
			Groups?:            [...(string | fn.#Fn)] | (string | fn.#Fn)
			ManagedPolicyName?: string | fn.#Fn
			Path?:              (=~#"^/(.+/)*$"#) | fn.#Fn
			PolicyDocument:     {
				{
					[string]: _
				}
				Version: string | *"2012-10-17"
			} | fn.#Fn
			Roles?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Users?: [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Policy: {
		Type: "AWS::IAM::Policy"
		Properties: {
			Groups?:        [...(string | fn.#Fn)] | (string | fn.#Fn)
			PolicyDocument: {
				{
					[string]: _
				}
				Version: string | *"2012-10-17"
			} | fn.#Fn
			PolicyName: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.#Fn
			Roles?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
			Users?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Role: {
		Type: "AWS::IAM::Role"
		Properties: {
			AssumeRolePolicyDocument: {
				{
					[string]: _
				}
				Version: string | *"2012-10-17"
			} | fn.#Fn
			Description?:         string | fn.#Fn
			ManagedPolicyArns?:   [...((=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn)] | ((=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn)
			MaxSessionDuration?:  (>=3600 & <=43200) | fn.#Fn
			Path?:                (=~#"^/(.+/)*$"#) | fn.#Fn
			PermissionsBoundary?: string | fn.#Fn
			Policies?:            [...{
				PolicyDocument: {
					{
						[string]: _
					}
					Version: string | *"2012-10-17"
				} | fn.#Fn
				PolicyName: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.#Fn
			}] | fn.If
			RoleName?: string | fn.#Fn
			Tags?:     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ServiceLinkedRole: {
		Type: "AWS::IAM::ServiceLinkedRole"
		Properties: {
			AWSServiceName: string | fn.#Fn
			CustomSuffix?:  string | fn.#Fn
			Description?:   string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#User: {
		Type: "AWS::IAM::User"
		Properties: {
			Groups?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
			LoginProfile?: {
				Password:               string | fn.#Fn
				PasswordResetRequired?: bool | fn.#Fn
			} | fn.If
			ManagedPolicyArns?:   [...((=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn)] | ((=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn)
			Path?:                (=~#"^/(.+/)*$"#) | fn.#Fn
			PermissionsBoundary?: string | fn.#Fn
			Policies?:            [...{
				PolicyDocument: {
					{
						[string]: _
					}
					Version: string | *"2012-10-17"
				} | fn.#Fn
				PolicyName: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.#Fn
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			UserName?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#UserToGroupAddition: {
		Type: "AWS::IAM::UserToGroupAddition"
		Properties: {
			GroupName: string | fn.#Fn
			Users:     [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

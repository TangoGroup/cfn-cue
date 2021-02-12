package apsoutheast2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

SSO :: {
	Assignment :: {
		Type:       "AWS::SSO::Assignment"
		Properties: close({
			InstanceArn:      (strings.MinRunes(10) & strings.MaxRunes(1224) & (=~#"arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}"#)) | fn.Fn
			PermissionSetArn: (strings.MinRunes(10) & strings.MaxRunes(1224) & (=~#"arn:aws:sso:::permissionSet/(sso)?ins-[a-zA-Z0-9-.]{16}/ps-[a-zA-Z0-9-./]{16}"#)) | fn.Fn
			PrincipalId:      (strings.MinRunes(1) & strings.MaxRunes(47) & (=~#"^([0-9a-f]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$"#)) | fn.Fn
			PrincipalType:    ("USER" | "GROUP") | fn.Fn
			TargetId:         (=~#"\d{12}"#) | fn.Fn
			TargetType:       ("AWS_ACCOUNT") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	InstanceAccessControlAttributeConfiguration :: {
		Type:       "AWS::SSO::InstanceAccessControlAttributeConfiguration"
		Properties: close({
			AccessControlAttributes?: [...close({
				Key:   string | fn.Fn
				Value: close({
					Source: close({
						AccessControlAttributeValueSourceList?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
				}) | fn.If
			})] | fn.If
			InstanceArn: (strings.MinRunes(10) & strings.MaxRunes(1224) & (=~#"arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}"#)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PermissionSet :: {
		Type:       "AWS::SSO::PermissionSet"
		Properties: close({
			Description?:  string | fn.Fn
			InlinePolicy?: {
				[string]: _
			} | fn.Fn
			InstanceArn:      (strings.MinRunes(10) & strings.MaxRunes(1224) & (=~#"arn:aws:sso:::instance/(sso)?ins-[a-zA-Z0-9-.]{16}"#)) | fn.Fn
			ManagedPolicies?: [...((strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn)] | ((strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn)
			Name:             (strings.MinRunes(1) & strings.MaxRunes(32) & (=~#"[\w+=,.@-]+"#)) | fn.Fn
			RelayStateType?:  (strings.MinRunes(1) & strings.MaxRunes(240) & (=~#"[a-zA-Z0-9&amp;$@#\/%?=~\-_'&quot;|!:,.;*+\[\]\ \(\)\{\}]+"#)) | fn.Fn
			SessionDuration?: (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^(-?)P(?=\d|T\d)(?:(\d+)Y)?(?:(\d+)M)?(?:(\d+)([DW]))?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+(?:\.\d+)?)S)?)?$"#)) | fn.Fn
			Tags?:            [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

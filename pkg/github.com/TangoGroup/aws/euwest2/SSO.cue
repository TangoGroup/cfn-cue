package euwest2

import "github.com/TangoGroup/aws/fn"

SSO :: {
	Assignment :: {
		Type:       "AWS::SSO::Assignment"
		Properties: close({
			InstanceArn:      string | fn.Fn
			PermissionSetArn: string | fn.Fn
			PrincipalId:      string | fn.Fn
			PrincipalType:    string | fn.Fn
			TargetId:         string | fn.Fn
			TargetType:       string | fn.Fn
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
			InstanceAccessControlAttributeConfiguration?: {
				[string]: _
			} | fn.Fn
			InstanceArn: string | fn.Fn
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
			InstanceArn:      string | fn.Fn
			ManagedPolicies?: [...(string | fn.Fn)] | (string | fn.Fn)
			Name:             string | fn.Fn
			RelayStateType?:  string | fn.Fn
			SessionDuration?: string | fn.Fn
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

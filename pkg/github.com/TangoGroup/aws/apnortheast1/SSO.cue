package apnortheast1

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
	PermissionSet :: {
		Type:       "AWS::SSO::PermissionSet"
		Properties: close({
			Description?:     string | fn.Fn
			InlinePolicy?:    string | fn.Fn
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

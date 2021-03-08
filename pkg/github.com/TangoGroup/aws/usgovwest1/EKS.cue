package usgovwest1

import "github.com/TangoGroup/aws/fn"

EKS :: {
	Addon :: {
		Type:       "AWS::EKS::Addon"
		Properties: close({
			AddonName:              string | fn.Fn
			AddonVersion?:          string | fn.Fn
			ClusterName:            string | fn.Fn
			ResolveConflicts?:      ("NONE" | "OVERWRITE") | fn.Fn
			ServiceAccountRoleArn?: string | fn.Fn
			Tags?:                  [...close({
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

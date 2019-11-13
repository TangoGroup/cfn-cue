package useast2

import "github.com/TangoGroup/aws/fn"

CodeStarNotifications :: {
	NotificationRule :: {
		Type: "AWS::CodeStarNotifications::NotificationRule"
		Properties: {
			DetailType: string | fn.Fn
			EventTypeIds: [...(string | fn.Fn)]
			Name:     string | fn.Fn
			Resource: string | fn.Fn
			Status?:  string | fn.Fn
			Tags?:    {
				[string]: _
			} | fn.Fn
			Targets: [...{
				TargetAddress?: string | fn.Fn
				TargetType?:    string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

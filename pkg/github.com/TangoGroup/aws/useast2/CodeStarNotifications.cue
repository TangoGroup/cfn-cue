package useast2

import "github.com/TangoGroup/aws/fn"

CodeStarNotifications :: {
	NotificationRule :: {
		Type:       "AWS::CodeStarNotifications::NotificationRule"
		Properties: close({
			DetailType:   string | fn.Fn
			EventTypeIds: [...(string | fn.Fn)] | (string | fn.Fn)
			Name:         string | fn.Fn
			Resource:     string | fn.Fn
			Status?:      string | fn.Fn
			Tags?:        {
				[string]: _
			} | fn.Fn
			Targets: [...close({
				TargetAddress?: string | fn.Fn
				TargetType?:    string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

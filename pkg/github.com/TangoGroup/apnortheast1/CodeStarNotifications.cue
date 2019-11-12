package apnortheast1

import "github.com/TangoGroup/fn"

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
			} | fn.Fn
			Targets: [...{
				TargetAddress?: string | fn.Fn
				TargetType?:    string | fn.Fn
			}]
		}
	}
}

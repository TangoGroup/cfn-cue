package CodeStarNotifications

import "github.com/TangoGroup/fn"

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
		Targets: [...propTarget]
	}
	propTarget :: {
		TargetAddress?: string | fn.Fn
		TargetType?:    string | fn.Fn
	}
}

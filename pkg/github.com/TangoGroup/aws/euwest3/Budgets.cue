package euwest3

import "github.com/TangoGroup/aws/fn"

Budgets :: {
	Budget :: {
		Type: "AWS::Budgets::Budget"
		Properties: {
			Budget: {
			} | fn.If
			NotificationsWithSubscribers?: [...{
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

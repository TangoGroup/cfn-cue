package euwest3

import "github.com/TangoGroup/fn"

Budgets :: {
	Budget :: {
		Type: "AWS::Budgets::Budget"
		Properties: {
			Budget: {
			}
			NotificationsWithSubscribers?: [...{
			}]
		}
	}
}

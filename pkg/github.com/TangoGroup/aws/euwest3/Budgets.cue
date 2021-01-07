package euwest3

import "github.com/TangoGroup/aws/fn"

#Budgets: {
	#Budget: {
		Type: "AWS::Budgets::Budget"
		Properties: {
			Budget: {
				BudgetLimit?: {
					Amount: number | fn.#Fn
					Unit:   string | fn.#Fn
				} | fn.#If
				BudgetName?:  string | fn.#Fn
				BudgetType:   string | fn.#Fn
				CostFilters?: {
					[string]: _
				} | fn.#Fn
				CostTypes?: {
					IncludeCredit?:            bool | fn.#Fn
					IncludeDiscount?:          bool | fn.#Fn
					IncludeOtherSubscription?: bool | fn.#Fn
					IncludeRecurring?:         bool | fn.#Fn
					IncludeRefund?:            bool | fn.#Fn
					IncludeSubscription?:      bool | fn.#Fn
					IncludeSupport?:           bool | fn.#Fn
					IncludeTax?:               bool | fn.#Fn
					IncludeUpfront?:           bool | fn.#Fn
					UseAmortized?:             bool | fn.#Fn
					UseBlended?:               bool | fn.#Fn
				} | fn.#If
				PlannedBudgetLimits?: {
					[string]: _
				} | fn.#Fn
				TimePeriod?: {
					End?:   string | fn.#Fn
					Start?: string | fn.#Fn
				} | fn.#If
				TimeUnit: string | fn.#Fn
			} | fn.#If
			NotificationsWithSubscribers?: [...{
				Notification: {
					ComparisonOperator: string | fn.#Fn
					NotificationType:   string | fn.#Fn
					Threshold:          number | fn.#Fn
					ThresholdType?:     string | fn.#Fn
				} | fn.#If
				Subscribers: [...{
					Address:          string | fn.#Fn
					SubscriptionType: string | fn.#Fn
				}] | fn.#If
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

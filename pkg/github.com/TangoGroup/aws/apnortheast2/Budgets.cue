package apnortheast2

import "github.com/TangoGroup/aws/fn"

#Budgets: {
	#Budget: {
		Type:       "AWS::Budgets::Budget"
		Properties: close({
			Budget: close({
				BudgetLimit?: close({
					Amount: number | fn.#Fn
					Unit:   string | fn.#Fn
				}) | fn.If
				BudgetName?:  string | fn.#Fn
				BudgetType:   ("COST" | "RI_COVERAGE" | "RI_UTILIZATION" | "USAGE") | fn.#Fn
				CostFilters?: {
					[string]: _
				} | fn.#Fn
				CostTypes?: close({
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
				}) | fn.If
				PlannedBudgetLimits?: {
					[string]: _
				} | fn.#Fn
				TimePeriod?: close({
					End?:   string | fn.#Fn
					Start?: string | fn.#Fn
				}) | fn.If
				TimeUnit: ("ANNUALLY" | "DAILY" | "MONTHLY" | "QUARTERLY") | fn.#Fn
			}) | fn.If
			NotificationsWithSubscribers?: [...close({
				Notification: close({
					ComparisonOperator: ("EQUAL_TO" | "GREATER_THAN" | "LESS_THAN") | fn.#Fn
					NotificationType:   ("ACTUAL" | "FORECASTED") | fn.#Fn
					Threshold:          (>=0.1 & <=1000000000) | fn.#Fn
					ThresholdType?:     ("ABSOLUTE_VALUE" | "PERCENTAGE") | fn.#Fn
				}) | fn.If
				Subscribers: [...close({
					Address:          string | fn.#Fn
					SubscriptionType: ("EMAIL" | "SNS") | fn.#Fn
				})] | fn.If
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

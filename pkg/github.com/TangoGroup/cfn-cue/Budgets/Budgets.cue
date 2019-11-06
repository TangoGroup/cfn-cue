package Budgets

import "github.com/TangoGroup/fn"

Budget :: {
	Type: "AWS::Budgets::Budget"
	Properties: {
		Budget: propBudgetData
		NotificationsWithSubscribers?: [...propNotificationWithSubscribers]
	}
	propBudgetData :: {
		BudgetLimit?: propSpend
		BudgetName?:  string | fn.Fn
		BudgetType:   (string & ("COST" | "RI_COVERAGE" | "RI_UTILIZATION" | "USAGE")) | fn.Fn
		CostFilters?: {
		} | fn.Fn
		CostTypes?:           propCostTypes
		PlannedBudgetLimits?: {
		} | fn.Fn
		TimePeriod?: propTimePeriod
		TimeUnit:    (string & ("ANNUALLY" | "DAILY" | "MONTHLY" | "QUARTERLY")) | fn.Fn
	}
	propCostTypes :: {
		IncludeCredit?:            bool | fn.Fn
		IncludeDiscount?:          bool | fn.Fn
		IncludeOtherSubscription?: bool | fn.Fn
		IncludeRecurring?:         bool | fn.Fn
		IncludeRefund?:            bool | fn.Fn
		IncludeSubscription?:      bool | fn.Fn
		IncludeSupport?:           bool | fn.Fn
		IncludeTax?:               bool | fn.Fn
		IncludeUpfront?:           bool | fn.Fn
		UseAmortized?:             bool | fn.Fn
		UseBlended?:               bool | fn.Fn
	}
	propNotification :: {
		ComparisonOperator: (string & ("EQUAL_TO" | "GREATER_THAN" | "LESS_THAN")) | fn.Fn
		NotificationType:   (string & ("ACTUAL" | "FORECASTED")) | fn.Fn
		Threshold:          (float & (>=0.1 & <=1000000000)) | fn.Fn
		ThresholdType?:     (string & ("ABSOLUTE_VALUE" | "PERCENTAGE")) | fn.Fn
	}
	propNotificationWithSubscribers :: {
		Notification: propNotification
		Subscribers: [...propSubscriber]
	}
	propSpend :: {
		Amount: float | fn.Fn
		Unit:   string | fn.Fn
	}
	propSubscriber :: {
		Address:          string | fn.Fn
		SubscriptionType: (string & ("EMAIL" | "SNS")) | fn.Fn
	}
	propTimePeriod :: {
		End?:   string | fn.Fn
		Start?: string | fn.Fn
	}
}

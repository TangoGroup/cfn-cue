package Budgets

import "github.com/TangoGroup/fn"

Budget :: {
	Type: "AWS::Budgets::Budget"
	Properties: {
		Budget: __BudgetData
		NotificationsWithSubscribers?: [...__NotificationWithSubscribers]
	}
	__BudgetData :: {
		BudgetLimit?: __Spend
		BudgetName?:  string | fn.Fn
		BudgetType:   (string & ("COST" | "RI_COVERAGE" | "RI_UTILIZATION" | "USAGE")) | fn.Fn
		CostFilters?: {
		} | fn.Fn
		CostTypes?:           __CostTypes
		PlannedBudgetLimits?: {
		} | fn.Fn
		TimePeriod?: __TimePeriod
		TimeUnit:    (string & ("ANNUALLY" | "DAILY" | "MONTHLY" | "QUARTERLY")) | fn.Fn
	}
	__CostTypes :: {
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
	__Notification :: {
		ComparisonOperator: (string & ("EQUAL_TO" | "GREATER_THAN" | "LESS_THAN")) | fn.Fn
		NotificationType:   (string & ("ACTUAL" | "FORECASTED")) | fn.Fn
		Threshold:          (float & (>=0.1 & <=1000000000)) | fn.Fn
		ThresholdType?:     (string & ("ABSOLUTE_VALUE" | "PERCENTAGE")) | fn.Fn
	}
	__NotificationWithSubscribers :: {
		Notification: __Notification
		Subscribers: [...__Subscriber]
	}
	__Spend :: {
		Amount: float | fn.Fn
		Unit:   string | fn.Fn
	}
	__Subscriber :: {
		Address:          string | fn.Fn
		SubscriptionType: (string & ("EMAIL" | "SNS")) | fn.Fn
	}
	__TimePeriod :: {
		End?:   string | fn.Fn
		Start?: string | fn.Fn
	}
}

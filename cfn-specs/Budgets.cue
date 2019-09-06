package Budgets

Budget :: {
  Type: "AWS::Budgets::Budget"
  Properties: {
    Budget: __BudgetData
    NotificationsWithSubscribers?: [...__NotificationWithSubscribers]
  }
  __BudgetData = {
    BudgetLimit?: __Spend
    BudgetName?:  string
    BudgetType:   "COST" | "RI_COVERAGE" | "RI_UTILIZATION" | "USAGE"
    BudgetType:   string
    CostFilters?: {
    }
    CostTypes?:  __CostTypes
    TimePeriod?: __TimePeriod
    TimeUnit:    "ANNUALLY" | "DAILY" | "MONTHLY" | "QUARTERLY"
    TimeUnit:    string
  }
  __CostTypes = {
    IncludeCredit?:            bool
    IncludeDiscount?:          bool
    IncludeOtherSubscription?: bool
    IncludeRecurring?:         bool
    IncludeRefund?:            bool
    IncludeSubscription?:      bool
    IncludeSupport?:           bool
    IncludeTax?:               bool
    IncludeUpfront?:           bool
    UseAmortized?:             bool
    UseBlended?:               bool
  }
  __Notification = {
    ComparisonOperator: "EQUAL_TO" | "GREATER_THAN" | "LESS_THAN"
    ComparisonOperator: string
    NotificationType:   "ACTUAL" | "FORECASTED"
    NotificationType:   string
    Threshold:          float
    ThresholdType?:     "ABSOLUTE_VALUE" | "PERCENTAGE"
    ThresholdType?:     string
  }
  __NotificationWithSubscribers = {
    Notification: __Notification
    Subscribers: [...__Subscriber]
  }
  __Spend = {
    Amount: float
    Unit:   string
  }
  __Subscriber = {
    Address:          string
    SubscriptionType: "EMAIL" | "SNS"
    SubscriptionType: string
  }
  __TimePeriod = {
    End?:   string
    Start?: string
  }
}

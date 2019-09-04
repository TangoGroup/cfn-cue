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
    BudgetType:   string
    CostFilters?: {
    }
    CostTypes?:  __CostTypes
    TimePeriod?: __TimePeriod
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
    ComparisonOperator: string
    NotificationType:   string
    Threshold:          float
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
    SubscriptionType: string
  }
  __TimePeriod = {
    End?:   string
    Start?: string
  }
}

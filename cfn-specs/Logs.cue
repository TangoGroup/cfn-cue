package Logs

Destination :: {
  Type: "AWS::Logs::Destination"
  Properties: {
    DestinationName:   string
    DestinationPolicy: string
    RoleArn:           string
    TargetArn:         string
  }
}
LogGroup :: {
  Type: "AWS::Logs::LogGroup"
  Properties: {
    LogGroupName?:    string
    RetentionInDays?: "1" | "3" | "5" | "7" | "14" | "30" | "60" | "90" | "120" | "150" | "180" | "365" | "400" | "545" | "731" | "1827" | "3653"
    RetentionInDays?: int
  }
}
LogStream :: {
  Type: "AWS::Logs::LogStream"
  Properties: {
    LogGroupName:   string
    LogStreamName?: string
  }
}
MetricFilter :: {
  Type: "AWS::Logs::MetricFilter"
  Properties: {
    FilterPattern: string
    LogGroupName:  string
    MetricTransformations: [...__MetricTransformation]
  }
  __MetricTransformation = {
    DefaultValue?:   float
    MetricName:      string
    MetricNamespace: string
    MetricValue:     string
  }
}
SubscriptionFilter :: {
  Type: "AWS::Logs::SubscriptionFilter"
  Properties: {
    DestinationArn: string
    FilterPattern:  string
    LogGroupName:   string
    RoleArn?:       string
  }
}

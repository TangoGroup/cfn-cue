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

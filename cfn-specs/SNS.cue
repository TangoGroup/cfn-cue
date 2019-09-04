package SNS

Subscription :: {
  Type: "AWS::SNS::Subscription"
  Properties: {
    DeliveryPolicy?: {
    }
    Endpoint?: string
    FilterPolicy?: {
    }
    Protocol:            string
    RawMessageDelivery?: bool
    Region?:             string
    TopicArn:            string
  }
}
Topic :: {
  Type: "AWS::SNS::Topic"
  Properties: {
    DisplayName?:    string
    KmsMasterKeyId?: string
    Subscription?: [...__Subscription]
    TopicName?: string
  }
  __Subscription = {
    Endpoint: string
    Protocol: string
  }
}
TopicPolicy :: {
  Type: "AWS::SNS::TopicPolicy"
  Properties: {
    PolicyDocument: {
    }
    Topics: [...string]
  }
}

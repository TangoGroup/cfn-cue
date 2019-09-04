package SQS

Queue :: {
  Type: "AWS::SQS::Queue"
  Properties: {
    ContentBasedDeduplication?:     bool
    DelaySeconds?:                  int
    FifoQueue?:                     bool
    KmsDataKeyReusePeriodSeconds?:  int
    KmsMasterKeyId?:                string
    MaximumMessageSize?:            int
    MessageRetentionPeriod?:        int
    QueueName?:                     string
    ReceiveMessageWaitTimeSeconds?: int
    RedrivePolicy?: {
    }
    Tags?: [...__Tag]
    VisibilityTimeout?: int
  }
}
QueuePolicy :: {
  Type: "AWS::SQS::QueuePolicy"
  Properties: {
    PolicyDocument: {
    }
    Queues: [...string]
  }
}

package SQS

Queue :: {
  Type: "AWS::SQS::Queue"
  Properties: {
    ContentBasedDeduplication?:     bool
    DelaySeconds?:                  >=0 & <=900
    DelaySeconds?:                  int
    FifoQueue?:                     bool
    KmsDataKeyReusePeriodSeconds?:  >=60 & <=86400
    KmsDataKeyReusePeriodSeconds?:  int
    KmsMasterKeyId?:                string
    MaximumMessageSize?:            >=1024 & <=262144
    MaximumMessageSize?:            int
    MessageRetentionPeriod?:        >=60 & <=1209600
    MessageRetentionPeriod?:        int
    QueueName?:                     string
    ReceiveMessageWaitTimeSeconds?: >=0 & <=20
    ReceiveMessageWaitTimeSeconds?: int
    RedrivePolicy?: {
    }
    Tags?: [...__Tag]
    VisibilityTimeout?: >=0 & <=43200
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

package Kinesis

Stream :: {
  Type: "AWS::Kinesis::Stream"
  Properties: {
    Name?:                 string
    RetentionPeriodHours?: int
    ShardCount:            int
    StreamEncryption?:     __StreamEncryption
    Tags?: [...__Tag]
  }
  __StreamEncryption = {
    EncryptionType: string
    KeyId:          string
  }
}
StreamConsumer :: {
  Type: "AWS::Kinesis::StreamConsumer"
  Properties: {
    ConsumerName: string
    StreamARN:    string
  }
}

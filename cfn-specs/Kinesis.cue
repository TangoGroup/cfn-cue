package Kinesis

Stream :: {
	Type: "AWS::Kinesis::Stream"
	Properties: {
		Name?:                 string
		RetentionPeriodHours?: >=1 & <=168
		RetentionPeriodHours?: int
		ShardCount:            >=1 & <=100000
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

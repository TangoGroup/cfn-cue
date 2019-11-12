package apeast1

import "github.com/TangoGroup/fn"

Kinesis :: {
	Stream :: {
		Type: "AWS::Kinesis::Stream"
		Properties: {
			Name?:                 string | fn.Fn
			RetentionPeriodHours?: (int & (>=1 & <=168)) | fn.Fn
			ShardCount:            (int & (>=1 & <=100000)) | fn.Fn
			StreamEncryption?: {
				EncryptionType: string | fn.Fn
				KeyId:          string | fn.Fn
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
	}
}

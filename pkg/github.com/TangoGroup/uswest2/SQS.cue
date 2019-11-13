package uswest2

import "github.com/TangoGroup/fn"

SQS :: {
	Queue :: {
		Type: "AWS::SQS::Queue"
		Properties: {
			ContentBasedDeduplication?:     bool | fn.Fn
			DelaySeconds?:                  (int & (>=0 & <=900)) | fn.Fn
			FifoQueue?:                     bool | fn.Fn
			KmsDataKeyReusePeriodSeconds?:  (int & (>=60 & <=86400)) | fn.Fn
			KmsMasterKeyId?:                string | fn.Fn
			MaximumMessageSize?:            (int & (>=1024 & <=262144)) | fn.Fn
			MessageRetentionPeriod?:        (int & (>=60 & <=1209600)) | fn.Fn
			QueueName?:                     string | fn.Fn
			ReceiveMessageWaitTimeSeconds?: (int & (>=0 & <=20)) | fn.Fn
			RedrivePolicy?:                 {
				[string]: _
			} | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VisibilityTimeout?: (int & (>=0 & <=43200)) | fn.Fn
		}
		DependsOn?: string | [...string]
	}
	QueuePolicy :: {
		Type: "AWS::SQS::QueuePolicy"
		Properties: {
			PolicyDocument: {
				[string]: _
			} | fn.Fn
			Queues: [...(string | fn.Fn)]
		}
		DependsOn?: string | [...string]
	}
}

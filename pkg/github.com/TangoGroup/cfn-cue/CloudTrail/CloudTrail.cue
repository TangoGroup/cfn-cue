package CloudTrail

import "github.com/TangoGroup/fn"

Trail :: {
	Type: "AWS::CloudTrail::Trail"
	Properties: {
		CloudWatchLogsLogGroupArn?: string | fn.Fn
		CloudWatchLogsRoleArn?:     string | fn.Fn
		EnableLogFileValidation?:   bool | fn.Fn
		EventSelectors?: [...propEventSelector]
		IncludeGlobalServiceEvents?: bool | fn.Fn
		IsLogging:                   bool | fn.Fn
		IsMultiRegionTrail?:         bool | fn.Fn
		KMSKeyId?:                   string | fn.Fn
		S3BucketName:                string | fn.Fn
		S3KeyPrefix?:                string | fn.Fn
		SnsTopicName?:               string | fn.Fn
		Tags?: [...propTag]
		TrailName?: string | fn.Fn
	}
	propDataResource :: {
		Type:    (string & ("AWS::Lambda::Function" | "AWS::S3::Object")) | fn.Fn
		Values?: [...string] | fn.Fn
	}
	propEventSelector :: {
		DataResources?: [...propDataResource]
		IncludeManagementEvents?: bool | fn.Fn
		ReadWriteType?:           (string & ("All" | "ReadOnly" | "WriteOnly")) | fn.Fn
	}
}

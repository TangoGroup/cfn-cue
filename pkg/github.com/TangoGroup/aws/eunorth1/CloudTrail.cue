package eunorth1

import "github.com/TangoGroup/aws/fn"

CloudTrail :: {
	Trail :: {
		Type:       "AWS::CloudTrail::Trail"
		Properties: close({
			CloudWatchLogsLogGroupArn?: string | fn.Fn
			CloudWatchLogsRoleArn?:     string | fn.Fn
			EnableLogFileValidation?:   bool | fn.Fn
			EventSelectors?:            [...close({
				DataResources?: [...close({
					Type:    ("AWS::Lambda::Function" | "AWS::S3::Object") | fn.Fn
					Values?: [...(string | fn.Fn)] | (string | fn.Fn)
				})] | fn.If
				IncludeManagementEvents?: bool | fn.Fn
				ReadWriteType?:           ("All" | "ReadOnly" | "WriteOnly") | fn.Fn
			})] | fn.If
			IncludeGlobalServiceEvents?: bool | fn.Fn
			IsLogging:                   bool | fn.Fn
			IsMultiRegionTrail?:         bool | fn.Fn
			KMSKeyId?:                   string | fn.Fn
			S3BucketName:                string | fn.Fn
			S3KeyPrefix?:                string | fn.Fn
			SnsTopicName?:               string | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TrailName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

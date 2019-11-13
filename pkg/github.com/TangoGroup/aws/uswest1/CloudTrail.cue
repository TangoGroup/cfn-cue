package uswest1

import "github.com/TangoGroup/aws/fn"

CloudTrail :: {
	Trail :: {
		Type: "AWS::CloudTrail::Trail"
		Properties: {
			CloudWatchLogsLogGroupArn?: string | fn.Fn
			CloudWatchLogsRoleArn?:     string | fn.Fn
			EnableLogFileValidation?:   bool | fn.Fn
			EventSelectors?: [...{
				DataResources?: [...{
					Type: (string & ("AWS::Lambda::Function" | "AWS::S3::Object")) | fn.Fn
					Values?: [...(string | fn.Fn)]
				}]
				IncludeManagementEvents?: bool | fn.Fn
				ReadWriteType?:           (string & ("All" | "ReadOnly" | "WriteOnly")) | fn.Fn
			}]
			IncludeGlobalServiceEvents?: bool | fn.Fn
			IsLogging:                   bool | fn.Fn
			IsMultiRegionTrail?:         bool | fn.Fn
			KMSKeyId?:                   string | fn.Fn
			S3BucketName:                string | fn.Fn
			S3KeyPrefix?:                string | fn.Fn
			SnsTopicName?:               string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TrailName?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

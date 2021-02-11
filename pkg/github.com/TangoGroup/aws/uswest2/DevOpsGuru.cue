package uswest2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

DevOpsGuru :: {
	NotificationChannel :: {
		Type:       "AWS::DevOpsGuru::NotificationChannel"
		Properties: close({
			Config: close({
				Sns?: close({
					TopicArn?: (strings.MinRunes(36) & strings.MaxRunes(1024) & (=~#"^arn:aws[a-z0-9-]*:sns:[a-z0-9-]+:\d{12}:[^:]+$"#)) | fn.Fn
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ResourceCollection :: {
		Type:       "AWS::DevOpsGuru::ResourceCollection"
		Properties: close({
			ResourceCollectionFilter: close({
				CloudFormation?: close({
					StackNames?: [...((strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z*]+[a-zA-Z0-9-]*$"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[a-zA-Z*]+[a-zA-Z0-9-]*$"#)) | fn.Fn)
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

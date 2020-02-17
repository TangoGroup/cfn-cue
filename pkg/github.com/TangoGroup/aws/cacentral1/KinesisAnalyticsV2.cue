package cacentral1

import "github.com/TangoGroup/aws/fn"

KinesisAnalyticsV2 :: {
	Application :: {
		Type: "AWS::KinesisAnalyticsV2::Application"
		Properties: {
			ApplicationConfiguration?: {
			} | fn.If
			ApplicationDescription?: string | fn.Fn
			ApplicationName?:        string | fn.Fn
			RuntimeEnvironment:      string | fn.Fn
			ServiceExecutionRole:    string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationCloudWatchLoggingOption :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
		Properties: {
			ApplicationName:         string | fn.Fn
			CloudWatchLoggingOption: {
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationOutput :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
		Properties: {
			ApplicationName: string | fn.Fn
			Output:          {
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationReferenceDataSource :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
		Properties: {
			ApplicationName:     string | fn.Fn
			ReferenceDataSource: {
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

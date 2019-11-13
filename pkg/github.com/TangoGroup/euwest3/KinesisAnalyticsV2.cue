package euwest3

import "github.com/TangoGroup/fn"

KinesisAnalyticsV2 :: {
	Application :: {
		Type: "AWS::KinesisAnalyticsV2::Application"
		Properties: {
			ApplicationConfiguration?: {
			}
			ApplicationDescription?: string | fn.Fn
			ApplicationName?:        string | fn.Fn
			RuntimeEnvironment:      string | fn.Fn
			ServiceExecutionRole:    string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ApplicationCloudWatchLoggingOption :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
		Properties: {
			ApplicationName: string | fn.Fn
			CloudWatchLoggingOption: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ApplicationOutput :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
		Properties: {
			ApplicationName: string | fn.Fn
			Output: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ApplicationReferenceDataSource :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
		Properties: {
			ApplicationName: string | fn.Fn
			ReferenceDataSource: {
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

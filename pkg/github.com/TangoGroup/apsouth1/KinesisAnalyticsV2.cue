package apsouth1

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
	}
	ApplicationCloudWatchLoggingOption :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
		Properties: {
			ApplicationName: string | fn.Fn
			CloudWatchLoggingOption: {
			}
		}
	}
	ApplicationOutput :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
		Properties: {
			ApplicationName: string | fn.Fn
			Output: {
			}
		}
	}
	ApplicationReferenceDataSource :: {
		Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
		Properties: {
			ApplicationName: string | fn.Fn
			ReferenceDataSource: {
			}
		}
	}
}

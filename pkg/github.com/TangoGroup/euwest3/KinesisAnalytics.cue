package euwest3

import "github.com/TangoGroup/fn"

KinesisAnalytics :: {
	Application :: {
		Type: "AWS::KinesisAnalytics::Application"
		Properties: {
			ApplicationCode?:        string | fn.Fn
			ApplicationDescription?: string | fn.Fn
			ApplicationName?:        string | fn.Fn
			Inputs: [...{
			}]
		}
	}
	ApplicationOutput :: {
		Type: "AWS::KinesisAnalytics::ApplicationOutput"
		Properties: {
			ApplicationName: string | fn.Fn
			Output: {
			}
		}
	}
	ApplicationReferenceDataSource :: {
		Type: "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
		Properties: {
			ApplicationName: string | fn.Fn
			ReferenceDataSource: {
			}
		}
	}
}

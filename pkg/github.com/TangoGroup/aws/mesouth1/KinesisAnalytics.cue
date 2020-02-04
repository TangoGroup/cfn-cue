package mesouth1

import "github.com/TangoGroup/aws/fn"

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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ApplicationOutput :: {
		Type: "AWS::KinesisAnalytics::ApplicationOutput"
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
		Type: "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
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

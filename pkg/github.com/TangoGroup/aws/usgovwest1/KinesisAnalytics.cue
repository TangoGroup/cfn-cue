package usgovwest1

import "github.com/TangoGroup/aws/fn"

KinesisAnalytics :: {
	Application :: {
		Type:       "AWS::KinesisAnalytics::Application"
		Properties: close({
			ApplicationCode?:        string | fn.Fn
			ApplicationDescription?: string | fn.Fn
			ApplicationName?:        string | fn.Fn
			Inputs:                  [...close({})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationOutput :: {
		Type:       "AWS::KinesisAnalytics::ApplicationOutput"
		Properties: close({
			ApplicationName: string | fn.Fn
			Output:          close({}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApplicationReferenceDataSource :: {
		Type:       "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
		Properties: close({
			ApplicationName:     string | fn.Fn
			ReferenceDataSource: close({}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

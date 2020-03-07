package saeast1

import "github.com/TangoGroup/aws/fn"

Chatbot :: {
	SlackChannelConfiguration :: {
		Type: "AWS::Chatbot::SlackChannelConfiguration"
		Properties: {
			Arn?:              string | fn.Fn
			ConfigurationName: string | fn.Fn
			IamRoleArn:        string | fn.Fn
			LoggingLevel?:     string | fn.Fn
			SlackChannelId:    string | fn.Fn
			SlackWorkspaceId:  string | fn.Fn
			SnsTopicArns?:     [...(string | fn.Fn)] | (string | fn.Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

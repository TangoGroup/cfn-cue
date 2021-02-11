package mesouth1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Chatbot :: {
	SlackChannelConfiguration :: {
		Type:       "AWS::Chatbot::SlackChannelConfiguration"
		Properties: close({
			ConfigurationName: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[A-Za-z0-9-_]+$"#)) | fn.Fn
			IamRoleArn:        (=~#"^arn:(aws[a-zA-Z-]*)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$"#) | fn.Fn
			LoggingLevel?:     (=~#"^(ERROR|INFO|NONE)$"#) | fn.Fn
			SlackChannelId:    (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[A-Za-z0-9]+$"#)) | fn.Fn
			SlackWorkspaceId:  (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			SnsTopicArns?:     [...((=~#"^arn:(aws[a-zA-Z-]*)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$"#) | fn.Fn)] | ((=~#"^arn:(aws[a-zA-Z-]*)?:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$"#) | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

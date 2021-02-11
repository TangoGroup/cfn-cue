package euwest3

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Detective :: {
	Graph :: {
		Type:       "AWS::Detective::Graph"
		Properties: close({
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MemberInvitation :: {
		Type:       "AWS::Detective::MemberInvitation"
		Properties: close({
			GraphArn:           (=~#"arn:aws(-[\w]+)*:detective:(([a-z]+-)+[0-9]+):[0-9]{12}:graph:[0-9a-f]{32}"#) | fn.Fn
			MemberEmailAddress: (=~#".*@.*"#) | fn.Fn
			MemberId:           (=~#"[0-9]{12}"#) | fn.Fn
			Message?:           (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

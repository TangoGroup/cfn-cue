package euwest2

import "github.com/TangoGroup/aws/fn"

#Detective: {
	#Graph: {
		Type: "AWS::Detective::Graph"
		Properties: {}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MemberInvitation: {
		Type: "AWS::Detective::MemberInvitation"
		Properties: {
			GraphArn:           string | fn.#Fn
			MemberEmailAddress: string | fn.#Fn
			MemberId:           string | fn.#Fn
			Message?:           string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package saeast1

import "github.com/TangoGroup/aws/fn"

CodeStarConnections :: {
	Connection :: {
		Type:       "AWS::CodeStarConnections::Connection"
		Properties: close({
			ConnectionName: string | fn.Fn
			ProviderType:   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

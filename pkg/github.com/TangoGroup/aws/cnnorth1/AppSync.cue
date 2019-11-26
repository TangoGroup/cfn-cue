package cnnorth1

import "github.com/TangoGroup/aws/fn"

AppSync :: {
	ApiCache :: {
		Type: "AWS::AppSync::ApiCache"
		Properties: {
			ApiCachingBehavior:        string | fn.Fn
			ApiId:                     string | fn.Fn
			AtRestEncryptionEnabled?:  bool | fn.Fn
			TransitEncryptionEnabled?: bool | fn.Fn
			Ttl:                       float | fn.Fn
			Type:                      string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

package apsouth1

import "github.com/TangoGroup/aws/fn"

CodeArtifact :: {
	Domain :: {
		Type:       "AWS::CodeArtifact::Domain"
		Properties: close({
			DomainName:                 string | fn.Fn
			PermissionsPolicyDocument?: {
				[string]: _
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Repository :: {
		Type:       "AWS::CodeArtifact::Repository"
		Properties: close({
			Description?:               string | fn.Fn
			ExternalConnections?:       [...(string | fn.Fn)] | (string | fn.Fn)
			PermissionsPolicyDocument?: {
				[string]: _
			} | fn.Fn
			RepositoryName: string | fn.Fn
			Upstreams?:     [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

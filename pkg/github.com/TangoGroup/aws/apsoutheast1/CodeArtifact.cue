package apsoutheast1

import "github.com/TangoGroup/aws/fn"

#CodeArtifact: {
	#Domain: {
		Type: "AWS::CodeArtifact::Domain"
		Properties: {
			DomainName:                 string | fn.#Fn
			PermissionsPolicyDocument?: {
				[string]: _
			} | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Repository: {
		Type: "AWS::CodeArtifact::Repository"
		Properties: {
			Description?:               string | fn.#Fn
			ExternalConnections?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
			PermissionsPolicyDocument?: {
				[string]: _
			} | fn.#Fn
			RepositoryName: string | fn.#Fn
			Tags?:          [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			Upstreams?: [...(string | fn.#Fn)] | (string | fn.#Fn)
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

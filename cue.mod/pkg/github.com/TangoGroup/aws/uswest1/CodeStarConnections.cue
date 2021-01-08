package uswest1

import "github.com/TangoGroup/aws/fn"

#CodeStarConnections: {
	#Connection: {
		Type: "AWS::CodeStarConnections::Connection"
		Properties: {
			ConnectionName: string | fn.#Fn
			HostArn?:       string | fn.#Fn
			ProviderType?:  string | fn.#Fn
			Tags?:          [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package uswest2

import "github.com/TangoGroup/aws/fn"

#DevOpsGuru: {
	#NotificationChannel: {
		Type: "AWS::DevOpsGuru::NotificationChannel"
		Properties: Config: {
			Sns?: {
				TopicArn?: string | fn.#Fn
			} | fn.#If
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceCollection: {
		Type: "AWS::DevOpsGuru::ResourceCollection"
		Properties: ResourceCollectionFilter: {
			CloudFormation?: {
				StackNames?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
		} | fn.#If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package euwest1

import "github.com/TangoGroup/aws/fn"

#DevOpsGuru: {
	#NotificationChannel: {
		Type:       "AWS::DevOpsGuru::NotificationChannel"
		Properties: close({
			Config: close({
				Sns?: close({
					TopicArn?: string | fn.#Fn
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceCollection: {
		Type:       "AWS::DevOpsGuru::ResourceCollection"
		Properties: close({
			ResourceCollectionFilter: close({
				CloudFormation?: close({
					StackNames?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

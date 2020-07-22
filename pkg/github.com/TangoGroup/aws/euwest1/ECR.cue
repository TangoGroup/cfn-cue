package euwest1

import "github.com/TangoGroup/aws/fn"

#ECR: {
	#Repository: {
		Type:       "AWS::ECR::Repository"
		Properties: close({
			LifecyclePolicy?: close({
				LifecyclePolicyText?: string | fn.#Fn
				RegistryId?:          string | fn.#Fn
			}) | fn.If
			RepositoryName?:       string | fn.#Fn
			RepositoryPolicyText?: {
				[string]: _
			} | fn.#Fn
			Tags?: [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

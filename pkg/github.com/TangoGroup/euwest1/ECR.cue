package euwest1

import "github.com/TangoGroup/fn"

ECR :: {
	Repository :: {
		Type: "AWS::ECR::Repository"
		Properties: {
			LifecyclePolicy?: {
				LifecyclePolicyText?: string | fn.Fn
				RegistryId?:          string | fn.Fn
			}
			RepositoryName?:       string | fn.Fn
			RepositoryPolicyText?: {
			} | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
	}
}

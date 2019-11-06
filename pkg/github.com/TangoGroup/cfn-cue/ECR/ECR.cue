package ECR

import "github.com/TangoGroup/fn"

Repository :: {
	Type: "AWS::ECR::Repository"
	Properties: {
		LifecyclePolicy?:      propLifecyclePolicy
		RepositoryName?:       string | fn.Fn
		RepositoryPolicyText?: {
		} | fn.Fn
		Tags?: [...propTag]
	}
	propLifecyclePolicy :: {
		LifecyclePolicyText?: string | fn.Fn
		RegistryId?:          string | fn.Fn
	}
}

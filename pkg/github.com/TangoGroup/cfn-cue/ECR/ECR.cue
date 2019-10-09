package ECR

import "github.com/TangoGroup/fn"

Repository :: {
	Type: "AWS::ECR::Repository"
	Properties: {
		LifecyclePolicy?:      __LifecyclePolicy
		RepositoryName?:       string | fn.Fn
		RepositoryPolicyText?: {
		} | fn.Fn
		Tags?: [...__Tag]
	}
	__LifecyclePolicy :: {
		LifecyclePolicyText?: string | fn.Fn
		RegistryId?:          string | fn.Fn
	}
}

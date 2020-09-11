package euwest3

import "github.com/TangoGroup/aws/fn"

ECR :: {
	Repository :: {
		Type:       "AWS::ECR::Repository"
		Properties: close({
			ImageScanningConfiguration?: {
				[string]: _
			} | fn.Fn
			ImageTagMutability?: string | fn.Fn
			LifecyclePolicy?:    {
				[string]: _
			} | fn.Fn
			RepositoryName?:       string | fn.Fn
			RepositoryPolicyText?: {
				[string]: _
			} | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

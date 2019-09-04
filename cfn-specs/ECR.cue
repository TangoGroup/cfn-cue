package ECR

Repository :: {
  Type: "AWS::ECR::Repository"
  Properties: {
    LifecyclePolicy?: __LifecyclePolicy
    RepositoryName?:  string
    RepositoryPolicyText?: {
    }
    Tags?: [...__Tag]
  }
  __LifecyclePolicy = {
    LifecyclePolicyText?: string
    RegistryId?:          string
  }
}

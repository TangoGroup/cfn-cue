package EFS

FileSystem :: {
  Type: "AWS::EFS::FileSystem"
  Properties: {
    Encrypted?: bool
    FileSystemTags?: [...__ElasticFileSystemTag]
    KmsKeyId?: string
    LifecyclePolicies?: [...__LifecyclePolicy]
    PerformanceMode?:              string
    ProvisionedThroughputInMibps?: float
    ThroughputMode?:               string
  }
  __ElasticFileSystemTag = {
    Key:   string
    Value: string
  }
  __LifecyclePolicy = {
    TransitionToIA: string
  }
}
MountTarget :: {
  Type: "AWS::EFS::MountTarget"
  Properties: {
    FileSystemId: string
    IpAddress?:   string
    SecurityGroups: [...string]
    SubnetId: string
  }
}

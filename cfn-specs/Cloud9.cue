package Cloud9

EnvironmentEC2 :: {
  Type: "AWS::Cloud9::EnvironmentEC2"
  Properties: {
    AutomaticStopTimeMinutes?: int
    Description?:              string
    InstanceType:              string
    Name?:                     string
    OwnerArn?:                 string
    Repositories?: [...__Repository]
    SubnetId?: string
  }
  __Repository = {
    PathComponent: string
    RepositoryUrl: string
  }
}

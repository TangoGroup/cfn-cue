package CodeCommit

Repository :: {
  Type: "AWS::CodeCommit::Repository"
  Properties: {
    Code?:                  __Code
    RepositoryDescription?: string
    RepositoryName:         string
    Tags?: [...__Tag]
    Triggers?: [...__RepositoryTrigger]
  }
  __Code = {
    S3: __S3
  }
  __RepositoryTrigger = {
    Branches?: [...string]
    CustomData?:    string
    DestinationArn: string
    Events: [...string]
    Name: string
  }
  __S3 = {
    Bucket:         string
    Key:            string
    ObjectVersion?: string
  }
}

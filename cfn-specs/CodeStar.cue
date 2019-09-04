package CodeStar

GitHubRepository :: {
  Type: "AWS::CodeStar::GitHubRepository"
  Properties: {
    Code?:                  __Code
    EnableIssues?:          bool
    IsPrivate?:             bool
    RepositoryAccessToken:  string
    RepositoryDescription?: string
    RepositoryName:         string
    RepositoryOwner:        string
  }
  __Code = {
    S3: __S3
  }
  __S3 = {
    Bucket:         string
    Key:            string
    ObjectVersion?: string
  }
}

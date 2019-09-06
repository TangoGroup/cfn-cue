package KMS

Alias :: {
  Type: "AWS::KMS::Alias"
  Properties: {
    AliasName:   string
    TargetKeyId: string
  }
}
Key :: {
  Type: "AWS::KMS::Key"
  Properties: {
    Description?:       string
    EnableKeyRotation?: bool
    Enabled?:           bool
    KeyPolicy: {
    }
    KeyUsage?:            string
    PendingWindowInDays?: >=7 & <=30
    PendingWindowInDays?: int
    Tags?: [...__Tag]
  }
}

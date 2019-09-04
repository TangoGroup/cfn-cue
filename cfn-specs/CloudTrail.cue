package CloudTrail

Trail :: {
  Type: "AWS::CloudTrail::Trail"
  Properties: {
    CloudWatchLogsLogGroupArn?: string
    CloudWatchLogsRoleArn?:     string
    EnableLogFileValidation?:   bool
    EventSelectors?: [...__EventSelector]
    IncludeGlobalServiceEvents?: bool
    IsLogging:                   bool
    IsMultiRegionTrail?:         bool
    KMSKeyId?:                   string
    S3BucketName:                string
    S3KeyPrefix?:                string
    SnsTopicName?:               string
    Tags?: [...__Tag]
    TrailName?: string
  }
  __DataResource = {
    Type: string
    Values?: [...string]
  }
  __EventSelector = {
    DataResources?: [...__DataResource]
    IncludeManagementEvents?: bool
    ReadWriteType?:           string
  }
}

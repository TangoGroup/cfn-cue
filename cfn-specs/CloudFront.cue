package CloudFront

CloudFrontOriginAccessIdentity :: {
  Type: "AWS::CloudFront::CloudFrontOriginAccessIdentity"
  Properties: {
    CloudFrontOriginAccessIdentityConfig: __CloudFrontOriginAccessIdentityConfig
  }
  __CloudFrontOriginAccessIdentityConfig = {
    Comment: string
  }
}
Distribution :: {
  Type: "AWS::CloudFront::Distribution"
  Properties: {
    DistributionConfig: __DistributionConfig
    Tags?: [...__Tag]
  }
  __CacheBehavior = {
    AllowedMethods?: [...string]
    CachedMethods?: [...string]
    Compress?:               bool
    DefaultTTL?:             float
    FieldLevelEncryptionId?: string
    ForwardedValues:         __ForwardedValues
    LambdaFunctionAssociations?: [...__LambdaFunctionAssociation]
    MaxTTL?:          float
    MinTTL?:          float
    PathPattern:      string
    SmoothStreaming?: bool
    TargetOriginId:   string
    TrustedSigners?: [...string]
    ViewerProtocolPolicy: string
  }
  __Cookies = {
    Forward: string
    WhitelistedNames?: [...string]
  }
  __CustomErrorResponse = {
    ErrorCachingMinTTL?: float
    ErrorCode:           int
    ResponseCode?:       int
    ResponsePagePath?:   string
  }
  __CustomOriginConfig = {
    HTTPPort?:               int
    HTTPSPort?:              int
    OriginKeepaliveTimeout?: int
    OriginProtocolPolicy:    string
    OriginReadTimeout?:      int
    OriginSSLProtocols?: [...string]
  }
  __DefaultCacheBehavior = {
    AllowedMethods?: [...string]
    CachedMethods?: [...string]
    Compress?:               bool
    DefaultTTL?:             float
    FieldLevelEncryptionId?: string
    ForwardedValues:         __ForwardedValues
    LambdaFunctionAssociations?: [...__LambdaFunctionAssociation]
    MaxTTL?:          float
    MinTTL?:          float
    SmoothStreaming?: bool
    TargetOriginId:   string
    TrustedSigners?: [...string]
    ViewerProtocolPolicy: string
  }
  __DistributionConfig = {
    Aliases?: [...string]
    CacheBehaviors?: [...__CacheBehavior]
    Comment?: string
    CustomErrorResponses?: [...__CustomErrorResponse]
    DefaultCacheBehavior: __DefaultCacheBehavior
    DefaultRootObject?:   string
    Enabled:              bool
    HttpVersion?:         string
    IPV6Enabled?:         bool
    Logging?:             __Logging
    Origins: [...__Origin]
    PriceClass?:        string
    Restrictions?:      __Restrictions
    ViewerCertificate?: __ViewerCertificate
    WebACLId?:          string
  }
  __ForwardedValues = {
    Cookies?: __Cookies
    Headers?: [...string]
    QueryString: bool
    QueryStringCacheKeys?: [...string]
  }
  __GeoRestriction = {
    Locations?: [...string]
    RestrictionType: string
  }
  __LambdaFunctionAssociation = {
    EventType?:        string
    LambdaFunctionARN: string
  }
  __Logging = {
    Bucket:          string
    IncludeCookies?: bool
    Prefix?:         string
  }
  __Origin = {
    CustomOriginConfig?: __CustomOriginConfig
    DomainName:          string
    Id:                  string
    OriginCustomHeaders?: [...__OriginCustomHeader]
    OriginPath?:     string
    S3OriginConfig?: __S3OriginConfig
  }
  __OriginCustomHeader = {
    HeaderName:  string
    HeaderValue: string
  }
  __Restrictions = {
    GeoRestriction: __GeoRestriction
  }
  __S3OriginConfig = {
    OriginAccessIdentity?: string
  }
  __ViewerCertificate = {
    AcmCertificateArn?:            string
    CloudFrontDefaultCertificate?: bool
    IamCertificateId?:             string
    MinimumProtocolVersion?:       string
    SslSupportMethod?:             string
  }
}
StreamingDistribution :: {
  Type: "AWS::CloudFront::StreamingDistribution"
  Properties: {
    StreamingDistributionConfig: __StreamingDistributionConfig
    Tags: [...__Tag]
  }
  __Logging = {
    Bucket:  string
    Enabled: bool
    Prefix:  string
  }
  __S3Origin = {
    DomainName:           string
    OriginAccessIdentity: string
  }
  __StreamingDistributionConfig = {
    Aliases?: [...string]
    Comment:        string
    Enabled:        bool
    Logging?:       __Logging
    PriceClass?:    string
    S3Origin:       __S3Origin
    TrustedSigners: __TrustedSigners
  }
  __TrustedSigners = {
    AwsAccountNumbers?: [...string]
    Enabled: bool
  }
}

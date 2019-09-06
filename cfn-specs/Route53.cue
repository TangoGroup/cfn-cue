package Route53

HealthCheck :: {
  Type: "AWS::Route53::HealthCheck"
  Properties: {
    HealthCheckConfig: __HealthCheckConfig
    HealthCheckTags?: [...__HealthCheckTag]
  }
  __AlarmIdentifier = {
    Name:   string
    Region: string
  }
  __HealthCheckConfig = {
    AlarmIdentifier?: __AlarmIdentifier
    ChildHealthChecks?: [...string]
    EnableSNI?:                    bool
    FailureThreshold?:             int
    FullyQualifiedDomainName?:     string
    HealthThreshold?:              int
    IPAddress?:                    string
    InsufficientDataHealthStatus?: "Healthy" | "LastKnownStatus" | "Unhealthy"
    InsufficientDataHealthStatus?: string
    Inverted?:                     bool
    MeasureLatency?:               bool
    Port?:                         int
    Regions?: [...string]
    RequestInterval?: int
    ResourcePath?:    string
    SearchString?:    string
    Type:             "CALCULATED" | "CLOUDWATCH_METRIC" | "HTTP_STR_MATCH" | "HTTP" | "HTTPS_STR_MATCH" | "HTTPS" | "TCP"
    Type:             string
  }
  __HealthCheckTag = {
    Key:   string
    Value: string
  }
}
HostedZone :: {
  Type: "AWS::Route53::HostedZone"
  Properties: {
    HostedZoneConfig?: __HostedZoneConfig
    HostedZoneTags?: [...__HostedZoneTag]
    Name:                string
    QueryLoggingConfig?: __QueryLoggingConfig
    VPCs?: [...__VPC]
  }
  __HostedZoneConfig = {
    Comment?: string
  }
  __HostedZoneTag = {
    Key:   string
    Value: string
  }
  __QueryLoggingConfig = {
    CloudWatchLogsLogGroupArn: string
  }
  __VPC = {
    VPCId:     string
    VPCRegion: string
  }
}
RecordSet :: {
  Type: "AWS::Route53::RecordSet"
  Properties: {
    AliasTarget?:      __AliasTarget
    Comment?:          string
    Failover?:         "PRIMARY" | "SECONDARY"
    Failover?:         string
    GeoLocation?:      __GeoLocation
    HealthCheckId?:    string
    HostedZoneId?:     string
    HostedZoneName?:   string
    MultiValueAnswer?: bool
    Name:              string
    Region?:           string
    ResourceRecords?: [...string]
    SetIdentifier?: string
    TTL?:           string
    Type:           "A" | "AAAA" | "CAA" | "CNAME" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT"
    Type:           string
    Weight?:        int
  }
  __AliasTarget = {
    DNSName:               string
    EvaluateTargetHealth?: bool
    HostedZoneId:          string
  }
  __GeoLocation = {
    ContinentCode?:   "AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA"
    ContinentCode?:   string
    CountryCode?:     string
    SubdivisionCode?: string
  }
}
RecordSetGroup :: {
  Type: "AWS::Route53::RecordSetGroup"
  Properties: {
    Comment?:        string
    HostedZoneId?:   string
    HostedZoneName?: string
    RecordSets?: [...__RecordSet]
  }
  __AliasTarget = {
    DNSName:               string
    EvaluateTargetHealth?: bool
    HostedZoneId:          string
  }
  __GeoLocation = {
    ContinentCode?:   "AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA"
    ContinentCode?:   string
    CountryCode?:     string
    SubdivisionCode?: string
  }
  __RecordSet = {
    AliasTarget?:      __AliasTarget
    Comment?:          string
    Failover?:         "PRIMARY" | "SECONDARY"
    Failover?:         string
    GeoLocation?:      __GeoLocation
    HealthCheckId?:    string
    HostedZoneId?:     string
    HostedZoneName?:   string
    MultiValueAnswer?: bool
    Name:              string
    Region?:           string
    ResourceRecords?: [...string]
    SetIdentifier?: string
    TTL?:           string
    Type:           "A" | "AAAA" | "CAA" | "CNAME" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT"
    Type:           string
    Weight?:        int
  }
}

package Route53

import "github.com/TangoGroup/fn"

HealthCheck :: {
	Type: "AWS::Route53::HealthCheck"
	Properties: {
		HealthCheckConfig: __HealthCheckConfig
		HealthCheckTags?: [...__HealthCheckTag]
	}
	__AlarmIdentifier :: {
		Name:   string | fn.Fn
		Region: string | fn.Fn
	}
	__HealthCheckConfig :: {
		AlarmIdentifier?:              __AlarmIdentifier
		ChildHealthChecks?:            [...string] | fn.Fn
		EnableSNI?:                    bool | fn.Fn
		FailureThreshold?:             int | fn.Fn
		FullyQualifiedDomainName?:     string | fn.Fn
		HealthThreshold?:              int | fn.Fn
		IPAddress?:                    string | fn.Fn
		InsufficientDataHealthStatus?: (string & ("Healthy" | "LastKnownStatus" | "Unhealthy")) | fn.Fn
		Inverted?:                     bool | fn.Fn
		MeasureLatency?:               bool | fn.Fn
		Port?:                         int | fn.Fn
		Regions?:                      [...string] | fn.Fn
		RequestInterval?:              int | fn.Fn
		ResourcePath?:                 string | fn.Fn
		SearchString?:                 string | fn.Fn
		Type:                          (string & ("CALCULATED" | "CLOUDWATCH_METRIC" | "HTTP_STR_MATCH" | "HTTP" | "HTTPS_STR_MATCH" | "HTTPS" | "TCP")) | fn.Fn
	}
	__HealthCheckTag :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
}
HostedZone :: {
	Type: "AWS::Route53::HostedZone"
	Properties: {
		HostedZoneConfig?: __HostedZoneConfig
		HostedZoneTags?: [...__HostedZoneTag]
		Name:                string | fn.Fn
		QueryLoggingConfig?: __QueryLoggingConfig
		VPCs?: [...__VPC]
	}
	__HostedZoneConfig :: {
		Comment?: string | fn.Fn
	}
	__HostedZoneTag :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	__QueryLoggingConfig :: {
		CloudWatchLogsLogGroupArn: string | fn.Fn
	}
	__VPC :: {
		VPCId:     string | fn.Fn
		VPCRegion: string | fn.Fn
	}
}
RecordSet :: {
	Type: "AWS::Route53::RecordSet"
	Properties: {
		AliasTarget?:      __AliasTarget
		Comment?:          string | fn.Fn
		Failover?:         (string & ("PRIMARY" | "SECONDARY")) | fn.Fn
		GeoLocation?:      __GeoLocation
		HealthCheckId?:    string | fn.Fn
		HostedZoneId?:     string | fn.Fn
		HostedZoneName?:   string | fn.Fn
		MultiValueAnswer?: bool | fn.Fn
		Name:              string | fn.Fn
		Region?:           string | fn.Fn
		ResourceRecords?:  [...string] | fn.Fn
		SetIdentifier?:    string | fn.Fn
		TTL?:              string | fn.Fn
		Type:              (string & ("A" | "AAAA" | "CAA" | "CNAME" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT")) | fn.Fn
		Weight?:           int | fn.Fn
	}
	__AliasTarget :: {
		DNSName:               string | fn.Fn
		EvaluateTargetHealth?: bool | fn.Fn
		HostedZoneId:          string | fn.Fn
	}
	__GeoLocation :: {
		ContinentCode?:   (string & ("AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA")) | fn.Fn
		CountryCode?:     string | fn.Fn
		SubdivisionCode?: string | fn.Fn
	}
}
RecordSetGroup :: {
	Type: "AWS::Route53::RecordSetGroup"
	Properties: {
		Comment?:        string | fn.Fn
		HostedZoneId?:   string | fn.Fn
		HostedZoneName?: string | fn.Fn
		RecordSets?: [...__RecordSet]
	}
	__AliasTarget :: {
		DNSName:               string | fn.Fn
		EvaluateTargetHealth?: bool | fn.Fn
		HostedZoneId:          string | fn.Fn
	}
	__GeoLocation :: {
		ContinentCode?:   (string & ("AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA")) | fn.Fn
		CountryCode?:     string | fn.Fn
		SubdivisionCode?: string | fn.Fn
	}
	__RecordSet :: {
		AliasTarget?:      __AliasTarget
		Comment?:          string | fn.Fn
		Failover?:         (string & ("PRIMARY" | "SECONDARY")) | fn.Fn
		GeoLocation?:      __GeoLocation
		HealthCheckId?:    string | fn.Fn
		HostedZoneId?:     string | fn.Fn
		HostedZoneName?:   string | fn.Fn
		MultiValueAnswer?: bool | fn.Fn
		Name:              string | fn.Fn
		Region?:           string | fn.Fn
		ResourceRecords?:  [...string] | fn.Fn
		SetIdentifier?:    string | fn.Fn
		TTL?:              string | fn.Fn
		Type:              (string & ("A" | "AAAA" | "CAA" | "CNAME" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT")) | fn.Fn
		Weight?:           int | fn.Fn
	}
}

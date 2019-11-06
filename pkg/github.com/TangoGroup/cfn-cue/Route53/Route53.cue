package Route53

import "github.com/TangoGroup/fn"

HealthCheck :: {
	Type: "AWS::Route53::HealthCheck"
	Properties: {
		HealthCheckConfig: propHealthCheckConfig
		HealthCheckTags?: [...propHealthCheckTag]
	}
	propAlarmIdentifier :: {
		Name:   string | fn.Fn
		Region: string | fn.Fn
	}
	propHealthCheckConfig :: {
		AlarmIdentifier?: propAlarmIdentifier
		ChildHealthChecks?: [...(string | fn.Fn)]
		EnableSNI?:                    bool | fn.Fn
		FailureThreshold?:             int | fn.Fn
		FullyQualifiedDomainName?:     string | fn.Fn
		HealthThreshold?:              int | fn.Fn
		IPAddress?:                    string | fn.Fn
		InsufficientDataHealthStatus?: (string & ("Healthy" | "LastKnownStatus" | "Unhealthy")) | fn.Fn
		Inverted?:                     bool | fn.Fn
		MeasureLatency?:               bool | fn.Fn
		Port?:                         int | fn.Fn
		Regions?: [...(string | fn.Fn)]
		RequestInterval?: int | fn.Fn
		ResourcePath?:    string | fn.Fn
		SearchString?:    string | fn.Fn
		Type:             (string & ("CALCULATED" | "CLOUDWATCH_METRIC" | "HTTP_STR_MATCH" | "HTTP" | "HTTPS_STR_MATCH" | "HTTPS" | "TCP")) | fn.Fn
	}
	propHealthCheckTag :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
}
HostedZone :: {
	Type: "AWS::Route53::HostedZone"
	Properties: {
		HostedZoneConfig?: propHostedZoneConfig
		HostedZoneTags?: [...propHostedZoneTag]
		Name:                string | fn.Fn
		QueryLoggingConfig?: propQueryLoggingConfig
		VPCs?: [...propVPC]
	}
	propHostedZoneConfig :: {
		Comment?: string | fn.Fn
	}
	propHostedZoneTag :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	propQueryLoggingConfig :: {
		CloudWatchLogsLogGroupArn: string | fn.Fn
	}
	propVPC :: {
		VPCId:     string | fn.Fn
		VPCRegion: string | fn.Fn
	}
}
RecordSet :: {
	Type: "AWS::Route53::RecordSet"
	Properties: {
		AliasTarget?:      propAliasTarget
		Comment?:          string | fn.Fn
		Failover?:         (string & ("PRIMARY" | "SECONDARY")) | fn.Fn
		GeoLocation?:      propGeoLocation
		HealthCheckId?:    string | fn.Fn
		HostedZoneId?:     string | fn.Fn
		HostedZoneName?:   string | fn.Fn
		MultiValueAnswer?: bool | fn.Fn
		Name:              string | fn.Fn
		Region?:           string | fn.Fn
		ResourceRecords?: [...(string | fn.Fn)]
		SetIdentifier?: string | fn.Fn
		TTL?:           string | fn.Fn
		Type:           (string & ("A" | "AAAA" | "CAA" | "CNAME" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT")) | fn.Fn
		Weight?:        int | fn.Fn
	}
	propAliasTarget :: {
		DNSName:               string | fn.Fn
		EvaluateTargetHealth?: bool | fn.Fn
		HostedZoneId:          string | fn.Fn
	}
	propGeoLocation :: {
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
		RecordSets?: [...propRecordSet]
	}
	propAliasTarget :: {
		DNSName:               string | fn.Fn
		EvaluateTargetHealth?: bool | fn.Fn
		HostedZoneId:          string | fn.Fn
	}
	propGeoLocation :: {
		ContinentCode?:   (string & ("AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA")) | fn.Fn
		CountryCode?:     string | fn.Fn
		SubdivisionCode?: string | fn.Fn
	}
	propRecordSet :: {
		AliasTarget?:      propAliasTarget
		Comment?:          string | fn.Fn
		Failover?:         (string & ("PRIMARY" | "SECONDARY")) | fn.Fn
		GeoLocation?:      propGeoLocation
		HealthCheckId?:    string | fn.Fn
		HostedZoneId?:     string | fn.Fn
		HostedZoneName?:   string | fn.Fn
		MultiValueAnswer?: bool | fn.Fn
		Name:              string | fn.Fn
		Region?:           string | fn.Fn
		ResourceRecords?: [...(string | fn.Fn)]
		SetIdentifier?: string | fn.Fn
		TTL?:           string | fn.Fn
		Type:           (string & ("A" | "AAAA" | "CAA" | "CNAME" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT")) | fn.Fn
		Weight?:        int | fn.Fn
	}
}

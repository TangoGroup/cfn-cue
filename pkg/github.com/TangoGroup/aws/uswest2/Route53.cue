package uswest2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Route53 :: {
	DNSSEC :: {
		Type:       "AWS::Route53::DNSSEC"
		Properties: close({
			HostedZoneId: (=~#"^[A-Z0-9]{1,32}$"#) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	HealthCheck :: {
		Type:       "AWS::Route53::HealthCheck"
		Properties: close({
			HealthCheckConfig: close({
				AlarmIdentifier?: close({
					Name:   (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
					Region: ("ap-east-1" | "ap-northeast-1" | "ap-northeast-2" | "ap-northeast-3" | "ap-south-1" | "ap-southeast-1" | "ap-southeast-2" | "ca-central-1" | "cn-north-1" | "cn-northwest-1" | "eu-central-1" | "eu-north-1" | "eu-west-1" | "eu-west-2" | "eu-west-3" | "me-south-1" | "sa-east-1" | "us-east-1" | "us-east-2" | "us-west-1" | "us-west-2") | fn.Fn
				}) | fn.If
				ChildHealthChecks?:            [...(string | fn.Fn)] | (string | fn.Fn)
				EnableSNI?:                    bool | fn.Fn
				FailureThreshold?:             (>=1 & <=10) | fn.Fn
				FullyQualifiedDomainName?:     string | fn.Fn
				HealthThreshold?:              int | fn.Fn
				IPAddress?:                    (=~#"^((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))$|^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$"#) | fn.Fn
				InsufficientDataHealthStatus?: ("Healthy" | "LastKnownStatus" | "Unhealthy") | fn.Fn
				Inverted?:                     bool | fn.Fn
				MeasureLatency?:               bool | fn.Fn
				Port?:                         (>=1 & <=65535) | fn.Fn
				Regions?:                      [...(string | fn.Fn)] | (string | fn.Fn)
				RequestInterval?:              (>=10 & <=30) | fn.Fn
				ResourcePath?:                 string | fn.Fn
				SearchString?:                 string | fn.Fn
				Type:                          ("CALCULATED" | "CLOUDWATCH_METRIC" | "HTTP" | "HTTP_STR_MATCH" | "HTTPS" | "HTTPS_STR_MATCH" | "TCP") | fn.Fn
			}) | fn.If
			HealthCheckTags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	HostedZone :: {
		Type:       "AWS::Route53::HostedZone"
		Properties: close({
			HostedZoneConfig?: close({
				Comment?: string | fn.Fn
			}) | fn.If
			HostedZoneTags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Name:                string | fn.Fn
			QueryLoggingConfig?: close({
				CloudWatchLogsLogGroupArn: string | fn.Fn
			}) | fn.If
			VPCs?: [...close({
				VPCId:     string | fn.Fn
				VPCRegion: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	KeySigningKey :: {
		Type:       "AWS::Route53::KeySigningKey"
		Properties: close({
			HostedZoneId:            (=~#"^[A-Z0-9]{1,32}$"#) | fn.Fn
			KeyManagementServiceArn: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			Name:                    (=~#"^[a-zA-Z0-9_]{3,128}$"#) | fn.Fn
			Status:                  ("ACTIVE" | "INACTIVE") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RecordSet :: {
		Type:       "AWS::Route53::RecordSet"
		Properties: close({
			AliasTarget?: close({
				DNSName:               string | fn.Fn
				EvaluateTargetHealth?: bool | fn.Fn
				HostedZoneId:          string | fn.Fn
			}) | fn.If
			Comment?:     string | fn.Fn
			Failover?:    ("PRIMARY" | "SECONDARY") | fn.Fn
			GeoLocation?: close({
				ContinentCode?:   ("AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA") | fn.Fn
				CountryCode?:     string | fn.Fn
				SubdivisionCode?: string | fn.Fn
			}) | fn.If
			HealthCheckId?:    string | fn.Fn
			HostedZoneId?:     string | fn.Fn
			HostedZoneName?:   string | fn.Fn
			MultiValueAnswer?: bool | fn.Fn
			Name:              string | fn.Fn
			Region?:           string | fn.Fn
			ResourceRecords?:  [...(string | fn.Fn)] | (string | fn.Fn)
			SetIdentifier?:    string | fn.Fn
			TTL?:              int | fn.Fn
			Type:              ("A" | "AAAA" | "CAA" | "CNAME" | "DS" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT") | fn.Fn
			Weight?:           int | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RecordSetGroup :: {
		Type:       "AWS::Route53::RecordSetGroup"
		Properties: close({
			Comment?:        string | fn.Fn
			HostedZoneId?:   string | fn.Fn
			HostedZoneName?: string | fn.Fn
			RecordSets?:     [...close({
				AliasTarget?: close({
					DNSName:               string | fn.Fn
					EvaluateTargetHealth?: bool | fn.Fn
					HostedZoneId:          string | fn.Fn
				}) | fn.If
				Comment?:     string | fn.Fn
				Failover?:    ("PRIMARY" | "SECONDARY") | fn.Fn
				GeoLocation?: close({
					ContinentCode?:   ("AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA") | fn.Fn
					CountryCode?:     string | fn.Fn
					SubdivisionCode?: string | fn.Fn
				}) | fn.If
				HealthCheckId?:    string | fn.Fn
				HostedZoneId?:     string | fn.Fn
				HostedZoneName?:   string | fn.Fn
				MultiValueAnswer?: bool | fn.Fn
				Name:              string | fn.Fn
				Region?:           string | fn.Fn
				ResourceRecords?:  [...(string | fn.Fn)] | (string | fn.Fn)
				SetIdentifier?:    string | fn.Fn
				TTL?:              string | fn.Fn
				Type:              ("A" | "AAAA" | "CAA" | "CNAME" | "DS" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT") | fn.Fn
				Weight?:           int | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package apnortheast3

import "github.com/TangoGroup/aws/fn"

ServiceDiscovery :: {
	HttpNamespace :: {
		Type: "AWS::ServiceDiscovery::HttpNamespace"
		Properties: {
			Description?: string | fn.Fn
			Name:         string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Instance :: {
		Type: "AWS::ServiceDiscovery::Instance"
		Properties: {
			InstanceAttributes: [string]: string | fn.Fn
			InstanceId?: string | fn.Fn
			ServiceId:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PrivateDnsNamespace :: {
		Type: "AWS::ServiceDiscovery::PrivateDnsNamespace"
		Properties: {
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			Vpc:          string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PublicDnsNamespace :: {
		Type: "AWS::ServiceDiscovery::PublicDnsNamespace"
		Properties: {
			Description?: string | fn.Fn
			Name:         string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Service :: {
		Type: "AWS::ServiceDiscovery::Service"
		Properties: {
			Description?: string | fn.Fn
			DnsConfig?: {
				DnsRecords: [...{
					TTL:  number | fn.Fn
					Type: ("A" | "AAAA" | "SRV" | "CNAME") | fn.Fn
				}]
				NamespaceId?:   string | fn.Fn
				RoutingPolicy?: string | fn.Fn
			}
			HealthCheckConfig?: {
				FailureThreshold?: number | fn.Fn
				ResourcePath?:     string | fn.Fn
				Type:              ("HTTP" | "HTTPS" | "TCP") | fn.Fn
			}
			HealthCheckCustomConfig?: FailureThreshold?: number | fn.Fn
			Name?:        string | fn.Fn
			NamespaceId?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

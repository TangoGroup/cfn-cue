package euwest1

import "github.com/TangoGroup/aws/fn"

ServiceDiscovery :: {
	HttpNamespace :: {
		Type:       "AWS::ServiceDiscovery::HttpNamespace"
		Properties: close({
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			Tags?:        [...close({
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
	Instance :: {
		Type:       "AWS::ServiceDiscovery::Instance"
		Properties: close({
			InstanceAttributes: {
				[string]: string | fn.Fn
			} | fn.If
			InstanceId?: string | fn.Fn
			ServiceId:   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PrivateDnsNamespace :: {
		Type:       "AWS::ServiceDiscovery::PrivateDnsNamespace"
		Properties: close({
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			Tags?:        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Vpc: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PublicDnsNamespace :: {
		Type:       "AWS::ServiceDiscovery::PublicDnsNamespace"
		Properties: close({
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			Tags?:        [...close({
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
	Service :: {
		Type:       "AWS::ServiceDiscovery::Service"
		Properties: close({
			Description?: string | fn.Fn
			DnsConfig?:   close({
				DnsRecords: [...close({
					TTL:  number | fn.Fn
					Type: ("A" | "AAAA" | "SRV" | "CNAME") | fn.Fn
				})] | fn.If
				NamespaceId?:   string | fn.Fn
				RoutingPolicy?: string | fn.Fn
			}) | fn.If
			HealthCheckConfig?: close({
				FailureThreshold?: number | fn.Fn
				ResourcePath?:     string | fn.Fn
				Type:              ("HTTP" | "HTTPS" | "TCP") | fn.Fn
			}) | fn.If
			HealthCheckCustomConfig?: close({
				FailureThreshold?: number | fn.Fn
			}) | fn.If
			Name?:        string | fn.Fn
			NamespaceId?: string | fn.Fn
			Tags?:        [...close({
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
}

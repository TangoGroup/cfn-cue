package saeast1

import "github.com/TangoGroup/aws/fn"

#ServiceDiscovery: {
	#HttpNamespace: {
		Type:       "AWS::ServiceDiscovery::HttpNamespace"
		Properties: close({
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Tags?:        [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Instance: {
		Type:       "AWS::ServiceDiscovery::Instance"
		Properties: close({
			InstanceAttributes: {
				[string]: _
			} | fn.#Fn
			InstanceId?: string | fn.#Fn
			ServiceId:   string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PrivateDnsNamespace: {
		Type:       "AWS::ServiceDiscovery::PrivateDnsNamespace"
		Properties: close({
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Tags?:        [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			Vpc: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PublicDnsNamespace: {
		Type:       "AWS::ServiceDiscovery::PublicDnsNamespace"
		Properties: close({
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Tags?:        [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Service: {
		Type:       "AWS::ServiceDiscovery::Service"
		Properties: close({
			Description?:             string | fn.#Fn
			DnsConfig?:               close({}) | fn.If
			HealthCheckConfig?:       close({}) | fn.If
			HealthCheckCustomConfig?: close({}) | fn.If
			Name?:                    string | fn.#Fn
			NamespaceId?:             string | fn.#Fn
			Tags?:                    [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package apeast1

import "github.com/TangoGroup/aws/fn"

ElasticLoadBalancing :: {
	LoadBalancer :: {
		Type: "AWS::ElasticLoadBalancing::LoadBalancer"
		Properties: {
			AccessLoggingPolicy?: {
				EmitInterval?:   int | fn.Fn
				Enabled:         bool | fn.Fn
				S3BucketName:    string | fn.Fn
				S3BucketPrefix?: string | fn.Fn
			}
			AppCookieStickinessPolicy?: [...{
				CookieName: string | fn.Fn
				PolicyName: string | fn.Fn
			}]
			AvailabilityZones?: [...(string | fn.Fn)] | fn.Fn
			ConnectionDrainingPolicy?: {
				Enabled:  bool | fn.Fn
				Timeout?: int | fn.Fn
			}
			ConnectionSettings?: IdleTimeout: int | fn.Fn
			CrossZone?: bool | fn.Fn
			HealthCheck?: {
				HealthyThreshold:   string | fn.Fn
				Interval:           string | fn.Fn
				Target:             string | fn.Fn
				Timeout:            string | fn.Fn
				UnhealthyThreshold: string | fn.Fn
			}
			Instances?: [...(string | fn.Fn)] | fn.Fn
			LBCookieStickinessPolicy?: [...{
				CookieExpirationPeriod?: string | fn.Fn
				PolicyName?:             string | fn.Fn
			}]
			Listeners: [...{
				InstancePort:      (>=1 & <=65535) | fn.Fn
				InstanceProtocol?: string | fn.Fn
				LoadBalancerPort:  (>=1 & <=65535) | fn.Fn
				PolicyNames?:      [...(string | fn.Fn)] | fn.Fn
				Protocol:          string | fn.Fn
				SSLCertificateId?: string | fn.Fn
			}]
			LoadBalancerName?: string | fn.Fn
			Policies?: [...{
				Attributes: [...({
					[string]: _
				} | fn.Fn)] | fn.Fn
				InstancePorts?:     [...(string | fn.Fn)] | fn.Fn
				LoadBalancerPorts?: [...(string | fn.Fn)] | fn.Fn
				PolicyName:         string | fn.Fn
				PolicyType:         string | fn.Fn
			}]
			Scheme?:         string | fn.Fn
			SecurityGroups?: [...(string | fn.Fn)] | fn.Fn
			Subnets?:        [...(string | fn.Fn)] | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

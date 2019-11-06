package ElasticLoadBalancing

import "github.com/TangoGroup/fn"

LoadBalancer :: {
	Type: "AWS::ElasticLoadBalancing::LoadBalancer"
	Properties: {
		AccessLoggingPolicy?: propAccessLoggingPolicy
		AppCookieStickinessPolicy?: [...propAppCookieStickinessPolicy]
		AvailabilityZones?:        [...string] | fn.Fn
		ConnectionDrainingPolicy?: propConnectionDrainingPolicy
		ConnectionSettings?:       propConnectionSettings
		CrossZone?:                bool | fn.Fn
		HealthCheck?:              propHealthCheck
		Instances?:                [...string] | fn.Fn
		LBCookieStickinessPolicy?: [...propLBCookieStickinessPolicy]
		Listeners: [...propListeners]
		LoadBalancerName?: string | fn.Fn
		Policies?: [...propPolicies]
		Scheme?:         string | fn.Fn
		SecurityGroups?: [...string] | fn.Fn
		Subnets?:        [...string] | fn.Fn
		Tags?: [...propTag]
	}
	propAccessLoggingPolicy :: {
		EmitInterval?:   int | fn.Fn
		Enabled:         bool | fn.Fn
		S3BucketName:    string | fn.Fn
		S3BucketPrefix?: string | fn.Fn
	}
	propAppCookieStickinessPolicy :: {
		CookieName: string | fn.Fn
		PolicyName: string | fn.Fn
	}
	propConnectionDrainingPolicy :: {
		Enabled:  bool | fn.Fn
		Timeout?: int | fn.Fn
	}
	propConnectionSettings :: {
		IdleTimeout: int | fn.Fn
	}
	propHealthCheck :: {
		HealthyThreshold:   string | fn.Fn
		Interval:           string | fn.Fn
		Target:             string | fn.Fn
		Timeout:            string | fn.Fn
		UnhealthyThreshold: string | fn.Fn
	}
	propLBCookieStickinessPolicy :: {
		CookieExpirationPeriod?: string | fn.Fn
		PolicyName?:             string | fn.Fn
	}
	propListeners :: {
		InstancePort:      (string & (>=1 & <=65535)) | fn.Fn
		InstanceProtocol?: string | fn.Fn
		LoadBalancerPort:  (string & (>=1 & <=65535)) | fn.Fn
		PolicyNames?:      [...string] | fn.Fn
		Protocol:          string | fn.Fn
		SSLCertificateId?: string | fn.Fn
	}
	propPolicies :: {
		Attributes: [...{
		}] | fn.Fn
		InstancePorts?:     [...string] | fn.Fn
		LoadBalancerPorts?: [...string] | fn.Fn
		PolicyName:         string | fn.Fn
		PolicyType:         string | fn.Fn
	}
}

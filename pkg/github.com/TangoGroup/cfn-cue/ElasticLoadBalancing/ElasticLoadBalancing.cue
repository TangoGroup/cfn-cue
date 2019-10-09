package ElasticLoadBalancing

import "github.com/TangoGroup/fn"

LoadBalancer :: {
	Type: "AWS::ElasticLoadBalancing::LoadBalancer"
	Properties: {
		AccessLoggingPolicy?: __AccessLoggingPolicy
		AppCookieStickinessPolicy?: [...__AppCookieStickinessPolicy]
		AvailabilityZones?:        [...string] | fn.Fn
		ConnectionDrainingPolicy?: __ConnectionDrainingPolicy
		ConnectionSettings?:       __ConnectionSettings
		CrossZone?:                bool | fn.Fn
		HealthCheck?:              __HealthCheck
		Instances?:                [...string] | fn.Fn
		LBCookieStickinessPolicy?: [...__LBCookieStickinessPolicy]
		Listeners: [...__Listeners]
		LoadBalancerName?: string | fn.Fn
		Policies?: [...__Policies]
		Scheme?:         string | fn.Fn
		SecurityGroups?: [...string] | fn.Fn
		Subnets?:        [...string] | fn.Fn
		Tags?: [...__Tag]
	}
	__AccessLoggingPolicy :: {
		EmitInterval?:   int | fn.Fn
		Enabled:         bool | fn.Fn
		S3BucketName:    string | fn.Fn
		S3BucketPrefix?: string | fn.Fn
	}
	__AppCookieStickinessPolicy :: {
		CookieName: string | fn.Fn
		PolicyName: string | fn.Fn
	}
	__ConnectionDrainingPolicy :: {
		Enabled:  bool | fn.Fn
		Timeout?: int | fn.Fn
	}
	__ConnectionSettings :: {
		IdleTimeout: int | fn.Fn
	}
	__HealthCheck :: {
		HealthyThreshold:   string | fn.Fn
		Interval:           string | fn.Fn
		Target:             string | fn.Fn
		Timeout:            string | fn.Fn
		UnhealthyThreshold: string | fn.Fn
	}
	__LBCookieStickinessPolicy :: {
		CookieExpirationPeriod?: string | fn.Fn
		PolicyName?:             string | fn.Fn
	}
	__Listeners :: {
		InstancePort:      (string & (>=1 & <=65535)) | fn.Fn
		InstanceProtocol?: string | fn.Fn
		LoadBalancerPort:  (string & (>=1 & <=65535)) | fn.Fn
		PolicyNames?:      [...string] | fn.Fn
		Protocol:          string | fn.Fn
		SSLCertificateId?: string | fn.Fn
	}
	__Policies :: {
		Attributes: [...{
		}] | fn.Fn
		InstancePorts?:     [...string] | fn.Fn
		LoadBalancerPorts?: [...string] | fn.Fn
		PolicyName:         string | fn.Fn
		PolicyType:         string | fn.Fn
	}
}

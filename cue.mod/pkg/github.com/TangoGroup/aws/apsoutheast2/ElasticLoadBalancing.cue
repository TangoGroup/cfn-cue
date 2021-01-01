package apsoutheast2

import "github.com/TangoGroup/aws/fn"

#ElasticLoadBalancing: {
	#LoadBalancer: {
		Type:       "AWS::ElasticLoadBalancing::LoadBalancer"
		Properties: close({
			AccessLoggingPolicy?: close({
				EmitInterval?:   int | fn.#Fn
				Enabled:         bool | fn.#Fn
				S3BucketName:    string | fn.#Fn
				S3BucketPrefix?: string | fn.#Fn
			}) | fn.If
			AppCookieStickinessPolicy?: [...close({
				CookieName: string | fn.#Fn
				PolicyName: string | fn.#Fn
			})] | fn.If
			AvailabilityZones?:        [...(("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn)] | (("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.#Fn)
			ConnectionDrainingPolicy?: close({
				Enabled:  bool | fn.#Fn
				Timeout?: int | fn.#Fn
			}) | fn.If
			ConnectionSettings?: close({
				IdleTimeout: int | fn.#Fn
			}) | fn.If
			CrossZone?:   bool | fn.#Fn
			HealthCheck?: close({
				HealthyThreshold:   string | fn.#Fn
				Interval:           string | fn.#Fn
				Target:             string | fn.#Fn
				Timeout:            string | fn.#Fn
				UnhealthyThreshold: string | fn.#Fn
			}) | fn.If
			Instances?:                [...(string | fn.#Fn)] | (string | fn.#Fn)
			LBCookieStickinessPolicy?: [...close({
				CookieExpirationPeriod?: string | fn.#Fn
				PolicyName?:             string | fn.#Fn
			})] | fn.If
			Listeners: [...close({
				InstancePort:      (>=1 & <=65535) | fn.#Fn
				InstanceProtocol?: string | fn.#Fn
				LoadBalancerPort:  (>=1 & <=65535) | fn.#Fn
				PolicyNames?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
				Protocol:          string | fn.#Fn
				SSLCertificateId?: string | fn.#Fn
			})] | fn.If
			LoadBalancerName?: string | fn.#Fn
			Policies?:         [...close({
				Attributes: [...({
					[string]: _
				} | fn.#Fn)] | ({
					[string]: _
				} | fn.#Fn)
				InstancePorts?:     [...(string | fn.#Fn)] | (string | fn.#Fn)
				LoadBalancerPorts?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				PolicyName:         string | fn.#Fn
				PolicyType:         string | fn.#Fn
			})] | fn.If
			Scheme?:         string | fn.#Fn
			SecurityGroups?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Subnets?:        [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:           [...close({
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

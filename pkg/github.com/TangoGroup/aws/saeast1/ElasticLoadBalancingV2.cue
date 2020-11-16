package saeast1

import "github.com/TangoGroup/aws/fn"

ElasticLoadBalancingV2 :: {
	Listener :: {
		Type:       "AWS::ElasticLoadBalancingV2::Listener"
		Properties: close({
			AlpnPolicy?:   [...(string | fn.Fn)] | (string | fn.Fn)
			Certificates?: [...close({
				CertificateArn?: string | fn.Fn
			})] | fn.If
			DefaultActions: [...close({
				AuthenticateCognitoConfig?: close({
					AuthenticationRequestExtraParams?: {
						[string]: string | fn.Fn
					} | fn.If
					OnUnauthenticatedRequest?: string | fn.Fn
					Scope?:                    string | fn.Fn
					SessionCookieName?:        string | fn.Fn
					SessionTimeout?:           string | fn.Fn
					UserPoolArn:               string | fn.Fn
					UserPoolClientId:          string | fn.Fn
					UserPoolDomain:            string | fn.Fn
				}) | fn.If
				AuthenticateOidcConfig?: close({
					AuthenticationRequestExtraParams?: {
						[string]: string | fn.Fn
					} | fn.If
					AuthorizationEndpoint:     string | fn.Fn
					ClientId:                  string | fn.Fn
					ClientSecret:              string | fn.Fn
					Issuer:                    string | fn.Fn
					OnUnauthenticatedRequest?: string | fn.Fn
					Scope?:                    string | fn.Fn
					SessionCookieName?:        string | fn.Fn
					SessionTimeout?:           string | fn.Fn
					TokenEndpoint:             string | fn.Fn
					UserInfoEndpoint:          string | fn.Fn
				}) | fn.If
				FixedResponseConfig?: close({
					ContentType?: string | fn.Fn
					MessageBody?: string | fn.Fn
					StatusCode:   string | fn.Fn
				}) | fn.If
				ForwardConfig?: close({
					TargetGroupStickinessConfig?: close({
						DurationSeconds?: int | fn.Fn
						Enabled?:         bool | fn.Fn
					}) | fn.If
					TargetGroups?: [...close({
						TargetGroupArn?: string | fn.Fn
						Weight?:         int | fn.Fn
					})] | fn.If
				}) | fn.If
				Order?:          int | fn.Fn
				RedirectConfig?: close({
					Host?:      string | fn.Fn
					Path?:      string | fn.Fn
					Port?:      string | fn.Fn
					Protocol?:  string | fn.Fn
					Query?:     string | fn.Fn
					StatusCode: string | fn.Fn
				}) | fn.If
				TargetGroupArn?: string | fn.Fn
				Type:            string | fn.Fn
			})] | fn.If
			LoadBalancerArn: string | fn.Fn
			Port?:           (>=1 & <=65535) | fn.Fn
			Protocol?:       string | fn.Fn
			SslPolicy?:      string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ListenerCertificate :: {
		Type:       "AWS::ElasticLoadBalancingV2::ListenerCertificate"
		Properties: close({
			Certificates: [...close({
				CertificateArn?: string | fn.Fn
			})] | fn.If
			ListenerArn: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ListenerRule :: {
		Type:       "AWS::ElasticLoadBalancingV2::ListenerRule"
		Properties: close({
			Actions: [...close({
				AuthenticateCognitoConfig?: close({
					AuthenticationRequestExtraParams?: {
						[string]: string | fn.Fn
					} | fn.If
					OnUnauthenticatedRequest?: string | fn.Fn
					Scope?:                    string | fn.Fn
					SessionCookieName?:        string | fn.Fn
					SessionTimeout?:           int | fn.Fn
					UserPoolArn:               string | fn.Fn
					UserPoolClientId:          string | fn.Fn
					UserPoolDomain:            string | fn.Fn
				}) | fn.If
				AuthenticateOidcConfig?: close({
					AuthenticationRequestExtraParams?: {
						[string]: string | fn.Fn
					} | fn.If
					AuthorizationEndpoint:     string | fn.Fn
					ClientId:                  string | fn.Fn
					ClientSecret:              string | fn.Fn
					Issuer:                    string | fn.Fn
					OnUnauthenticatedRequest?: string | fn.Fn
					Scope?:                    string | fn.Fn
					SessionCookieName?:        string | fn.Fn
					SessionTimeout?:           int | fn.Fn
					TokenEndpoint:             string | fn.Fn
					UserInfoEndpoint:          string | fn.Fn
				}) | fn.If
				FixedResponseConfig?: close({
					ContentType?: string | fn.Fn
					MessageBody?: string | fn.Fn
					StatusCode:   string | fn.Fn
				}) | fn.If
				ForwardConfig?: close({
					TargetGroupStickinessConfig?: close({
						DurationSeconds?: int | fn.Fn
						Enabled?:         bool | fn.Fn
					}) | fn.If
					TargetGroups?: [...close({
						TargetGroupArn?: string | fn.Fn
						Weight?:         int | fn.Fn
					})] | fn.If
				}) | fn.If
				Order?:          int | fn.Fn
				RedirectConfig?: close({
					Host?:      string | fn.Fn
					Path?:      string | fn.Fn
					Port?:      string | fn.Fn
					Protocol?:  string | fn.Fn
					Query?:     string | fn.Fn
					StatusCode: string | fn.Fn
				}) | fn.If
				TargetGroupArn?: string | fn.Fn
				Type:            string | fn.Fn
			})] | fn.If
			Conditions: [...close({
				Field?:            string | fn.Fn
				HostHeaderConfig?: close({
					Values?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				HttpHeaderConfig?: close({
					HttpHeaderName?: string | fn.Fn
					Values?:         [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				HttpRequestMethodConfig?: close({
					Values?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				PathPatternConfig?: close({
					Values?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				QueryStringConfig?: close({
					Values?: [...close({
						Key?:   string | fn.Fn
						Value?: string | fn.Fn
					})] | fn.If
				}) | fn.If
				SourceIpConfig?: close({
					Values?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				Values?: [...(string | fn.Fn)] | (string | fn.Fn)
			})] | fn.If
			ListenerArn: string | fn.Fn
			Priority:    (>=1 & <=50000) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LoadBalancer :: {
		Type:       "AWS::ElasticLoadBalancingV2::LoadBalancer"
		Properties: close({
			IpAddressType?:          string | fn.Fn
			LoadBalancerAttributes?: [...close({
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
			Name?:           string | fn.Fn
			Scheme?:         string | fn.Fn
			SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
			SubnetMappings?: [...close({
				AllocationId?:       string | fn.Fn
				IPv6Address?:        string | fn.Fn
				PrivateIPv4Address?: string | fn.Fn
				SubnetId:            string | fn.Fn
			})] | fn.If
			Subnets?: [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:    [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TargetGroup :: {
		Type:       "AWS::ElasticLoadBalancingV2::TargetGroup"
		Properties: close({
			HealthCheckEnabled?:         bool | fn.Fn
			HealthCheckIntervalSeconds?: (>=5 & <=300) | fn.Fn
			HealthCheckPath?:            string | fn.Fn
			HealthCheckPort?:            string | fn.Fn
			HealthCheckProtocol?:        string | fn.Fn
			HealthCheckTimeoutSeconds?:  (>=2 & <=120) | fn.Fn
			HealthyThresholdCount?:      (>=2 & <=10) | fn.Fn
			Matcher?:                    close({
				HttpCode?: string | fn.Fn
			}) | fn.If
			Name?:     string | fn.Fn
			Port?:     int | fn.Fn
			Protocol?: string | fn.Fn
			Tags?:     [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TargetGroupAttributes?: [...close({
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
			TargetType?: string | fn.Fn
			Targets?:    [...close({
				AvailabilityZone?: ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.Fn
				Id:                string | fn.Fn
				Port?:             int | fn.Fn
			})] | fn.If
			UnhealthyThresholdCount?: (>=2 & <=10) | fn.Fn
			VpcId?:                   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package uswest1

import "github.com/TangoGroup/aws/fn"

ElasticLoadBalancingV2 :: {
	Listener :: {
		Type: "AWS::ElasticLoadBalancingV2::Listener"
		Properties: {
			Certificates?: [...{
				CertificateArn?: string | fn.Fn
			}]
			DefaultActions: [...{
				AuthenticateCognitoConfig?: {
					AuthenticationRequestExtraParams?: [string]: string | fn.Fn
					OnUnauthenticatedRequest?: string | fn.Fn
					Scope?:                    string | fn.Fn
					SessionCookieName?:        string | fn.Fn
					SessionTimeout?:           int | fn.Fn
					UserPoolArn:               string | fn.Fn
					UserPoolClientId:          string | fn.Fn
					UserPoolDomain:            string | fn.Fn
				}
				AuthenticateOidcConfig?: {
					AuthenticationRequestExtraParams?: [string]: string | fn.Fn
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
				}
				FixedResponseConfig?: {
					ContentType?: string | fn.Fn
					MessageBody?: string | fn.Fn
					StatusCode:   string | fn.Fn
				}
				Order?: int | fn.Fn
				RedirectConfig?: {
					Host?:      string | fn.Fn
					Path?:      string | fn.Fn
					Port?:      string | fn.Fn
					Protocol?:  string | fn.Fn
					Query?:     string | fn.Fn
					StatusCode: string | fn.Fn
				}
				TargetGroupArn?: string | fn.Fn
				Type:            string | fn.Fn
			}]
			LoadBalancerArn: string | fn.Fn
			Port:            (int & (>=1 & <=65535)) | fn.Fn
			Protocol:        string | fn.Fn
			SslPolicy?:      string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ListenerCertificate :: {
		Type: "AWS::ElasticLoadBalancingV2::ListenerCertificate"
		Properties: {
			Certificates: [...{
				CertificateArn?: string | fn.Fn
			}]
			ListenerArn: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ListenerRule :: {
		Type: "AWS::ElasticLoadBalancingV2::ListenerRule"
		Properties: {
			Actions: [...{
				AuthenticateCognitoConfig?: {
					AuthenticationRequestExtraParams?: [string]: string | fn.Fn
					OnUnauthenticatedRequest?: string | fn.Fn
					Scope?:                    string | fn.Fn
					SessionCookieName?:        string | fn.Fn
					SessionTimeout?:           int | fn.Fn
					UserPoolArn:               string | fn.Fn
					UserPoolClientId:          string | fn.Fn
					UserPoolDomain:            string | fn.Fn
				}
				AuthenticateOidcConfig?: {
					AuthenticationRequestExtraParams?: [string]: string | fn.Fn
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
				}
				FixedResponseConfig?: {
					ContentType?: string | fn.Fn
					MessageBody?: string | fn.Fn
					StatusCode:   string | fn.Fn
				}
				Order?: int | fn.Fn
				RedirectConfig?: {
					Host?:      string | fn.Fn
					Path?:      string | fn.Fn
					Port?:      string | fn.Fn
					Protocol?:  string | fn.Fn
					Query?:     string | fn.Fn
					StatusCode: string | fn.Fn
				}
				TargetGroupArn?: string | fn.Fn
				Type:            string | fn.Fn
			}]
			Conditions: [...{
				Field?: string | fn.Fn
				HostHeaderConfig?: Values?: [...(string | fn.Fn)]
				HttpHeaderConfig?: {
					HttpHeaderName?: string | fn.Fn
					Values?: [...(string | fn.Fn)]
				}
				HttpRequestMethodConfig?: Values?: [...(string | fn.Fn)]
				PathPatternConfig?: Values?: [...(string | fn.Fn)]
				QueryStringConfig?: Values?: [...{
					Key?:   string | fn.Fn
					Value?: string | fn.Fn
				}]
				SourceIpConfig?: Values?: [...(string | fn.Fn)]
				Values?: [...(string | fn.Fn)]
			}]
			ListenerArn: string | fn.Fn
			Priority:    int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LoadBalancer :: {
		Type: "AWS::ElasticLoadBalancingV2::LoadBalancer"
		Properties: {
			IpAddressType?: string | fn.Fn
			LoadBalancerAttributes?: [...{
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			}]
			Name?:   string | fn.Fn
			Scheme?: string | fn.Fn
			SecurityGroups?: [...(string | fn.Fn)]
			SubnetMappings?: [...{
				AllocationId: string | fn.Fn
				SubnetId:     string | fn.Fn
			}]
			Subnets?: [...(string | fn.Fn)]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Type?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	TargetGroup :: {
		Type: "AWS::ElasticLoadBalancingV2::TargetGroup"
		Properties: {
			HealthCheckEnabled?:         bool | fn.Fn
			HealthCheckIntervalSeconds?: (int & (>=5 & <=300)) | fn.Fn
			HealthCheckPath?:            string | fn.Fn
			HealthCheckPort?:            string | fn.Fn
			HealthCheckProtocol?:        string | fn.Fn
			HealthCheckTimeoutSeconds?:  (int & (>=2 & <=120)) | fn.Fn
			HealthyThresholdCount?:      (int & (>=2 & <=10)) | fn.Fn
			Matcher?: HttpCode: string | fn.Fn
			Name?:     string | fn.Fn
			Port?:     int | fn.Fn
			Protocol?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TargetGroupAttributes?: [...{
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			}]
			TargetType?: string | fn.Fn
			Targets?: [...{
				AvailabilityZone?: string | fn.Fn
				Id:                string | fn.Fn
				Port?:             int | fn.Fn
			}]
			UnhealthyThresholdCount?: (int & (>=2 & <=10)) | fn.Fn
			VpcId?:                   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

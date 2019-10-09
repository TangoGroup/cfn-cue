package ElasticLoadBalancingV2

import "github.com/TangoGroup/fn"

Listener :: {
	Type: "AWS::ElasticLoadBalancingV2::Listener"
	Properties: {
		Certificates?: [...__Certificate]
		DefaultActions: [...__Action]
		LoadBalancerArn: string | fn.Fn
		Port:            (int & (>=1 & <=65535)) | fn.Fn
		Protocol:        string | fn.Fn
		SslPolicy?:      string | fn.Fn
	}
	__Action :: {
		AuthenticateCognitoConfig?: __AuthenticateCognitoConfig
		AuthenticateOidcConfig?:    __AuthenticateOidcConfig
		FixedResponseConfig?:       __FixedResponseConfig
		Order?:                     int | fn.Fn
		RedirectConfig?:            __RedirectConfig
		TargetGroupArn?:            string | fn.Fn
		Type:                       string | fn.Fn
	}
	__AuthenticateCognitoConfig :: {
		AuthenticationRequestExtraParams?: {
		}
		OnUnauthenticatedRequest?: string | fn.Fn
		Scope?:                    string | fn.Fn
		SessionCookieName?:        string | fn.Fn
		SessionTimeout?:           int | fn.Fn
		UserPoolArn:               string | fn.Fn
		UserPoolClientId:          string | fn.Fn
		UserPoolDomain:            string | fn.Fn
	}
	__AuthenticateOidcConfig :: {
		AuthenticationRequestExtraParams?: {
		}
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
	__Certificate :: {
		CertificateArn?: string | fn.Fn
	}
	__FixedResponseConfig :: {
		ContentType?: string | fn.Fn
		MessageBody?: string | fn.Fn
		StatusCode:   string | fn.Fn
	}
	__RedirectConfig :: {
		Host?:      string | fn.Fn
		Path?:      string | fn.Fn
		Port?:      string | fn.Fn
		Protocol?:  string | fn.Fn
		Query?:     string | fn.Fn
		StatusCode: string | fn.Fn
	}
}
ListenerCertificate :: {
	Type: "AWS::ElasticLoadBalancingV2::ListenerCertificate"
	Properties: {
		Certificates: [...__Certificate]
		ListenerArn: string | fn.Fn
	}
	__Certificate :: {
		CertificateArn?: string | fn.Fn
	}
}
ListenerRule :: {
	Type: "AWS::ElasticLoadBalancingV2::ListenerRule"
	Properties: {
		Actions: [...__Action]
		Conditions: [...__RuleCondition]
		ListenerArn: string | fn.Fn
		Priority:    int | fn.Fn
	}
	__Action :: {
		AuthenticateCognitoConfig?: __AuthenticateCognitoConfig
		AuthenticateOidcConfig?:    __AuthenticateOidcConfig
		FixedResponseConfig?:       __FixedResponseConfig
		Order?:                     int | fn.Fn
		RedirectConfig?:            __RedirectConfig
		TargetGroupArn?:            string | fn.Fn
		Type:                       string | fn.Fn
	}
	__AuthenticateCognitoConfig :: {
		AuthenticationRequestExtraParams?: {
		}
		OnUnauthenticatedRequest?: string | fn.Fn
		Scope?:                    string | fn.Fn
		SessionCookieName?:        string | fn.Fn
		SessionTimeout?:           int | fn.Fn
		UserPoolArn:               string | fn.Fn
		UserPoolClientId:          string | fn.Fn
		UserPoolDomain:            string | fn.Fn
	}
	__AuthenticateOidcConfig :: {
		AuthenticationRequestExtraParams?: {
		}
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
	__FixedResponseConfig :: {
		ContentType?: string | fn.Fn
		MessageBody?: string | fn.Fn
		StatusCode:   string | fn.Fn
	}
	__HostHeaderConfig :: {
		Values?: [...string] | fn.Fn
	}
	__HttpHeaderConfig :: {
		HttpHeaderName?: string | fn.Fn
		Values?:         [...string] | fn.Fn
	}
	__HttpRequestMethodConfig :: {
		Values?: [...string] | fn.Fn
	}
	__PathPatternConfig :: {
		Values?: [...string] | fn.Fn
	}
	__QueryStringConfig :: {
		Values?: [...__QueryStringKeyValue]
	}
	__QueryStringKeyValue :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
	__RedirectConfig :: {
		Host?:      string | fn.Fn
		Path?:      string | fn.Fn
		Port?:      string | fn.Fn
		Protocol?:  string | fn.Fn
		Query?:     string | fn.Fn
		StatusCode: string | fn.Fn
	}
	__RuleCondition :: {
		Field?:                   string | fn.Fn
		HostHeaderConfig?:        __HostHeaderConfig
		HttpHeaderConfig?:        __HttpHeaderConfig
		HttpRequestMethodConfig?: __HttpRequestMethodConfig
		PathPatternConfig?:       __PathPatternConfig
		QueryStringConfig?:       __QueryStringConfig
		SourceIpConfig?:          __SourceIpConfig
		Values?:                  [...string] | fn.Fn
	}
	__SourceIpConfig :: {
		Values?: [...string] | fn.Fn
	}
}
LoadBalancer :: {
	Type: "AWS::ElasticLoadBalancingV2::LoadBalancer"
	Properties: {
		IpAddressType?: string | fn.Fn
		LoadBalancerAttributes?: [...__LoadBalancerAttribute]
		Name?:           string | fn.Fn
		Scheme?:         string | fn.Fn
		SecurityGroups?: [...string] | fn.Fn
		SubnetMappings?: [...__SubnetMapping]
		Subnets?: [...string] | fn.Fn
		Tags?: [...__Tag]
		Type?: string | fn.Fn
	}
	__LoadBalancerAttribute :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
	__SubnetMapping :: {
		AllocationId: string | fn.Fn
		SubnetId:     string | fn.Fn
	}
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
		Matcher?:                    __Matcher
		Name?:                       string | fn.Fn
		Port?:                       int | fn.Fn
		Protocol?:                   string | fn.Fn
		Tags?: [...__Tag]
		TargetGroupAttributes?: [...__TargetGroupAttribute]
		TargetType?: string | fn.Fn
		Targets?: [...__TargetDescription]
		UnhealthyThresholdCount?: (int & (>=2 & <=10)) | fn.Fn
		VpcId?:                   string | fn.Fn
	}
	__Matcher :: {
		HttpCode: string | fn.Fn
	}
	__TargetDescription :: {
		AvailabilityZone?: string | fn.Fn
		Id:                string | fn.Fn
		Port?:             int | fn.Fn
	}
	__TargetGroupAttribute :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
}

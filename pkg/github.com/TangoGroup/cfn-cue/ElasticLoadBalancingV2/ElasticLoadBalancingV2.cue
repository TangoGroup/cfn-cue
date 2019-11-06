package ElasticLoadBalancingV2

import "github.com/TangoGroup/fn"

Listener :: {
	Type: "AWS::ElasticLoadBalancingV2::Listener"
	Properties: {
		Certificates?: [...propCertificate]
		DefaultActions: [...propAction]
		LoadBalancerArn: string | fn.Fn
		Port:            (int & (>=1 & <=65535)) | fn.Fn
		Protocol:        string | fn.Fn
		SslPolicy?:      string | fn.Fn
	}
	propAction :: {
		AuthenticateCognitoConfig?: propAuthenticateCognitoConfig
		AuthenticateOidcConfig?:    propAuthenticateOidcConfig
		FixedResponseConfig?:       propFixedResponseConfig
		Order?:                     int | fn.Fn
		RedirectConfig?:            propRedirectConfig
		TargetGroupArn?:            string | fn.Fn
		Type:                       string | fn.Fn
	}
	propAuthenticateCognitoConfig :: {
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
	propAuthenticateOidcConfig :: {
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
	propCertificate :: {
		CertificateArn?: string | fn.Fn
	}
	propFixedResponseConfig :: {
		ContentType?: string | fn.Fn
		MessageBody?: string | fn.Fn
		StatusCode:   string | fn.Fn
	}
	propRedirectConfig :: {
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
		Certificates: [...propCertificate]
		ListenerArn: string | fn.Fn
	}
	propCertificate :: {
		CertificateArn?: string | fn.Fn
	}
}
ListenerRule :: {
	Type: "AWS::ElasticLoadBalancingV2::ListenerRule"
	Properties: {
		Actions: [...propAction]
		Conditions: [...propRuleCondition]
		ListenerArn: string | fn.Fn
		Priority:    int | fn.Fn
	}
	propAction :: {
		AuthenticateCognitoConfig?: propAuthenticateCognitoConfig
		AuthenticateOidcConfig?:    propAuthenticateOidcConfig
		FixedResponseConfig?:       propFixedResponseConfig
		Order?:                     int | fn.Fn
		RedirectConfig?:            propRedirectConfig
		TargetGroupArn?:            string | fn.Fn
		Type:                       string | fn.Fn
	}
	propAuthenticateCognitoConfig :: {
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
	propAuthenticateOidcConfig :: {
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
	propFixedResponseConfig :: {
		ContentType?: string | fn.Fn
		MessageBody?: string | fn.Fn
		StatusCode:   string | fn.Fn
	}
	propHostHeaderConfig :: {
		Values?: [...string] | fn.Fn
	}
	propHttpHeaderConfig :: {
		HttpHeaderName?: string | fn.Fn
		Values?:         [...string] | fn.Fn
	}
	propHttpRequestMethodConfig :: {
		Values?: [...string] | fn.Fn
	}
	propPathPatternConfig :: {
		Values?: [...string] | fn.Fn
	}
	propQueryStringConfig :: {
		Values?: [...propQueryStringKeyValue]
	}
	propQueryStringKeyValue :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
	propRedirectConfig :: {
		Host?:      string | fn.Fn
		Path?:      string | fn.Fn
		Port?:      string | fn.Fn
		Protocol?:  string | fn.Fn
		Query?:     string | fn.Fn
		StatusCode: string | fn.Fn
	}
	propRuleCondition :: {
		Field?:                   string | fn.Fn
		HostHeaderConfig?:        propHostHeaderConfig
		HttpHeaderConfig?:        propHttpHeaderConfig
		HttpRequestMethodConfig?: propHttpRequestMethodConfig
		PathPatternConfig?:       propPathPatternConfig
		QueryStringConfig?:       propQueryStringConfig
		SourceIpConfig?:          propSourceIpConfig
		Values?:                  [...string] | fn.Fn
	}
	propSourceIpConfig :: {
		Values?: [...string] | fn.Fn
	}
}
LoadBalancer :: {
	Type: "AWS::ElasticLoadBalancingV2::LoadBalancer"
	Properties: {
		IpAddressType?: string | fn.Fn
		LoadBalancerAttributes?: [...propLoadBalancerAttribute]
		Name?:           string | fn.Fn
		Scheme?:         string | fn.Fn
		SecurityGroups?: [...string] | fn.Fn
		SubnetMappings?: [...propSubnetMapping]
		Subnets?: [...string] | fn.Fn
		Tags?: [...propTag]
		Type?: string | fn.Fn
	}
	propLoadBalancerAttribute :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
	propSubnetMapping :: {
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
		Matcher?:                    propMatcher
		Name?:                       string | fn.Fn
		Port?:                       int | fn.Fn
		Protocol?:                   string | fn.Fn
		Tags?: [...propTag]
		TargetGroupAttributes?: [...propTargetGroupAttribute]
		TargetType?: string | fn.Fn
		Targets?: [...propTargetDescription]
		UnhealthyThresholdCount?: (int & (>=2 & <=10)) | fn.Fn
		VpcId?:                   string | fn.Fn
	}
	propMatcher :: {
		HttpCode: string | fn.Fn
	}
	propTargetDescription :: {
		AvailabilityZone?: string | fn.Fn
		Id:                string | fn.Fn
		Port?:             int | fn.Fn
	}
	propTargetGroupAttribute :: {
		Key?:   string | fn.Fn
		Value?: string | fn.Fn
	}
}

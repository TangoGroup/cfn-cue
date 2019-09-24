package CloudFront

CloudFrontOriginAccessIdentity :: {
	Type: "AWS::CloudFront::CloudFrontOriginAccessIdentity"
	Properties: {
		CloudFrontOriginAccessIdentityConfig: __CloudFrontOriginAccessIdentityConfig
	}
	__CloudFrontOriginAccessIdentityConfig :: {
		Comment: string
	}
}
Distribution :: {
	Type: "AWS::CloudFront::Distribution"
	Properties: {
		DistributionConfig: __DistributionConfig
		Tags?: [...__Tag]
	}
	__CacheBehavior :: {
		AllowedMethods?: [...string]
		CachedMethods?: [...string]
		Compress?:               bool
		DefaultTTL?:             float
		FieldLevelEncryptionId?: string
		ForwardedValues:         __ForwardedValues
		LambdaFunctionAssociations?: [...__LambdaFunctionAssociation]
		MaxTTL?:          float
		MinTTL?:          float
		PathPattern:      string
		SmoothStreaming?: bool
		TargetOriginId:   string
		TrustedSigners?: [...string]
		ViewerProtocolPolicy: "allow-all" | "https-only" | "redirect-to-https"
		ViewerProtocolPolicy: string
	}
	__Cookies :: {
		Forward: string
		WhitelistedNames?: [...string]
	}
	__CustomErrorResponse :: {
		ErrorCachingMinTTL?: float
		ErrorCode:           "400" | "403" | "404" | "405" | "414" | "416" | "500" | "501" | "502" | "503" | "504"
		ErrorCode:           int
		ResponseCode?:       "200" | "400" | "403" | "404" | "405" | "414" | "416" | "500" | "501" | "502" | "503" | "504"
		ResponseCode?:       int
		ResponsePagePath?:   string
	}
	__CustomOriginConfig :: {
		HTTPPort?:               int
		HTTPSPort?:              int
		OriginKeepaliveTimeout?: int
		OriginProtocolPolicy:    "http-only" | "https-only" | "match-viewer"
		OriginProtocolPolicy:    string
		OriginReadTimeout?:      int
		OriginSSLProtocols?:     "SSLv3" | "TLSv1.1" | "TLSv1.2" | "TLSv1"
		OriginSSLProtocols?: [...string]
	}
	__DefaultCacheBehavior :: {
		AllowedMethods?: [...string]
		CachedMethods?: [...string]
		Compress?:               bool
		DefaultTTL?:             float
		FieldLevelEncryptionId?: string
		ForwardedValues:         __ForwardedValues
		LambdaFunctionAssociations?: [...__LambdaFunctionAssociation]
		MaxTTL?:          float
		MinTTL?:          float
		SmoothStreaming?: bool
		TargetOriginId:   string
		TrustedSigners?: [...string]
		ViewerProtocolPolicy: "allow-all" | "https-only" | "redirect-to-https"
		ViewerProtocolPolicy: string
	}
	__DistributionConfig :: {
		Aliases?: [...string]
		CacheBehaviors?: [...__CacheBehavior]
		Comment?: string
		CustomErrorResponses?: [...__CustomErrorResponse]
		DefaultCacheBehavior: __DefaultCacheBehavior
		DefaultRootObject?:   string
		Enabled:              bool
		HttpVersion?:         "http1.1" | "http2"
		HttpVersion?:         string
		IPV6Enabled?:         bool
		Logging?:             __Logging
		Origins: [...__Origin]
		PriceClass?:        "PriceClass_100" | "PriceClass_200" | "PriceClass_All"
		PriceClass?:        string
		Restrictions?:      __Restrictions
		ViewerCertificate?: __ViewerCertificate
		WebACLId?:          string
	}
	__ForwardedValues :: {
		Cookies?: __Cookies
		Headers?: [...string]
		QueryString: bool
		QueryStringCacheKeys?: [...string]
	}
	__GeoRestriction :: {
		Locations?: "AD" | "AE" | "AF" | "AG" | "AI" | "AL" | "AM" | "AO" | "AQ" | "AR" | "AS" | "AT" | "AU" | "AW" | "AX" | "AZ" | "BA" | "BB" | "BD" | "BE" | "BF" | "BG" | "BH" | "BI" | "BJ" | "BL" | "BM" | "BN" | "BO" | "BQ" | "BR" | "BS" | "BT" | "BV" | "BW" | "BY" | "BZ" | "CA" | "CC" | "CD" | "CF" | "CG" | "CH" | "CI" | "CK" | "CL" | "CM" | "CN" | "CO" | "CR" | "CU" | "CV" | "CW" | "CX" | "CY" | "CZ" | "DE" | "DJ" | "DK" | "DM" | "DO" | "DZ" | "EC" | "EE" | "EG" | "EH" | "ER" | "ES" | "ET" | "FI" | "FJ" | "FK" | "FM" | "FO" | "FR" | "GA" | "GB" | "GD" | "GE" | "GF" | "GG" | "GH" | "GI" | "GL" | "GM" | "GN" | "GP" | "GQ" | "GR" | "GS" | "GT" | "GU" | "GW" | "GY" | "HK" | "HM" | "HN" | "HR" | "HT" | "HU" | "ID" | "IE" | "IL" | "IM" | "IN" | "IO" | "IQ" | "IR" | "IS" | "IT" | "JE" | "JM" | "JO" | "JP" | "KE" | "KG" | "KH" | "KI" | "KM" | "KN" | "KP" | "KR" | "KW" | "KY" | "KZ" | "LA" | "LB" | "LC" | "LI" | "LK" | "LR" | "LS" | "LT" | "LU" | "LV" | "LY" | "MA" | "MC" | "MD" | "ME" | "MF" | "MG" | "MH" | "MK" | "ML" | "MM" | "MN" | "MO" | "MP" | "MQ" | "MR" | "MS" | "MT" | "MU" | "MV" | "MW" | "MX" | "MY" | "MZ" | "NA" | "NC" | "NE" | "NF" | "NG" | "NI" | "NL" | "NO" | "NP" | "NR" | "NU" | "NZ" | "OM" | "PA" | "PE" | "PF" | "PG" | "PH" | "PK" | "PL" | "PM" | "PN" | "PR" | "PS" | "PT" | "PW" | "PY" | "QA" | "RE" | "RO" | "RS" | "RU" | "RW" | "SA" | "SB" | "SC" | "SD" | "SE" | "SG" | "SH" | "SI" | "SJ" | "SK" | "SL" | "SM" | "SN" | "SO" | "SR" | "SS" | "ST" | "SV" | "SX" | "SY" | "SZ" | "TC" | "TD" | "TF" | "TG" | "TH" | "TJ" | "TK" | "TL" | "TM" | "TN" | "TO" | "TR" | "TT" | "TV" | "TW" | "TZ" | "UA" | "UG" | "UM" | "US" | "UY" | "UZ" | "VA" | "VC" | "VE" | "VG" | "VI" | "VN" | "VU" | "WF" | "WS" | "YE" | "YT" | "ZA" | "ZM" | "ZW"
		Locations?: [...string]
		RestrictionType: "blacklist" | "none" | "whitelist"
		RestrictionType: string
	}
	__LambdaFunctionAssociation :: {
		EventType?:        "origin-request" | "origin-response" | "viewer-request" | "viewer-response"
		EventType?:        string
		LambdaFunctionARN: string
	}
	__Logging :: {
		Bucket:          string
		IncludeCookies?: bool
		Prefix?:         string
	}
	__Origin :: {
		CustomOriginConfig?: __CustomOriginConfig
		DomainName:          string
		Id:                  string
		OriginCustomHeaders?: [...__OriginCustomHeader]
		OriginPath?:     string
		S3OriginConfig?: __S3OriginConfig
	}
	__OriginCustomHeader :: {
		HeaderName:  string
		HeaderValue: string
	}
	__Restrictions :: {
		GeoRestriction: __GeoRestriction
	}
	__S3OriginConfig :: {
		OriginAccessIdentity?: string
	}
	__ViewerCertificate :: {
		AcmCertificateArn?:            string
		CloudFrontDefaultCertificate?: bool
		IamCertificateId?:             string
		MinimumProtocolVersion?:       "SSLv3" | "TLSv1" | "TLSv1_2016" | "TLSv1.1_2016" | "TLSv1.2_2018"
		MinimumProtocolVersion?:       string
		SslSupportMethod?:             "sni-only" | "vip"
		SslSupportMethod?:             string
	}
}
StreamingDistribution :: {
	Type: "AWS::CloudFront::StreamingDistribution"
	Properties: {
		StreamingDistributionConfig: __StreamingDistributionConfig
		Tags: [...__Tag]
	}
	__Logging :: {
		Bucket:  string
		Enabled: bool
		Prefix:  string
	}
	__S3Origin :: {
		DomainName:           string
		OriginAccessIdentity: string
	}
	__StreamingDistributionConfig :: {
		Aliases?: [...string]
		Comment:        string
		Enabled:        bool
		Logging?:       __Logging
		PriceClass?:    "PriceClass_100" | "PriceClass_200" | "PriceClass_All"
		PriceClass?:    string
		S3Origin:       __S3Origin
		TrustedSigners: __TrustedSigners
	}
	__TrustedSigners :: {
		AwsAccountNumbers?: [...string]
		Enabled: bool
	}
}

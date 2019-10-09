package CloudFront

import "github.com/TangoGroup/fn"

CloudFrontOriginAccessIdentity :: {
	Type: "AWS::CloudFront::CloudFrontOriginAccessIdentity"
	Properties: {
		CloudFrontOriginAccessIdentityConfig: __CloudFrontOriginAccessIdentityConfig
	}
	__CloudFrontOriginAccessIdentityConfig :: {
		Comment: string | fn.Fn
	}
}
Distribution :: {
	Type: "AWS::CloudFront::Distribution"
	Properties: {
		DistributionConfig: __DistributionConfig
		Tags?: [...__Tag]
	}
	__CacheBehavior :: {
		AllowedMethods?:         [...string] | fn.Fn
		CachedMethods?:          [...string] | fn.Fn
		Compress?:               bool | fn.Fn
		DefaultTTL?:             float | fn.Fn
		FieldLevelEncryptionId?: string | fn.Fn
		ForwardedValues:         __ForwardedValues
		LambdaFunctionAssociations?: [...__LambdaFunctionAssociation]
		MaxTTL?:              float | fn.Fn
		MinTTL?:              float | fn.Fn
		PathPattern:          string | fn.Fn
		SmoothStreaming?:     bool | fn.Fn
		TargetOriginId:       string | fn.Fn
		TrustedSigners?:      [...string] | fn.Fn
		ViewerProtocolPolicy: (string & ("allow-all" | "https-only" | "redirect-to-https")) | fn.Fn
	}
	__Cookies :: {
		Forward:           string | fn.Fn
		WhitelistedNames?: [...string] | fn.Fn
	}
	__CustomErrorResponse :: {
		ErrorCachingMinTTL?: float | fn.Fn
		ErrorCode:           (int & (400 | 403 | 404 | 405 | 414 | 416 | 500 | 501 | 502 | 503 | 504)) | fn.Fn
		ResponseCode?:       (int & (200 | 400 | 403 | 404 | 405 | 414 | 416 | 500 | 501 | 502 | 503 | 504)) | fn.Fn
		ResponsePagePath?:   string | fn.Fn
	}
	__CustomOriginConfig :: {
		HTTPPort?:               int | fn.Fn
		HTTPSPort?:              int | fn.Fn
		OriginKeepaliveTimeout?: int | fn.Fn
		OriginProtocolPolicy:    (string & ("http-only" | "https-only" | "match-viewer")) | fn.Fn
		OriginReadTimeout?:      int | fn.Fn
		OriginSSLProtocols?:     ([...string] & ("SSLv3" | "TLSv1.1" | "TLSv1.2" | "TLSv1")) | fn.Fn
	}
	__DefaultCacheBehavior :: {
		AllowedMethods?:         [...string] | fn.Fn
		CachedMethods?:          [...string] | fn.Fn
		Compress?:               bool | fn.Fn
		DefaultTTL?:             float | fn.Fn
		FieldLevelEncryptionId?: string | fn.Fn
		ForwardedValues:         __ForwardedValues
		LambdaFunctionAssociations?: [...__LambdaFunctionAssociation]
		MaxTTL?:              float | fn.Fn
		MinTTL?:              float | fn.Fn
		SmoothStreaming?:     bool | fn.Fn
		TargetOriginId:       string | fn.Fn
		TrustedSigners?:      [...string] | fn.Fn
		ViewerProtocolPolicy: (string & ("allow-all" | "https-only" | "redirect-to-https")) | fn.Fn
	}
	__DistributionConfig :: {
		Aliases?: [...string] | fn.Fn
		CacheBehaviors?: [...__CacheBehavior]
		Comment?: string | fn.Fn
		CustomErrorResponses?: [...__CustomErrorResponse]
		DefaultCacheBehavior: __DefaultCacheBehavior
		DefaultRootObject?:   string | fn.Fn
		Enabled:              bool | fn.Fn
		HttpVersion?:         (string & ("http1.1" | "http2")) | fn.Fn
		IPV6Enabled?:         bool | fn.Fn
		Logging?:             __Logging
		Origins: [...__Origin]
		PriceClass?:        (string & ("PriceClass_100" | "PriceClass_200" | "PriceClass_All")) | fn.Fn
		Restrictions?:      __Restrictions
		ViewerCertificate?: __ViewerCertificate
		WebACLId?:          string | fn.Fn
	}
	__ForwardedValues :: {
		Cookies?:              __Cookies
		Headers?:              [...string] | fn.Fn
		QueryString:           bool | fn.Fn
		QueryStringCacheKeys?: [...string] | fn.Fn
	}
	__GeoRestriction :: {
		Locations?:      ([...string] & ("AD" | "AE" | "AF" | "AG" | "AI" | "AL" | "AM" | "AO" | "AQ" | "AR" | "AS" | "AT" | "AU" | "AW" | "AX" | "AZ" | "BA" | "BB" | "BD" | "BE" | "BF" | "BG" | "BH" | "BI" | "BJ" | "BL" | "BM" | "BN" | "BO" | "BQ" | "BR" | "BS" | "BT" | "BV" | "BW" | "BY" | "BZ" | "CA" | "CC" | "CD" | "CF" | "CG" | "CH" | "CI" | "CK" | "CL" | "CM" | "CN" | "CO" | "CR" | "CU" | "CV" | "CW" | "CX" | "CY" | "CZ" | "DE" | "DJ" | "DK" | "DM" | "DO" | "DZ" | "EC" | "EE" | "EG" | "EH" | "ER" | "ES" | "ET" | "FI" | "FJ" | "FK" | "FM" | "FO" | "FR" | "GA" | "GB" | "GD" | "GE" | "GF" | "GG" | "GH" | "GI" | "GL" | "GM" | "GN" | "GP" | "GQ" | "GR" | "GS" | "GT" | "GU" | "GW" | "GY" | "HK" | "HM" | "HN" | "HR" | "HT" | "HU" | "ID" | "IE" | "IL" | "IM" | "IN" | "IO" | "IQ" | "IR" | "IS" | "IT" | "JE" | "JM" | "JO" | "JP" | "KE" | "KG" | "KH" | "KI" | "KM" | "KN" | "KP" | "KR" | "KW" | "KY" | "KZ" | "LA" | "LB" | "LC" | "LI" | "LK" | "LR" | "LS" | "LT" | "LU" | "LV" | "LY" | "MA" | "MC" | "MD" | "ME" | "MF" | "MG" | "MH" | "MK" | "ML" | "MM" | "MN" | "MO" | "MP" | "MQ" | "MR" | "MS" | "MT" | "MU" | "MV" | "MW" | "MX" | "MY" | "MZ" | "NA" | "NC" | "NE" | "NF" | "NG" | "NI" | "NL" | "NO" | "NP" | "NR" | "NU" | "NZ" | "OM" | "PA" | "PE" | "PF" | "PG" | "PH" | "PK" | "PL" | "PM" | "PN" | "PR" | "PS" | "PT" | "PW" | "PY" | "QA" | "RE" | "RO" | "RS" | "RU" | "RW" | "SA" | "SB" | "SC" | "SD" | "SE" | "SG" | "SH" | "SI" | "SJ" | "SK" | "SL" | "SM" | "SN" | "SO" | "SR" | "SS" | "ST" | "SV" | "SX" | "SY" | "SZ" | "TC" | "TD" | "TF" | "TG" | "TH" | "TJ" | "TK" | "TL" | "TM" | "TN" | "TO" | "TR" | "TT" | "TV" | "TW" | "TZ" | "UA" | "UG" | "UM" | "US" | "UY" | "UZ" | "VA" | "VC" | "VE" | "VG" | "VI" | "VN" | "VU" | "WF" | "WS" | "YE" | "YT" | "ZA" | "ZM" | "ZW")) | fn.Fn
		RestrictionType: (string & ("blacklist" | "none" | "whitelist")) | fn.Fn
	}
	__LambdaFunctionAssociation :: {
		EventType?:        (string & ("origin-request" | "origin-response" | "viewer-request" | "viewer-response")) | fn.Fn
		LambdaFunctionARN: string | fn.Fn
	}
	__Logging :: {
		Bucket:          string | fn.Fn
		IncludeCookies?: bool | fn.Fn
		Prefix?:         string | fn.Fn
	}
	__Origin :: {
		CustomOriginConfig?: __CustomOriginConfig
		DomainName:          string | fn.Fn
		Id:                  string | fn.Fn
		OriginCustomHeaders?: [...__OriginCustomHeader]
		OriginPath?:     string | fn.Fn
		S3OriginConfig?: __S3OriginConfig
	}
	__OriginCustomHeader :: {
		HeaderName:  string | fn.Fn
		HeaderValue: string | fn.Fn
	}
	__Restrictions :: {
		GeoRestriction: __GeoRestriction
	}
	__S3OriginConfig :: {
		OriginAccessIdentity?: string | fn.Fn
	}
	__ViewerCertificate :: {
		AcmCertificateArn?:            string | fn.Fn
		CloudFrontDefaultCertificate?: bool | fn.Fn
		IamCertificateId?:             string | fn.Fn
		MinimumProtocolVersion?:       (string & ("SSLv3" | "TLSv1" | "TLSv1_2016" | "TLSv1.1_2016" | "TLSv1.2_2018")) | fn.Fn
		SslSupportMethod?:             (string & ("sni-only" | "vip")) | fn.Fn
	}
}
StreamingDistribution :: {
	Type: "AWS::CloudFront::StreamingDistribution"
	Properties: {
		StreamingDistributionConfig: __StreamingDistributionConfig
		Tags: [...__Tag]
	}
	__Logging :: {
		Bucket:  string | fn.Fn
		Enabled: bool | fn.Fn
		Prefix:  string | fn.Fn
	}
	__S3Origin :: {
		DomainName:           string | fn.Fn
		OriginAccessIdentity: string | fn.Fn
	}
	__StreamingDistributionConfig :: {
		Aliases?:       [...string] | fn.Fn
		Comment:        string | fn.Fn
		Enabled:        bool | fn.Fn
		Logging?:       __Logging
		PriceClass?:    (string & ("PriceClass_100" | "PriceClass_200" | "PriceClass_All")) | fn.Fn
		S3Origin:       __S3Origin
		TrustedSigners: __TrustedSigners
	}
	__TrustedSigners :: {
		AwsAccountNumbers?: [...string] | fn.Fn
		Enabled:            bool | fn.Fn
	}
}

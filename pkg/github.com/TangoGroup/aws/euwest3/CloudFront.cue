package euwest3

import "github.com/TangoGroup/aws/fn"

CloudFront :: {
	CloudFrontOriginAccessIdentity :: {
		Type: "AWS::CloudFront::CloudFrontOriginAccessIdentity"
		Properties: CloudFrontOriginAccessIdentityConfig: close({
			Comment: string | fn.Fn
		}) | fn.If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Distribution :: {
		Type: "AWS::CloudFront::Distribution"
		Properties: {
			DistributionConfig: close({
				Aliases?:        [...(string | fn.Fn)] | (string | fn.Fn)
				CacheBehaviors?: [...close({
					AllowedMethods?:         [...(string | fn.Fn)] | (string | fn.Fn)
					CachedMethods?:          [...(string | fn.Fn)] | (string | fn.Fn)
					Compress?:               bool | fn.Fn
					DefaultTTL?:             number | fn.Fn
					FieldLevelEncryptionId?: string | fn.Fn
					ForwardedValues:         close({
						Cookies?: close({
							Forward:           string | fn.Fn
							WhitelistedNames?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						Headers?:              [...(string | fn.Fn)] | (string | fn.Fn)
						QueryString:           bool | fn.Fn
						QueryStringCacheKeys?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					LambdaFunctionAssociations?: [...close({
						EventType?:        ("origin-request" | "origin-response" | "viewer-request" | "viewer-response") | fn.Fn
						IncludeBody?:      bool | fn.Fn
						LambdaFunctionARN: string | fn.Fn
					})] | fn.If
					MaxTTL?:              number | fn.Fn
					MinTTL?:              number | fn.Fn
					PathPattern:          string | fn.Fn
					SmoothStreaming?:     bool | fn.Fn
					TargetOriginId:       string | fn.Fn
					TrustedSigners?:      [...(string | fn.Fn)] | (string | fn.Fn)
					ViewerProtocolPolicy: ("allow-all" | "https-only" | "redirect-to-https") | fn.Fn
				})] | fn.If
				Comment?:              string | fn.Fn
				CustomErrorResponses?: [...close({
					ErrorCachingMinTTL?: number | fn.Fn
					ErrorCode:           (400 | 403 | 404 | 405 | 414 | 416 | 500 | 501 | 502 | 503 | 504) | fn.Fn
					ResponseCode?:       (200 | 400 | 403 | 404 | 405 | 414 | 416 | 500 | 501 | 502 | 503 | 504) | fn.Fn
					ResponsePagePath?:   string | fn.Fn
				})] | fn.If
				DefaultCacheBehavior: close({
					AllowedMethods?:         [...(string | fn.Fn)] | (string | fn.Fn)
					CachedMethods?:          [...(string | fn.Fn)] | (string | fn.Fn)
					Compress?:               bool | fn.Fn
					DefaultTTL?:             number | fn.Fn
					FieldLevelEncryptionId?: string | fn.Fn
					ForwardedValues:         close({
						Cookies?: close({
							Forward:           string | fn.Fn
							WhitelistedNames?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						Headers?:              [...(string | fn.Fn)] | (string | fn.Fn)
						QueryString:           bool | fn.Fn
						QueryStringCacheKeys?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					LambdaFunctionAssociations?: [...close({
						EventType?:        ("origin-request" | "origin-response" | "viewer-request" | "viewer-response") | fn.Fn
						IncludeBody?:      bool | fn.Fn
						LambdaFunctionARN: string | fn.Fn
					})] | fn.If
					MaxTTL?:              number | fn.Fn
					MinTTL?:              number | fn.Fn
					SmoothStreaming?:     bool | fn.Fn
					TargetOriginId:       string | fn.Fn
					TrustedSigners?:      [...(string | fn.Fn)] | (string | fn.Fn)
					ViewerProtocolPolicy: ("allow-all" | "https-only" | "redirect-to-https") | fn.Fn
				}) | fn.If
				DefaultRootObject?: string | fn.Fn
				Enabled:            bool | fn.Fn
				HttpVersion?:       ("http1.1" | "http2") | fn.Fn
				IPV6Enabled?:       bool | fn.Fn
				Logging?:           close({
					Bucket:          string | fn.Fn
					IncludeCookies?: bool | fn.Fn
					Prefix?:         string | fn.Fn
				}) | fn.If
				OriginGroups?: close({
					Items?: [...close({
						FailoverCriteria: close({
							StatusCodes: close({
								Items:    [...(int | fn.Fn)] | (int | fn.Fn)
								Quantity: int | fn.Fn
							}) | fn.If
						}) | fn.If
						Id:      string | fn.Fn
						Members: close({
							Items: [...close({
								OriginId: string | fn.Fn
							})] | fn.If
							Quantity: int | fn.Fn
						}) | fn.If
					})] | fn.If
					Quantity: int | fn.Fn
				}) | fn.If
				Origins: [...close({
					CustomOriginConfig?: close({
						HTTPPort?:               int | fn.Fn
						HTTPSPort?:              int | fn.Fn
						OriginKeepaliveTimeout?: int | fn.Fn
						OriginProtocolPolicy:    ("http-only" | "https-only" | "match-viewer") | fn.Fn
						OriginReadTimeout?:      int | fn.Fn
						OriginSSLProtocols?:     [...(("SSLv3" | "TLSv1.1" | "TLSv1.2" | "TLSv1") | fn.Fn)] | (("SSLv3" | "TLSv1.1" | "TLSv1.2" | "TLSv1") | fn.Fn)
					}) | fn.If
					DomainName:           string | fn.Fn
					Id:                   string | fn.Fn
					OriginCustomHeaders?: [...close({
						HeaderName:  string | fn.Fn
						HeaderValue: string | fn.Fn
					})] | fn.If
					OriginPath?:     string | fn.Fn
					S3OriginConfig?: close({
						OriginAccessIdentity?: string | fn.Fn
					}) | fn.If
				})] | fn.If
				PriceClass?:   ("PriceClass_100" | "PriceClass_200" | "PriceClass_All") | fn.Fn
				Restrictions?: close({
					GeoRestriction: close({
						Locations?:      [...(("AD" | "AE" | "AF" | "AG" | "AI" | "AL" | "AM" | "AO" | "AQ" | "AR" | "AS" | "AT" | "AU" | "AW" | "AX" | "AZ" | "BA" | "BB" | "BD" | "BE" | "BF" | "BG" | "BH" | "BI" | "BJ" | "BL" | "BM" | "BN" | "BO" | "BQ" | "BR" | "BS" | "BT" | "BV" | "BW" | "BY" | "BZ" | "CA" | "CC" | "CD" | "CF" | "CG" | "CH" | "CI" | "CK" | "CL" | "CM" | "CN" | "CO" | "CR" | "CU" | "CV" | "CW" | "CX" | "CY" | "CZ" | "DE" | "DJ" | "DK" | "DM" | "DO" | "DZ" | "EC" | "EE" | "EG" | "EH" | "ER" | "ES" | "ET" | "FI" | "FJ" | "FK" | "FM" | "FO" | "FR" | "GA" | "GB" | "GD" | "GE" | "GF" | "GG" | "GH" | "GI" | "GL" | "GM" | "GN" | "GP" | "GQ" | "GR" | "GS" | "GT" | "GU" | "GW" | "GY" | "HK" | "HM" | "HN" | "HR" | "HT" | "HU" | "ID" | "IE" | "IL" | "IM" | "IN" | "IO" | "IQ" | "IR" | "IS" | "IT" | "JE" | "JM" | "JO" | "JP" | "KE" | "KG" | "KH" | "KI" | "KM" | "KN" | "KP" | "KR" | "KW" | "KY" | "KZ" | "LA" | "LB" | "LC" | "LI" | "LK" | "LR" | "LS" | "LT" | "LU" | "LV" | "LY" | "MA" | "MC" | "MD" | "ME" | "MF" | "MG" | "MH" | "MK" | "ML" | "MM" | "MN" | "MO" | "MP" | "MQ" | "MR" | "MS" | "MT" | "MU" | "MV" | "MW" | "MX" | "MY" | "MZ" | "NA" | "NC" | "NE" | "NF" | "NG" | "NI" | "NL" | "NO" | "NP" | "NR" | "NU" | "NZ" | "OM" | "PA" | "PE" | "PF" | "PG" | "PH" | "PK" | "PL" | "PM" | "PN" | "PR" | "PS" | "PT" | "PW" | "PY" | "QA" | "RE" | "RO" | "RS" | "RU" | "RW" | "SA" | "SB" | "SC" | "SD" | "SE" | "SG" | "SH" | "SI" | "SJ" | "SK" | "SL" | "SM" | "SN" | "SO" | "SR" | "SS" | "ST" | "SV" | "SX" | "SY" | "SZ" | "TC" | "TD" | "TF" | "TG" | "TH" | "TJ" | "TK" | "TL" | "TM" | "TN" | "TO" | "TR" | "TT" | "TV" | "TW" | "TZ" | "UA" | "UG" | "UM" | "US" | "UY" | "UZ" | "VA" | "VC" | "VE" | "VG" | "VI" | "VN" | "VU" | "WF" | "WS" | "YE" | "YT" | "ZA" | "ZM" | "ZW") | fn.Fn)] | (("AD" | "AE" | "AF" | "AG" | "AI" | "AL" | "AM" | "AO" | "AQ" | "AR" | "AS" | "AT" | "AU" | "AW" | "AX" | "AZ" | "BA" | "BB" | "BD" | "BE" | "BF" | "BG" | "BH" | "BI" | "BJ" | "BL" | "BM" | "BN" | "BO" | "BQ" | "BR" | "BS" | "BT" | "BV" | "BW" | "BY" | "BZ" | "CA" | "CC" | "CD" | "CF" | "CG" | "CH" | "CI" | "CK" | "CL" | "CM" | "CN" | "CO" | "CR" | "CU" | "CV" | "CW" | "CX" | "CY" | "CZ" | "DE" | "DJ" | "DK" | "DM" | "DO" | "DZ" | "EC" | "EE" | "EG" | "EH" | "ER" | "ES" | "ET" | "FI" | "FJ" | "FK" | "FM" | "FO" | "FR" | "GA" | "GB" | "GD" | "GE" | "GF" | "GG" | "GH" | "GI" | "GL" | "GM" | "GN" | "GP" | "GQ" | "GR" | "GS" | "GT" | "GU" | "GW" | "GY" | "HK" | "HM" | "HN" | "HR" | "HT" | "HU" | "ID" | "IE" | "IL" | "IM" | "IN" | "IO" | "IQ" | "IR" | "IS" | "IT" | "JE" | "JM" | "JO" | "JP" | "KE" | "KG" | "KH" | "KI" | "KM" | "KN" | "KP" | "KR" | "KW" | "KY" | "KZ" | "LA" | "LB" | "LC" | "LI" | "LK" | "LR" | "LS" | "LT" | "LU" | "LV" | "LY" | "MA" | "MC" | "MD" | "ME" | "MF" | "MG" | "MH" | "MK" | "ML" | "MM" | "MN" | "MO" | "MP" | "MQ" | "MR" | "MS" | "MT" | "MU" | "MV" | "MW" | "MX" | "MY" | "MZ" | "NA" | "NC" | "NE" | "NF" | "NG" | "NI" | "NL" | "NO" | "NP" | "NR" | "NU" | "NZ" | "OM" | "PA" | "PE" | "PF" | "PG" | "PH" | "PK" | "PL" | "PM" | "PN" | "PR" | "PS" | "PT" | "PW" | "PY" | "QA" | "RE" | "RO" | "RS" | "RU" | "RW" | "SA" | "SB" | "SC" | "SD" | "SE" | "SG" | "SH" | "SI" | "SJ" | "SK" | "SL" | "SM" | "SN" | "SO" | "SR" | "SS" | "ST" | "SV" | "SX" | "SY" | "SZ" | "TC" | "TD" | "TF" | "TG" | "TH" | "TJ" | "TK" | "TL" | "TM" | "TN" | "TO" | "TR" | "TT" | "TV" | "TW" | "TZ" | "UA" | "UG" | "UM" | "US" | "UY" | "UZ" | "VA" | "VC" | "VE" | "VG" | "VI" | "VN" | "VU" | "WF" | "WS" | "YE" | "YT" | "ZA" | "ZM" | "ZW") | fn.Fn)
						RestrictionType: ("blacklist" | "none" | "whitelist") | fn.Fn
					}) | fn.If
				}) | fn.If
				ViewerCertificate?: close({
					AcmCertificateArn?:            string | fn.Fn
					CloudFrontDefaultCertificate?: bool | fn.Fn
					IamCertificateId?:             string | fn.Fn
					MinimumProtocolVersion?:       ("SSLv3" | "TLSv1" | "TLSv1_2016" | "TLSv1.1_2016" | "TLSv1.2_2018") | fn.Fn
					SslSupportMethod?:             ("sni-only" | "vip") | fn.Fn
				}) | fn.If
				WebACLId?: string | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	StreamingDistribution :: {
		Type: "AWS::CloudFront::StreamingDistribution"
		Properties: {
			StreamingDistributionConfig: close({
				Aliases?: [...(string | fn.Fn)] | (string | fn.Fn)
				Comment:  string | fn.Fn
				Enabled:  bool | fn.Fn
				Logging?: close({
					Bucket:  string | fn.Fn
					Enabled: bool | fn.Fn
					Prefix:  string | fn.Fn
				}) | fn.If
				PriceClass?: ("PriceClass_100" | "PriceClass_200" | "PriceClass_All") | fn.Fn
				S3Origin:    close({
					DomainName:           string | fn.Fn
					OriginAccessIdentity: string | fn.Fn
				}) | fn.If
				TrustedSigners: close({
					AwsAccountNumbers?: [...(string | fn.Fn)] | (string | fn.Fn)
					Enabled:            bool | fn.Fn
				}) | fn.If
			}) | fn.If
			Tags: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package cacentral1

import "github.com/TangoGroup/aws/fn"

CloudFront :: {
	CloudFrontOriginAccessIdentity :: {
		Type: "AWS::CloudFront::CloudFrontOriginAccessIdentity"
		Properties: CloudFrontOriginAccessIdentityConfig: Comment: string | fn.Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Distribution :: {
		Type: "AWS::CloudFront::Distribution"
		Properties: {
			DistributionConfig: {
				Aliases?: [...(string | fn.Fn)] | fn.Fn
				CacheBehaviors?: [...{
					AllowedMethods?:         [...(string | fn.Fn)] | fn.Fn
					CachedMethods?:          [...(string | fn.Fn)] | fn.Fn
					Compress?:               bool | fn.Fn
					DefaultTTL?:             float | fn.Fn
					FieldLevelEncryptionId?: string | fn.Fn
					ForwardedValues: {
						Cookies?: {
							Forward:           string | fn.Fn
							WhitelistedNames?: [...(string | fn.Fn)] | fn.Fn
						}
						Headers?:              [...(string | fn.Fn)] | fn.Fn
						QueryString:           bool | fn.Fn
						QueryStringCacheKeys?: [...(string | fn.Fn)] | fn.Fn
					}
					LambdaFunctionAssociations?: [...{
						EventType?:        (string & ("origin-request" | "origin-response" | "viewer-request" | "viewer-response")) | fn.Fn
						LambdaFunctionARN: string | fn.Fn
					}]
					MaxTTL?:              float | fn.Fn
					MinTTL?:              float | fn.Fn
					PathPattern:          string | fn.Fn
					SmoothStreaming?:     bool | fn.Fn
					TargetOriginId:       string | fn.Fn
					TrustedSigners?:      [...(string | fn.Fn)] | fn.Fn
					ViewerProtocolPolicy: (string & ("allow-all" | "https-only" | "redirect-to-https")) | fn.Fn
				}]
				Comment?: string | fn.Fn
				CustomErrorResponses?: [...{
					ErrorCachingMinTTL?: float | fn.Fn
					ErrorCode:           (int & (400 | 403 | 404 | 405 | 414 | 416 | 500 | 501 | 502 | 503 | 504)) | fn.Fn
					ResponseCode?:       (int & (200 | 400 | 403 | 404 | 405 | 414 | 416 | 500 | 501 | 502 | 503 | 504)) | fn.Fn
					ResponsePagePath?:   string | fn.Fn
				}]
				DefaultCacheBehavior: {
					AllowedMethods?:         [...(string | fn.Fn)] | fn.Fn
					CachedMethods?:          [...(string | fn.Fn)] | fn.Fn
					Compress?:               bool | fn.Fn
					DefaultTTL?:             float | fn.Fn
					FieldLevelEncryptionId?: string | fn.Fn
					ForwardedValues: {
						Cookies?: {
							Forward:           string | fn.Fn
							WhitelistedNames?: [...(string | fn.Fn)] | fn.Fn
						}
						Headers?:              [...(string | fn.Fn)] | fn.Fn
						QueryString:           bool | fn.Fn
						QueryStringCacheKeys?: [...(string | fn.Fn)] | fn.Fn
					}
					LambdaFunctionAssociations?: [...{
						EventType?:        (string & ("origin-request" | "origin-response" | "viewer-request" | "viewer-response")) | fn.Fn
						LambdaFunctionARN: string | fn.Fn
					}]
					MaxTTL?:              float | fn.Fn
					MinTTL?:              float | fn.Fn
					SmoothStreaming?:     bool | fn.Fn
					TargetOriginId:       string | fn.Fn
					TrustedSigners?:      [...(string | fn.Fn)] | fn.Fn
					ViewerProtocolPolicy: (string & ("allow-all" | "https-only" | "redirect-to-https")) | fn.Fn
				}
				DefaultRootObject?: string | fn.Fn
				Enabled:            bool | fn.Fn
				HttpVersion?:       (string & ("http1.1" | "http2")) | fn.Fn
				IPV6Enabled?:       bool | fn.Fn
				Logging?: {
					Bucket:          string | fn.Fn
					IncludeCookies?: bool | fn.Fn
					Prefix?:         string | fn.Fn
				}
				Origins: [...{
					CustomOriginConfig?: {
						HTTPPort?:               int | fn.Fn
						HTTPSPort?:              int | fn.Fn
						OriginKeepaliveTimeout?: int | fn.Fn
						OriginProtocolPolicy:    (string & ("http-only" | "https-only" | "match-viewer")) | fn.Fn
						OriginReadTimeout?:      int | fn.Fn
						OriginSSLProtocols?:     [...((string & ("SSLv3" | "TLSv1.1" | "TLSv1.2" | "TLSv1")) | fn.Fn)] | fn.Fn
					}
					DomainName: string | fn.Fn
					Id:         string | fn.Fn
					OriginCustomHeaders?: [...{
						HeaderName:  string | fn.Fn
						HeaderValue: string | fn.Fn
					}]
					OriginPath?: string | fn.Fn
					S3OriginConfig?: OriginAccessIdentity?: string | fn.Fn
				}]
				PriceClass?: (string & ("PriceClass_100" | "PriceClass_200" | "PriceClass_All")) | fn.Fn
				Restrictions?: GeoRestriction: {
					Locations?:      [...((string & ("AD" | "AE" | "AF" | "AG" | "AI" | "AL" | "AM" | "AO" | "AQ" | "AR" | "AS" | "AT" | "AU" | "AW" | "AX" | "AZ" | "BA" | "BB" | "BD" | "BE" | "BF" | "BG" | "BH" | "BI" | "BJ" | "BL" | "BM" | "BN" | "BO" | "BQ" | "BR" | "BS" | "BT" | "BV" | "BW" | "BY" | "BZ" | "CA" | "CC" | "CD" | "CF" | "CG" | "CH" | "CI" | "CK" | "CL" | "CM" | "CN" | "CO" | "CR" | "CU" | "CV" | "CW" | "CX" | "CY" | "CZ" | "DE" | "DJ" | "DK" | "DM" | "DO" | "DZ" | "EC" | "EE" | "EG" | "EH" | "ER" | "ES" | "ET" | "FI" | "FJ" | "FK" | "FM" | "FO" | "FR" | "GA" | "GB" | "GD" | "GE" | "GF" | "GG" | "GH" | "GI" | "GL" | "GM" | "GN" | "GP" | "GQ" | "GR" | "GS" | "GT" | "GU" | "GW" | "GY" | "HK" | "HM" | "HN" | "HR" | "HT" | "HU" | "ID" | "IE" | "IL" | "IM" | "IN" | "IO" | "IQ" | "IR" | "IS" | "IT" | "JE" | "JM" | "JO" | "JP" | "KE" | "KG" | "KH" | "KI" | "KM" | "KN" | "KP" | "KR" | "KW" | "KY" | "KZ" | "LA" | "LB" | "LC" | "LI" | "LK" | "LR" | "LS" | "LT" | "LU" | "LV" | "LY" | "MA" | "MC" | "MD" | "ME" | "MF" | "MG" | "MH" | "MK" | "ML" | "MM" | "MN" | "MO" | "MP" | "MQ" | "MR" | "MS" | "MT" | "MU" | "MV" | "MW" | "MX" | "MY" | "MZ" | "NA" | "NC" | "NE" | "NF" | "NG" | "NI" | "NL" | "NO" | "NP" | "NR" | "NU" | "NZ" | "OM" | "PA" | "PE" | "PF" | "PG" | "PH" | "PK" | "PL" | "PM" | "PN" | "PR" | "PS" | "PT" | "PW" | "PY" | "QA" | "RE" | "RO" | "RS" | "RU" | "RW" | "SA" | "SB" | "SC" | "SD" | "SE" | "SG" | "SH" | "SI" | "SJ" | "SK" | "SL" | "SM" | "SN" | "SO" | "SR" | "SS" | "ST" | "SV" | "SX" | "SY" | "SZ" | "TC" | "TD" | "TF" | "TG" | "TH" | "TJ" | "TK" | "TL" | "TM" | "TN" | "TO" | "TR" | "TT" | "TV" | "TW" | "TZ" | "UA" | "UG" | "UM" | "US" | "UY" | "UZ" | "VA" | "VC" | "VE" | "VG" | "VI" | "VN" | "VU" | "WF" | "WS" | "YE" | "YT" | "ZA" | "ZM" | "ZW")) | fn.Fn)] | fn.Fn
					RestrictionType: (string & ("blacklist" | "none" | "whitelist")) | fn.Fn
				}
				ViewerCertificate?: {
					AcmCertificateArn?:            string | fn.Fn
					CloudFrontDefaultCertificate?: bool | fn.Fn
					IamCertificateId?:             string | fn.Fn
					MinimumProtocolVersion?:       (string & ("SSLv3" | "TLSv1" | "TLSv1_2016" | "TLSv1.1_2016" | "TLSv1.2_2018")) | fn.Fn
					SslSupportMethod?:             (string & ("sni-only" | "vip")) | fn.Fn
				}
				WebACLId?: string | fn.Fn
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	StreamingDistribution :: {
		Type: "AWS::CloudFront::StreamingDistribution"
		Properties: {
			StreamingDistributionConfig: {
				Aliases?: [...(string | fn.Fn)] | fn.Fn
				Comment:  string | fn.Fn
				Enabled:  bool | fn.Fn
				Logging?: {
					Bucket:  string | fn.Fn
					Enabled: bool | fn.Fn
					Prefix:  string | fn.Fn
				}
				PriceClass?: (string & ("PriceClass_100" | "PriceClass_200" | "PriceClass_All")) | fn.Fn
				S3Origin: {
					DomainName:           string | fn.Fn
					OriginAccessIdentity: string | fn.Fn
				}
				TrustedSigners: {
					AwsAccountNumbers?: [...(string | fn.Fn)] | fn.Fn
					Enabled:            bool | fn.Fn
				}
			}
			Tags: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

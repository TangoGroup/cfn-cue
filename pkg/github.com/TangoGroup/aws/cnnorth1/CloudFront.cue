package cnnorth1

import "github.com/TangoGroup/aws/fn"

#CloudFront: {
	#CachePolicy: {
		Type: "AWS::CloudFront::CachePolicy"
		Properties: CachePolicyConfig: {
			Comment?:                                 string | fn.#Fn
			DefaultTTL:                               number | fn.#Fn
			MaxTTL:                                   number | fn.#Fn
			MinTTL:                                   number | fn.#Fn
			Name:                                     string | fn.#Fn
			ParametersInCacheKeyAndForwardedToOrigin: {
				CookiesConfig: {
					CookieBehavior: string | fn.#Fn
					Cookies?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.If
				EnableAcceptEncodingBrotli?: bool | fn.#Fn
				EnableAcceptEncodingGzip:    bool | fn.#Fn
				HeadersConfig:               {
					HeaderBehavior: string | fn.#Fn
					Headers?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.If
				QueryStringsConfig: {
					QueryStringBehavior: string | fn.#Fn
					QueryStrings?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.If
			} | fn.If
		} | fn.If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#OriginRequestPolicy: {
		Type: "AWS::CloudFront::OriginRequestPolicy"
		Properties: OriginRequestPolicyConfig: {
			Comment?:      string | fn.#Fn
			CookiesConfig: {
				CookieBehavior: string | fn.#Fn
				Cookies?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.If
			HeadersConfig: {
				HeaderBehavior: string | fn.#Fn
				Headers?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.If
			Name:               string | fn.#Fn
			QueryStringsConfig: {
				QueryStringBehavior: string | fn.#Fn
				QueryStrings?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.If
		} | fn.If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#RealtimeLogConfig: {
		Type: "AWS::CloudFront::RealtimeLogConfig"
		Properties: {
			EndPoints: [...{
				KinesisStreamConfig: {
					RoleArn:   string | fn.#Fn
					StreamArn: string | fn.#Fn
				} | fn.If
				StreamType: string | fn.#Fn
			}] | fn.If
			Fields:       [...(string | fn.#Fn)] | (string | fn.#Fn)
			Name:         string | fn.#Fn
			SamplingRate: number | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package mesouth1

import "github.com/TangoGroup/aws/fn"

CloudFront :: {
	CachePolicy :: {
		Type:       "AWS::CloudFront::CachePolicy"
		Properties: close({
			CachePolicyConfig: close({
				Comment?:                                 string | fn.Fn
				DefaultTTL:                               number | fn.Fn
				MaxTTL:                                   number | fn.Fn
				MinTTL:                                   number | fn.Fn
				Name:                                     string | fn.Fn
				ParametersInCacheKeyAndForwardedToOrigin: close({
					CookiesConfig: close({
						CookieBehavior: string | fn.Fn
						Cookies?:       [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					EnableAcceptEncodingBrotli?: bool | fn.Fn
					EnableAcceptEncodingGzip:    bool | fn.Fn
					HeadersConfig:               close({
						HeaderBehavior: string | fn.Fn
						Headers?:       [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					QueryStringsConfig: close({
						QueryStringBehavior: string | fn.Fn
						QueryStrings?:       [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	KeyGroup :: {
		Type:       "AWS::CloudFront::KeyGroup"
		Properties: close({
			KeyGroupConfig: close({
				Comment?: string | fn.Fn
				Items:    [...(string | fn.Fn)] | (string | fn.Fn)
				Name:     string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	OriginRequestPolicy :: {
		Type:       "AWS::CloudFront::OriginRequestPolicy"
		Properties: close({
			OriginRequestPolicyConfig: close({
				Comment?:      string | fn.Fn
				CookiesConfig: close({
					CookieBehavior: string | fn.Fn
					Cookies?:       [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				HeadersConfig: close({
					HeaderBehavior: string | fn.Fn
					Headers?:       [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				Name:               string | fn.Fn
				QueryStringsConfig: close({
					QueryStringBehavior: string | fn.Fn
					QueryStrings?:       [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PublicKey :: {
		Type:       "AWS::CloudFront::PublicKey"
		Properties: close({
			PublicKeyConfig: close({
				CallerReference: string | fn.Fn
				Comment?:        string | fn.Fn
				EncodedKey:      string | fn.Fn
				Name:            string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RealtimeLogConfig :: {
		Type:       "AWS::CloudFront::RealtimeLogConfig"
		Properties: close({
			EndPoints: [...close({
				KinesisStreamConfig: close({
					RoleArn:   string | fn.Fn
					StreamArn: string | fn.Fn
				}) | fn.If
				StreamType: string | fn.Fn
			})] | fn.If
			Fields:       [...(string | fn.Fn)] | (string | fn.Fn)
			Name:         string | fn.Fn
			SamplingRate: number | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

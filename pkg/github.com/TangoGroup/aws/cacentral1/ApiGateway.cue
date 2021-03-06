package cacentral1

import "github.com/TangoGroup/aws/fn"

ApiGateway :: {
	Account :: {
		Type:       "AWS::ApiGateway::Account"
		Properties: close({
			CloudWatchRoleArn?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ApiKey :: {
		Type:       "AWS::ApiGateway::ApiKey"
		Properties: close({
			CustomerId?:         string | fn.Fn
			Description?:        string | fn.Fn
			Enabled?:            bool | fn.Fn
			GenerateDistinctId?: bool | fn.Fn
			Name?:               string | fn.Fn
			StageKeys?:          [...close({
				RestApiId?: string | fn.Fn
				StageName?: string | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Value?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Authorizer :: {
		Type:       "AWS::ApiGateway::Authorizer"
		Properties: close({
			AuthType?:                     string | fn.Fn
			AuthorizerCredentials?:        string | fn.Fn
			AuthorizerResultTtlInSeconds?: (>=0 & <=3600) | fn.Fn
			AuthorizerUri?:                string | fn.Fn
			IdentitySource?:               string | fn.Fn
			IdentityValidationExpression?: string | fn.Fn
			Name?:                         string | fn.Fn
			ProviderARNs?:                 [...(string | fn.Fn)] | (string | fn.Fn)
			RestApiId:                     string | fn.Fn
			Type:                          ("COGNITO_USER_POOLS" | "REQUEST" | "TOKEN") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	BasePathMapping :: {
		Type:       "AWS::ApiGateway::BasePathMapping"
		Properties: close({
			BasePath?:  string | fn.Fn
			DomainName: string | fn.Fn
			RestApiId?: string | fn.Fn
			Stage?:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ClientCertificate :: {
		Type:       "AWS::ApiGateway::ClientCertificate"
		Properties: close({
			Description?: string | fn.Fn
			Tags?:        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Deployment :: {
		Type:       "AWS::ApiGateway::Deployment"
		Properties: close({
			DeploymentCanarySettings?: close({
				PercentTraffic?:         number | fn.Fn
				StageVariableOverrides?: {
					[string]: string | fn.Fn
				} | fn.If
				UseStageCache?: bool | fn.Fn
			}) | fn.If
			Description?:      string | fn.Fn
			RestApiId:         string | fn.Fn
			StageDescription?: close({
				AccessLogSetting?: close({
					DestinationArn?: string | fn.Fn
					Format?:         string | fn.Fn
				}) | fn.If
				CacheClusterEnabled?: bool | fn.Fn
				CacheClusterSize?:    string | fn.Fn
				CacheDataEncrypted?:  bool | fn.Fn
				CacheTtlInSeconds?:   int | fn.Fn
				CachingEnabled?:      bool | fn.Fn
				CanarySetting?:       close({
					PercentTraffic?:         number | fn.Fn
					StageVariableOverrides?: {
						[string]: string | fn.Fn
					} | fn.If
					UseStageCache?: bool | fn.Fn
				}) | fn.If
				ClientCertificateId?:  string | fn.Fn
				DataTraceEnabled?:     bool | fn.Fn
				Description?:          string | fn.Fn
				DocumentationVersion?: string | fn.Fn
				LoggingLevel?:         string | fn.Fn
				MethodSettings?:       [...close({
					CacheDataEncrypted?:   bool | fn.Fn
					CacheTtlInSeconds?:    int | fn.Fn
					CachingEnabled?:       bool | fn.Fn
					DataTraceEnabled?:     bool | fn.Fn
					HttpMethod?:           string | fn.Fn
					LoggingLevel?:         string | fn.Fn
					MetricsEnabled?:       bool | fn.Fn
					ResourcePath?:         string | fn.Fn
					ThrottlingBurstLimit?: int | fn.Fn
					ThrottlingRateLimit?:  number | fn.Fn
				})] | fn.If
				MetricsEnabled?: bool | fn.Fn
				Tags?:           [...close({
					Key:   string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
				ThrottlingBurstLimit?: int | fn.Fn
				ThrottlingRateLimit?:  number | fn.Fn
				TracingEnabled?:       bool | fn.Fn
				Variables?:            {
					[string]: string | fn.Fn
				} | fn.If
			}) | fn.If
			StageName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DocumentationPart :: {
		Type:       "AWS::ApiGateway::DocumentationPart"
		Properties: close({
			Location: close({
				Method?:     string | fn.Fn
				Name?:       string | fn.Fn
				Path?:       string | fn.Fn
				StatusCode?: string | fn.Fn
				Type?:       string | fn.Fn
			}) | fn.If
			Properties: string | fn.Fn
			RestApiId:  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DocumentationVersion :: {
		Type:       "AWS::ApiGateway::DocumentationVersion"
		Properties: close({
			Description?:         string | fn.Fn
			DocumentationVersion: string | fn.Fn
			RestApiId:            string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DomainName :: {
		Type:       "AWS::ApiGateway::DomainName"
		Properties: close({
			CertificateArn?:        string | fn.Fn
			DomainName?:            string | fn.Fn
			EndpointConfiguration?: close({
				Types?: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			MutualTlsAuthentication?: close({
				TruststoreUri?:     string | fn.Fn
				TruststoreVersion?: string | fn.Fn
			}) | fn.If
			RegionalCertificateArn?: string | fn.Fn
			SecurityPolicy?:         string | fn.Fn
			Tags?:                   [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GatewayResponse :: {
		Type:       "AWS::ApiGateway::GatewayResponse"
		Properties: close({
			ResponseParameters?: {
				[string]: string | fn.Fn
			} | fn.If
			ResponseTemplates?: {
				[string]: string | fn.Fn
			} | fn.If
			ResponseType: ("ACCESS_DENIED" | "API_CONFIGURATION_ERROR" | "AUTHORIZER_CONFIGURATION_ERROR" | "AUTHORIZER_FAILURE" | "BAD_REQUEST_BODY" | "BAD_REQUEST_PARAMETERS" | "DEFAULT_4XX" | "DEFAULT_5XX" | "EXPIRED_TOKEN" | "INTEGRATION_FAILURE" | "INTEGRATION_TIMEOUT" | "INVALID_API_KEY" | "INVALID_SIGNATURE" | "MISSING_AUTHENTICATION_TOKEN" | "QUOTA_EXCEEDED" | "REQUEST_TOO_LARGE" | "RESOURCE_NOT_FOUND" | "THROTTLED" | "UNAUTHORIZED" | "UNSUPPORTED_MEDIA_TYPE") | fn.Fn
			RestApiId:    string | fn.Fn
			StatusCode?:  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Method :: {
		Type:       "AWS::ApiGateway::Method"
		Properties: close({
			ApiKeyRequired?:      bool | fn.Fn
			AuthorizationScopes?: [...(string | fn.Fn)] | (string | fn.Fn)
			AuthorizationType?:   string | fn.Fn
			AuthorizerId?:        string | fn.Fn
			HttpMethod:           string | fn.Fn
			Integration?:         close({
				CacheKeyParameters?:    [...(string | fn.Fn)] | (string | fn.Fn)
				CacheNamespace?:        string | fn.Fn
				ConnectionId?:          string | fn.Fn
				ConnectionType?:        string | fn.Fn
				ContentHandling?:       string | fn.Fn
				Credentials?:           string | fn.Fn
				IntegrationHttpMethod?: string | fn.Fn
				IntegrationResponses?:  [...close({
					ContentHandling?:    string | fn.Fn
					ResponseParameters?: {
						[string]: string | fn.Fn
					} | fn.If
					ResponseTemplates?: {
						[string]: string | fn.Fn
					} | fn.If
					SelectionPattern?: string | fn.Fn
					StatusCode:        string | fn.Fn
				})] | fn.If
				PassthroughBehavior?: string | fn.Fn
				RequestParameters?:   {
					[string]: string | fn.Fn
				} | fn.If
				RequestTemplates?: {
					[string]: string | fn.Fn
				} | fn.If
				TimeoutInMillis?: int | fn.Fn
				Type?:            string | fn.Fn
				Uri?:             string | fn.Fn
			}) | fn.If
			MethodResponses?: [...close({
				ResponseModels?: {
					[string]: string | fn.Fn
				} | fn.If
				ResponseParameters?: {
					[string]: bool | fn.Fn
				} | fn.If
				StatusCode: string | fn.Fn
			})] | fn.If
			OperationName?: string | fn.Fn
			RequestModels?: {
				[string]: string | fn.Fn
			} | fn.If
			RequestParameters?: {
				[string]: bool | fn.Fn
			} | fn.If
			RequestValidatorId?: string | fn.Fn
			ResourceId:          string | fn.Fn
			RestApiId:           string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Model :: {
		Type:       "AWS::ApiGateway::Model"
		Properties: close({
			ContentType?: string | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			RestApiId:    string | fn.Fn
			Schema?:      {
				[string]: _
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RequestValidator :: {
		Type:       "AWS::ApiGateway::RequestValidator"
		Properties: close({
			Name?:                      string | fn.Fn
			RestApiId:                  string | fn.Fn
			ValidateRequestBody?:       bool | fn.Fn
			ValidateRequestParameters?: bool | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Resource :: {
		Type:       "AWS::ApiGateway::Resource"
		Properties: close({
			ParentId:  string | fn.Fn
			PathPart:  string | fn.Fn
			RestApiId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RestApi :: {
		Type:       "AWS::ApiGateway::RestApi"
		Properties: close({
			ApiKeySourceType?: ("AUTHORIZER" | "HEADER") | fn.Fn
			BinaryMediaTypes?: [...(string | fn.Fn)] | (string | fn.Fn)
			Body?:             {
				[string]: _
			} | fn.Fn
			BodyS3Location?: close({
				Bucket?:  string | fn.Fn
				ETag?:    string | fn.Fn
				Key?:     string | fn.Fn
				Version?: string | fn.Fn
			}) | fn.If
			CloneFrom?:                 string | fn.Fn
			Description?:               string | fn.Fn
			DisableExecuteApiEndpoint?: bool | fn.Fn
			EndpointConfiguration?:     close({
				Types?:          [...(string | fn.Fn)] | (string | fn.Fn)
				VpcEndpointIds?: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			FailOnWarnings?:         bool | fn.Fn
			MinimumCompressionSize?: int | fn.Fn
			Name?:                   string | fn.Fn
			Parameters?:             {
				[string]: string | fn.Fn
			} | fn.If
			Policy?: {
				[string]: _
			} | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Stage :: {
		Type:       "AWS::ApiGateway::Stage"
		Properties: close({
			AccessLogSetting?: close({
				DestinationArn?: string | fn.Fn
				Format?:         string | fn.Fn
			}) | fn.If
			CacheClusterEnabled?: bool | fn.Fn
			CacheClusterSize?:    string | fn.Fn
			CanarySetting?:       close({
				DeploymentId?:           string | fn.Fn
				PercentTraffic?:         number | fn.Fn
				StageVariableOverrides?: {
					[string]: string | fn.Fn
				} | fn.If
				UseStageCache?: bool | fn.Fn
			}) | fn.If
			ClientCertificateId?:  string | fn.Fn
			DeploymentId?:         string | fn.Fn
			Description?:          string | fn.Fn
			DocumentationVersion?: string | fn.Fn
			MethodSettings?:       [...close({
				CacheDataEncrypted?:   bool | fn.Fn
				CacheTtlInSeconds?:    int | fn.Fn
				CachingEnabled?:       bool | fn.Fn
				DataTraceEnabled?:     bool | fn.Fn
				HttpMethod?:           string | fn.Fn
				LoggingLevel?:         string | fn.Fn
				MetricsEnabled?:       bool | fn.Fn
				ResourcePath?:         string | fn.Fn
				ThrottlingBurstLimit?: int | fn.Fn
				ThrottlingRateLimit?:  number | fn.Fn
			})] | fn.If
			RestApiId:  string | fn.Fn
			StageName?: string | fn.Fn
			Tags?:      [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TracingEnabled?: bool | fn.Fn
			Variables?:      {
				[string]: string | fn.Fn
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UsagePlan :: {
		Type:       "AWS::ApiGateway::UsagePlan"
		Properties: close({
			ApiStages?: [...close({
				ApiId?:    string | fn.Fn
				Stage?:    string | fn.Fn
				Throttle?: {
					[string]: close({
						BurstLimit?: int | fn.Fn
						RateLimit?:  number | fn.Fn
					})
				} | fn.If
			})] | fn.If
			Description?: string | fn.Fn
			Quota?:       close({
				Limit?:  int | fn.Fn
				Offset?: int | fn.Fn
				Period?: string | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Throttle?: close({
				BurstLimit?: int | fn.Fn
				RateLimit?:  number | fn.Fn
			}) | fn.If
			UsagePlanName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	UsagePlanKey :: {
		Type:       "AWS::ApiGateway::UsagePlanKey"
		Properties: close({
			KeyId:       string | fn.Fn
			KeyType:     ("API_KEY") | fn.Fn
			UsagePlanId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	VpcLink :: {
		Type:       "AWS::ApiGateway::VpcLink"
		Properties: close({
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			TargetArns:   [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

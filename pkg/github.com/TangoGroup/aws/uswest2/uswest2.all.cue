package uswest2

import (
	"time"
	"github.com/TangoGroup/aws/regions"
	"strings"
	"list"
)

ResourceSpecificationVersion :: "9.1.0"
Template :: {
	ASK :: {
		Skill :: {
			Type: "Alexa::ASK::Skill"
			Properties: {
				AuthenticationConfiguration: {
					ClientId:     string | fn.Fn
					ClientSecret: string | fn.Fn
					RefreshToken: string | fn.Fn
				}
				SkillPackage: {
					Overrides?: Manifest?: {
						[string]: _
					} | fn.Fn
					S3Bucket:         string | fn.Fn
					S3BucketRole?:    string | fn.Fn
					S3Key:            string | fn.Fn
					S3ObjectVersion?: string | fn.Fn
				}
				VendorId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	AmazonMQ :: {
		Broker :: {
			Type: "AWS::AmazonMQ::Broker"
			Properties: {
				AutoMinorVersionUpgrade: bool | fn.Fn
				BrokerName:              string | fn.Fn
				Configuration?: {
					Id:       string | fn.Fn
					Revision: int | fn.Fn
				}
				DeploymentMode: (string & ("ACTIVE_STANDBY_MULTI_AZ" | "SINGLE_INSTANCE")) | fn.Fn
				EncryptionOptions?: {
					KmsKeyId?:      string | fn.Fn
					UseAwsOwnedKey: bool | fn.Fn
				}
				EngineType:       (string & ("ACTIVEMQ")) | fn.Fn
				EngineVersion:    (string & ("5.15.0" | "5.15.6" | "5.15.8" | "5.15.9")) | fn.Fn
				HostInstanceType: (string & ("mq.m4.large" | "mq.m5.2xlarge" | "mq.m5.4xlarge" | "mq.m5.large" | "mq.m5.xlarge" | "mq.t2.micro")) | fn.Fn
				Logs?: {
					Audit?:   bool | fn.Fn
					General?: bool | fn.Fn
				}
				MaintenanceWindowStartTime?: {
					DayOfWeek: string | fn.Fn
					TimeOfDay: string | fn.Fn
					TimeZone:  string | fn.Fn
				}
				PubliclyAccessible: bool | fn.Fn
				SecurityGroups?:    [...(string | fn.Fn)] | fn.Fn
				StorageType?:       string | fn.Fn
				SubnetIds?:         [...(string | fn.Fn)] | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Users: [...{
					ConsoleAccess?: bool | fn.Fn
					Groups?:        [...(string | fn.Fn)] | fn.Fn
					Password:       string | fn.Fn
					Username:       string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Configuration :: {
			Type: "AWS::AmazonMQ::Configuration"
			Properties: {
				Data:          string | fn.Fn
				Description?:  string | fn.Fn
				EngineType:    (string & ("ACTIVEMQ")) | fn.Fn
				EngineVersion: (string & ("5.15.0" | "5.15.6" | "5.15.8" | "5.15.9")) | fn.Fn
				Name:          string | fn.Fn
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
		ConfigurationAssociation :: {
			Type: "AWS::AmazonMQ::ConfigurationAssociation"
			Properties: {
				Broker: string | fn.Fn
				Configuration: {
					Id:       string | fn.Fn
					Revision: int | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Amplify :: {
		App :: {
			Type: "AWS::Amplify::App"
			Properties: {
				AccessToken?: string | fn.Fn
				AutoBranchCreationConfig?: {
					AutoBranchCreationPatterns?: [...(string | fn.Fn)] | fn.Fn
					BasicAuthConfig?: {
						EnableBasicAuth?: bool | fn.Fn
						Password?:        string | fn.Fn
						Username?:        string | fn.Fn
					}
					BuildSpec?:                string | fn.Fn
					EnableAutoBranchCreation?: bool | fn.Fn
					EnableAutoBuild?:          bool | fn.Fn
					EnablePullRequestPreview?: bool | fn.Fn
					EnvironmentVariables?: [...{
						Name:  string | fn.Fn
						Value: string | fn.Fn
					}]
					PullRequestEnvironmentName?: string | fn.Fn
					Stage?:                      string | fn.Fn
				}
				BasicAuthConfig?: {
					EnableBasicAuth?: bool | fn.Fn
					Password?:        string | fn.Fn
					Username?:        string | fn.Fn
				}
				BuildSpec?: string | fn.Fn
				CustomRules?: [...{
					Condition?: string | fn.Fn
					Source:     string | fn.Fn
					Status?:    string | fn.Fn
					Target:     string | fn.Fn
				}]
				Description?: string | fn.Fn
				EnvironmentVariables?: [...{
					Name:  string | fn.Fn
					Value: string | fn.Fn
				}]
				IAMServiceRole?: string | fn.Fn
				Name:            string | fn.Fn
				OauthToken?:     string | fn.Fn
				Repository?:     string | fn.Fn
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
		Branch :: {
			Type: "AWS::Amplify::Branch"
			Properties: {
				AppId: string | fn.Fn
				BasicAuthConfig?: {
					EnableBasicAuth?: bool | fn.Fn
					Password:         string | fn.Fn
					Username:         string | fn.Fn
				}
				BranchName:                string | fn.Fn
				BuildSpec?:                string | fn.Fn
				Description?:              string | fn.Fn
				EnableAutoBuild?:          bool | fn.Fn
				EnablePullRequestPreview?: bool | fn.Fn
				EnvironmentVariables?: [...{
					Name:  string | fn.Fn
					Value: string | fn.Fn
				}]
				PullRequestEnvironmentName?: string | fn.Fn
				Stage?:                      string | fn.Fn
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
		Domain :: {
			Type: "AWS::Amplify::Domain"
			Properties: {
				AppId:      string | fn.Fn
				DomainName: string | fn.Fn
				SubDomainSettings: [...{
					BranchName: string | fn.Fn
					Prefix:     string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ApiGateway :: {
		Account :: {
			Type: "AWS::ApiGateway::Account"
			Properties: CloudWatchRoleArn?: string | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApiKey :: {
			Type: "AWS::ApiGateway::ApiKey"
			Properties: {
				CustomerId?:         string | fn.Fn
				Description?:        string | fn.Fn
				Enabled?:            bool | fn.Fn
				GenerateDistinctId?: bool | fn.Fn
				Name?:               string | fn.Fn
				StageKeys?: [...{
					RestApiId?: string | fn.Fn
					StageName?: string | fn.Fn
				}]
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Value?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Authorizer :: {
			Type: "AWS::ApiGateway::Authorizer"
			Properties: {
				AuthType?:                     string | fn.Fn
				AuthorizerCredentials?:        string | fn.Fn
				AuthorizerResultTtlInSeconds?: (int & (>=0 & <=3600)) | fn.Fn
				AuthorizerUri?:                string | fn.Fn
				IdentitySource?:               string | fn.Fn
				IdentityValidationExpression?: string | fn.Fn
				Name?:                         string | fn.Fn
				ProviderARNs?:                 [...(string | fn.Fn)] | fn.Fn
				RestApiId:                     string | fn.Fn
				Type:                          (string & ("COGNITO_USER_POOLS" | "REQUEST" | "TOKEN")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		BasePathMapping :: {
			Type: "AWS::ApiGateway::BasePathMapping"
			Properties: {
				BasePath?:  string | fn.Fn
				DomainName: string | fn.Fn
				RestApiId?: string | fn.Fn
				Stage?:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ClientCertificate :: {
			Type: "AWS::ApiGateway::ClientCertificate"
			Properties: {
				Description?: string | fn.Fn
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
		Deployment :: {
			Type: "AWS::ApiGateway::Deployment"
			Properties: {
				DeploymentCanarySettings?: {
					PercentTraffic?: float | fn.Fn
					StageVariableOverrides?: [string]: string | fn.Fn
					UseStageCache?: bool | fn.Fn
				}
				Description?: string | fn.Fn
				RestApiId:    string | fn.Fn
				StageDescription?: {
					AccessLogSetting?: {
						DestinationArn?: string | fn.Fn
						Format?:         string | fn.Fn
					}
					CacheClusterEnabled?: bool | fn.Fn
					CacheClusterSize?:    string | fn.Fn
					CacheDataEncrypted?:  bool | fn.Fn
					CacheTtlInSeconds?:   int | fn.Fn
					CachingEnabled?:      bool | fn.Fn
					CanarySetting?: {
						PercentTraffic?: float | fn.Fn
						StageVariableOverrides?: [string]: string | fn.Fn
						UseStageCache?: bool | fn.Fn
					}
					ClientCertificateId?:  string | fn.Fn
					DataTraceEnabled?:     bool | fn.Fn
					Description?:          string | fn.Fn
					DocumentationVersion?: string | fn.Fn
					LoggingLevel?:         string | fn.Fn
					MethodSettings?: [...{
						CacheDataEncrypted?:   bool | fn.Fn
						CacheTtlInSeconds?:    int | fn.Fn
						CachingEnabled?:       bool | fn.Fn
						DataTraceEnabled?:     bool | fn.Fn
						HttpMethod?:           string | fn.Fn
						LoggingLevel?:         string | fn.Fn
						MetricsEnabled?:       bool | fn.Fn
						ResourcePath?:         string | fn.Fn
						ThrottlingBurstLimit?: int | fn.Fn
						ThrottlingRateLimit?:  float | fn.Fn
					}]
					MetricsEnabled?: bool | fn.Fn
					Tags?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
					ThrottlingBurstLimit?: int | fn.Fn
					ThrottlingRateLimit?:  float | fn.Fn
					TracingEnabled?:       bool | fn.Fn
					Variables?: [string]: string | fn.Fn
				}
				StageName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DocumentationPart :: {
			Type: "AWS::ApiGateway::DocumentationPart"
			Properties: {
				Location: {
					Method?:     string | fn.Fn
					Name?:       string | fn.Fn
					Path?:       string | fn.Fn
					StatusCode?: string | fn.Fn
					Type?:       string | fn.Fn
				}
				Properties: string | fn.Fn
				RestApiId:  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DocumentationVersion :: {
			Type: "AWS::ApiGateway::DocumentationVersion"
			Properties: {
				Description?:         string | fn.Fn
				DocumentationVersion: string | fn.Fn
				RestApiId:            string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DomainName :: {
			Type: "AWS::ApiGateway::DomainName"
			Properties: {
				CertificateArn?: string | fn.Fn
				DomainName:      string | fn.Fn
				EndpointConfiguration?: Types?: [...(string | fn.Fn)] | fn.Fn
				RegionalCertificateArn?: string | fn.Fn
				SecurityPolicy?:         string | fn.Fn
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
		GatewayResponse :: {
			Type: "AWS::ApiGateway::GatewayResponse"
			Properties: {
				ResponseParameters?: [string]: string | fn.Fn
				ResponseTemplates?: [string]:  string | fn.Fn
				ResponseType: (string & ("ACCESS_DENIED" | "API_CONFIGURATION_ERROR" | "AUTHORIZER_FAILURE" | "AUTHORIZER_CONFIGURATION_ERROR" | "BAD_REQUEST_PARAMETERS" | "BAD_REQUEST_BODY" | "DEFAULT_4XX" | "DEFAULT_5XX" | "EXPIRED_TOKEN" | "INVALID_SIGNATURE" | "INTEGRATION_FAILURE" | "INTEGRATION_TIMEOUT" | "INVALID_API_KEY" | "MISSING_AUTHENTICATION_TOKEN" | "QUOTA_EXCEEDED" | "REQUEST_TOO_LARGE" | "RESOURCE_NOT_FOUND" | "THROTTLED" | "UNAUTHORIZED" | "UNSUPPORTED_MEDIA_TYPE")) | fn.Fn
				RestApiId:    string | fn.Fn
				StatusCode?:  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Method :: {
			Type: "AWS::ApiGateway::Method"
			Properties: {
				ApiKeyRequired?:      bool | fn.Fn
				AuthorizationScopes?: [...(string | fn.Fn)] | fn.Fn
				AuthorizationType?:   string | fn.Fn
				AuthorizerId?:        string | fn.Fn
				HttpMethod:           string | fn.Fn
				Integration?: {
					CacheKeyParameters?:    [...(string | fn.Fn)] | fn.Fn
					CacheNamespace?:        string | fn.Fn
					ConnectionId?:          string | fn.Fn
					ConnectionType?:        string | fn.Fn
					ContentHandling?:       string | fn.Fn
					Credentials?:           string | fn.Fn
					IntegrationHttpMethod?: string | fn.Fn
					IntegrationResponses?: [...{
						ContentHandling?: string | fn.Fn
						ResponseParameters?: [string]: string | fn.Fn
						ResponseTemplates?: [string]:  string | fn.Fn
						SelectionPattern?: string | fn.Fn
						StatusCode:        string | fn.Fn
					}]
					PassthroughBehavior?: string | fn.Fn
					RequestParameters?: [string]: string | fn.Fn
					RequestTemplates?: [string]:  string | fn.Fn
					TimeoutInMillis?: int | fn.Fn
					Type?:            string | fn.Fn
					Uri?:             string | fn.Fn
				}
				MethodResponses?: [...{
					ResponseModels?: [string]:     string | fn.Fn
					ResponseParameters?: [string]: bool | fn.Fn
					StatusCode: string | fn.Fn
				}]
				OperationName?: string | fn.Fn
				RequestModels?: [string]:     string | fn.Fn
				RequestParameters?: [string]: bool | fn.Fn
				RequestValidatorId?: string | fn.Fn
				ResourceId:          string | fn.Fn
				RestApiId:           string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Model :: {
			Type: "AWS::ApiGateway::Model"
			Properties: {
				ContentType?: string | fn.Fn
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				RestApiId:    string | fn.Fn
				Schema?:      {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RequestValidator :: {
			Type: "AWS::ApiGateway::RequestValidator"
			Properties: {
				Name?:                      string | fn.Fn
				RestApiId:                  string | fn.Fn
				ValidateRequestBody?:       bool | fn.Fn
				ValidateRequestParameters?: bool | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Resource :: {
			Type: "AWS::ApiGateway::Resource"
			Properties: {
				ParentId:  string | fn.Fn
				PathPart:  string | fn.Fn
				RestApiId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RestApi :: {
			Type: "AWS::ApiGateway::RestApi"
			Properties: {
				ApiKeySourceType?: (string & ("AUTHORIZER" | "HEADER")) | fn.Fn
				BinaryMediaTypes?: [...(string | fn.Fn)] | fn.Fn
				Body?:             {
					[string]: _
				} | fn.Fn
				BodyS3Location?: {
					Bucket?:  string | fn.Fn
					ETag?:    string | fn.Fn
					Key?:     string | fn.Fn
					Version?: string | fn.Fn
				}
				CloneFrom?:   string | fn.Fn
				Description?: string | fn.Fn
				EndpointConfiguration?: {
					Types?:          [...(string | fn.Fn)] | fn.Fn
					VpcEndpointIds?: [...(string | fn.Fn)] | fn.Fn
				}
				FailOnWarnings?:         bool | fn.Fn
				MinimumCompressionSize?: int | fn.Fn
				Name?:                   string | fn.Fn
				Parameters?: [string]: string | fn.Fn
				Policy?: {
					[string]: _
				} | fn.Fn
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
		Stage :: {
			Type: "AWS::ApiGateway::Stage"
			Properties: {
				AccessLogSetting?: {
					DestinationArn?: string | fn.Fn
					Format?:         string | fn.Fn
				}
				CacheClusterEnabled?: bool | fn.Fn
				CacheClusterSize?:    string | fn.Fn
				CanarySetting?: {
					DeploymentId?:   string | fn.Fn
					PercentTraffic?: float | fn.Fn
					StageVariableOverrides?: [string]: string | fn.Fn
					UseStageCache?: bool | fn.Fn
				}
				ClientCertificateId?:  string | fn.Fn
				DeploymentId?:         string | fn.Fn
				Description?:          string | fn.Fn
				DocumentationVersion?: string | fn.Fn
				MethodSettings?: [...{
					CacheDataEncrypted?:   bool | fn.Fn
					CacheTtlInSeconds?:    int | fn.Fn
					CachingEnabled?:       bool | fn.Fn
					DataTraceEnabled?:     bool | fn.Fn
					HttpMethod?:           string | fn.Fn
					LoggingLevel?:         string | fn.Fn
					MetricsEnabled?:       bool | fn.Fn
					ResourcePath?:         string | fn.Fn
					ThrottlingBurstLimit?: int | fn.Fn
					ThrottlingRateLimit?:  float | fn.Fn
				}]
				RestApiId:  string | fn.Fn
				StageName?: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TracingEnabled?: bool | fn.Fn
				Variables?: [string]: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UsagePlan :: {
			Type: "AWS::ApiGateway::UsagePlan"
			Properties: {
				ApiStages?: [...{
					ApiId?: string | fn.Fn
					Stage?: string | fn.Fn
					Throttle?: [string]: {
						BurstLimit?: int | fn.Fn
						RateLimit?:  float | fn.Fn
					}
				}]
				Description?: string | fn.Fn
				Quota?: {
					Limit?:  int | fn.Fn
					Offset?: int | fn.Fn
					Period?: string | fn.Fn
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Throttle?: {
					BurstLimit?: int | fn.Fn
					RateLimit?:  float | fn.Fn
				}
				UsagePlanName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UsagePlanKey :: {
			Type: "AWS::ApiGateway::UsagePlanKey"
			Properties: {
				KeyId:       string | fn.Fn
				KeyType:     (string & ("API_KEY")) | fn.Fn
				UsagePlanId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VpcLink :: {
			Type: "AWS::ApiGateway::VpcLink"
			Properties: {
				Description?: string | fn.Fn
				Name:         string | fn.Fn
				TargetArns:   [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ApiGatewayV2 :: {
		Api :: {
			Type: "AWS::ApiGatewayV2::Api"
			Properties: {
				ApiKeySelectionExpression?: string | fn.Fn
				Description?:               string | fn.Fn
				DisableSchemaValidation?:   bool | fn.Fn
				Name:                       string | fn.Fn
				ProtocolType:               string | fn.Fn
				RouteSelectionExpression:   string | fn.Fn
				Tags?:                      {
					[string]: _
				} | fn.Fn
				Version?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApiMapping :: {
			Type: "AWS::ApiGatewayV2::ApiMapping"
			Properties: {
				ApiId:          string | fn.Fn
				ApiMappingKey?: string | fn.Fn
				DomainName:     string | fn.Fn
				Stage:          string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Authorizer :: {
			Type: "AWS::ApiGatewayV2::Authorizer"
			Properties: {
				ApiId:                         string | fn.Fn
				AuthorizerCredentialsArn?:     string | fn.Fn
				AuthorizerResultTtlInSeconds?: int | fn.Fn
				AuthorizerType:                string | fn.Fn
				AuthorizerUri:                 string | fn.Fn
				IdentitySource:                [...(string | fn.Fn)] | fn.Fn
				IdentityValidationExpression?: string | fn.Fn
				Name:                          string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Deployment :: {
			Type: "AWS::ApiGatewayV2::Deployment"
			Properties: {
				ApiId:        string | fn.Fn
				Description?: string | fn.Fn
				StageName?:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DomainName :: {
			Type: "AWS::ApiGatewayV2::DomainName"
			Properties: {
				DomainName: string | fn.Fn
				DomainNameConfigurations?: [...{
					CertificateArn?:  string | fn.Fn
					CertificateName?: string | fn.Fn
					EndpointType?:    string | fn.Fn
				}]
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Integration :: {
			Type: "AWS::ApiGatewayV2::Integration"
			Properties: {
				ApiId:                    string | fn.Fn
				ConnectionType?:          string | fn.Fn
				ContentHandlingStrategy?: string | fn.Fn
				CredentialsArn?:          string | fn.Fn
				Description?:             string | fn.Fn
				IntegrationMethod?:       string | fn.Fn
				IntegrationType:          string | fn.Fn
				IntegrationUri?:          string | fn.Fn
				PassthroughBehavior?:     string | fn.Fn
				RequestParameters?:       {
					[string]: _
				} | fn.Fn
				RequestTemplates?: {
					[string]: _
				} | fn.Fn
				TemplateSelectionExpression?: string | fn.Fn
				TimeoutInMillis?:             int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		IntegrationResponse :: {
			Type: "AWS::ApiGatewayV2::IntegrationResponse"
			Properties: {
				ApiId:                    string | fn.Fn
				ContentHandlingStrategy?: string | fn.Fn
				IntegrationId:            string | fn.Fn
				IntegrationResponseKey:   string | fn.Fn
				ResponseParameters?:      {
					[string]: _
				} | fn.Fn
				ResponseTemplates?: {
					[string]: _
				} | fn.Fn
				TemplateSelectionExpression?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Model :: {
			Type: "AWS::ApiGatewayV2::Model"
			Properties: {
				ApiId:        string | fn.Fn
				ContentType?: string | fn.Fn
				Description?: string | fn.Fn
				Name:         string | fn.Fn
				Schema:       {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Route :: {
			Type: "AWS::ApiGatewayV2::Route"
			Properties: {
				ApiId:                     string | fn.Fn
				ApiKeyRequired?:           bool | fn.Fn
				AuthorizationScopes?:      [...(string | fn.Fn)] | fn.Fn
				AuthorizationType?:        string | fn.Fn
				AuthorizerId?:             string | fn.Fn
				ModelSelectionExpression?: string | fn.Fn
				OperationName?:            string | fn.Fn
				RequestModels?:            {
					[string]: _
				} | fn.Fn
				RequestParameters?: {
					[string]: _
				} | fn.Fn
				RouteKey:                          string | fn.Fn
				RouteResponseSelectionExpression?: string | fn.Fn
				Target?:                           string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RouteResponse :: {
			Type: "AWS::ApiGatewayV2::RouteResponse"
			Properties: {
				ApiId:                     string | fn.Fn
				ModelSelectionExpression?: string | fn.Fn
				ResponseModels?:           {
					[string]: _
				} | fn.Fn
				ResponseParameters?: {
					[string]: _
				} | fn.Fn
				RouteId:          string | fn.Fn
				RouteResponseKey: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Stage :: {
			Type: "AWS::ApiGatewayV2::Stage"
			Properties: {
				AccessLogSettings?: {
					DestinationArn?: string | fn.Fn
					Format?:         string | fn.Fn
				}
				ApiId:                string | fn.Fn
				ClientCertificateId?: string | fn.Fn
				DefaultRouteSettings?: {
					DataTraceEnabled?:       bool | fn.Fn
					DetailedMetricsEnabled?: bool | fn.Fn
					LoggingLevel?:           string | fn.Fn
					ThrottlingBurstLimit?:   int | fn.Fn
					ThrottlingRateLimit?:    float | fn.Fn
				}
				DeploymentId:   string | fn.Fn
				Description?:   string | fn.Fn
				RouteSettings?: {
					[string]: _
				} | fn.Fn
				StageName:       string | fn.Fn
				StageVariables?: {
					[string]: _
				} | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	AppMesh :: {
		Mesh :: {
			Type: "AWS::AppMesh::Mesh"
			Properties: {
				MeshName: string | fn.Fn
				Spec?: EgressFilter?: Type: string | fn.Fn
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
		Route :: {
			Type: "AWS::AppMesh::Route"
			Properties: {
				MeshName:  string | fn.Fn
				RouteName: string | fn.Fn
				Spec: {
					GrpcRoute?: {
						Action: WeightedTargets: [...{
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						}]
						Match: {
							Metadata?: [...{
								Invert?: bool | fn.Fn
								Match?: {
									Exact?:  string | fn.Fn
									Prefix?: string | fn.Fn
									Range?: {
										End:   int | fn.Fn
										Start: int | fn.Fn
									}
									Regex?:  string | fn.Fn
									Suffix?: string | fn.Fn
								}
								Name: string | fn.Fn
							}]
							MethodName?:  string | fn.Fn
							ServiceName?: string | fn.Fn
						}
						RetryPolicy?: {
							GrpcRetryEvents?: [...(string | fn.Fn)] | fn.Fn
							HttpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
							MaxRetries:       int | fn.Fn
							PerRetryTimeout: {
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}
							TcpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
						}
					}
					Http2Route?: {
						Action: WeightedTargets: [...{
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						}]
						Match: {
							Headers?: [...{
								Invert?: bool | fn.Fn
								Match?: {
									Exact?:  string | fn.Fn
									Prefix?: string | fn.Fn
									Range?: {
										End:   int | fn.Fn
										Start: int | fn.Fn
									}
									Regex?:  string | fn.Fn
									Suffix?: string | fn.Fn
								}
								Name: string | fn.Fn
							}]
							Method?: string | fn.Fn
							Prefix:  string | fn.Fn
							Scheme?: string | fn.Fn
						}
						RetryPolicy?: {
							HttpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
							MaxRetries:       int | fn.Fn
							PerRetryTimeout: {
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}
							TcpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
						}
					}
					HttpRoute?: {
						Action: WeightedTargets: [...{
							VirtualNode: string | fn.Fn
							Weight:      int | fn.Fn
						}]
						Match: {
							Headers?: [...{
								Invert?: bool | fn.Fn
								Match?: {
									Exact?:  string | fn.Fn
									Prefix?: string | fn.Fn
									Range?: {
										End:   int | fn.Fn
										Start: int | fn.Fn
									}
									Regex?:  string | fn.Fn
									Suffix?: string | fn.Fn
								}
								Name: string | fn.Fn
							}]
							Method?: string | fn.Fn
							Prefix:  string | fn.Fn
							Scheme?: string | fn.Fn
						}
						RetryPolicy?: {
							HttpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
							MaxRetries:       int | fn.Fn
							PerRetryTimeout: {
								Unit:  string | fn.Fn
								Value: int | fn.Fn
							}
							TcpRetryEvents?: [...(string | fn.Fn)] | fn.Fn
						}
					}
					Priority?: int | fn.Fn
					TcpRoute?: Action: WeightedTargets: [...{
						VirtualNode: string | fn.Fn
						Weight:      int | fn.Fn
					}]
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VirtualRouterName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VirtualNode :: {
			Type: "AWS::AppMesh::VirtualNode"
			Properties: {
				MeshName: string | fn.Fn
				Spec: {
					Backends?: [...{
						VirtualService?: VirtualServiceName: string | fn.Fn
					}]
					Listeners?: [...{
						HealthCheck?: {
							HealthyThreshold:   int | fn.Fn
							IntervalMillis:     int | fn.Fn
							Path?:              string | fn.Fn
							Port?:              int | fn.Fn
							Protocol:           string | fn.Fn
							TimeoutMillis:      int | fn.Fn
							UnhealthyThreshold: int | fn.Fn
						}
						PortMapping: {
							Port:     int | fn.Fn
							Protocol: string | fn.Fn
						}
					}]
					Logging?: AccessLog?: File?: Path: string | fn.Fn
					ServiceDiscovery?: {
						AWSCloudMap?: {
							Attributes?: [...{
								Key:   string | fn.Fn
								Value: string | fn.Fn
							}]
							NamespaceName: string | fn.Fn
							ServiceName:   string | fn.Fn
						}
						DNS?: Hostname: string | fn.Fn
					}
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VirtualNodeName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VirtualRouter :: {
			Type: "AWS::AppMesh::VirtualRouter"
			Properties: {
				MeshName: string | fn.Fn
				Spec: Listeners: [...{
					PortMapping: {
						Port:     int | fn.Fn
						Protocol: string | fn.Fn
					}
				}]
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VirtualRouterName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VirtualService :: {
			Type: "AWS::AppMesh::VirtualService"
			Properties: {
				MeshName: string | fn.Fn
				Spec: Provider?: {
					VirtualNode?: VirtualNodeName:     string | fn.Fn
					VirtualRouter?: VirtualRouterName: string | fn.Fn
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VirtualServiceName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	AppStream :: {
		DirectoryConfig :: {
			Type: "AWS::AppStream::DirectoryConfig"
			Properties: {
				DirectoryName:                        string | fn.Fn
				OrganizationalUnitDistinguishedNames: [...(string | fn.Fn)] | fn.Fn
				ServiceAccountCredentials: {
					AccountName:     string | fn.Fn
					AccountPassword: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Fleet :: {
			Type: "AWS::AppStream::Fleet"
			Properties: {
				ComputeCapacity: DesiredInstances: int | fn.Fn
				Description?:                string | fn.Fn
				DisconnectTimeoutInSeconds?: (int & (>=60 & <=360000)) | fn.Fn
				DisplayName?:                string | fn.Fn
				DomainJoinInfo?: {
					DirectoryName?:                       string | fn.Fn
					OrganizationalUnitDistinguishedName?: string | fn.Fn
				}
				EnableDefaultInternetAccess?:    bool | fn.Fn
				FleetType?:                      string | fn.Fn
				IdleDisconnectTimeoutInSeconds?: (int & (>=0 & <=3600)) | fn.Fn
				ImageArn?:                       string | fn.Fn
				ImageName?:                      string | fn.Fn
				InstanceType:                    string | fn.Fn
				MaxUserDurationInSeconds?:       (int & (>=600 & <=360000)) | fn.Fn
				Name?:                           string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcConfig?: {
					SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
					SubnetIds?:        [...(string | fn.Fn)] | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ImageBuilder :: {
			Type: "AWS::AppStream::ImageBuilder"
			Properties: {
				AccessEndpoints?: [...{
					EndpointType: string | fn.Fn
					VpceId:       string | fn.Fn
				}]
				AppstreamAgentVersion?: string | fn.Fn
				Description?:           string | fn.Fn
				DisplayName?:           string | fn.Fn
				DomainJoinInfo?: {
					DirectoryName?:                       string | fn.Fn
					OrganizationalUnitDistinguishedName?: string | fn.Fn
				}
				EnableDefaultInternetAccess?: bool | fn.Fn
				ImageArn?:                    string | fn.Fn
				ImageName?:                   string | fn.Fn
				InstanceType:                 string | fn.Fn
				Name?:                        string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcConfig?: {
					SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
					SubnetIds?:        [...(string | fn.Fn)] | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Stack :: {
			Type: "AWS::AppStream::Stack"
			Properties: {
				AccessEndpoints?: [...{
					EndpointType: string | fn.Fn
					VpceId:       string | fn.Fn
				}]
				ApplicationSettings?: {
					Enabled:        bool | fn.Fn
					SettingsGroup?: string | fn.Fn
				}
				AttributesToDelete?:      [...(string | fn.Fn)] | fn.Fn
				DeleteStorageConnectors?: bool | fn.Fn
				Description?:             string | fn.Fn
				DisplayName?:             string | fn.Fn
				EmbedHostDomains?:        [...(string | fn.Fn)] | fn.Fn
				FeedbackURL?:             string | fn.Fn
				Name?:                    string | fn.Fn
				RedirectURL?:             string | fn.Fn
				StorageConnectors?: [...{
					ConnectorType:       string | fn.Fn
					Domains?:            [...(string | fn.Fn)] | fn.Fn
					ResourceIdentifier?: string | fn.Fn
				}]
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				UserSettings?: [...{
					Action:     string | fn.Fn
					Permission: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		StackFleetAssociation :: {
			Type: "AWS::AppStream::StackFleetAssociation"
			Properties: {
				FleetName: string | fn.Fn
				StackName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		StackUserAssociation :: {
			Type: "AWS::AppStream::StackUserAssociation"
			Properties: {
				AuthenticationType:     string | fn.Fn
				SendEmailNotification?: bool | fn.Fn
				StackName:              string | fn.Fn
				UserName:               string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		User :: {
			Type: "AWS::AppStream::User"
			Properties: {
				AuthenticationType: string | fn.Fn
				FirstName?:         string | fn.Fn
				LastName?:          string | fn.Fn
				MessageAction?:     string | fn.Fn
				UserName:           string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	AppSync :: {
		ApiCache :: {
			Type: "AWS::AppSync::ApiCache"
			Properties: {
				ApiCachingBehavior:        string | fn.Fn
				ApiId:                     string | fn.Fn
				AtRestEncryptionEnabled?:  bool | fn.Fn
				TransitEncryptionEnabled?: bool | fn.Fn
				Ttl:                       float | fn.Fn
				Type:                      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApiKey :: {
			Type: "AWS::AppSync::ApiKey"
			Properties: {
				ApiId:        string | fn.Fn
				Description?: string | fn.Fn
				Expires?:     float | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DataSource :: {
			Type: "AWS::AppSync::DataSource"
			Properties: {
				ApiId:        string | fn.Fn
				Description?: string | fn.Fn
				DynamoDBConfig?: {
					AwsRegion: string | fn.Fn
					DeltaSyncConfig?: {
						BaseTableTTL:       string | fn.Fn
						DeltaSyncTableName: string | fn.Fn
						DeltaSyncTableTTL:  string | fn.Fn
					}
					TableName:             string | fn.Fn
					UseCallerCredentials?: bool | fn.Fn
					Versioned?:            bool | fn.Fn
				}
				ElasticsearchConfig?: {
					AwsRegion: string | fn.Fn
					Endpoint:  string | fn.Fn
				}
				HttpConfig?: {
					AuthorizationConfig?: {
						AuthorizationType: string | fn.Fn
						AwsIamConfig?: {
							SigningRegion?:      string | fn.Fn
							SigningServiceName?: string | fn.Fn
						}
					}
					Endpoint: string | fn.Fn
				}
				LambdaConfig?: LambdaFunctionArn: string | fn.Fn
				Name: string | fn.Fn
				RelationalDatabaseConfig?: {
					RdsHttpEndpointConfig?: {
						AwsRegion:           string | fn.Fn
						AwsSecretStoreArn:   string | fn.Fn
						DatabaseName?:       string | fn.Fn
						DbClusterIdentifier: string | fn.Fn
						Schema?:             string | fn.Fn
					}
					RelationalDatabaseSourceType: string | fn.Fn
				}
				ServiceRoleArn?: string | fn.Fn
				Type:            (string & ("AMAZON_DYNAMODB" | "AMAZON_ELASTICSEARCH" | "AWS_LAMBDA" | "HTTP" | "NONE" | "RELATIONAL_DATABASE")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		FunctionConfiguration :: {
			Type: "AWS::AppSync::FunctionConfiguration"
			Properties: {
				ApiId:                              string | fn.Fn
				DataSourceName:                     string | fn.Fn
				Description?:                       string | fn.Fn
				FunctionVersion:                    string | fn.Fn
				Name:                               string | fn.Fn
				RequestMappingTemplate?:            string | fn.Fn
				RequestMappingTemplateS3Location?:  string | fn.Fn
				ResponseMappingTemplate?:           string | fn.Fn
				ResponseMappingTemplateS3Location?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		GraphQLApi :: {
			Type: "AWS::AppSync::GraphQLApi"
			Properties: {
				AdditionalAuthenticationProviders?: [...{
					AuthenticationType: string | fn.Fn
					OpenIDConnectConfig?: {
						AuthTTL?:  float | fn.Fn
						ClientId?: string | fn.Fn
						IatTTL?:   float | fn.Fn
						Issuer?:   string | fn.Fn
					}
					UserPoolConfig?: {
						AppIdClientRegex?: string | fn.Fn
						AwsRegion?:        string | fn.Fn
						UserPoolId?:       string | fn.Fn
					}
				}]
				AuthenticationType: (string & ("AMAZON_COGNITO_USER_POOLS" | "API_KEY" | "AWS_IAM" | "OPENID_CONNECT")) | fn.Fn
				LogConfig?: {
					CloudWatchLogsRoleArn?: string | fn.Fn
					ExcludeVerboseContent?: bool | fn.Fn
					FieldLogLevel?:         string | fn.Fn
				}
				Name: string | fn.Fn
				OpenIDConnectConfig?: {
					AuthTTL?:  float | fn.Fn
					ClientId?: string | fn.Fn
					IatTTL?:   float | fn.Fn
					Issuer?:   string | fn.Fn
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				UserPoolConfig?: {
					AppIdClientRegex?: string | fn.Fn
					AwsRegion?:        string | fn.Fn
					DefaultAction?:    string | fn.Fn
					UserPoolId?:       string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		GraphQLSchema :: {
			Type: "AWS::AppSync::GraphQLSchema"
			Properties: {
				ApiId:                 string | fn.Fn
				Definition?:           string | fn.Fn
				DefinitionS3Location?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Resolver :: {
			Type: "AWS::AppSync::Resolver"
			Properties: {
				ApiId: string | fn.Fn
				CachingConfig?: {
					CachingKeys?: [...(string | fn.Fn)] | fn.Fn
					Ttl?:         float | fn.Fn
				}
				DataSourceName?: string | fn.Fn
				FieldName:       string | fn.Fn
				Kind?:           (string & ("PIPELINE" | "UNIT")) | fn.Fn
				PipelineConfig?: Functions?: [...(string | fn.Fn)] | fn.Fn
				RequestMappingTemplate?:            string | fn.Fn
				RequestMappingTemplateS3Location?:  string | fn.Fn
				ResponseMappingTemplate?:           string | fn.Fn
				ResponseMappingTemplateS3Location?: string | fn.Fn
				SyncConfig?: {
					ConflictDetection: string | fn.Fn
					ConflictHandler?:  string | fn.Fn
					LambdaConflictHandlerConfig?: LambdaConflictHandlerArn?: string | fn.Fn
				}
				TypeName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ApplicationAutoScaling :: {
		ScalableTarget :: {
			Type: "AWS::ApplicationAutoScaling::ScalableTarget"
			Properties: {
				MaxCapacity:       int | fn.Fn
				MinCapacity:       int | fn.Fn
				ResourceId:        string | fn.Fn
				RoleARN:           string | fn.Fn
				ScalableDimension: string | fn.Fn
				ScheduledActions?: [...{
					EndTime?: time.Time | fn.Fn
					ScalableTargetAction?: {
						MaxCapacity?: int | fn.Fn
						MinCapacity?: int | fn.Fn
					}
					Schedule:            string | fn.Fn
					ScheduledActionName: string | fn.Fn
					StartTime?:          time.Time | fn.Fn
				}]
				ServiceNamespace: string | fn.Fn
				SuspendedState?: {
					DynamicScalingInSuspended?:  bool | fn.Fn
					DynamicScalingOutSuspended?: bool | fn.Fn
					ScheduledScalingSuspended?:  bool | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ScalingPolicy :: {
			Type: "AWS::ApplicationAutoScaling::ScalingPolicy"
			Properties: {
				PolicyName:         string | fn.Fn
				PolicyType:         (string & ("StepScaling" | "TargetTrackingScaling")) | fn.Fn
				ResourceId?:        string | fn.Fn
				ScalableDimension?: string | fn.Fn
				ScalingTargetId?:   string | fn.Fn
				ServiceNamespace?:  string | fn.Fn
				StepScalingPolicyConfiguration?: {
					AdjustmentType?:         string | fn.Fn
					Cooldown?:               int | fn.Fn
					MetricAggregationType?:  string | fn.Fn
					MinAdjustmentMagnitude?: int | fn.Fn
					StepAdjustments?: [...{
						MetricIntervalLowerBound?: float | fn.Fn
						MetricIntervalUpperBound?: float | fn.Fn
						ScalingAdjustment:         int | fn.Fn
					}]
				}
				TargetTrackingScalingPolicyConfiguration?: {
					CustomizedMetricSpecification?: {
						Dimensions?: [...{
							Name:  string | fn.Fn
							Value: string | fn.Fn
						}]
						MetricName: string | fn.Fn
						Namespace:  string | fn.Fn
						Statistic:  (string & ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum")) | fn.Fn
						Unit?:      string | fn.Fn
					}
					DisableScaleIn?: bool | fn.Fn
					PredefinedMetricSpecification?: {
						PredefinedMetricType: (string & ("ALBRequestCountPerTarget" | "DynamoDBReadCapacityUtilization" | "DynamoDBWriteCapacityUtilization" | "EC2SpotFleetRequestAverageCPUUtilization" | "EC2SpotFleetRequestAverageNetworkIn" | "EC2SpotFleetRequestAverageNetworkOut" | "ECSServiceAverageCPUUtilization" | "ECSServiceAverageMemoryUtilization" | "RDSReaderAverageCPUUtilization" | "RDSReaderAverageDatabaseConnections" | "SageMakerVariantInvocationsPerInstance")) | fn.Fn
						ResourceLabel?:       string | fn.Fn
					}
					ScaleInCooldown?:  int | fn.Fn
					ScaleOutCooldown?: int | fn.Fn
					TargetValue:       float | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Athena :: {
		NamedQuery :: {
			Type: "AWS::Athena::NamedQuery"
			Properties: {
				Database:     string | fn.Fn
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				QueryString:  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	AutoScaling :: {
		AutoScalingGroup :: {
			Type: "AWS::AutoScaling::AutoScalingGroup"
			Properties: {
				AutoScalingGroupName?:    string | fn.Fn
				AvailabilityZones?:       [...(string | fn.Fn)] | fn.Fn
				Cooldown?:                string | fn.Fn
				DesiredCapacity?:         string | fn.Fn
				HealthCheckGracePeriod?:  int | fn.Fn
				HealthCheckType?:         (string & ("EC2" | "ELB")) | fn.Fn
				InstanceId?:              string | fn.Fn
				LaunchConfigurationName?: string | fn.Fn
				LaunchTemplate?: {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version:             string | fn.Fn
				}
				LifecycleHookSpecificationList?: [...{
					DefaultResult?:         (string & ("ABANDON" | "CONTINUE")) | fn.Fn
					HeartbeatTimeout?:      int | fn.Fn
					LifecycleHookName:      string | fn.Fn
					LifecycleTransition:    (string & ("autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING")) | fn.Fn
					NotificationMetadata?:  string | fn.Fn
					NotificationTargetARN?: string | fn.Fn
					RoleARN?:               string | fn.Fn
				}]
				LoadBalancerNames?: [...(string | fn.Fn)] | fn.Fn
				MaxSize:            string | fn.Fn
				MetricsCollection?: [...{
					Granularity: string | fn.Fn
					Metrics?:    [...(string | fn.Fn)] | fn.Fn
				}]
				MinSize: string | fn.Fn
				MixedInstancesPolicy?: {
					InstancesDistribution?: {
						OnDemandAllocationStrategy?:          string | fn.Fn
						OnDemandBaseCapacity?:                int | fn.Fn
						OnDemandPercentageAboveBaseCapacity?: int | fn.Fn
						SpotAllocationStrategy?:              string | fn.Fn
						SpotInstancePools?:                   int | fn.Fn
						SpotMaxPrice?:                        string | fn.Fn
					}
					LaunchTemplate: {
						LaunchTemplateSpecification: {
							LaunchTemplateId?:   string | fn.Fn
							LaunchTemplateName?: string | fn.Fn
							Version:             string | fn.Fn
						}
						Overrides?: [...{
							InstanceType?: string | fn.Fn
						}]
					}
				}
				NotificationConfigurations?: [...{
					NotificationTypes?: [...(string | fn.Fn)] | fn.Fn
					TopicARN:           string | fn.Fn
				}]
				PlacementGroup?:       string | fn.Fn
				ServiceLinkedRoleARN?: string | fn.Fn
				Tags?: [...{
					Key:               string | fn.Fn
					PropagateAtLaunch: bool | fn.Fn
					Value:             string | fn.Fn
				}]
				TargetGroupARNs?:     [...(string | fn.Fn)] | fn.Fn
				TerminationPolicies?: [...(string | fn.Fn)] | fn.Fn
				VPCZoneIdentifier?:   [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?: string | [...string]
			CreationPolicy?: {
				AutoScalingCreationPolicy?: MinSuccessfulInstancesPercent?: int
				ResourceSignal?: {
					Count?:   int
					Timeout?: string
				}
			}
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LaunchConfiguration :: {
			Type: "AWS::AutoScaling::LaunchConfiguration"
			Properties: {
				AssociatePublicIpAddress?: bool | fn.Fn
				BlockDeviceMappings?: [...{
					DeviceName: string | fn.Fn
					Ebs?: {
						DeleteOnTermination?: bool | fn.Fn
						Encrypted?:           bool | fn.Fn
						Iops?:                int | fn.Fn
						SnapshotId?:          string | fn.Fn
						VolumeSize?:          int | fn.Fn
						VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
					}
					NoDevice?:    bool | fn.Fn
					VirtualName?: string | fn.Fn
				}]
				ClassicLinkVPCId?:             string | fn.Fn
				ClassicLinkVPCSecurityGroups?: [...(string | fn.Fn)] | fn.Fn
				EbsOptimized?:                 bool | fn.Fn
				IamInstanceProfile?:           string | fn.Fn
				ImageId:                       string | fn.Fn
				InstanceId?:                   string | fn.Fn
				InstanceMonitoring?:           bool | fn.Fn
				InstanceType:                  (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
				KernelId?:                     string | fn.Fn
				KeyName?:                      string | fn.Fn
				LaunchConfigurationName?:      string | fn.Fn
				PlacementTenancy?:             (string & ("dedicated" | "default")) | fn.Fn
				RamDiskId?:                    string | fn.Fn
				SecurityGroups?:               [...(string | fn.Fn)] | fn.Fn
				SpotPrice?:                    string | fn.Fn
				UserData?:                     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LifecycleHook :: {
			Type: "AWS::AutoScaling::LifecycleHook"
			Properties: {
				AutoScalingGroupName:   string | fn.Fn
				DefaultResult?:         (string & ("ABANDON" | "CONTINUE")) | fn.Fn
				HeartbeatTimeout?:      int | fn.Fn
				LifecycleHookName?:     string | fn.Fn
				LifecycleTransition:    (string & ("autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING")) | fn.Fn
				NotificationMetadata?:  string | fn.Fn
				NotificationTargetARN?: string | fn.Fn
				RoleARN?:               string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ScalingPolicy :: {
			Type: "AWS::AutoScaling::ScalingPolicy"
			Properties: {
				AdjustmentType?:          (string & ("ChangeInCapacity" | "ExactCapacity" | "PercentChangeInCapacity")) | fn.Fn
				AutoScalingGroupName:     string | fn.Fn
				Cooldown?:                string | fn.Fn
				EstimatedInstanceWarmup?: int | fn.Fn
				MetricAggregationType?:   (string & ("Average" | "Maximum" | "Minimum")) | fn.Fn
				MinAdjustmentMagnitude?:  int | fn.Fn
				PolicyType?:              (string & ("SimpleScaling" | "StepScaling" | "TargetTrackingScaling")) | fn.Fn
				ScalingAdjustment?:       int | fn.Fn
				StepAdjustments?: [...{
					MetricIntervalLowerBound?: float | fn.Fn
					MetricIntervalUpperBound?: float | fn.Fn
					ScalingAdjustment:         int | fn.Fn
				}]
				TargetTrackingConfiguration?: {
					CustomizedMetricSpecification?: {
						Dimensions?: [...{
							Name:  string | fn.Fn
							Value: string | fn.Fn
						}]
						MetricName: string | fn.Fn
						Namespace:  string | fn.Fn
						Statistic:  (string & ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum")) | fn.Fn
						Unit?:      string | fn.Fn
					}
					DisableScaleIn?: bool | fn.Fn
					PredefinedMetricSpecification?: {
						PredefinedMetricType: (string & ("ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut")) | fn.Fn
						ResourceLabel?:       string | fn.Fn
					}
					TargetValue: float | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ScheduledAction :: {
			Type: "AWS::AutoScaling::ScheduledAction"
			Properties: {
				AutoScalingGroupName: string | fn.Fn
				DesiredCapacity?:     int | fn.Fn
				EndTime?:             string | fn.Fn
				MaxSize?:             int | fn.Fn
				MinSize?:             int | fn.Fn
				Recurrence?:          string | fn.Fn
				StartTime?:           string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	AutoScalingPlans :: {
		ScalingPlan :: {
			Type: "AWS::AutoScalingPlans::ScalingPlan"
			Properties: {
				ApplicationSource: {
					CloudFormationStackARN?: string | fn.Fn
					TagFilters?: [...{
						Key:     string | fn.Fn
						Values?: [...(string | fn.Fn)] | fn.Fn
					}]
				}
				ScalingInstructions: [...{
					CustomizedLoadMetricSpecification?: {
						Dimensions?: [...{
							Name:  string | fn.Fn
							Value: string | fn.Fn
						}]
						MetricName: string | fn.Fn
						Namespace:  string | fn.Fn
						Statistic:  string | fn.Fn
						Unit?:      string | fn.Fn
					}
					DisableDynamicScaling?: bool | fn.Fn
					MaxCapacity:            int | fn.Fn
					MinCapacity:            int | fn.Fn
					PredefinedLoadMetricSpecification?: {
						PredefinedLoadMetricType: string | fn.Fn
						ResourceLabel?:           string | fn.Fn
					}
					PredictiveScalingMaxCapacityBehavior?: (string & ("SetForecastCapacityToMaxCapacity" | "SetMaxCapacityToForecastCapacity" | "SetMaxCapacityAboveForecastCapacity")) | fn.Fn
					PredictiveScalingMaxCapacityBuffer?:   int | fn.Fn
					PredictiveScalingMode?:                (string & ("ForecastAndScale" | "ForecastOnly")) | fn.Fn
					ResourceId:                            string | fn.Fn
					ScalableDimension:                     (string & ("autoscaling:autoScalingGroup:DesiredCapacity" | "ecs:service:DesiredCount" | "ec2:spot-fleet-request:TargetCapacity" | "dynamodb:table:ReadCapacityUnits" | "dynamodb:table:WriteCapacityUnits" | "dynamodb:index:ReadCapacityUnits" | "dynamodb:index:WriteCapacityUnits" | "rds:cluster:ReadReplicaCount")) | fn.Fn
					ScalingPolicyUpdateBehavior?:          string | fn.Fn
					ScheduledActionBufferTime?:            int | fn.Fn
					ServiceNamespace:                      (string & ("autoscaling" | "dynamodb" | "ecs" | "ec2" | "rds")) | fn.Fn
					TargetTrackingConfigurations: [...{
						CustomizedScalingMetricSpecification?: {
							Dimensions?: [...{
								Name:  string | fn.Fn
								Value: string | fn.Fn
							}]
							MetricName: string | fn.Fn
							Namespace:  string | fn.Fn
							Statistic:  (string & ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum")) | fn.Fn
							Unit?:      string | fn.Fn
						}
						DisableScaleIn?:          bool | fn.Fn
						EstimatedInstanceWarmup?: int | fn.Fn
						PredefinedScalingMetricSpecification?: {
							PredefinedScalingMetricType: (string & ("ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut")) | fn.Fn
							ResourceLabel?:              string | fn.Fn
						}
						ScaleInCooldown?:  int | fn.Fn
						ScaleOutCooldown?: int | fn.Fn
						TargetValue:       float | fn.Fn
					}]
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Backup :: {
		BackupPlan :: {
			Type: "AWS::Backup::BackupPlan"
			Properties: {
				BackupPlan: {
					BackupPlanName: string | fn.Fn
					BackupPlanRule: [...{
						CompletionWindowMinutes?: int | fn.Fn
						Lifecycle?: {
							DeleteAfterDays?:            int | fn.Fn
							MoveToColdStorageAfterDays?: int | fn.Fn
						}
						RecoveryPointTags?: {
							[string]: _
						} | fn.Fn
						RuleName:            string | fn.Fn
						ScheduleExpression?: string | fn.Fn
						StartWindowMinutes?: int | fn.Fn
						TargetBackupVault:   string | fn.Fn
					}]
				}
				BackupPlanTags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		BackupSelection :: {
			Type: "AWS::Backup::BackupSelection"
			Properties: {
				BackupPlanId: string | fn.Fn
				BackupSelection: {
					IamRoleArn: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
					ListOfTags?: [...{
						ConditionKey:   string | fn.Fn
						ConditionType:  string | fn.Fn
						ConditionValue: string | fn.Fn
					}]
					Resources?:    [...(string | fn.Fn)] | fn.Fn
					SelectionName: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		BackupVault :: {
			Type: "AWS::Backup::BackupVault"
			Properties: {
				AccessPolicy?: {
					[string]: _
				} | fn.Fn
				BackupVaultName:  string | fn.Fn
				BackupVaultTags?: {
					[string]: _
				} | fn.Fn
				EncryptionKeyArn?: string | fn.Fn
				Notifications?: {
					BackupVaultEvents: [...(string | fn.Fn)] | fn.Fn
					SNSTopicArn:       string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Batch :: {
		ComputeEnvironment :: {
			Type: "AWS::Batch::ComputeEnvironment"
			Properties: {
				ComputeEnvironmentName?: string | fn.Fn
				ComputeResources?: {
					AllocationStrategy?: string | fn.Fn
					BidPercentage?:      int | fn.Fn
					DesiredvCpus?:       int | fn.Fn
					Ec2KeyPair?:         string | fn.Fn
					ImageId?:            string | fn.Fn
					InstanceRole:        string | fn.Fn
					InstanceTypes:       [...(string | fn.Fn)] | fn.Fn
					LaunchTemplate?: {
						LaunchTemplateId?:   string | fn.Fn
						LaunchTemplateName?: string | fn.Fn
						Version?:            string | fn.Fn
					}
					MaxvCpus:          int | fn.Fn
					MinvCpus:          int | fn.Fn
					PlacementGroup?:   string | fn.Fn
					SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
					SpotIamFleetRole?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
					Subnets:           [...(string | fn.Fn)] | fn.Fn
					Tags?:             {
						[string]: _
					} | fn.Fn
					Type: string | fn.Fn
				}
				ServiceRole: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
				State?:      string | fn.Fn
				Type:        string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		JobDefinition :: {
			Type: "AWS::Batch::JobDefinition"
			Properties: {
				ContainerProperties?: {
					Command?: [...(string | fn.Fn)] | fn.Fn
					Environment?: [...{
						Name?:  string | fn.Fn
						Value?: string | fn.Fn
					}]
					Image:         string | fn.Fn
					InstanceType?: string | fn.Fn
					JobRoleArn?:   string | fn.Fn
					LinuxParameters?: Devices?: [...{
						ContainerPath?: string | fn.Fn
						HostPath?:      string | fn.Fn
						Permissions?:   [...(string | fn.Fn)] | fn.Fn
					}]
					Memory: int | fn.Fn
					MountPoints?: [...{
						ContainerPath?: string | fn.Fn
						ReadOnly?:      bool | fn.Fn
						SourceVolume?:  string | fn.Fn
					}]
					Privileged?:             bool | fn.Fn
					ReadonlyRootFilesystem?: bool | fn.Fn
					ResourceRequirements?: [...{
						Type?:  string | fn.Fn
						Value?: string | fn.Fn
					}]
					Ulimits?: [...{
						HardLimit: int | fn.Fn
						Name:      string | fn.Fn
						SoftLimit: int | fn.Fn
					}]
					User?: string | fn.Fn
					Vcpus: int | fn.Fn
					Volumes?: [...{
						Host?: SourcePath?: string | fn.Fn
						Name?: string | fn.Fn
					}]
				}
				JobDefinitionName?: string | fn.Fn
				NodeProperties?: {
					MainNode: int | fn.Fn
					NodeRangeProperties: [...{
						Container?: {
							Command?: [...(string | fn.Fn)] | fn.Fn
							Environment?: [...{
								Name?:  string | fn.Fn
								Value?: string | fn.Fn
							}]
							Image:         string | fn.Fn
							InstanceType?: string | fn.Fn
							JobRoleArn?:   string | fn.Fn
							LinuxParameters?: Devices?: [...{
								ContainerPath?: string | fn.Fn
								HostPath?:      string | fn.Fn
								Permissions?:   [...(string | fn.Fn)] | fn.Fn
							}]
							Memory: int | fn.Fn
							MountPoints?: [...{
								ContainerPath?: string | fn.Fn
								ReadOnly?:      bool | fn.Fn
								SourceVolume?:  string | fn.Fn
							}]
							Privileged?:             bool | fn.Fn
							ReadonlyRootFilesystem?: bool | fn.Fn
							ResourceRequirements?: [...{
								Type?:  string | fn.Fn
								Value?: string | fn.Fn
							}]
							Ulimits?: [...{
								HardLimit: int | fn.Fn
								Name:      string | fn.Fn
								SoftLimit: int | fn.Fn
							}]
							User?: string | fn.Fn
							Vcpus: int | fn.Fn
							Volumes?: [...{
								Host?: SourcePath?: string | fn.Fn
								Name?: string | fn.Fn
							}]
						}
						TargetNodes: string | fn.Fn
					}]
					NumNodes: int | fn.Fn
				}
				Parameters?: {
					[string]: _
				} | fn.Fn
				RetryStrategy?: Attempts?:         int | fn.Fn
				Timeout?: AttemptDurationSeconds?: int | fn.Fn
				Type: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		JobQueue :: {
			Type: "AWS::Batch::JobQueue"
			Properties: {
				ComputeEnvironmentOrder: [...{
					ComputeEnvironment: string | fn.Fn
					Order:              int | fn.Fn
				}]
				JobQueueName?: string | fn.Fn
				Priority:      int | fn.Fn
				State?:        string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Budgets :: {
		Budget :: {
			Type: "AWS::Budgets::Budget"
			Properties: {
				Budget: {
					BudgetLimit?: {
						Amount: float | fn.Fn
						Unit:   string | fn.Fn
					}
					BudgetName?:  string | fn.Fn
					BudgetType:   (string & ("COST" | "RI_COVERAGE" | "RI_UTILIZATION" | "USAGE")) | fn.Fn
					CostFilters?: {
						[string]: _
					} | fn.Fn
					CostTypes?: {
						IncludeCredit?:            bool | fn.Fn
						IncludeDiscount?:          bool | fn.Fn
						IncludeOtherSubscription?: bool | fn.Fn
						IncludeRecurring?:         bool | fn.Fn
						IncludeRefund?:            bool | fn.Fn
						IncludeSubscription?:      bool | fn.Fn
						IncludeSupport?:           bool | fn.Fn
						IncludeTax?:               bool | fn.Fn
						IncludeUpfront?:           bool | fn.Fn
						UseAmortized?:             bool | fn.Fn
						UseBlended?:               bool | fn.Fn
					}
					PlannedBudgetLimits?: {
						[string]: _
					} | fn.Fn
					TimePeriod?: {
						End?:   string | fn.Fn
						Start?: string | fn.Fn
					}
					TimeUnit: (string & ("ANNUALLY" | "DAILY" | "MONTHLY" | "QUARTERLY")) | fn.Fn
				}
				NotificationsWithSubscribers?: [...{
					Notification: {
						ComparisonOperator: (string & ("EQUAL_TO" | "GREATER_THAN" | "LESS_THAN")) | fn.Fn
						NotificationType:   (string & ("ACTUAL" | "FORECASTED")) | fn.Fn
						Threshold:          (float & (>=0.1 & <=1000000000)) | fn.Fn
						ThresholdType?:     (string & ("ABSOLUTE_VALUE" | "PERCENTAGE")) | fn.Fn
					}
					Subscribers: [...{
						Address:          string | fn.Fn
						SubscriptionType: (string & ("EMAIL" | "SNS")) | fn.Fn
					}]
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CDK :: {
		Metadata :: {
			Type: "AWS::CDK::Metadata"
			Properties: Modules: string | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CertificateManager :: {
		Certificate :: {
			Type: "AWS::CertificateManager::Certificate"
			Properties: {
				DomainName: string | fn.Fn
				DomainValidationOptions?: [...{
					DomainName:       string | fn.Fn
					ValidationDomain: string | fn.Fn
				}]
				SubjectAlternativeNames?: [...(string | fn.Fn)] | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				ValidationMethod?: (string & ("DNS" | "EMAIL")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Cloud9 :: {
		EnvironmentEC2 :: {
			Type: "AWS::Cloud9::EnvironmentEC2"
			Properties: {
				AutomaticStopTimeMinutes?: (int & (>=0 & <=20160)) | fn.Fn
				Description?:              string | fn.Fn
				InstanceType:              string | fn.Fn
				Name?:                     string | fn.Fn
				OwnerArn?:                 string | fn.Fn
				Repositories?: [...{
					PathComponent: string | fn.Fn
					RepositoryUrl: string | fn.Fn
				}]
				SubnetId?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CloudFormation :: {
		CustomResource :: {
			Type: "AWS::CloudFormation::CustomResource" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
			Properties: {
				ServiceToken: string | fn.Fn
				[string]:     _
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Macro :: {
			Type: "AWS::CloudFormation::Macro"
			Properties: {
				Description?:  string | fn.Fn
				FunctionName:  string | fn.Fn
				LogGroupName?: string | fn.Fn
				LogRoleARN?:   string | fn.Fn
				Name:          string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Stack :: {
			Type: "AWS::CloudFormation::Stack"
			Properties: {
				NotificationARNs?: [...(string | fn.Fn)] | fn.Fn
				Parameters?: [string]: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TemplateURL:       string | fn.Fn
				TimeoutInMinutes?: int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		WaitCondition :: {
			Type: "AWS::CloudFormation::WaitCondition"
			Properties: {
				Count?:   int | fn.Fn
				Handle?:  string | fn.Fn
				Timeout?: (string & (>=0 & <=43200)) | fn.Fn
			}
			DependsOn?: string | [...string]
			CreationPolicy?: {
				AutoScalingCreationPolicy?: MinSuccessfulInstancesPercent?: int
				ResourceSignal?: {
					Count?:   int
					Timeout?: string
				}
			}
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		WaitConditionHandle :: {
			Type: "AWS::CloudFormation::WaitConditionHandle"
			Properties: {
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

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

	CloudTrail :: {
		Trail :: {
			Type: "AWS::CloudTrail::Trail"
			Properties: {
				CloudWatchLogsLogGroupArn?: string | fn.Fn
				CloudWatchLogsRoleArn?:     string | fn.Fn
				EnableLogFileValidation?:   bool | fn.Fn
				EventSelectors?: [...{
					DataResources?: [...{
						Type:    (string & ("AWS::Lambda::Function" | "AWS::S3::Object")) | fn.Fn
						Values?: [...(string | fn.Fn)] | fn.Fn
					}]
					IncludeManagementEvents?: bool | fn.Fn
					ReadWriteType?:           (string & ("All" | "ReadOnly" | "WriteOnly")) | fn.Fn
				}]
				IncludeGlobalServiceEvents?: bool | fn.Fn
				IsLogging:                   bool | fn.Fn
				IsMultiRegionTrail?:         bool | fn.Fn
				KMSKeyId?:                   string | fn.Fn
				S3BucketName:                string | fn.Fn
				S3KeyPrefix?:                string | fn.Fn
				SnsTopicName?:               string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TrailName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CloudWatch :: {
		Alarm :: {
			Type: "AWS::CloudWatch::Alarm"
			Properties: {
				ActionsEnabled?:    bool | fn.Fn
				AlarmActions?:      [...((string & (strings.MinRunes(1) & strings.MaxRunes(1024))) | fn.Fn)] | fn.Fn
				AlarmDescription?:  string | fn.Fn
				AlarmName?:         string | fn.Fn
				ComparisonOperator: (string & ("GreaterThanOrEqualToThreshold" | "GreaterThanThreshold" | "LessThanThreshold" | "LessThanOrEqualToThreshold" | "LessThanLowerOrGreaterThanUpperThreshold" | "LessThanLowerThreshold" | "GreaterThanUpperThreshold")) | fn.Fn
				DatapointsToAlarm?: int | fn.Fn
				Dimensions?: [...{
					Name:  string | fn.Fn
					Value: string | fn.Fn
				}]
				EvaluateLowSampleCountPercentile?: string | fn.Fn
				EvaluationPeriods:                 int | fn.Fn
				ExtendedStatistic?:                string | fn.Fn
				InsufficientDataActions?:          [...(string | fn.Fn)] | fn.Fn
				MetricName?:                       string | fn.Fn
				Metrics?: [...{
					Expression?: string | fn.Fn
					Id:          string | fn.Fn
					Label?:      string | fn.Fn
					MetricStat?: {
						Metric: {
							Dimensions?: [...{
								Name:  string | fn.Fn
								Value: string | fn.Fn
							}]
							MetricName?: string | fn.Fn
							Namespace?:  string | fn.Fn
						}
						Period: int | fn.Fn
						Stat:   string | fn.Fn
						Unit?:  string | fn.Fn
					}
					ReturnData?: bool | fn.Fn
				}]
				Namespace?:         string | fn.Fn
				OKActions?:         [...(string | fn.Fn)] | fn.Fn
				Period?:            int | fn.Fn
				Statistic?:         (string & ("Average" | "Maximum" | "Minimum" | "SampleCount" | "Sum")) | fn.Fn
				Threshold?:         float | fn.Fn
				ThresholdMetricId?: string | fn.Fn
				TreatMissingData?:  (string & ("breaching" | "ignore" | "missing" | "notBreaching")) | fn.Fn
				Unit?:              (string & ("Bits" | "Bits/Second" | "Bytes" | "Bytes/Second" | "Count" | "Count/Second" | "Gigabits" | "Gigabits/Second" | "Gigabytes" | "Gigabytes/Second" | "Kilobits" | "Kilobits/Second" | "Kilobytes" | "Kilobytes/Second" | "Megabits" | "Megabits/Second" | "Megabytes" | "Megabytes/Second" | "Microseconds" | "Milliseconds" | "None" | "Percent" | "Seconds" | "Terabits" | "Terabits/Second" | "Terabytes" | "Terabytes/Second")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		AnomalyDetector :: {
			Type: "AWS::CloudWatch::AnomalyDetector"
			Properties: {
				Configuration?: {
					ExcludedTimeRanges?: [...{
						EndTime:   string | fn.Fn
						StartTime: string | fn.Fn
					}]
					MetricTimeZone?: string | fn.Fn
				}
				Dimensions?: [...{
					Name:  string | fn.Fn
					Value: string | fn.Fn
				}]
				MetricName: string | fn.Fn
				Namespace:  string | fn.Fn
				Stat:       string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Dashboard :: {
			Type: "AWS::CloudWatch::Dashboard"
			Properties: {
				DashboardBody:  string | fn.Fn
				DashboardName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		InsightRule :: {
			Type: "AWS::CloudWatch::InsightRule"
			Properties: {
				RuleBody:  string | fn.Fn
				RuleName:  string | fn.Fn
				RuleState: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CodeBuild :: {
		Project :: {
			Type: "AWS::CodeBuild::Project"
			Properties: {
				Artifacts: {
					ArtifactIdentifier?:   string | fn.Fn
					EncryptionDisabled?:   bool | fn.Fn
					Location?:             string | fn.Fn
					Name?:                 string | fn.Fn
					NamespaceType?:        string | fn.Fn
					OverrideArtifactName?: bool | fn.Fn
					Packaging?:            (string & ("NONE" | "ZIP")) | fn.Fn
					Path?:                 string | fn.Fn
					Type:                  (string & ("CODEPIPELINE" | "NO_ARTIFACTS" | "S3")) | fn.Fn
				}
				BadgeEnabled?: bool | fn.Fn
				Cache?: {
					Location?: string | fn.Fn
					Modes?:    [...(string | fn.Fn)] | fn.Fn
					Type:      (string & ("LOCAL" | "NO_CACHE" | "S3")) | fn.Fn
				}
				Description?:   string | fn.Fn
				EncryptionKey?: string | fn.Fn
				Environment: {
					Certificate?: string | fn.Fn
					ComputeType:  (string & ("BUILD_GENERAL1_LARGE" | "BUILD_GENERAL1_MEDIUM" | "BUILD_GENERAL1_SMALL")) | fn.Fn
					EnvironmentVariables?: [...{
						Name:  string | fn.Fn
						Type?: string | fn.Fn
						Value: string | fn.Fn
					}]
					Image:                     string | fn.Fn
					ImagePullCredentialsType?: (string & ("CODEBUILD" | "SERVICE_ROLE")) | fn.Fn
					PrivilegedMode?:           bool | fn.Fn
					RegistryCredential?: {
						Credential:         string | fn.Fn
						CredentialProvider: string | fn.Fn
					}
					Type: (string & ("LINUX_CONTAINER" | "WINDOWS_CONTAINER")) | fn.Fn
				}
				LogsConfig?: {
					CloudWatchLogs?: {
						GroupName?:  string | fn.Fn
						Status:      (string & ("DISABLED" | "ENABLED")) | fn.Fn
						StreamName?: string | fn.Fn
					}
					S3Logs?: {
						EncryptionDisabled?: bool | fn.Fn
						Location?:           string | fn.Fn
						Status:              (string & ("DISABLED" | "ENABLED")) | fn.Fn
					}
				}
				Name?:                   string | fn.Fn
				QueuedTimeoutInMinutes?: (int & (>=5 & <=480)) | fn.Fn
				SecondaryArtifacts?: [...{
					ArtifactIdentifier?:   string | fn.Fn
					EncryptionDisabled?:   bool | fn.Fn
					Location?:             string | fn.Fn
					Name?:                 string | fn.Fn
					NamespaceType?:        string | fn.Fn
					OverrideArtifactName?: bool | fn.Fn
					Packaging?:            (string & ("NONE" | "ZIP")) | fn.Fn
					Path?:                 string | fn.Fn
					Type:                  (string & ("CODEPIPELINE" | "NO_ARTIFACTS" | "S3")) | fn.Fn
				}]
				SecondarySourceVersions?: [...{
					SourceIdentifier: string | fn.Fn
					SourceVersion?:   string | fn.Fn
				}]
				SecondarySources?: [...{
					Auth?: {
						Resource?: string | fn.Fn
						Type:      string | fn.Fn
					}
					BuildSpec?:     string | fn.Fn
					GitCloneDepth?: int | fn.Fn
					GitSubmodulesConfig?: FetchSubmodules: bool | fn.Fn
					InsecureSsl?:       bool | fn.Fn
					Location?:          string | fn.Fn
					ReportBuildStatus?: bool | fn.Fn
					SourceIdentifier?:  string | fn.Fn
					Type:               (string & ("BITBUCKET" | "CODECOMMIT" | "CODEPIPELINE" | "GITHUB" | "GITHUB_ENTERPRISE" | "NO_SOURCE" | "S3")) | fn.Fn
				}]
				ServiceRole: string | fn.Fn
				Source: {
					Auth?: {
						Resource?: string | fn.Fn
						Type:      string | fn.Fn
					}
					BuildSpec?:     string | fn.Fn
					GitCloneDepth?: int | fn.Fn
					GitSubmodulesConfig?: FetchSubmodules: bool | fn.Fn
					InsecureSsl?:       bool | fn.Fn
					Location?:          string | fn.Fn
					ReportBuildStatus?: bool | fn.Fn
					SourceIdentifier?:  string | fn.Fn
					Type:               (string & ("BITBUCKET" | "CODECOMMIT" | "CODEPIPELINE" | "GITHUB" | "GITHUB_ENTERPRISE" | "NO_SOURCE" | "S3")) | fn.Fn
				}
				SourceVersion?: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TimeoutInMinutes?: (int & (>=5 & <=480)) | fn.Fn
				Triggers?: {
					FilterGroups?: [...[...{
						ExcludeMatchedPattern?: bool | fn.Fn
						Pattern:                string | fn.Fn
						Type:                   string | fn.Fn
					}]]
					Webhook?: bool | fn.Fn
				}
				VpcConfig?: {
					SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
					Subnets?:          [...(string | fn.Fn)] | fn.Fn
					VpcId?:            string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SourceCredential :: {
			Type: "AWS::CodeBuild::SourceCredential"
			Properties: {
				AuthType:   string | fn.Fn
				ServerType: string | fn.Fn
				Token:      string | fn.Fn
				Username?:  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CodeCommit :: {
		Repository :: {
			Type: "AWS::CodeCommit::Repository"
			Properties: {
				Code?: S3: {
					Bucket:         string | fn.Fn
					Key:            string | fn.Fn
					ObjectVersion?: string | fn.Fn
				}
				RepositoryDescription?: string | fn.Fn
				RepositoryName:         (string & (strings.MinRunes(1) & strings.MaxRunes(100)) & (=~#"^[a-zA-Z0-9._\-]+(?<!\.git)$"#)) | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Triggers?: [...{
					Branches?:      [...(string | fn.Fn)] | fn.Fn
					CustomData?:    string | fn.Fn
					DestinationArn: string | fn.Fn
					Events:         [...((string & ("all" | "createReference" | "deleteReference" | "updateReference")) | fn.Fn)] | fn.Fn
					Name:           string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CodeDeploy :: {
		Application :: {
			Type: "AWS::CodeDeploy::Application"
			Properties: {
				ApplicationName?: string | fn.Fn
				ComputePlatform?: (string & ("ECS" | "Lambda" | "Server")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DeploymentConfig :: {
			Type: "AWS::CodeDeploy::DeploymentConfig"
			Properties: {
				DeploymentConfigName?: string | fn.Fn
				MinimumHealthyHosts?: {
					Type:  (string & ("FLEET_PERCENT" | "HOST_COUNT")) | fn.Fn
					Value: int | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DeploymentGroup :: {
			Type: "AWS::CodeDeploy::DeploymentGroup"
			Properties: {
				AlarmConfiguration?: {
					Alarms?: [...{
						Name?: string | fn.Fn
					}]
					Enabled?:                bool | fn.Fn
					IgnorePollAlarmFailure?: bool | fn.Fn
				}
				ApplicationName: string | fn.Fn
				AutoRollbackConfiguration?: {
					Enabled?: bool | fn.Fn
					Events?:  [...((string & ("DEPLOYMENT_FAILURE" | "DEPLOYMENT_STOP_ON_ALARM" | "DEPLOYMENT_STOP_ON_REQUEST")) | fn.Fn)] | fn.Fn
				}
				AutoScalingGroups?: [...(string | fn.Fn)] | fn.Fn
				Deployment?: {
					Description?:                   string | fn.Fn
					IgnoreApplicationStopFailures?: bool | fn.Fn
					Revision: {
						GitHubLocation?: {
							CommitId:   string | fn.Fn
							Repository: string | fn.Fn
						}
						RevisionType?: string | fn.Fn
						S3Location?: {
							Bucket:      string | fn.Fn
							BundleType?: string | fn.Fn
							ETag?:       string | fn.Fn
							Key:         string | fn.Fn
							Version?:    string | fn.Fn
						}
					}
				}
				DeploymentConfigName?: string | fn.Fn
				DeploymentGroupName?:  string | fn.Fn
				DeploymentStyle?: {
					DeploymentOption?: (string & ("WITH_TRAFFIC_CONTROL" | "WITHOUT_TRAFFIC_CONTROL")) | fn.Fn
					DeploymentType?:   (string & ("BLUE_GREEN" | "IN_PLACE")) | fn.Fn
				}
				Ec2TagFilters?: [...{
					Key?:   string | fn.Fn
					Type?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				Ec2TagSet?: Ec2TagSetList?: [...{
					Ec2TagGroup?: [...{
						Key?:   string | fn.Fn
						Type?:  string | fn.Fn
						Value?: string | fn.Fn
					}]
				}]
				LoadBalancerInfo?: {
					ElbInfoList?: [...{
						Name?: string | fn.Fn
					}]
					TargetGroupInfoList?: [...{
						Name?: string | fn.Fn
					}]
				}
				OnPremisesInstanceTagFilters?: [...{
					Key?:   string | fn.Fn
					Type?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				OnPremisesTagSet?: OnPremisesTagSetList?: [...{
					OnPremisesTagGroup?: [...{
						Key?:   string | fn.Fn
						Type?:  string | fn.Fn
						Value?: string | fn.Fn
					}]
				}]
				ServiceRoleArn: string | fn.Fn
				TriggerConfigurations?: [...{
					TriggerEvents?:    [...((string & ("DeploymentFailure" | "DeploymentReady" | "DeploymentRollback" | "DeploymentStart" | "DeploymentStop" | "DeploymentSuccess" | "InstanceFailure" | "InstanceReady" | "InstanceStart" | "InstanceSuccess")) | fn.Fn)] | fn.Fn
					TriggerName?:      string | fn.Fn
					TriggerTargetArn?: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CodePipeline :: {
		CustomActionType :: {
			Type: "AWS::CodePipeline::CustomActionType"
			Properties: {
				Category: (string & ("Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test")) | fn.Fn
				ConfigurationProperties?: [...{
					Description?: string | fn.Fn
					Key:          bool | fn.Fn
					Name:         string | fn.Fn
					Queryable?:   bool | fn.Fn
					Required:     bool | fn.Fn
					Secret:       bool | fn.Fn
					Type?:        (string & ("Boolean" | "Number" | "String")) | fn.Fn
				}]
				InputArtifactDetails: {
					MaximumCount: int | fn.Fn
					MinimumCount: int | fn.Fn
				}
				OutputArtifactDetails: {
					MaximumCount: int | fn.Fn
					MinimumCount: int | fn.Fn
				}
				Provider: string | fn.Fn
				Settings?: {
					EntityUrlTemplate?:          string | fn.Fn
					ExecutionUrlTemplate?:       string | fn.Fn
					RevisionUrlTemplate?:        string | fn.Fn
					ThirdPartyConfigurationUrl?: string | fn.Fn
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Version: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Pipeline :: {
			Type: "AWS::CodePipeline::Pipeline"
			Properties: {
				ArtifactStore?: {
					EncryptionKey?: {
						Id:   string | fn.Fn
						Type: string | fn.Fn
					}
					Location: string | fn.Fn
					Type:     (string & ("S3")) | fn.Fn
				}
				ArtifactStores?: [...{
					ArtifactStore: {
						EncryptionKey?: {
							Id:   string | fn.Fn
							Type: string | fn.Fn
						}
						Location: string | fn.Fn
						Type:     (string & ("S3")) | fn.Fn
					}
					Region: string | fn.Fn
				}]
				DisableInboundStageTransitions?: [...{
					Reason:    string | fn.Fn
					StageName: string | fn.Fn
				}]
				Name?:                     string | fn.Fn
				RestartExecutionOnUpdate?: bool | fn.Fn
				RoleArn:                   string | fn.Fn
				Stages: [...{
					Actions: [...{
						ActionTypeId: {
							Category: (string & ("Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test")) | fn.Fn
							Owner:    (string & ("AWS" | "Custom" | "ThirdParty")) | fn.Fn
							Provider: string | fn.Fn
							Version:  string | fn.Fn
						}
						Configuration?: {
							[string]: _
						} | fn.Fn
						InputArtifacts?: [...{
							Name: string | fn.Fn
						}]
						Name:       string | fn.Fn
						Namespace?: string | fn.Fn
						OutputArtifacts?: [...{
							Name: string | fn.Fn
						}]
						Region?:   string | fn.Fn
						RoleArn?:  string | fn.Fn
						RunOrder?: int | fn.Fn
					}]
					Blockers?: [...{
						Name: string | fn.Fn
						Type: (string & ("Schedule")) | fn.Fn
					}]
					Name: string | fn.Fn
				}]
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
		Webhook :: {
			Type: "AWS::CodePipeline::Webhook"
			Properties: {
				Authentication: (string & ("GITHUB_HMAC" | "IP" | "UNAUTHENTICATED")) | fn.Fn
				AuthenticationConfiguration: {
					AllowedIPRange?: string | fn.Fn
					SecretToken?:    string | fn.Fn
				}
				Filters: [...{
					JsonPath:     string | fn.Fn
					MatchEquals?: string | fn.Fn
				}]
				Name?:                   string | fn.Fn
				RegisterWithThirdParty?: bool | fn.Fn
				TargetAction:            string | fn.Fn
				TargetPipeline:          string | fn.Fn
				TargetPipelineVersion:   int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CodeStar :: {
		GitHubRepository :: {
			Type: "AWS::CodeStar::GitHubRepository"
			Properties: {
				Code?: S3: {
					Bucket:         string | fn.Fn
					Key:            string | fn.Fn
					ObjectVersion?: string | fn.Fn
				}
				EnableIssues?:          bool | fn.Fn
				IsPrivate?:             bool | fn.Fn
				RepositoryAccessToken:  string | fn.Fn
				RepositoryDescription?: string | fn.Fn
				RepositoryName:         string | fn.Fn
				RepositoryOwner:        string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	CodeStarNotifications :: {
		NotificationRule :: {
			Type: "AWS::CodeStarNotifications::NotificationRule"
			Properties: {
				DetailType:   string | fn.Fn
				EventTypeIds: [...(string | fn.Fn)] | fn.Fn
				Name:         string | fn.Fn
				Resource:     string | fn.Fn
				Status?:      string | fn.Fn
				Tags?:        {
					[string]: _
				} | fn.Fn
				Targets: [...{
					TargetAddress?: string | fn.Fn
					TargetType?:    string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Cognito :: {
		IdentityPool :: {
			Type: "AWS::Cognito::IdentityPool"
			Properties: {
				AllowClassicFlow?:              bool | fn.Fn
				AllowUnauthenticatedIdentities: bool | fn.Fn
				CognitoEvents?:                 {
					[string]: _
				} | fn.Fn
				CognitoIdentityProviders?: [...{
					ClientId?:             string | fn.Fn
					ProviderName?:         string | fn.Fn
					ServerSideTokenCheck?: bool | fn.Fn
				}]
				CognitoStreams?: {
					RoleArn?:         string | fn.Fn
					StreamName?:      string | fn.Fn
					StreamingStatus?: (string & ("DISABLED" | "ENABLED")) | fn.Fn
				}
				DeveloperProviderName?:     string | fn.Fn
				IdentityPoolName?:          string | fn.Fn
				OpenIdConnectProviderARNs?: [...(string | fn.Fn)] | fn.Fn
				PushSync?: {
					ApplicationArns?: [...(string | fn.Fn)] | fn.Fn
					RoleArn?:         string | fn.Fn
				}
				SamlProviderARNs?:        [...(string | fn.Fn)] | fn.Fn
				SupportedLoginProviders?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		IdentityPoolRoleAttachment :: {
			Type: "AWS::Cognito::IdentityPoolRoleAttachment"
			Properties: {
				IdentityPoolId: string | fn.Fn
				RoleMappings?:  {
					[string]: _
				} | fn.Fn
				Roles?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPool :: {
			Type: "AWS::Cognito::UserPool"
			Properties: {
				AdminCreateUserConfig?: {
					AllowAdminCreateUserOnly?: bool | fn.Fn
					InviteMessageTemplate?: {
						EmailMessage?: string | fn.Fn
						EmailSubject?: string | fn.Fn
						SMSMessage?:   string | fn.Fn
					}
					UnusedAccountValidityDays?: int | fn.Fn
				}
				AliasAttributes?:        [...((string & ("email" | "phone_number" | "preferred_username")) | fn.Fn)] | fn.Fn
				AutoVerifiedAttributes?: [...((string & ("email" | "phone_number")) | fn.Fn)] | fn.Fn
				DeviceConfiguration?: {
					ChallengeRequiredOnNewDevice?:     bool | fn.Fn
					DeviceOnlyRememberedOnUserPrompt?: bool | fn.Fn
				}
				EmailConfiguration?: {
					ConfigurationSet?:    string | fn.Fn
					EmailSendingAccount?: string | fn.Fn
					From?:                string | fn.Fn
					ReplyToEmailAddress?: string | fn.Fn
					SourceArn?:           string | fn.Fn
				}
				EmailVerificationMessage?: string | fn.Fn
				EmailVerificationSubject?: string | fn.Fn
				EnabledMfas?:              [...(string | fn.Fn)] | fn.Fn
				LambdaConfig?: {
					CreateAuthChallenge?:         string | fn.Fn
					CustomMessage?:               string | fn.Fn
					DefineAuthChallenge?:         string | fn.Fn
					PostAuthentication?:          string | fn.Fn
					PostConfirmation?:            string | fn.Fn
					PreAuthentication?:           string | fn.Fn
					PreSignUp?:                   string | fn.Fn
					PreTokenGeneration?:          string | fn.Fn
					UserMigration?:               string | fn.Fn
					VerifyAuthChallengeResponse?: string | fn.Fn
				}
				MfaConfiguration?: (string & ("OFF" | "ON" | "OPTIONAL")) | fn.Fn
				Policies?: PasswordPolicy?: {
					MinimumLength?:                 int | fn.Fn
					RequireLowercase?:              bool | fn.Fn
					RequireNumbers?:                bool | fn.Fn
					RequireSymbols?:                bool | fn.Fn
					RequireUppercase?:              bool | fn.Fn
					TemporaryPasswordValidityDays?: int | fn.Fn
				}
				Schema?: [...{
					AttributeDataType?:      (string & ("Boolean" | "DateTime" | "Number" | "String")) | fn.Fn
					DeveloperOnlyAttribute?: bool | fn.Fn
					Mutable?:                bool | fn.Fn
					Name?:                   string | fn.Fn
					NumberAttributeConstraints?: {
						MaxValue?: string | fn.Fn
						MinValue?: string | fn.Fn
					}
					Required?: bool | fn.Fn
					StringAttributeConstraints?: {
						MaxLength?: string | fn.Fn
						MinLength?: string | fn.Fn
					}
				}]
				SmsAuthenticationMessage?: string | fn.Fn
				SmsConfiguration?: {
					ExternalId:    string | fn.Fn
					SnsCallerArn?: string | fn.Fn
				}
				SmsVerificationMessage?: string | fn.Fn
				UserPoolAddOns?: AdvancedSecurityMode?: string | fn.Fn
				UserPoolName?: string | fn.Fn
				UserPoolTags?: {
					[string]: _
				} | fn.Fn
				UsernameAttributes?: [...((string & ("email" | "phone_number")) | fn.Fn)] | fn.Fn
				VerificationMessageTemplate?: {
					DefaultEmailOption?: string | fn.Fn
					EmailMessage?:       string | fn.Fn
					EmailMessageByLink?: string | fn.Fn
					EmailSubject?:       string | fn.Fn
					EmailSubjectByLink?: string | fn.Fn
					SmsMessage?:         string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolClient :: {
			Type: "AWS::Cognito::UserPoolClient"
			Properties: {
				AllowedOAuthFlows?:               [...(string | fn.Fn)] | fn.Fn
				AllowedOAuthFlowsUserPoolClient?: bool | fn.Fn
				AllowedOAuthScopes?:              [...(string | fn.Fn)] | fn.Fn
				AnalyticsConfiguration?: {
					ApplicationId?:  string | fn.Fn
					ExternalId?:     string | fn.Fn
					RoleArn?:        string | fn.Fn
					UserDataShared?: bool | fn.Fn
				}
				CallbackURLs?:               [...(string | fn.Fn)] | fn.Fn
				ClientName?:                 string | fn.Fn
				DefaultRedirectURI?:         string | fn.Fn
				ExplicitAuthFlows?:          [...((string & ("ADMIN_NO_SRP_AUTH" | "CUSTOM_AUTH_FLOW_ONLY" | "USER_PASSWORD_AUTH")) | fn.Fn)] | fn.Fn
				GenerateSecret?:             bool | fn.Fn
				LogoutURLs?:                 [...(string | fn.Fn)] | fn.Fn
				PreventUserExistenceErrors?: string | fn.Fn
				ReadAttributes?:             [...(string | fn.Fn)] | fn.Fn
				RefreshTokenValidity?:       (int & (>=0 & <=3650)) | fn.Fn
				SupportedIdentityProviders?: [...(string | fn.Fn)] | fn.Fn
				UserPoolId:                  string | fn.Fn
				WriteAttributes?:            [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolDomain :: {
			Type: "AWS::Cognito::UserPoolDomain"
			Properties: {
				CustomDomainConfig?: CertificateArn?: string | fn.Fn
				Domain:     string | fn.Fn
				UserPoolId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolGroup :: {
			Type: "AWS::Cognito::UserPoolGroup"
			Properties: {
				Description?: string | fn.Fn
				GroupName?:   string | fn.Fn
				Precedence?:  float | fn.Fn
				RoleArn?:     string | fn.Fn
				UserPoolId:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolIdentityProvider :: {
			Type: "AWS::Cognito::UserPoolIdentityProvider"
			Properties: {
				AttributeMapping?: {
					[string]: _
				} | fn.Fn
				IdpIdentifiers?:  [...(string | fn.Fn)] | fn.Fn
				ProviderDetails?: {
					[string]: _
				} | fn.Fn
				ProviderName: string | fn.Fn
				ProviderType: string | fn.Fn
				UserPoolId:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolResourceServer :: {
			Type: "AWS::Cognito::UserPoolResourceServer"
			Properties: {
				Identifier: string | fn.Fn
				Name:       string | fn.Fn
				Scopes?: [...{
					ScopeDescription: string | fn.Fn
					ScopeName:        string | fn.Fn
				}]
				UserPoolId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolRiskConfigurationAttachment :: {
			Type: "AWS::Cognito::UserPoolRiskConfigurationAttachment"
			Properties: {
				AccountTakeoverRiskConfiguration?: {
					Actions: {
						HighAction?: {
							EventAction: string | fn.Fn
							Notify:      bool | fn.Fn
						}
						LowAction?: {
							EventAction: string | fn.Fn
							Notify:      bool | fn.Fn
						}
						MediumAction?: {
							EventAction: string | fn.Fn
							Notify:      bool | fn.Fn
						}
					}
					NotifyConfiguration?: {
						BlockEmail?: {
							HtmlBody?: string | fn.Fn
							Subject:   string | fn.Fn
							TextBody?: string | fn.Fn
						}
						From?: string | fn.Fn
						MfaEmail?: {
							HtmlBody?: string | fn.Fn
							Subject:   string | fn.Fn
							TextBody?: string | fn.Fn
						}
						NoActionEmail?: {
							HtmlBody?: string | fn.Fn
							Subject:   string | fn.Fn
							TextBody?: string | fn.Fn
						}
						ReplyTo?:  string | fn.Fn
						SourceArn: string | fn.Fn
					}
				}
				ClientId: string | fn.Fn
				CompromisedCredentialsRiskConfiguration?: {
					Actions: EventAction: string | fn.Fn
					EventFilter?: [...(string | fn.Fn)] | fn.Fn
				}
				RiskExceptionConfiguration?: {
					BlockedIPRangeList?: [...(string | fn.Fn)] | fn.Fn
					SkippedIPRangeList?: [...(string | fn.Fn)] | fn.Fn
				}
				UserPoolId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolUICustomizationAttachment :: {
			Type: "AWS::Cognito::UserPoolUICustomizationAttachment"
			Properties: {
				CSS?:       string | fn.Fn
				ClientId:   string | fn.Fn
				UserPoolId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolUser :: {
			Type: "AWS::Cognito::UserPoolUser"
			Properties: {
				ClientMetadata?: {
					[string]: _
				} | fn.Fn
				DesiredDeliveryMediums?: [...((string & ("EMAIL" | "SMS")) | fn.Fn)] | fn.Fn
				ForceAliasCreation?:     bool | fn.Fn
				MessageAction?:          (string & ("RESEND" | "SUPPRESS")) | fn.Fn
				UserAttributes?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				UserPoolId: string | fn.Fn
				Username?:  string | fn.Fn
				ValidationData?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserPoolUserToGroupAttachment :: {
			Type: "AWS::Cognito::UserPoolUserToGroupAttachment"
			Properties: {
				GroupName:  string | fn.Fn
				UserPoolId: string | fn.Fn
				Username:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Config :: {
		AggregationAuthorization :: {
			Type: "AWS::Config::AggregationAuthorization"
			Properties: {
				AuthorizedAccountId: string | fn.Fn
				AuthorizedAwsRegion: (string & ("ap-northeast-1" | "ap-northeast-2" | "ap-northeast-3" | "ap-south-1" | "ap-southeast-1" | "ap-southeast-2" | "ca-central-1" | "eu-central-1" | "eu-north-1" | "eu-west-1" | "eu-west-2" | "eu-west-3" | "sa-east-1" | "us-east-1" | "us-east-2" | "us-gov-east-1" | "us-gov-west-1" | "us-west-1" | "us-west-2")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ConfigRule :: {
			Type: "AWS::Config::ConfigRule"
			Properties: {
				ConfigRuleName?:  string | fn.Fn
				Description?:     string | fn.Fn
				InputParameters?: {
					[string]: _
				} | fn.Fn
				MaximumExecutionFrequency?: (string & ("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours")) | fn.Fn
				Scope?: {
					ComplianceResourceId?:    string | fn.Fn
					ComplianceResourceTypes?: [...((string & ("AWS::ACM::Certificate" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::Volume" | "AWS::EC2::VPC" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::Elasticsearch::Domain" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::KMS::Key" | "AWS::Lambda::Function" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::Bucket" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::XRay::EncryptionConfig")) | fn.Fn)] | fn.Fn
					TagKey?:                  string | fn.Fn
					TagValue?:                string | fn.Fn
				}
				Source: {
					Owner: (string & ("AWS" | "CUSTOM_LAMBDA")) | fn.Fn
					SourceDetails?: [...{
						EventSource:                (string & ("aws.config")) | fn.Fn
						MaximumExecutionFrequency?: (string & ("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours")) | fn.Fn
						MessageType:                (string & ("ConfigurationItemChangeNotification" | "ConfigurationSnapshotDeliveryCompleted" | "OversizedConfigurationItemChangeNotification" | "ScheduledNotification")) | fn.Fn
					}]
					SourceIdentifier: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ConfigurationAggregator :: {
			Type: "AWS::Config::ConfigurationAggregator"
			Properties: {
				AccountAggregationSources?: [...{
					AccountIds:     [...(string | fn.Fn)] | fn.Fn
					AllAwsRegions?: bool | fn.Fn
					AwsRegions?:    [...(string | fn.Fn)] | fn.Fn
				}]
				ConfigurationAggregatorName: string | fn.Fn
				OrganizationAggregationSource?: {
					AllAwsRegions?: bool | fn.Fn
					AwsRegions?:    [...(string | fn.Fn)] | fn.Fn
					RoleArn:        string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ConfigurationRecorder :: {
			Type: "AWS::Config::ConfigurationRecorder"
			Properties: {
				Name?: string | fn.Fn
				RecordingGroup?: {
					AllSupported?:               bool | fn.Fn
					IncludeGlobalResourceTypes?: bool | fn.Fn
					ResourceTypes?:              [...((string & ("AWS::ACM::Certificate" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::Volume" | "AWS::EC2::VPC" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::Elasticsearch::Domain" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::KMS::Key" | "AWS::Lambda::Function" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::Bucket" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::XRay::EncryptionConfig")) | fn.Fn)] | fn.Fn
				}
				RoleARN: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DeliveryChannel :: {
			Type: "AWS::Config::DeliveryChannel"
			Properties: {
				ConfigSnapshotDeliveryProperties?: DeliveryFrequency?: (string & ("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours")) | fn.Fn
				Name?:        string | fn.Fn
				S3BucketName: string | fn.Fn
				S3KeyPrefix?: string | fn.Fn
				SnsTopicARN?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		OrganizationConfigRule :: {
			Type: "AWS::Config::OrganizationConfigRule"
			Properties: {
				ExcludedAccounts?:          [...(string | fn.Fn)] | fn.Fn
				OrganizationConfigRuleName: string | fn.Fn
				OrganizationCustomRuleMetadata?: {
					Description?:                       string | fn.Fn
					InputParameters?:                   string | fn.Fn
					LambdaFunctionArn:                  string | fn.Fn
					MaximumExecutionFrequency?:         string | fn.Fn
					OrganizationConfigRuleTriggerTypes: [...(string | fn.Fn)] | fn.Fn
					ResourceIdScope?:                   string | fn.Fn
					ResourceTypesScope?:                [...(string | fn.Fn)] | fn.Fn
					TagKeyScope?:                       string | fn.Fn
					TagValueScope?:                     string | fn.Fn
				}
				OrganizationManagedRuleMetadata?: {
					Description?:               string | fn.Fn
					InputParameters?:           string | fn.Fn
					MaximumExecutionFrequency?: string | fn.Fn
					ResourceIdScope?:           string | fn.Fn
					ResourceTypesScope?:        [...(string | fn.Fn)] | fn.Fn
					RuleIdentifier:             string | fn.Fn
					TagKeyScope?:               string | fn.Fn
					TagValueScope?:             string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RemediationConfiguration :: {
			Type: "AWS::Config::RemediationConfiguration"
			Properties: {
				Automatic?:     bool | fn.Fn
				ConfigRuleName: string | fn.Fn
				ExecutionControls?: SsmControls?: {
					ConcurrentExecutionRatePercentage?: int | fn.Fn
					ErrorPercentage?:                   int | fn.Fn
				}
				MaximumAutomaticAttempts?: int | fn.Fn
				Parameters?:               {
					[string]: _
				} | fn.Fn
				ResourceType?:        string | fn.Fn
				RetryAttemptSeconds?: int | fn.Fn
				TargetId:             string | fn.Fn
				TargetType:           string | fn.Fn
				TargetVersion?:       string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	DAX :: {
		Cluster :: {
			Type: "AWS::DAX::Cluster"
			Properties: {
				AvailabilityZones?:          [...(string | fn.Fn)] | fn.Fn
				ClusterName?:                string | fn.Fn
				Description?:                string | fn.Fn
				IAMRoleARN:                  string | fn.Fn
				NodeType:                    (string & ("dax.r3.2xlarge" | "dax.r3.4xlarge" | "dax.r3.8xlarge" | "dax.r3.large" | "dax.r3.xlarge" | "dax.r4.16xlarge" | "dax.r4.2xlarge" | "dax.r4.4xlarge" | "dax.r4.8xlarge" | "dax.r4.large" | "dax.r4.xlarge" | "dax.t2.medium" | "dax.t2.small")) | fn.Fn
				NotificationTopicARN?:       string | fn.Fn
				ParameterGroupName?:         string | fn.Fn
				PreferredMaintenanceWindow?: string | fn.Fn
				ReplicationFactor:           int | fn.Fn
				SSESpecification?: SSEEnabled?: bool | fn.Fn
				SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
				SubnetGroupName?:  string | fn.Fn
				Tags?:             {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ParameterGroup :: {
			Type: "AWS::DAX::ParameterGroup"
			Properties: {
				Description?:         string | fn.Fn
				ParameterGroupName?:  string | fn.Fn
				ParameterNameValues?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SubnetGroup :: {
			Type: "AWS::DAX::SubnetGroup"
			Properties: {
				Description?:     string | fn.Fn
				SubnetGroupName?: string | fn.Fn
				SubnetIds:        [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	DLM :: {
		LifecyclePolicy :: {
			Type: "AWS::DLM::LifecyclePolicy"
			Properties: {
				Description?:     string | fn.Fn
				ExecutionRoleArn: string | fn.Fn
				PolicyDetails?: {
					Parameters?: ExcludeBootVolume?: bool | fn.Fn
					PolicyType?:    string | fn.Fn
					ResourceTypes?: [...((string & ("INSTANCE" | "VOLUME")) | fn.Fn)] | fn.Fn
					Schedules?: [...{
						CopyTags?: bool | fn.Fn
						CreateRule?: {
							Interval:     int | fn.Fn
							IntervalUnit: string | fn.Fn
							Times?:       [...(string | fn.Fn)] | fn.Fn
						}
						FastRestoreRule?: {
							AvailabilityZones?: [...(string | fn.Fn)] | fn.Fn
							Count:              int | fn.Fn
						}
						Name?: string | fn.Fn
						RetainRule?: Count: int | fn.Fn
						TagsToAdd?: [...{
							Key:   string | fn.Fn
							Value: string | fn.Fn
						}]
						VariableTags?: [...{
							Key:   string | fn.Fn
							Value: string | fn.Fn
						}]
					}]
					TargetTags?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}
				State: (string & ("DISABLED" | "ENABLED")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	DMS :: {
		Certificate :: {
			Type: "AWS::DMS::Certificate"
			Properties: {
				CertificateIdentifier?: string | fn.Fn
				CertificatePem?:        string | fn.Fn
				CertificateWallet?:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Endpoint :: {
			Type: "AWS::DMS::Endpoint"
			Properties: {
				CertificateArn?: string | fn.Fn
				DatabaseName?:   string | fn.Fn
				DynamoDbSettings?: ServiceAccessRoleArn?: string | fn.Fn
				ElasticsearchSettings?: {
					EndpointUri?:             string | fn.Fn
					ErrorRetryDuration?:      int | fn.Fn
					FullLoadErrorPercentage?: int | fn.Fn
					ServiceAccessRoleArn?:    string | fn.Fn
				}
				EndpointIdentifier?:        string | fn.Fn
				EndpointType:               (string & ("source" | "target")) | fn.Fn
				EngineName:                 (string & ("aurora-postgresql" | "aurora" | "azuredb" | "db2" | "dynamodb" | "mariadb" | "mongodb" | "mysql" | "oracle" | "postgres" | "redshift" | "s3" | "sqlserver" | "sybase")) | fn.Fn
				ExtraConnectionAttributes?: string | fn.Fn
				KinesisSettings?: {
					MessageFormat?:        string | fn.Fn
					ServiceAccessRoleArn?: string | fn.Fn
					StreamArn?:            string | fn.Fn
				}
				KmsKeyId?: string | fn.Fn
				MongoDbSettings?: {
					AuthMechanism?:     string | fn.Fn
					AuthSource?:        string | fn.Fn
					AuthType?:          string | fn.Fn
					DatabaseName?:      string | fn.Fn
					DocsToInvestigate?: string | fn.Fn
					ExtractDocId?:      string | fn.Fn
					NestingLevel?:      string | fn.Fn
					Password?:          string | fn.Fn
					Port?:              int | fn.Fn
					ServerName?:        string | fn.Fn
					Username?:          string | fn.Fn
				}
				Password?: string | fn.Fn
				Port?:     int | fn.Fn
				S3Settings?: {
					BucketFolder?:            string | fn.Fn
					BucketName?:              string | fn.Fn
					CompressionType?:         string | fn.Fn
					CsvDelimiter?:            string | fn.Fn
					CsvRowDelimiter?:         string | fn.Fn
					ExternalTableDefinition?: string | fn.Fn
					ServiceAccessRoleArn?:    string | fn.Fn
				}
				ServerName?: string | fn.Fn
				SslMode?:    (string & ("none" | "require" | "verify-ca" | "verify-full")) | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Username?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EventSubscription :: {
			Type: "AWS::DMS::EventSubscription"
			Properties: {
				Enabled?:          bool | fn.Fn
				EventCategories?:  [...(string | fn.Fn)] | fn.Fn
				SnsTopicArn:       string | fn.Fn
				SourceIds?:        [...(string | fn.Fn)] | fn.Fn
				SourceType?:       string | fn.Fn
				SubscriptionName?: string | fn.Fn
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
		ReplicationInstance :: {
			Type: "AWS::DMS::ReplicationInstance"
			Properties: {
				AllocatedStorage?:                 int | fn.Fn
				AllowMajorVersionUpgrade?:         bool | fn.Fn
				AutoMinorVersionUpgrade?:          bool | fn.Fn
				AvailabilityZone?:                 string | fn.Fn
				EngineVersion?:                    string | fn.Fn
				KmsKeyId?:                         string | fn.Fn
				MultiAZ?:                          bool | fn.Fn
				PreferredMaintenanceWindow?:       string | fn.Fn
				PubliclyAccessible?:               bool | fn.Fn
				ReplicationInstanceClass:          string | fn.Fn
				ReplicationInstanceIdentifier?:    string | fn.Fn
				ReplicationSubnetGroupIdentifier?: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcSecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ReplicationSubnetGroup :: {
			Type: "AWS::DMS::ReplicationSubnetGroup"
			Properties: {
				ReplicationSubnetGroupDescription: string | fn.Fn
				ReplicationSubnetGroupIdentifier?: string | fn.Fn
				SubnetIds:                         [...(string | fn.Fn)] | fn.Fn
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
		ReplicationTask :: {
			Type: "AWS::DMS::ReplicationTask"
			Properties: {
				CdcStartPosition?:          string | fn.Fn
				CdcStartTime?:              float | fn.Fn
				CdcStopPosition?:           string | fn.Fn
				MigrationType:              string | fn.Fn
				ReplicationInstanceArn:     string | fn.Fn
				ReplicationTaskIdentifier?: string | fn.Fn
				ReplicationTaskSettings?:   string | fn.Fn
				SourceEndpointArn:          string | fn.Fn
				TableMappings:              string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TargetEndpointArn: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	DataPipeline :: {
		Pipeline :: {
			Type: "AWS::DataPipeline::Pipeline"
			Properties: {
				Activate?:    bool | fn.Fn
				Description?: string | fn.Fn
				Name:         string | fn.Fn
				ParameterObjects: [...{
					Attributes: [...{
						Key:         string | fn.Fn
						StringValue: string | fn.Fn
					}]
					Id: string | fn.Fn
				}]
				ParameterValues?: [...{
					Id:          string | fn.Fn
					StringValue: string | fn.Fn
				}]
				PipelineObjects?: [...{
					Fields: [...{
						Key:          string | fn.Fn
						RefValue?:    string | fn.Fn
						StringValue?: string | fn.Fn
					}]
					Id:   string | fn.Fn
					Name: string | fn.Fn
				}]
				PipelineTags?: [...{
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

	DirectoryService :: {
		MicrosoftAD :: {
			Type: "AWS::DirectoryService::MicrosoftAD"
			Properties: {
				CreateAlias?: bool | fn.Fn
				Edition?:     (string & ("Enterprise" | "Standard")) | fn.Fn
				EnableSso?:   bool | fn.Fn
				Name:         string | fn.Fn
				Password:     string | fn.Fn
				ShortName?:   string | fn.Fn
				VpcSettings: {
					SubnetIds: [...(string | fn.Fn)] | fn.Fn
					VpcId:     string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SimpleAD :: {
			Type: "AWS::DirectoryService::SimpleAD"
			Properties: {
				CreateAlias?: bool | fn.Fn
				Description?: string | fn.Fn
				EnableSso?:   bool | fn.Fn
				Name:         string | fn.Fn
				Password:     string | fn.Fn
				ShortName?:   string | fn.Fn
				Size:         (string & ("Large" | "Small")) | fn.Fn
				VpcSettings: {
					SubnetIds: [...(string | fn.Fn)] | fn.Fn
					VpcId:     string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	DocDB :: {
		DBCluster :: {
			Type: "AWS::DocDB::DBCluster"
			Properties: {
				AvailabilityZones?:           [...(string | fn.Fn)] | fn.Fn
				BackupRetentionPeriod?:       (int & (>=1 & <=35)) | fn.Fn
				DBClusterIdentifier?:         string | fn.Fn
				DBClusterParameterGroupName?: string | fn.Fn
				DBSubnetGroupName?:           string | fn.Fn
				EnableCloudwatchLogsExports?: [...(string | fn.Fn)] | fn.Fn
				EngineVersion?:               (string & ("3.6.0")) | fn.Fn
				KmsKeyId?:                    string | fn.Fn
				MasterUserPassword:           string | fn.Fn
				MasterUsername:               string | fn.Fn
				Port?:                        int | fn.Fn
				PreferredBackupWindow?:       string | fn.Fn
				PreferredMaintenanceWindow?:  string | fn.Fn
				SnapshotIdentifier?:          string | fn.Fn
				StorageEncrypted?:            bool | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcSecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DBClusterParameterGroup :: {
			Type: "AWS::DocDB::DBClusterParameterGroup"
			Properties: {
				Description: string | fn.Fn
				Family:      string | fn.Fn
				Name?:       string | fn.Fn
				Parameters:  {
					[string]: _
				} | fn.Fn
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
		DBInstance :: {
			Type: "AWS::DocDB::DBInstance"
			Properties: {
				AutoMinorVersionUpgrade?:    bool | fn.Fn
				AvailabilityZone?:           string | fn.Fn
				DBClusterIdentifier:         string | fn.Fn
				DBInstanceClass:             (string & ("db.r4.16xlarge" | "db.r4.2xlarge" | "db.r4.4xlarge" | "db.r4.8xlarge" | "db.r4.large" | "db.r4.xlarge" | "db.r5.12xlarge" | "db.r5.24xlarge" | "db.r5.2xlarge" | "db.r5.4xlarge" | "db.r5.large" | "db.r5.xlarge")) | fn.Fn
				DBInstanceIdentifier?:       string | fn.Fn
				PreferredMaintenanceWindow?: string | fn.Fn
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
		DBSubnetGroup :: {
			Type: "AWS::DocDB::DBSubnetGroup"
			Properties: {
				DBSubnetGroupDescription: string | fn.Fn
				DBSubnetGroupName?:       string | fn.Fn
				SubnetIds:                [...(string | fn.Fn)] | fn.Fn
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
	}

	DynamoDB :: {
		Table :: {
			Type: "AWS::DynamoDB::Table"
			Properties: {
				AttributeDefinitions: [...{
					AttributeName: string | fn.Fn
					AttributeType: (string & ("B" | "N" | "S")) | fn.Fn
				}]
				BillingMode?: (string & ("PAY_PER_REQUEST" | "PROVISIONED")) | fn.Fn
				GlobalSecondaryIndexes?: [...{
					IndexName: string | fn.Fn
					KeySchema: [...{
						AttributeName: string | fn.Fn
						KeyType:       (string & ("HASH" | "RANGE")) | fn.Fn
					}]
					Projection: {
						NonKeyAttributes?: [...(string | fn.Fn)] | fn.Fn
						ProjectionType?:   (string & ("ALL" | "INCLUDE" | "KEYS_ONLY")) | fn.Fn
					}
					ProvisionedThroughput?: {
						ReadCapacityUnits:  int | fn.Fn
						WriteCapacityUnits: int | fn.Fn
					}
				}]
				KeySchema: [...{
					AttributeName: string | fn.Fn
					KeyType:       (string & ("HASH" | "RANGE")) | fn.Fn
				}]
				LocalSecondaryIndexes?: [...{
					IndexName: string | fn.Fn
					KeySchema: [...{
						AttributeName: string | fn.Fn
						KeyType:       (string & ("HASH" | "RANGE")) | fn.Fn
					}]
					Projection: {
						NonKeyAttributes?: [...(string | fn.Fn)] | fn.Fn
						ProjectionType?:   (string & ("ALL" | "INCLUDE" | "KEYS_ONLY")) | fn.Fn
					}
				}]
				PointInTimeRecoverySpecification?: PointInTimeRecoveryEnabled?: bool | fn.Fn
				ProvisionedThroughput?: {
					ReadCapacityUnits:  int | fn.Fn
					WriteCapacityUnits: int | fn.Fn
				}
				SSESpecification?: {
					KMSMasterKeyId?: string | fn.Fn
					SSEEnabled:      bool | fn.Fn
					SSEType?:        string | fn.Fn
				}
				StreamSpecification?: StreamViewType: (string & ("KEYS_ONLY" | "NEW_AND_OLD_IMAGES" | "NEW_IMAGE" | "OLD_IMAGE")) | fn.Fn
				TableName?: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TimeToLiveSpecification?: {
					AttributeName: string | fn.Fn
					Enabled:       bool | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	EC2 :: {
		CapacityReservation :: {
			Type: "AWS::EC2::CapacityReservation"
			Properties: {
				AvailabilityZone:       string | fn.Fn
				EbsOptimized?:          bool | fn.Fn
				EndDate?:               string | fn.Fn
				EndDateType?:           (string & ("limited" | "unlimited")) | fn.Fn
				EphemeralStorage?:      bool | fn.Fn
				InstanceCount:          int | fn.Fn
				InstanceMatchCriteria?: (string & ("open" | "targeted")) | fn.Fn
				InstancePlatform:       (string & ("Linux/UNIX" | "Red Hat Enterprise Linux" | "SUSE Linux" | "Windows with SQL Server Enterprise" | "Windows with SQL Server Standard" | "Windows with SQL Server Web" | "Windows with SQL Server" | "Windows")) | fn.Fn
				InstanceType:           (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
				TagSpecifications?: [...{
					ResourceType?: string | fn.Fn
					Tags?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				Tenancy?: (string & ("dedicated" | "default")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ClientVpnAuthorizationRule :: {
			Type: "AWS::EC2::ClientVpnAuthorizationRule"
			Properties: {
				AccessGroupId?:      string | fn.Fn
				AuthorizeAllGroups?: bool | fn.Fn
				ClientVpnEndpointId: string | fn.Fn
				Description?:        string | fn.Fn
				TargetNetworkCidr:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ClientVpnEndpoint :: {
			Type: "AWS::EC2::ClientVpnEndpoint"
			Properties: {
				AuthenticationOptions: [...{
					ActiveDirectory?: DirectoryId:                        string | fn.Fn
					MutualAuthentication?: ClientRootCertificateChainArn: string | fn.Fn
					Type: string | fn.Fn
				}]
				ClientCidrBlock: string | fn.Fn
				ConnectionLogOptions: {
					CloudwatchLogGroup?:  string | fn.Fn
					CloudwatchLogStream?: string | fn.Fn
					Enabled:              bool | fn.Fn
				}
				Description?:         string | fn.Fn
				DnsServers?:          [...(string | fn.Fn)] | fn.Fn
				ServerCertificateArn: string | fn.Fn
				SplitTunnel?:         bool | fn.Fn
				TagSpecifications?: [...{
					ResourceType: string | fn.Fn
					Tags: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				TransportProtocol?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ClientVpnRoute :: {
			Type: "AWS::EC2::ClientVpnRoute"
			Properties: {
				ClientVpnEndpointId:  string | fn.Fn
				Description?:         string | fn.Fn
				DestinationCidrBlock: string | fn.Fn
				TargetVpcSubnetId:    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ClientVpnTargetNetworkAssociation :: {
			Type: "AWS::EC2::ClientVpnTargetNetworkAssociation"
			Properties: {
				ClientVpnEndpointId: string | fn.Fn
				SubnetId:            string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		CustomerGateway :: {
			Type: "AWS::EC2::CustomerGateway"
			Properties: {
				BgpAsn:    int | fn.Fn
				IpAddress: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Type: (string & ("ipsec.1")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DHCPOptions :: {
			Type: "AWS::EC2::DHCPOptions"
			Properties: {
				DomainName?:         string | fn.Fn
				DomainNameServers?:  [...(string | fn.Fn)] | fn.Fn
				NetbiosNameServers?: [...(string | fn.Fn)] | fn.Fn
				NetbiosNodeType?:    (int & (1 | 2 | 4 | 8)) | fn.Fn
				NtpServers?:         [...(string | fn.Fn)] | fn.Fn
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
		EC2Fleet :: {
			Type: "AWS::EC2::EC2Fleet"
			Properties: {
				ExcessCapacityTerminationPolicy?: (string & ("no-termination" | "termination")) | fn.Fn
				LaunchTemplateConfigs: [...{
					LaunchTemplateSpecification?: {
						LaunchTemplateId?:   string | fn.Fn
						LaunchTemplateName?: string | fn.Fn
						Version?:            string | fn.Fn
					}
					Overrides?: [...{
						AvailabilityZone?: string | fn.Fn
						InstanceType?:     (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
						MaxPrice?:         string | fn.Fn
						Priority?:         float | fn.Fn
						SubnetId?:         string | fn.Fn
						WeightedCapacity?: float | fn.Fn
					}]
				}]
				OnDemandOptions?: AllocationStrategy?: (string & ("lowest-price" | "prioritized")) | fn.Fn
				ReplaceUnhealthyInstances?: bool | fn.Fn
				SpotOptions?: {
					AllocationStrategy?:           (string & ("capacityOptimized" | "diversified" | "lowestPrice")) | fn.Fn
					InstanceInterruptionBehavior?: (string & ("hibernate" | "stop" | "terminate")) | fn.Fn
					InstancePoolsToUseCount?:      int | fn.Fn
				}
				TagSpecifications?: [...{
					ResourceType?: string | fn.Fn
					Tags?: [...{
						Key?:   string | fn.Fn
						Value?: string | fn.Fn
					}]
				}]
				TargetCapacitySpecification: {
					DefaultTargetCapacityType?: (string & ("on-demand" | "spot")) | fn.Fn
					OnDemandTargetCapacity?:    int | fn.Fn
					SpotTargetCapacity?:        int | fn.Fn
					TotalTargetCapacity:        int | fn.Fn
				}
				TerminateInstancesWithExpiration?: bool | fn.Fn
				Type?:                             (string & ("instant" | "maintain" | "request")) | fn.Fn
				ValidFrom?:                        string | fn.Fn
				ValidUntil?:                       string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EIP :: {
			Type: "AWS::EC2::EIP"
			Properties: {
				Domain?:         (string & ("standard" | "vpc")) | fn.Fn
				InstanceId?:     string | fn.Fn
				PublicIpv4Pool?: string | fn.Fn
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
		EIPAssociation :: {
			Type: "AWS::EC2::EIPAssociation"
			Properties: {
				AllocationId?:       string | fn.Fn
				EIP?:                string | fn.Fn
				InstanceId?:         string | fn.Fn
				NetworkInterfaceId?: string | fn.Fn
				PrivateIpAddress?:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EgressOnlyInternetGateway :: {
			Type: "AWS::EC2::EgressOnlyInternetGateway"
			Properties: VpcId: string | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		FlowLog :: {
			Type: "AWS::EC2::FlowLog"
			Properties: {
				DeliverLogsPermissionArn?: string | fn.Fn
				LogDestination?:           string | fn.Fn
				LogDestinationType?:       (string & ("cloud-watch-logs" | "s3")) | fn.Fn
				LogGroupName?:             string | fn.Fn
				ResourceId:                string | fn.Fn
				ResourceType:              (string & ("NetworkInterface" | "Subnet" | "VPC")) | fn.Fn
				TrafficType:               (string & ("ACCEPT" | "ALL" | "REJECT")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Host :: {
			Type: "AWS::EC2::Host"
			Properties: {
				AutoPlacement?:   (string & ("off" | "on")) | fn.Fn
				AvailabilityZone: string | fn.Fn
				HostRecovery?:    string | fn.Fn
				InstanceType:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Instance :: {
			Type: "AWS::EC2::Instance"
			Properties: {
				AdditionalInfo?:   string | fn.Fn
				Affinity?:         (string & ("default" | "host")) | fn.Fn
				AvailabilityZone?: string | fn.Fn
				BlockDeviceMappings?: [...{
					DeviceName: string | fn.Fn
					Ebs?: {
						DeleteOnTermination?: bool | fn.Fn
						Encrypted?:           bool | fn.Fn
						Iops?:                (int & (>=100 & <=20000)) | fn.Fn
						KmsKeyId?:            string | fn.Fn
						SnapshotId?:          string | fn.Fn
						VolumeSize?:          int | fn.Fn
						VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
					}
					NoDevice?:    string | fn.Fn
					VirtualName?: string | fn.Fn
				}]
				CpuOptions?: {
					CoreCount?:      int | fn.Fn
					ThreadsPerCore?: int | fn.Fn
				}
				CreditSpecification?: CPUCredits?: (string & ("standard" | "unlimited")) | fn.Fn
				DisableApiTermination?: bool | fn.Fn
				EbsOptimized?:          bool | fn.Fn
				ElasticGpuSpecifications?: [...{
					Type: string | fn.Fn
				}]
				ElasticInferenceAccelerators?: [...{
					Count?: int | fn.Fn
					Type:   (string & ("eia1.large" | "eia1.medium" | "eia1.xlarge")) | fn.Fn
				}]
				HostId?:                            string | fn.Fn
				IamInstanceProfile?:                (string & (=~#"[a-zA-Z0-9+=,.@\-_]+"#)) | fn.Fn
				ImageId?:                           string | fn.Fn
				InstanceInitiatedShutdownBehavior?: string | fn.Fn
				InstanceType?:                      (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
				Ipv6AddressCount?:                  int | fn.Fn
				Ipv6Addresses?: [...{
					Ipv6Address: string | fn.Fn
				}]
				KernelId?: string | fn.Fn
				KeyName?:  string | fn.Fn
				LaunchTemplate?: {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version:             string | fn.Fn
				}
				LicenseSpecifications?: [...{
					LicenseConfigurationArn: string | fn.Fn
				}]
				Monitoring?: bool | fn.Fn
				NetworkInterfaces?: [...{
					AssociatePublicIpAddress?: bool | fn.Fn
					DeleteOnTermination?:      bool | fn.Fn
					Description?:              string | fn.Fn
					DeviceIndex:               string | fn.Fn
					GroupSet?:                 [...(string | fn.Fn)] | fn.Fn
					Ipv6AddressCount?:         int | fn.Fn
					Ipv6Addresses?: [...{
						Ipv6Address: string | fn.Fn
					}]
					NetworkInterfaceId?: string | fn.Fn
					PrivateIpAddress?:   string | fn.Fn
					PrivateIpAddresses?: [...{
						Primary:          bool | fn.Fn
						PrivateIpAddress: string | fn.Fn
					}]
					SecondaryPrivateIpAddressCount?: int | fn.Fn
					SubnetId?:                       string | fn.Fn
				}]
				PlacementGroupName?: string | fn.Fn
				PrivateIpAddress?:   string | fn.Fn
				RamdiskId?:          string | fn.Fn
				SecurityGroupIds?:   [...(string | fn.Fn)] | fn.Fn
				SecurityGroups?:     [...(string | fn.Fn)] | (RefTypeCheck & {ResourceType :: ["AWS::EC2::SecurityGroup"], ParameterType :: ["AWS::EC2::SecurityGroup::Id"]}) | (GetAttTypeCheck & {ResourceType :: {
					"AWS::EC2::SecurityGroup": "GroupId"
					"AWS::EC2::VPC":           "DefaultSecurityGroup"
				}}) | ImportValue
				SourceDestCheck?: bool | fn.Fn
				SsmAssociations?: [...{
					AssociationParameters?: [...{
						Key:   string | fn.Fn
						Value: [...(string | fn.Fn)] | fn.Fn
					}]
					DocumentName: string | fn.Fn
				}]
				SubnetId?: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Tenancy?:  (string & ("dedicated" | "default" | "host")) | fn.Fn
				UserData?: string | fn.Fn
				Volumes?: [...{
					Device:   string | fn.Fn
					VolumeId: string | fn.Fn
				}]
			}
			DependsOn?: string | [...string]
			CreationPolicy?: {
				AutoScalingCreationPolicy?: MinSuccessfulInstancesPercent?: int
				ResourceSignal?: {
					Count?:   int
					Timeout?: string
				}
			}
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		InternetGateway :: {
			Type: "AWS::EC2::InternetGateway"
			Properties: Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LaunchTemplate :: {
			Type: "AWS::EC2::LaunchTemplate"
			Properties: {
				LaunchTemplateData?: {
					BlockDeviceMappings?: [...{
						DeviceName?: string | fn.Fn
						Ebs?: {
							DeleteOnTermination?: bool | fn.Fn
							Encrypted?:           bool | fn.Fn
							Iops?:                int | fn.Fn
							KmsKeyId?:            string | fn.Fn
							SnapshotId?:          string | fn.Fn
							VolumeSize?:          int | fn.Fn
							VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
						}
						NoDevice?:    string | fn.Fn
						VirtualName?: string | fn.Fn
					}]
					CapacityReservationSpecification?: {
						CapacityReservationPreference?: string | fn.Fn
						CapacityReservationTarget?: CapacityReservationId?: string | fn.Fn
					}
					CpuOptions?: {
						CoreCount?:      int | fn.Fn
						ThreadsPerCore?: int | fn.Fn
					}
					CreditSpecification?: CpuCredits?: (string & ("standard" | "unlimited")) | fn.Fn
					DisableApiTermination?: bool | fn.Fn
					EbsOptimized?:          bool | fn.Fn
					ElasticGpuSpecifications?: [...{
						Type?: string | fn.Fn
					}]
					ElasticInferenceAccelerators?: [...{
						Type?: string | fn.Fn
					}]
					HibernationOptions?: Configured?: bool | fn.Fn
					IamInstanceProfile?: {
						Arn?:  string | fn.Fn
						Name?: (string & (=~#"[a-zA-Z0-9+=,.@\-_]+"#)) | fn.Fn
					}
					ImageId?:                           string | fn.Fn
					InstanceInitiatedShutdownBehavior?: (string & ("stop" | "terminate")) | fn.Fn
					InstanceMarketOptions?: {
						MarketType?: (string & ("spot")) | fn.Fn
						SpotOptions?: {
							BlockDurationMinutes?:         int | fn.Fn
							InstanceInterruptionBehavior?: (string & ("hibernate" | "stop" | "terminate")) | fn.Fn
							MaxPrice?:                     string | fn.Fn
							SpotInstanceType?:             (string & ("one-time" | "persistent")) | fn.Fn
							ValidUntil?:                   string | fn.Fn
						}
					}
					InstanceType?: (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
					KernelId?:     string | fn.Fn
					KeyName?:      string | fn.Fn
					LicenseSpecifications?: [...{
						LicenseConfigurationArn?: string | fn.Fn
					}]
					Monitoring?: Enabled?: bool | fn.Fn
					NetworkInterfaces?: [...{
						AssociatePublicIpAddress?: bool | fn.Fn
						DeleteOnTermination?:      bool | fn.Fn
						Description?:              string | fn.Fn
						DeviceIndex?:              int | fn.Fn
						Groups?:                   [...(string | fn.Fn)] | fn.Fn
						InterfaceType?:            string | fn.Fn
						Ipv6AddressCount?:         int | fn.Fn
						Ipv6Addresses?: [...{
							Ipv6Address?: string | fn.Fn
						}]
						NetworkInterfaceId?: string | fn.Fn
						PrivateIpAddress?:   string | fn.Fn
						PrivateIpAddresses?: [...{
							Primary?:          bool | fn.Fn
							PrivateIpAddress?: string | fn.Fn
						}]
						SecondaryPrivateIpAddressCount?: int | fn.Fn
						SubnetId?:                       string | fn.Fn
					}]
					Placement?: {
						Affinity?:         string | fn.Fn
						AvailabilityZone?: string | fn.Fn
						GroupName?:        string | fn.Fn
						HostId?:           string | fn.Fn
						Tenancy?:          (string & ("dedicated" | "default" | "host")) | fn.Fn
					}
					RamDiskId?:        string | fn.Fn
					SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
					SecurityGroups?:   [...(string | fn.Fn)] | fn.Fn
					TagSpecifications?: [...{
						ResourceType: (string & ("instance" | "volume")) | fn.Fn
						Tags: [...{
							Key:   string | fn.Fn
							Value: string | fn.Fn
						}]
					}]
					UserData?: string | fn.Fn
				}
				LaunchTemplateName?: (string & (strings.MinRunes(3) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9().\-/_]+$"#)) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		NatGateway :: {
			Type: "AWS::EC2::NatGateway"
			Properties: {
				AllocationId: string | fn.Fn
				SubnetId:     string | fn.Fn
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
		NetworkAcl :: {
			Type: "AWS::EC2::NetworkAcl"
			Properties: {
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		NetworkAclEntry :: {
			Type: "AWS::EC2::NetworkAclEntry"
			Properties: {
				CidrBlock?: (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
				Egress?:    bool | fn.Fn
				Icmp?: {
					Code?: int | fn.Fn
					Type?: int | fn.Fn
				}
				Ipv6CidrBlock?: string | fn.Fn
				NetworkAclId:   string | fn.Fn
				PortRange?: {
					From?: int | fn.Fn
					To?:   int | fn.Fn
				}
				Protocol:   int | fn.Fn
				RuleAction: (string & ("allow" | "deny")) | fn.Fn
				RuleNumber: (int & (>=1 & <=32766)) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		NetworkInterface :: {
			Type: "AWS::EC2::NetworkInterface"
			Properties: {
				Description?:      string | fn.Fn
				GroupSet?:         [...(string | fn.Fn)] | fn.Fn
				InterfaceType?:    string | fn.Fn
				Ipv6AddressCount?: int | fn.Fn
				Ipv6Addresses?: Ipv6Address: string | fn.Fn
				PrivateIpAddress?: string | fn.Fn
				PrivateIpAddresses?: [...{
					Primary:          bool | fn.Fn
					PrivateIpAddress: string | fn.Fn
				}]
				SecondaryPrivateIpAddressCount?: int | fn.Fn
				SourceDestCheck?:                bool | fn.Fn
				SubnetId:                        string | fn.Fn
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
		NetworkInterfaceAttachment :: {
			Type: "AWS::EC2::NetworkInterfaceAttachment"
			Properties: {
				DeleteOnTermination?: bool | fn.Fn
				DeviceIndex:          string | fn.Fn
				InstanceId:           string | fn.Fn
				NetworkInterfaceId:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		NetworkInterfacePermission :: {
			Type: "AWS::EC2::NetworkInterfacePermission"
			Properties: {
				AwsAccountId:       string | fn.Fn
				NetworkInterfaceId: string | fn.Fn
				Permission:         (string & ("EIP-ASSOCIATE" | "INSTANCE-ATTACH")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		PlacementGroup :: {
			Type: "AWS::EC2::PlacementGroup"
			Properties: Strategy?: (string & ("cluster" | "partition" | "spread")) | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Route :: {
			Type: "AWS::EC2::Route"
			Properties: {
				DestinationCidrBlock?:        string | fn.Fn
				DestinationIpv6CidrBlock?:    string | fn.Fn
				EgressOnlyInternetGatewayId?: string | fn.Fn
				GatewayId?:                   string | fn.Fn
				InstanceId?:                  string | fn.Fn
				NatGatewayId?:                string | fn.Fn
				NetworkInterfaceId?:          string | fn.Fn
				RouteTableId:                 string | fn.Fn
				TransitGatewayId?:            string | fn.Fn
				VpcPeeringConnectionId?:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RouteTable :: {
			Type: "AWS::EC2::RouteTable"
			Properties: {
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SecurityGroup :: {
			Type: "AWS::EC2::SecurityGroup"
			Properties: {
				GroupDescription: (string & (strings.MinRunes(0) & strings.MaxRunes(255)) & (=~#"^([a-z,A-Z,0-9,. _\-:/()#,@[\]+=&;\{\}!$*])*$"#)) | fn.Fn
				GroupName?:       string | fn.Fn
				SecurityGroupEgress?: [...{
					CidrIp?:                     (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
					CidrIpv6?:                   string | fn.Fn
					Description?:                string | fn.Fn
					DestinationPrefixListId?:    string | fn.Fn
					DestinationSecurityGroupId?: string | fn.Fn
					FromPort?:                   int | fn.Fn
					IpProtocol:                  string | fn.Fn
					ToPort?:                     int | fn.Fn
				}]
				SecurityGroupIngress?: [...{
					CidrIp?:                     (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
					CidrIpv6?:                   string | fn.Fn
					Description?:                string | fn.Fn
					FromPort?:                   int | fn.Fn
					IpProtocol:                  string | fn.Fn
					SourcePrefixListId?:         string | fn.Fn
					SourceSecurityGroupId?:      string | fn.Fn
					SourceSecurityGroupName?:    string | fn.Fn
					SourceSecurityGroupOwnerId?: string | fn.Fn
					ToPort?:                     int | fn.Fn
				}]
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcId?: string | (RefTypeCheck & {ResourceType :: ["AWS::EC2::VPC"], ParameterType :: [
					"AWS::EC2::VPC::Id",
					"AWS::SSM::Parameter::Value<AWS::EC2::VPC::Id>",
				]}) |
					(GetAttTypeCheck & {ResourceType :: {
						"AWS::EC2::SecurityGroup": "VpcId"
						"AWS::EC2::Subnet":        "VpcId"
					}}) | fn.ImportValue
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SecurityGroupEgress :: {
			Type: "AWS::EC2::SecurityGroupEgress"
			Properties: {
				CidrIp?:                     (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
				CidrIpv6?:                   string | fn.Fn
				Description?:                string | fn.Fn
				DestinationPrefixListId?:    string | fn.Fn
				DestinationSecurityGroupId?: string | fn.Fn
				FromPort?:                   int | fn.Fn
				GroupId:                     string | fn.Fn
				IpProtocol:                  string | fn.Fn
				ToPort?:                     int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SecurityGroupIngress :: {
			Type: "AWS::EC2::SecurityGroupIngress"
			Properties: {
				CidrIp?:                     (string & (=~#"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(/([0-9]|[1-2][0-9]|3[0-2]))$"#)) | fn.Fn
				CidrIpv6?:                   string | fn.Fn
				Description?:                string | fn.Fn
				FromPort?:                   int | fn.Fn
				GroupId?:                    string | fn.Fn
				GroupName?:                  string | fn.Fn
				IpProtocol:                  string | fn.Fn
				SourcePrefixListId?:         string | fn.Fn
				SourceSecurityGroupId?:      string | fn.Fn
				SourceSecurityGroupName?:    string | fn.Fn
				SourceSecurityGroupOwnerId?: string | fn.Fn
				ToPort?:                     int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SpotFleet :: {
			Type: "AWS::EC2::SpotFleet"
			Properties: SpotFleetRequestConfigData: {
				AllocationStrategy?:              (string & ("capacityOptimized" | "diversified" | "lowestPrice")) | fn.Fn
				ExcessCapacityTerminationPolicy?: (string & ("default" | "noTermination")) | fn.Fn
				IamFleetRole:                     (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
				InstanceInterruptionBehavior?:    (string & ("hibernate" | "stop" | "terminate")) | fn.Fn
				LaunchSpecifications?: [...{
					BlockDeviceMappings?: [...{
						DeviceName: string | fn.Fn
						Ebs?: {
							DeleteOnTermination?: bool | fn.Fn
							Encrypted?:           bool | fn.Fn
							Iops?:                int | fn.Fn
							SnapshotId?:          string | fn.Fn
							VolumeSize?:          int | fn.Fn
							VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
						}
						NoDevice?:    string | fn.Fn
						VirtualName?: string | fn.Fn
					}]
					EbsOptimized?: bool | fn.Fn
					IamInstanceProfile?: Arn?: string | fn.Fn
					ImageId:      string | fn.Fn
					InstanceType: (string & ("a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.metal" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.metal" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "g4dn.12xlarge" | "g4dn.16xlarge" | "g4dn.2xlarge" | "g4dn.4xlarge" | "g4dn.8xlarge" | "g4dn.metal" | "g4dn.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.16xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.8xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "m5dn.12xlarge" | "m5dn.16xlarge" | "m5dn.24xlarge" | "m5dn.2xlarge" | "m5dn.4xlarge" | "m5dn.8xlarge" | "m5dn.large" | "m5dn.metal" | "m5dn.xlarge" | "m5n.12xlarge" | "m5n.16xlarge" | "m5n.24xlarge" | "m5n.2xlarge" | "m5n.4xlarge" | "m5n.8xlarge" | "m5n.large" | "m5n.metal" | "m5n.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.16xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.8xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "r5dn.12xlarge" | "r5dn.16xlarge" | "r5dn.24xlarge" | "r5dn.2xlarge" | "r5dn.4xlarge" | "r5dn.8xlarge" | "r5dn.large" | "r5dn.metal" | "r5dn.xlarge" | "r5n.12xlarge" | "r5n.16xlarge" | "r5n.24xlarge" | "r5n.2xlarge" | "r5n.4xlarge" | "r5n.8xlarge" | "r5n.large" | "r5n.metal" | "r5n.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge")) | fn.Fn
					KernelId?:    string | fn.Fn
					KeyName?:     string | fn.Fn
					Monitoring?: Enabled?: bool | fn.Fn
					NetworkInterfaces?: [...{
						AssociatePublicIpAddress?: bool | fn.Fn
						DeleteOnTermination?:      bool | fn.Fn
						Description?:              string | fn.Fn
						DeviceIndex?:              int | fn.Fn
						Groups?:                   [...(string | fn.Fn)] | fn.Fn
						Ipv6AddressCount?:         int | fn.Fn
						Ipv6Addresses?: [...{
							Ipv6Address: string | fn.Fn
						}]
						NetworkInterfaceId?: string | fn.Fn
						PrivateIpAddresses?: [...{
							Primary?:         bool | fn.Fn
							PrivateIpAddress: string | fn.Fn
						}]
						SecondaryPrivateIpAddressCount?: int | fn.Fn
						SubnetId?:                       string | fn.Fn
					}]
					Placement?: {
						AvailabilityZone?: string | fn.Fn
						GroupName?:        string | fn.Fn
						Tenancy?:          string | fn.Fn
					}
					RamdiskId?: string | fn.Fn
					SecurityGroups?: [...{
						GroupId: string | fn.Fn
					}]
					SpotPrice?: string | fn.Fn
					SubnetId?:  string | fn.Fn
					TagSpecifications?: [...{
						ResourceType?: string | fn.Fn
						Tags?: [...{
							Key:   string | fn.Fn
							Value: string | fn.Fn
						}]
					}]
					UserData?:         string | fn.Fn
					WeightedCapacity?: float | fn.Fn
				}]
				LaunchTemplateConfigs?: [...{
					LaunchTemplateSpecification?: {
						LaunchTemplateId?:   string | fn.Fn
						LaunchTemplateName?: string | fn.Fn
						Version:             string | fn.Fn
					}
					Overrides?: [...{
						AvailabilityZone?: string | fn.Fn
						InstanceType?:     string | fn.Fn
						SpotPrice?:        string | fn.Fn
						SubnetId?:         string | fn.Fn
						WeightedCapacity?: float | fn.Fn
					}]
				}]
				LoadBalancersConfig?: {
					ClassicLoadBalancersConfig?: ClassicLoadBalancers: [...{
						Name: string | fn.Fn
					}]
					TargetGroupsConfig?: TargetGroups: [...{
						Arn: string | fn.Fn
					}]
				}
				ReplaceUnhealthyInstances?:        bool | fn.Fn
				SpotPrice?:                        string | fn.Fn
				TargetCapacity:                    int | fn.Fn
				TerminateInstancesWithExpiration?: bool | fn.Fn
				Type?:                             (string & ("instant" | "maintain" | "request")) | fn.Fn
				ValidFrom?:                        string | fn.Fn
				ValidUntil?:                       string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Subnet :: {
			Type: "AWS::EC2::Subnet"
			Properties: {
				AssignIpv6AddressOnCreation?: bool | fn.Fn
				AvailabilityZone?:            string | fn.Fn
				CidrBlock:                    string | fn.Fn
				Ipv6CidrBlock?:               string | fn.Fn
				MapPublicIpOnLaunch?:         bool | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SubnetCidrBlock :: {
			Type: "AWS::EC2::SubnetCidrBlock"
			Properties: {
				Ipv6CidrBlock: string | fn.Fn
				SubnetId:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SubnetNetworkAclAssociation :: {
			Type: "AWS::EC2::SubnetNetworkAclAssociation"
			Properties: {
				NetworkAclId: string | fn.Fn
				SubnetId:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SubnetRouteTableAssociation :: {
			Type: "AWS::EC2::SubnetRouteTableAssociation"
			Properties: {
				RouteTableId: string | fn.Fn
				SubnetId:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TrafficMirrorFilter :: {
			Type: "AWS::EC2::TrafficMirrorFilter"
			Properties: {
				Description?:     string | fn.Fn
				NetworkServices?: [...(string | fn.Fn)] | fn.Fn
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
		TrafficMirrorFilterRule :: {
			Type: "AWS::EC2::TrafficMirrorFilterRule"
			Properties: {
				Description?:         string | fn.Fn
				DestinationCidrBlock: string | fn.Fn
				DestinationPortRange?: {
					FromPort: int | fn.Fn
					ToPort:   int | fn.Fn
				}
				Protocol?:       int | fn.Fn
				RuleAction:      string | fn.Fn
				RuleNumber:      int | fn.Fn
				SourceCidrBlock: string | fn.Fn
				SourcePortRange?: {
					FromPort: int | fn.Fn
					ToPort:   int | fn.Fn
				}
				TrafficDirection:      string | fn.Fn
				TrafficMirrorFilterId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TrafficMirrorSession :: {
			Type: "AWS::EC2::TrafficMirrorSession"
			Properties: {
				Description?:       string | fn.Fn
				NetworkInterfaceId: string | fn.Fn
				PacketLength?:      int | fn.Fn
				SessionNumber:      int | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TrafficMirrorFilterId: string | fn.Fn
				TrafficMirrorTargetId: string | fn.Fn
				VirtualNetworkId?:     int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TrafficMirrorTarget :: {
			Type: "AWS::EC2::TrafficMirrorTarget"
			Properties: {
				Description?:            string | fn.Fn
				NetworkInterfaceId?:     string | fn.Fn
				NetworkLoadBalancerArn?: string | fn.Fn
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
		TransitGateway :: {
			Type: "AWS::EC2::TransitGateway"
			Properties: {
				AmazonSideAsn?:                int | fn.Fn
				AutoAcceptSharedAttachments?:  (string & ("disable" | "enable")) | fn.Fn
				DefaultRouteTableAssociation?: (string & ("disable" | "enable")) | fn.Fn
				DefaultRouteTablePropagation?: (string & ("disable" | "enable")) | fn.Fn
				Description?:                  string | fn.Fn
				DnsSupport?:                   (string & ("disable" | "enable")) | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpnEcmpSupport?: (string & ("disable" | "enable")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TransitGatewayAttachment :: {
			Type: "AWS::EC2::TransitGatewayAttachment"
			Properties: {
				SubnetIds: [...(string | fn.Fn)] | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TransitGatewayId: string | fn.Fn
				VpcId:            string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TransitGatewayRoute :: {
			Type: "AWS::EC2::TransitGatewayRoute"
			Properties: {
				Blackhole?:                  bool | fn.Fn
				DestinationCidrBlock?:       string | fn.Fn
				TransitGatewayAttachmentId?: string | fn.Fn
				TransitGatewayRouteTableId:  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TransitGatewayRouteTable :: {
			Type: "AWS::EC2::TransitGatewayRouteTable"
			Properties: {
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TransitGatewayId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TransitGatewayRouteTableAssociation :: {
			Type: "AWS::EC2::TransitGatewayRouteTableAssociation"
			Properties: {
				TransitGatewayAttachmentId: string | fn.Fn
				TransitGatewayRouteTableId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TransitGatewayRouteTablePropagation :: {
			Type: "AWS::EC2::TransitGatewayRouteTablePropagation"
			Properties: {
				TransitGatewayAttachmentId: string | fn.Fn
				TransitGatewayRouteTableId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPC :: {
			Type: "AWS::EC2::VPC"
			Properties: {
				CidrBlock:           string | fn.Fn
				EnableDnsHostnames?: bool | fn.Fn
				EnableDnsSupport?:   bool | fn.Fn
				InstanceTenancy?:    (string & ("dedicated" | "default")) | fn.Fn
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
		VPCCidrBlock :: {
			Type: "AWS::EC2::VPCCidrBlock"
			Properties: {
				AmazonProvidedIpv6CidrBlock?: bool | fn.Fn
				CidrBlock?:                   string | fn.Fn
				VpcId:                        string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPCDHCPOptionsAssociation :: {
			Type: "AWS::EC2::VPCDHCPOptionsAssociation"
			Properties: {
				DhcpOptionsId: string | fn.Fn
				VpcId:         string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPCEndpoint :: {
			Type: "AWS::EC2::VPCEndpoint"
			Properties: {
				PolicyDocument?: {
					[string]: _
				} | fn.Fn
				PrivateDnsEnabled?: bool | fn.Fn
				RouteTableIds?:     [...(string | fn.Fn)] | fn.Fn
				SecurityGroupIds?:  [...(string | fn.Fn)] | fn.Fn
				ServiceName:        string | fn.Fn
				SubnetIds?:         [...(string | fn.Fn)] | fn.Fn
				VpcEndpointType?:   (string & ("Gateway" | "Interface")) | fn.Fn
				VpcId:              string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPCEndpointService :: {
			Type: "AWS::EC2::VPCEndpointService"
			Properties: {
				AcceptanceRequired?:     bool | fn.Fn
				NetworkLoadBalancerArns: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPCEndpointServicePermissions :: {
			Type: "AWS::EC2::VPCEndpointServicePermissions"
			Properties: {
				AllowedPrincipals?: [...(string | fn.Fn)] | fn.Fn
				ServiceId:          string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPCGatewayAttachment :: {
			Type: "AWS::EC2::VPCGatewayAttachment"
			Properties: {
				InternetGatewayId?: string | fn.Fn
				VpcId:              string | fn.Fn
				VpnGatewayId?:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPCPeeringConnection :: {
			Type: "AWS::EC2::VPCPeeringConnection"
			Properties: {
				PeerOwnerId?: string | fn.Fn
				PeerRegion?:  string | fn.Fn
				PeerRoleArn?: string | fn.Fn
				PeerVpcId:    string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPNConnection :: {
			Type: "AWS::EC2::VPNConnection"
			Properties: {
				CustomerGatewayId: string | fn.Fn
				StaticRoutesOnly?: bool | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TransitGatewayId?: string | fn.Fn
				Type:              (string & ("ipsec.1")) | fn.Fn
				VpnGatewayId?:     string | fn.Fn
				VpnTunnelOptionsSpecifications?: [...{
					PreSharedKey?:     string | fn.Fn
					TunnelInsideCidr?: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPNConnectionRoute :: {
			Type: "AWS::EC2::VPNConnectionRoute"
			Properties: {
				DestinationCidrBlock: string | fn.Fn
				VpnConnectionId:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPNGateway :: {
			Type: "AWS::EC2::VPNGateway"
			Properties: {
				AmazonSideAsn?: int | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Type: (string & ("ipsec.1")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VPNGatewayRoutePropagation :: {
			Type: "AWS::EC2::VPNGatewayRoutePropagation"
			Properties: {
				RouteTableIds: [...(string | fn.Fn)] | fn.Fn
				VpnGatewayId:  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Volume :: {
			Type: "AWS::EC2::Volume"
			Properties: {
				AutoEnableIO?:    bool | fn.Fn
				AvailabilityZone: string | fn.Fn
				Encrypted?:       bool | fn.Fn
				Iops?:            int | fn.Fn
				KmsKeyId?:        string | fn.Fn
				Size?:            int | fn.Fn
				SnapshotId?:      string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VolumeType?: (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
			UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
			Metadata?: [string]: _
		}
		VolumeAttachment :: {
			Type: "AWS::EC2::VolumeAttachment"
			Properties: {
				Device:     string | fn.Fn
				InstanceId: string | fn.Fn
				VolumeId:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ECR :: {
		Repository :: {
			Type: "AWS::ECR::Repository"
			Properties: {
				LifecyclePolicy?: {
					LifecyclePolicyText?: string | fn.Fn
					RegistryId?:          string | fn.Fn
				}
				RepositoryName?:       string | fn.Fn
				RepositoryPolicyText?: {
					[string]: _
				} | fn.Fn
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
	}

	ECS :: {
		Cluster :: {
			Type: "AWS::ECS::Cluster"
			Properties: {
				ClusterName?: string | fn.Fn
				ClusterSettings?: [...{
					Name:  string | fn.Fn
					Value: string | fn.Fn
				}]
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
		PrimaryTaskSet :: {
			Type: "AWS::ECS::PrimaryTaskSet"
			Properties: {
				Cluster:   string | fn.Fn
				Service:   string | fn.Fn
				TaskSetId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Service :: {
			Type: "AWS::ECS::Service"
			Properties: {
				Cluster?: string | fn.Fn
				DeploymentConfiguration?: {
					MaximumPercent?:        int | fn.Fn
					MinimumHealthyPercent?: int | fn.Fn
				}
				DeploymentController?: Type?: string | fn.Fn
				DesiredCount?:                  int | fn.Fn
				EnableECSManagedTags?:          bool | fn.Fn
				HealthCheckGracePeriodSeconds?: int | fn.Fn
				LaunchType?:                    (string & ("EC2" | "FARGATE")) | fn.Fn
				LoadBalancers?: [...{
					ContainerName?:    string | fn.Fn
					ContainerPort:     int | fn.Fn
					LoadBalancerName?: string | fn.Fn
					TargetGroupArn?:   string | fn.Fn
				}]
				NetworkConfiguration?: AwsvpcConfiguration?: {
					AssignPublicIp?: string | fn.Fn
					SecurityGroups?: [...(string | fn.Fn)] | fn.Fn
					Subnets:         [...(string | fn.Fn)] | fn.Fn
				}
				PlacementConstraints?: [...{
					Expression?: string | fn.Fn
					Type:        string | fn.Fn
				}]
				PlacementStrategies?: [...{
					Field?: string | fn.Fn
					Type:   string | fn.Fn
				}]
				PlatformVersion?:    string | fn.Fn
				PropagateTags?:      string | fn.Fn
				Role?:               string | fn.Fn
				SchedulingStrategy?: (string & ("DAEMON" | "REPLICA")) | fn.Fn
				ServiceName?:        string | fn.Fn
				ServiceRegistries?: [...{
					ContainerName?: string | fn.Fn
					ContainerPort?: int | fn.Fn
					Port?:          int | fn.Fn
					RegistryArn?:   string | fn.Fn
				}]
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TaskDefinition?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TaskDefinition :: {
			Type: "AWS::ECS::TaskDefinition"
			Properties: {
				ContainerDefinitions?: [...{
					Command?: [...(string | fn.Fn)] | fn.Fn
					Cpu?:     int | fn.Fn
					DependsOn?: [...{
						Condition:     string | fn.Fn
						ContainerName: string | fn.Fn
					}]
					DisableNetworking?: bool | fn.Fn
					DnsSearchDomains?:  [...(string | fn.Fn)] | fn.Fn
					DnsServers?:        [...(string | fn.Fn)] | fn.Fn
					DockerLabels?: [string]: string | fn.Fn
					DockerSecurityOptions?: [...(string | fn.Fn)] | fn.Fn
					EntryPoint?:            [...(string | fn.Fn)] | fn.Fn
					Environment?: [...{
						Name?:  string | fn.Fn
						Value?: string | fn.Fn
					}]
					Essential?: bool | fn.Fn
					ExtraHosts?: [...{
						Hostname:  string | fn.Fn
						IpAddress: string | fn.Fn
					}]
					FirelensConfiguration?: {
						Options?: [string]: string | fn.Fn
						Type: string | fn.Fn
					}
					HealthCheck?: {
						Command:      [...(string | fn.Fn)] | fn.Fn
						Interval?:    int | fn.Fn
						Retries?:     int | fn.Fn
						StartPeriod?: int | fn.Fn
						Timeout?:     int | fn.Fn
					}
					Hostname?:    string | fn.Fn
					Image?:       string | fn.Fn
					Interactive?: bool | fn.Fn
					Links?:       [...(string | fn.Fn)] | fn.Fn
					LinuxParameters?: {
						Capabilities?: {
							Add?:  [...(string | fn.Fn)] | fn.Fn
							Drop?: [...(string | fn.Fn)] | fn.Fn
						}
						Devices?: [...{
							ContainerPath?: string | fn.Fn
							HostPath:       string | fn.Fn
							Permissions?:   [...(string | fn.Fn)] | fn.Fn
						}]
						InitProcessEnabled?: bool | fn.Fn
						MaxSwap?:            int | fn.Fn
						SharedMemorySize?:   int | fn.Fn
						Swappiness?:         int | fn.Fn
						Tmpfs?: [...{
							ContainerPath?: string | fn.Fn
							MountOptions?:  [...(string | fn.Fn)] | fn.Fn
							Size:           int | fn.Fn
						}]
					}
					LogConfiguration?: {
						LogDriver: string | fn.Fn
						Options?: [string]: string | fn.Fn
						SecretOptions?: [...{
							Name:      string | fn.Fn
							ValueFrom: string | fn.Fn
						}]
					}
					Memory?:            int | fn.Fn
					MemoryReservation?: int | fn.Fn
					MountPoints?: [...{
						ContainerPath?: string | fn.Fn
						ReadOnly?:      bool | fn.Fn
						SourceVolume?:  string | fn.Fn
					}]
					Name?: string | fn.Fn
					PortMappings?: [...{
						ContainerPort?: int | fn.Fn
						HostPort?:      int | fn.Fn
						Protocol?:      string | fn.Fn
					}]
					Privileged?:             bool | fn.Fn
					PseudoTerminal?:         bool | fn.Fn
					ReadonlyRootFilesystem?: bool | fn.Fn
					RepositoryCredentials?: CredentialsParameter?: string | fn.Fn
					ResourceRequirements?: [...{
						Type:  string | fn.Fn
						Value: string | fn.Fn
					}]
					Secrets?: [...{
						Name:      string | fn.Fn
						ValueFrom: string | fn.Fn
					}]
					StartTimeout?: int | fn.Fn
					StopTimeout?:  int | fn.Fn
					SystemControls?: [...{
						Namespace: string | fn.Fn
						Value:     string | fn.Fn
					}]
					Ulimits?: [...{
						HardLimit: int | fn.Fn
						Name:      string | fn.Fn
						SoftLimit: int | fn.Fn
					}]
					User?: string | fn.Fn
					VolumesFrom?: [...{
						ReadOnly?:        bool | fn.Fn
						SourceContainer?: string | fn.Fn
					}]
					WorkingDirectory?: string | fn.Fn
				}]
				Cpu?:              string | fn.Fn
				ExecutionRoleArn?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
				Family?:           string | fn.Fn
				InferenceAccelerators?: [...{
					DeviceName?:   string | fn.Fn
					DevicePolicy?: string | fn.Fn
					DeviceType?:   string | fn.Fn
				}]
				IpcMode?:     string | fn.Fn
				Memory?:      string | fn.Fn
				NetworkMode?: (string & ("awsvpc" | "bridge" | "host" | "none")) | fn.Fn
				PidMode?:     string | fn.Fn
				PlacementConstraints?: [...{
					Expression?: string | fn.Fn
					Type:        string | fn.Fn
				}]
				ProxyConfiguration?: {
					ContainerName: string | fn.Fn
					ProxyConfigurationProperties?: [...{
						Name?:  string | fn.Fn
						Value?: string | fn.Fn
					}]
					Type?: (string & ("APPMESH")) | fn.Fn
				}
				RequiresCompatibilities?: [...(string | fn.Fn)] | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TaskRoleArn?: string | fn.Fn
				Volumes?: [...{
					DockerVolumeConfiguration?: {
						Autoprovision?: bool | fn.Fn
						Driver?:        string | fn.Fn
						DriverOpts?: [string]: string | fn.Fn
						Labels?: [string]:     string | fn.Fn
						Scope?: string | fn.Fn
					}
					Host?: SourcePath?: string | fn.Fn
					Name?: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TaskSet :: {
			Type: "AWS::ECS::TaskSet"
			Properties: {
				Cluster:     string | fn.Fn
				ExternalId?: string | fn.Fn
				LaunchType?: string | fn.Fn
				LoadBalancers?: [...{
					ContainerName?:    string | fn.Fn
					ContainerPort?:    int | fn.Fn
					LoadBalancerName?: string | fn.Fn
					TargetGroupArn?:   string | fn.Fn
				}]
				NetworkConfiguration?: AwsVpcConfiguration?: {
					AssignPublicIp?: string | fn.Fn
					SecurityGroups?: [...(string | fn.Fn)] | fn.Fn
					Subnets:         [...(string | fn.Fn)] | fn.Fn
				}
				PlatformVersion?: string | fn.Fn
				Scale?: {
					Unit?:  string | fn.Fn
					Value?: float | fn.Fn
				}
				Service: string | fn.Fn
				ServiceRegistries?: [...{
					ContainerName?: string | fn.Fn
					ContainerPort?: int | fn.Fn
					Port?:          int | fn.Fn
					RegistryArn?:   string | fn.Fn
				}]
				TaskDefinition: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	EFS :: {
		FileSystem :: {
			Type: "AWS::EFS::FileSystem"
			Properties: {
				Encrypted?: bool | fn.Fn
				FileSystemTags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				KmsKeyId?: string | fn.Fn
				LifecyclePolicies?: [...{
					TransitionToIA: (string & ("AFTER_14_DAYS" | "AFTER_30_DAYS" | "AFTER_60_DAYS" | "AFTER_90_DAYS")) | fn.Fn
				}]
				PerformanceMode?:              (string & ("generalPurpose" | "maxIO")) | fn.Fn
				ProvisionedThroughputInMibps?: float | fn.Fn
				ThroughputMode?:               (string & ("bursting" | "provisioned")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		MountTarget :: {
			Type: "AWS::EFS::MountTarget"
			Properties: {
				FileSystemId:   string | fn.Fn
				IpAddress?:     string | fn.Fn
				SecurityGroups: [...(string | fn.Fn)] | fn.Fn
				SubnetId:       string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	EKS :: {
		Cluster :: {
			Type: "AWS::EKS::Cluster"
			Properties: {
				Name?: string | fn.Fn
				ResourcesVpcConfig: {
					SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
					SubnetIds:         [...(string | fn.Fn)] | fn.Fn
				}
				RoleArn:  string | fn.Fn
				Version?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Nodegroup :: {
			Type: "AWS::EKS::Nodegroup"
			Properties: {
				AmiType?:            string | fn.Fn
				ClusterName:         string | fn.Fn
				DiskSize?:           float | fn.Fn
				ForceUpdateEnabled?: bool | fn.Fn
				InstanceTypes?:      [...(string | fn.Fn)] | fn.Fn
				Labels?:             {
					[string]: _
				} | fn.Fn
				NodeRole:        string | fn.Fn
				NodegroupName?:  string | fn.Fn
				ReleaseVersion?: string | fn.Fn
				RemoteAccess?: {
					Ec2SshKey:             string | fn.Fn
					SourceSecurityGroups?: [...(string | fn.Fn)] | fn.Fn
				}
				ScalingConfig?: {
					DesiredSize?: float | fn.Fn
					MaxSize?:     float | fn.Fn
					MinSize?:     float | fn.Fn
				}
				Subnets: [...(string | fn.Fn)] | fn.Fn
				Tags?:   {
					[string]: _
				} | fn.Fn
				Version?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	EMR :: {
		Cluster :: {
			Type: "AWS::EMR::Cluster"
			Properties: {
				AdditionalInfo?: {
					[string]: _
				} | fn.Fn
				Applications?: [...{
					AdditionalInfo?: [string]: string | fn.Fn
					Args?:    [...(string | fn.Fn)] | fn.Fn
					Name?:    string | fn.Fn
					Version?: string | fn.Fn
				}]
				AutoScalingRole?: string | fn.Fn
				BootstrapActions?: [...{
					Name: string | fn.Fn
					ScriptBootstrapAction: {
						Args?: [...(string | fn.Fn)] | fn.Fn
						Path:  string | fn.Fn
					}
				}]
				Configurations?: [...{
					Classification?: string | fn.Fn
					ConfigurationProperties?: [string]: string | fn.Fn
					Configurations?: [...{
						[string]: _
					}]
				}]
				CustomAmiId?:       string | fn.Fn
				EbsRootVolumeSize?: int | fn.Fn
				Instances: {
					AdditionalMasterSecurityGroups?: [...(string | fn.Fn)] | fn.Fn
					AdditionalSlaveSecurityGroups?:  [...(string | fn.Fn)] | fn.Fn
					CoreInstanceFleet?: {
						InstanceTypeConfigs?: [...{
							BidPrice?:                            string | fn.Fn
							BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
							Configurations?: [...{
								Classification?: string | fn.Fn
								ConfigurationProperties?: [string]: string | fn.Fn
								Configurations?: [...{
									[string]: _
								}]
							}]
							EbsConfiguration?: {
								EbsBlockDeviceConfigs?: [...{
									VolumeSpecification: {
										Iops?:      int | fn.Fn
										SizeInGB:   int | fn.Fn
										VolumeType: string | fn.Fn
									}
									VolumesPerInstance?: int | fn.Fn
								}]
								EbsOptimized?: bool | fn.Fn
							}
							InstanceType:      string | fn.Fn
							WeightedCapacity?: int | fn.Fn
						}]
						LaunchSpecifications?: SpotSpecification: {
							BlockDurationMinutes?:  int | fn.Fn
							TimeoutAction:          string | fn.Fn
							TimeoutDurationMinutes: int | fn.Fn
						}
						Name?:                   string | fn.Fn
						TargetOnDemandCapacity?: int | fn.Fn
						TargetSpotCapacity?:     int | fn.Fn
					}
					CoreInstanceGroup?: {
						AutoScalingPolicy?: {
							Constraints: {
								MaxCapacity: int | fn.Fn
								MinCapacity: int | fn.Fn
							}
							Rules: [...{
								Action: {
									Market?: string | fn.Fn
									SimpleScalingPolicyConfiguration: {
										AdjustmentType?:   string | fn.Fn
										CoolDown?:         int | fn.Fn
										ScalingAdjustment: int | fn.Fn
									}
								}
								Description?: string | fn.Fn
								Name:         string | fn.Fn
								Trigger: CloudWatchAlarmDefinition: {
									ComparisonOperator: string | fn.Fn
									Dimensions?: [...{
										Key:   string | fn.Fn
										Value: string | fn.Fn
									}]
									EvaluationPeriods?: int | fn.Fn
									MetricName:         string | fn.Fn
									Namespace?:         string | fn.Fn
									Period:             int | fn.Fn
									Statistic?:         string | fn.Fn
									Threshold:          float | fn.Fn
									Unit?:              string | fn.Fn
								}
							}]
						}
						BidPrice?: string | fn.Fn
						Configurations?: [...{
							Classification?: string | fn.Fn
							ConfigurationProperties?: [string]: string | fn.Fn
							Configurations?: [...{
								[string]: _
							}]
						}]
						EbsConfiguration?: {
							EbsBlockDeviceConfigs?: [...{
								VolumeSpecification: {
									Iops?:      int | fn.Fn
									SizeInGB:   int | fn.Fn
									VolumeType: string | fn.Fn
								}
								VolumesPerInstance?: int | fn.Fn
							}]
							EbsOptimized?: bool | fn.Fn
						}
						InstanceCount: int | fn.Fn
						InstanceType:  string | fn.Fn
						Market?:       string | fn.Fn
						Name?:         string | fn.Fn
					}
					Ec2KeyName?:                    string | fn.Fn
					Ec2SubnetId?:                   string | fn.Fn
					Ec2SubnetIds?:                  [...(string | fn.Fn)] | fn.Fn
					EmrManagedMasterSecurityGroup?: string | fn.Fn
					EmrManagedSlaveSecurityGroup?:  string | fn.Fn
					HadoopVersion?:                 string | fn.Fn
					KeepJobFlowAliveWhenNoSteps?:   bool | fn.Fn
					MasterInstanceFleet?: {
						InstanceTypeConfigs?: [...{
							BidPrice?:                            string | fn.Fn
							BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
							Configurations?: [...{
								Classification?: string | fn.Fn
								ConfigurationProperties?: [string]: string | fn.Fn
								Configurations?: [...{
									[string]: _
								}]
							}]
							EbsConfiguration?: {
								EbsBlockDeviceConfigs?: [...{
									VolumeSpecification: {
										Iops?:      int | fn.Fn
										SizeInGB:   int | fn.Fn
										VolumeType: string | fn.Fn
									}
									VolumesPerInstance?: int | fn.Fn
								}]
								EbsOptimized?: bool | fn.Fn
							}
							InstanceType:      string | fn.Fn
							WeightedCapacity?: int | fn.Fn
						}]
						LaunchSpecifications?: SpotSpecification: {
							BlockDurationMinutes?:  int | fn.Fn
							TimeoutAction:          string | fn.Fn
							TimeoutDurationMinutes: int | fn.Fn
						}
						Name?:                   string | fn.Fn
						TargetOnDemandCapacity?: int | fn.Fn
						TargetSpotCapacity?:     int | fn.Fn
					}
					MasterInstanceGroup?: {
						AutoScalingPolicy?: {
							Constraints: {
								MaxCapacity: int | fn.Fn
								MinCapacity: int | fn.Fn
							}
							Rules: [...{
								Action: {
									Market?: string | fn.Fn
									SimpleScalingPolicyConfiguration: {
										AdjustmentType?:   string | fn.Fn
										CoolDown?:         int | fn.Fn
										ScalingAdjustment: int | fn.Fn
									}
								}
								Description?: string | fn.Fn
								Name:         string | fn.Fn
								Trigger: CloudWatchAlarmDefinition: {
									ComparisonOperator: string | fn.Fn
									Dimensions?: [...{
										Key:   string | fn.Fn
										Value: string | fn.Fn
									}]
									EvaluationPeriods?: int | fn.Fn
									MetricName:         string | fn.Fn
									Namespace?:         string | fn.Fn
									Period:             int | fn.Fn
									Statistic?:         string | fn.Fn
									Threshold:          float | fn.Fn
									Unit?:              string | fn.Fn
								}
							}]
						}
						BidPrice?: string | fn.Fn
						Configurations?: [...{
							Classification?: string | fn.Fn
							ConfigurationProperties?: [string]: string | fn.Fn
							Configurations?: [...{
								[string]: _
							}]
						}]
						EbsConfiguration?: {
							EbsBlockDeviceConfigs?: [...{
								VolumeSpecification: {
									Iops?:      int | fn.Fn
									SizeInGB:   int | fn.Fn
									VolumeType: string | fn.Fn
								}
								VolumesPerInstance?: int | fn.Fn
							}]
							EbsOptimized?: bool | fn.Fn
						}
						InstanceCount: int | fn.Fn
						InstanceType:  string | fn.Fn
						Market?:       string | fn.Fn
						Name?:         string | fn.Fn
					}
					Placement?: AvailabilityZone: string | fn.Fn
					ServiceAccessSecurityGroup?: string | fn.Fn
					TerminationProtected?:       bool | fn.Fn
				}
				JobFlowRole: (string & (=~#"[a-zA-Z0-9+=,.@\-_]+"#)) | fn.Fn
				KerberosAttributes?: {
					ADDomainJoinPassword?:             string | fn.Fn
					ADDomainJoinUser?:                 string | fn.Fn
					CrossRealmTrustPrincipalPassword?: string | fn.Fn
					KdcAdminPassword:                  string | fn.Fn
					Realm:                             string | fn.Fn
				}
				LogUri?:                string | fn.Fn
				Name:                   string | fn.Fn
				ReleaseLabel?:          string | fn.Fn
				ScaleDownBehavior?:     string | fn.Fn
				SecurityConfiguration?: string | fn.Fn
				ServiceRole:            string | fn.Fn
				Steps?: [...{
					ActionOnFailure?: string | fn.Fn
					HadoopJarStep: {
						Args?:      [...(string | fn.Fn)] | fn.Fn
						Jar:        string | fn.Fn
						MainClass?: string | fn.Fn
						StepProperties?: [...{
							Key?:   string | fn.Fn
							Value?: string | fn.Fn
						}]
					}
					Name: string | fn.Fn
				}]
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VisibleToAllUsers?: bool | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		InstanceFleetConfig :: {
			Type: "AWS::EMR::InstanceFleetConfig"
			Properties: {
				ClusterId:         string | fn.Fn
				InstanceFleetType: string | fn.Fn
				InstanceTypeConfigs?: [...{
					BidPrice?:                            string | fn.Fn
					BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
					Configurations?: [...{
						Classification?: string | fn.Fn
						ConfigurationProperties?: [string]: string | fn.Fn
						Configurations?: [...{
							[string]: _
						}]
					}]
					EbsConfiguration?: {
						EbsBlockDeviceConfigs?: [...{
							VolumeSpecification: {
								Iops?:      int | fn.Fn
								SizeInGB:   int | fn.Fn
								VolumeType: string | fn.Fn
							}
							VolumesPerInstance?: int | fn.Fn
						}]
						EbsOptimized?: bool | fn.Fn
					}
					InstanceType:      string | fn.Fn
					WeightedCapacity?: int | fn.Fn
				}]
				LaunchSpecifications?: SpotSpecification: {
					BlockDurationMinutes?:  int | fn.Fn
					TimeoutAction:          string | fn.Fn
					TimeoutDurationMinutes: int | fn.Fn
				}
				Name?:                   string | fn.Fn
				TargetOnDemandCapacity?: int | fn.Fn
				TargetSpotCapacity?:     int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		InstanceGroupConfig :: {
			Type: "AWS::EMR::InstanceGroupConfig"
			Properties: {
				AutoScalingPolicy?: {
					Constraints: {
						MaxCapacity: int | fn.Fn
						MinCapacity: int | fn.Fn
					}
					Rules: [...{
						Action: {
							Market?: string | fn.Fn
							SimpleScalingPolicyConfiguration: {
								AdjustmentType?:   string | fn.Fn
								CoolDown?:         int | fn.Fn
								ScalingAdjustment: int | fn.Fn
							}
						}
						Description?: string | fn.Fn
						Name:         string | fn.Fn
						Trigger: CloudWatchAlarmDefinition: {
							ComparisonOperator: string | fn.Fn
							Dimensions?: [...{
								Key:   string | fn.Fn
								Value: string | fn.Fn
							}]
							EvaluationPeriods?: int | fn.Fn
							MetricName:         string | fn.Fn
							Namespace?:         string | fn.Fn
							Period:             int | fn.Fn
							Statistic?:         string | fn.Fn
							Threshold:          float | fn.Fn
							Unit?:              string | fn.Fn
						}
					}]
				}
				BidPrice?: string | fn.Fn
				Configurations?: [...{
					Classification?: string | fn.Fn
					ConfigurationProperties?: [string]: string | fn.Fn
					Configurations?: [...{
						[string]: _
					}]
				}]
				EbsConfiguration?: {
					EbsBlockDeviceConfigs?: [...{
						VolumeSpecification: {
							Iops?:      int | fn.Fn
							SizeInGB:   int | fn.Fn
							VolumeType: string | fn.Fn
						}
						VolumesPerInstance?: int | fn.Fn
					}]
					EbsOptimized?: bool | fn.Fn
				}
				InstanceCount: int | fn.Fn
				InstanceRole:  string | fn.Fn
				InstanceType:  string | fn.Fn
				JobFlowId:     string | fn.Fn
				Market?:       string | fn.Fn
				Name?:         string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SecurityConfiguration :: {
			Type: "AWS::EMR::SecurityConfiguration"
			Properties: {
				Name?:                 string | fn.Fn
				SecurityConfiguration: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Step :: {
			Type: "AWS::EMR::Step"
			Properties: {
				ActionOnFailure: string | fn.Fn
				HadoopJarStep: {
					Args?:      [...(string | fn.Fn)] | fn.Fn
					Jar:        string | fn.Fn
					MainClass?: string | fn.Fn
					StepProperties?: [...{
						Key?:   string | fn.Fn
						Value?: string | fn.Fn
					}]
				}
				JobFlowId: string | fn.Fn
				Name:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ElastiCache :: {
		CacheCluster :: {
			Type: "AWS::ElastiCache::CacheCluster"
			Properties: {
				AZMode?:                     string | fn.Fn
				AutoMinorVersionUpgrade?:    bool | fn.Fn
				CacheNodeType:               string | fn.Fn
				CacheParameterGroupName?:    string | fn.Fn
				CacheSecurityGroupNames?:    [...(string | fn.Fn)] | fn.Fn
				CacheSubnetGroupName?:       string | fn.Fn
				ClusterName?:                string | fn.Fn
				Engine:                      string | fn.Fn
				EngineVersion?:              string | fn.Fn
				NotificationTopicArn?:       string | fn.Fn
				NumCacheNodes:               int | fn.Fn
				Port?:                       int | fn.Fn
				PreferredAvailabilityZone?:  string | fn.Fn
				PreferredAvailabilityZones?: [...(string | fn.Fn)] | fn.Fn
				PreferredMaintenanceWindow?: string | fn.Fn
				SnapshotArns?:               [...(string | fn.Fn)] | fn.Fn
				SnapshotName?:               string | fn.Fn
				SnapshotRetentionLimit?:     int | fn.Fn
				SnapshotWindow?:             string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcSecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
			UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
			Metadata?: [string]: _
		}
		ParameterGroup :: {
			Type: "AWS::ElastiCache::ParameterGroup"
			Properties: {
				CacheParameterGroupFamily: string | fn.Fn
				Description:               string | fn.Fn
				Properties?: [string]: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ReplicationGroup :: {
			Type: "AWS::ElastiCache::ReplicationGroup"
			Properties: {
				AtRestEncryptionEnabled?:  bool | fn.Fn
				AuthToken?:                string | fn.Fn
				AutoMinorVersionUpgrade?:  bool | fn.Fn
				AutomaticFailoverEnabled?: bool | fn.Fn
				CacheNodeType?:            string | fn.Fn
				CacheParameterGroupName?:  string | fn.Fn
				CacheSecurityGroupNames?:  [...(string | fn.Fn)] | fn.Fn
				CacheSubnetGroupName?:     string | fn.Fn
				Engine?:                   string | fn.Fn
				EngineVersion?:            string | fn.Fn
				KmsKeyId?:                 string | fn.Fn
				NodeGroupConfiguration?: [...{
					NodeGroupId?:              string | fn.Fn
					PrimaryAvailabilityZone?:  string | fn.Fn
					ReplicaAvailabilityZones?: [...(string | fn.Fn)] | fn.Fn
					ReplicaCount?:             int | fn.Fn
					Slots?:                    string | fn.Fn
				}]
				NotificationTopicArn?:       string | fn.Fn
				NumCacheClusters?:           (int & (>=1 & <=6)) | fn.Fn
				NumNodeGroups?:              int | fn.Fn
				Port?:                       int | fn.Fn
				PreferredCacheClusterAZs?:   [...(string | fn.Fn)] | fn.Fn
				PreferredMaintenanceWindow?: string | fn.Fn
				PrimaryClusterId?:           string | fn.Fn
				ReplicasPerNodeGroup?:       (int & (>=0 & <=5)) | fn.Fn
				ReplicationGroupDescription: string | fn.Fn
				ReplicationGroupId?:         string | fn.Fn
				SecurityGroupIds?:           [...(string | fn.Fn)] | fn.Fn
				SnapshotArns?:               [...(string | fn.Fn)] | fn.Fn
				SnapshotName?:               string | fn.Fn
				SnapshotRetentionLimit?:     int | fn.Fn
				SnapshotWindow?:             string | fn.Fn
				SnapshottingClusterId?:      string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TransitEncryptionEnabled?: bool | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
			UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
			Metadata?: [string]: _
		}
		SecurityGroup :: {
			Type: "AWS::ElastiCache::SecurityGroup"
			Properties: Description: string | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SecurityGroupIngress :: {
			Type: "AWS::ElastiCache::SecurityGroupIngress"
			Properties: {
				CacheSecurityGroupName:   string | fn.Fn
				EC2SecurityGroupName:     string | fn.Fn
				EC2SecurityGroupOwnerId?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SubnetGroup :: {
			Type: "AWS::ElastiCache::SubnetGroup"
			Properties: {
				CacheSubnetGroupName?: string | fn.Fn
				Description:           string | fn.Fn
				SubnetIds:             [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ElasticBeanstalk :: {
		Application :: {
			Type: "AWS::ElasticBeanstalk::Application"
			Properties: {
				ApplicationName?: string | fn.Fn
				Description?:     string | fn.Fn
				ResourceLifecycleConfig?: {
					ServiceRole?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
					VersionLifecycleConfig?: {
						MaxAgeRule?: {
							DeleteSourceFromS3?: bool | fn.Fn
							Enabled?:            bool | fn.Fn
							MaxAgeInDays?:       int | fn.Fn
						}
						MaxCountRule?: {
							DeleteSourceFromS3?: bool | fn.Fn
							Enabled?:            bool | fn.Fn
							MaxCount?:           int | fn.Fn
						}
					}
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApplicationVersion :: {
			Type: "AWS::ElasticBeanstalk::ApplicationVersion"
			Properties: {
				ApplicationName: string | fn.Fn
				Description?:    string | fn.Fn
				SourceBundle: {
					S3Bucket: string | fn.Fn
					S3Key:    string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ConfigurationTemplate :: {
			Type: "AWS::ElasticBeanstalk::ConfigurationTemplate"
			Properties: {
				ApplicationName: string | fn.Fn
				Description?:    string | fn.Fn
				EnvironmentId?:  string | fn.Fn
				OptionSettings?: [...{
					Namespace:     string | fn.Fn
					OptionName:    string | fn.Fn
					ResourceName?: string | fn.Fn
					Value?:        string | fn.Fn
				}]
				PlatformArn?:       string | fn.Fn
				SolutionStackName?: string | fn.Fn
				SourceConfiguration?: {
					ApplicationName: string | fn.Fn
					TemplateName:    string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Environment :: {
			Type: "AWS::ElasticBeanstalk::Environment"
			Properties: {
				ApplicationName:  string | fn.Fn
				CNAMEPrefix?:     string | fn.Fn
				Description?:     string | fn.Fn
				EnvironmentName?: string | fn.Fn
				OptionSettings?: [...{
					Namespace:     string | fn.Fn
					OptionName:    string | fn.Fn
					ResourceName?: string | fn.Fn
					Value?:        string | fn.Fn
				}]
				PlatformArn?:       string | fn.Fn
				SolutionStackName?: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TemplateName?: string | fn.Fn
				Tier?: {
					Name?:    string | fn.Fn
					Type?:    string | fn.Fn
					Version?: string | fn.Fn
				}
				VersionLabel?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ElasticLoadBalancing :: {
		LoadBalancer :: {
			Type: "AWS::ElasticLoadBalancing::LoadBalancer"
			Properties: {
				AccessLoggingPolicy?: {
					EmitInterval?:   int | fn.Fn
					Enabled:         bool | fn.Fn
					S3BucketName:    string | fn.Fn
					S3BucketPrefix?: string | fn.Fn
				}
				AppCookieStickinessPolicy?: [...{
					CookieName: string | fn.Fn
					PolicyName: string | fn.Fn
				}]
				AvailabilityZones?: [...(string | fn.Fn)] | fn.Fn
				ConnectionDrainingPolicy?: {
					Enabled:  bool | fn.Fn
					Timeout?: int | fn.Fn
				}
				ConnectionSettings?: IdleTimeout: int | fn.Fn
				CrossZone?: bool | fn.Fn
				HealthCheck?: {
					HealthyThreshold:   string | fn.Fn
					Interval:           string | fn.Fn
					Target:             string | fn.Fn
					Timeout:            string | fn.Fn
					UnhealthyThreshold: string | fn.Fn
				}
				Instances?: [...(string | fn.Fn)] | fn.Fn
				LBCookieStickinessPolicy?: [...{
					CookieExpirationPeriod?: string | fn.Fn
					PolicyName?:             string | fn.Fn
				}]
				Listeners: [...{
					InstancePort:      (string & (>=1 & <=65535)) | fn.Fn
					InstanceProtocol?: string | fn.Fn
					LoadBalancerPort:  (string & (>=1 & <=65535)) | fn.Fn
					PolicyNames?:      [...(string | fn.Fn)] | fn.Fn
					Protocol:          string | fn.Fn
					SSLCertificateId?: string | fn.Fn
				}]
				LoadBalancerName?: string | fn.Fn
				Policies?: [...{
					Attributes: [...({
						[string]: _
					} | fn.Fn)] | fn.Fn
					InstancePorts?:     [...(string | fn.Fn)] | fn.Fn
					LoadBalancerPorts?: [...(string | fn.Fn)] | fn.Fn
					PolicyName:         string | fn.Fn
					PolicyType:         string | fn.Fn
				}]
				Scheme?:         string | fn.Fn
				SecurityGroups?: [...(string | fn.Fn)] | fn.Fn
				Subnets?:        [...(string | fn.Fn)] | fn.Fn
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
	}

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
					HostHeaderConfig?: Values?: [...(string | fn.Fn)] | fn.Fn
					HttpHeaderConfig?: {
						HttpHeaderName?: string | fn.Fn
						Values?:         [...(string | fn.Fn)] | fn.Fn
					}
					HttpRequestMethodConfig?: Values?: [...(string | fn.Fn)] | fn.Fn
					PathPatternConfig?: Values?:       [...(string | fn.Fn)] | fn.Fn
					QueryStringConfig?: Values?: [...{
						Key?:   string | fn.Fn
						Value?: string | fn.Fn
					}]
					SourceIpConfig?: Values?: [...(string | fn.Fn)] | fn.Fn
					Values?: [...(string | fn.Fn)] | fn.Fn
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
				Name?:           string | fn.Fn
				Scheme?:         string | fn.Fn
				SecurityGroups?: [...(string | fn.Fn)] | fn.Fn
				SubnetMappings?: [...{
					AllocationId: string | fn.Fn
					SubnetId:     string | fn.Fn
				}]
				Subnets?: [...(string | fn.Fn)] | fn.Fn
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

	Elasticsearch :: {
		Domain :: {
			Type: "AWS::Elasticsearch::Domain"
			Properties: {
				AccessPolicies?: {
					[string]: _
				} | fn.Fn
				AdvancedOptions?: [string]: string | fn.Fn
				CognitoOptions?: {
					Enabled?:        bool | fn.Fn
					IdentityPoolId?: string | fn.Fn
					RoleArn?:        string | fn.Fn
					UserPoolId?:     string | fn.Fn
				}
				DomainName?: string | fn.Fn
				EBSOptions?: {
					EBSEnabled?: bool | fn.Fn
					Iops?:       int | fn.Fn
					VolumeSize?: int | fn.Fn
					VolumeType?: string | fn.Fn
				}
				ElasticsearchClusterConfig?: {
					DedicatedMasterCount?:   int | fn.Fn
					DedicatedMasterEnabled?: bool | fn.Fn
					DedicatedMasterType?:    string | fn.Fn
					InstanceCount?:          int | fn.Fn
					InstanceType?:           string | fn.Fn
					ZoneAwarenessConfig?: AvailabilityZoneCount?: int | fn.Fn
					ZoneAwarenessEnabled?: bool | fn.Fn
				}
				ElasticsearchVersion?: string | fn.Fn
				EncryptionAtRestOptions?: {
					Enabled?:  bool | fn.Fn
					KmsKeyId?: string | fn.Fn
				}
				LogPublishingOptions?: [string]: {
					CloudWatchLogsLogGroupArn?: string | fn.Fn
					Enabled?:                   bool | fn.Fn
				}
				NodeToNodeEncryptionOptions?: Enabled?:        bool | fn.Fn
				SnapshotOptions?: AutomatedSnapshotStartHour?: int | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VPCOptions?: {
					SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
					SubnetIds?:        [...(string | fn.Fn)] | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Events :: {
		EventBus :: {
			Type: "AWS::Events::EventBus"
			Properties: {
				EventSourceName?: string | fn.Fn
				Name:             string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EventBusPolicy :: {
			Type: "AWS::Events::EventBusPolicy"
			Properties: {
				Action: (string & ("events:PutEvents")) | fn.Fn
				Condition?: {
					Key?:   (string & ("aws:PrincipalOrgID")) | fn.Fn
					Type?:  (string & ("StringEquals")) | fn.Fn
					Value?: string | fn.Fn
				}
				EventBusName?: string | fn.Fn
				Principal:     string | fn.Fn
				StatementId:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Rule :: {
			Type: "AWS::Events::Rule"
			Properties: {
				Description?:  string | fn.Fn
				EventBusName?: string | fn.Fn
				EventPattern?: {
					[string]: _
				} | fn.Fn
				Name?:               string | fn.Fn
				RoleArn?:            string | fn.Fn
				ScheduleExpression?: string | fn.Fn
				State?:              (string & ("DISABLED" | "ENABLED")) | fn.Fn
				Targets?: [...{
					Arn: string | fn.Fn
					BatchParameters?: {
						ArrayProperties?: Size?: int | fn.Fn
						JobDefinition: string | fn.Fn
						JobName:       string | fn.Fn
						RetryStrategy?: Attempts?: int | fn.Fn
					}
					EcsParameters?: {
						Group?:      string | fn.Fn
						LaunchType?: string | fn.Fn
						NetworkConfiguration?: AwsVpcConfiguration?: {
							AssignPublicIp?: string | fn.Fn
							SecurityGroups?: [...(string | fn.Fn)] | fn.Fn
							Subnets:         [...(string | fn.Fn)] | fn.Fn
						}
						PlatformVersion?:  string | fn.Fn
						TaskCount?:        int | fn.Fn
						TaskDefinitionArn: string | fn.Fn
					}
					Id:         string | fn.Fn
					Input?:     string | fn.Fn
					InputPath?: string | fn.Fn
					InputTransformer?: {
						InputPathsMap?: [string]: string | fn.Fn
						InputTemplate: string | fn.Fn
					}
					KinesisParameters?: PartitionKeyPath: string | fn.Fn
					RoleArn?: string | fn.Fn
					RunCommandParameters?: RunCommandTargets: [...{
						Key:    string | fn.Fn
						Values: [...(string | fn.Fn)] | fn.Fn
					}]
					SqsParameters?: MessageGroupId: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	FSx :: {
		FileSystem :: {
			Type: "AWS::FSx::FileSystem"
			Properties: {
				BackupId?:      string | fn.Fn
				FileSystemType: string | fn.Fn
				KmsKeyId?:      string | fn.Fn
				LustreConfiguration?: {
					ExportPath?:                 string | fn.Fn
					ImportPath?:                 string | fn.Fn
					ImportedFileChunkSize?:      int | fn.Fn
					WeeklyMaintenanceStartTime?: string | fn.Fn
				}
				SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
				StorageCapacity?:  (int & (>=300 & <=65536)) | fn.Fn
				SubnetIds:         [...(string | fn.Fn)] | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				WindowsConfiguration?: {
					ActiveDirectoryId?:             string | fn.Fn
					AutomaticBackupRetentionDays?:  int | fn.Fn
					CopyTagsToBackups?:             bool | fn.Fn
					DailyAutomaticBackupStartTime?: string | fn.Fn
					SelfManagedActiveDirectoryConfiguration?: {
						DnsIps?:                              [...(string | fn.Fn)] | fn.Fn
						DomainName?:                          string | fn.Fn
						FileSystemAdministratorsGroup?:       string | fn.Fn
						OrganizationalUnitDistinguishedName?: string | fn.Fn
						Password?:                            string | fn.Fn
						UserName?:                            string | fn.Fn
					}
					ThroughputCapacity?:         int | fn.Fn
					WeeklyMaintenanceStartTime?: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	GameLift :: {
		Alias :: {
			Type: "AWS::GameLift::Alias"
			Properties: {
				Description?: string | fn.Fn
				Name:         string | fn.Fn
				RoutingStrategy: {
					FleetId?: string | fn.Fn
					Message?: string | fn.Fn
					Type:     string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Build :: {
			Type: "AWS::GameLift::Build"
			Properties: {
				Name?:            string | fn.Fn
				OperatingSystem?: string | fn.Fn
				StorageLocation?: {
					Bucket:         string | fn.Fn
					Key:            string | fn.Fn
					ObjectVersion?: string | fn.Fn
					RoleArn:        string | fn.Fn
				}
				Version?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Fleet :: {
			Type: "AWS::GameLift::Fleet"
			Properties: {
				BuildId?: string | fn.Fn
				CertificateConfiguration?: CertificateType: string | fn.Fn
				Description?:         string | fn.Fn
				DesiredEC2Instances?: int | fn.Fn
				EC2InboundPermissions?: [...{
					FromPort: int | fn.Fn
					IpRange:  string | fn.Fn
					Protocol: string | fn.Fn
					ToPort:   int | fn.Fn
				}]
				EC2InstanceType:                 string | fn.Fn
				FleetType?:                      string | fn.Fn
				InstanceRoleARN?:                string | fn.Fn
				LogPaths?:                       [...(string | fn.Fn)] | fn.Fn
				MaxSize?:                        int | fn.Fn
				MetricGroups?:                   [...(string | fn.Fn)] | fn.Fn
				MinSize?:                        int | fn.Fn
				Name:                            string | fn.Fn
				NewGameSessionProtectionPolicy?: string | fn.Fn
				PeerVpcAwsAccountId?:            string | fn.Fn
				PeerVpcId?:                      string | fn.Fn
				ResourceCreationLimitPolicy?: {
					NewGameSessionsPerCreator?: int | fn.Fn
					PolicyPeriodInMinutes?:     int | fn.Fn
				}
				RuntimeConfiguration?: {
					GameSessionActivationTimeoutSeconds?: int | fn.Fn
					MaxConcurrentGameSessionActivations?: int | fn.Fn
					ServerProcesses?: [...{
						ConcurrentExecutions: int | fn.Fn
						LaunchPath:           string | fn.Fn
						Parameters?:          string | fn.Fn
					}]
				}
				ScriptId?:               string | fn.Fn
				ServerLaunchParameters?: string | fn.Fn
				ServerLaunchPath?:       string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		GameSessionQueue :: {
			Type: "AWS::GameLift::GameSessionQueue"
			Properties: {
				Destinations?: [...{
					DestinationArn?: string | fn.Fn
				}]
				Name: string | fn.Fn
				PlayerLatencyPolicies?: [...{
					MaximumIndividualPlayerLatencyMilliseconds?: int | fn.Fn
					PolicyDurationSeconds?:                      int | fn.Fn
				}]
				TimeoutInSeconds?: int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		MatchmakingConfiguration :: {
			Type: "AWS::GameLift::MatchmakingConfiguration"
			Properties: {
				AcceptanceRequired:        bool | fn.Fn
				AcceptanceTimeoutSeconds?: int | fn.Fn
				AdditionalPlayerCount?:    int | fn.Fn
				BackfillMode?:             string | fn.Fn
				CustomEventData?:          string | fn.Fn
				Description?:              string | fn.Fn
				GameProperties?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				GameSessionData?:      string | fn.Fn
				GameSessionQueueArns:  [...(string | fn.Fn)] | fn.Fn
				Name:                  string | fn.Fn
				NotificationTarget?:   string | fn.Fn
				RequestTimeoutSeconds: int | fn.Fn
				RuleSetName:           string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		MatchmakingRuleSet :: {
			Type: "AWS::GameLift::MatchmakingRuleSet"
			Properties: {
				Name:        string | fn.Fn
				RuleSetBody: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Script :: {
			Type: "AWS::GameLift::Script"
			Properties: {
				Name?: string | fn.Fn
				StorageLocation: {
					Bucket:         string | fn.Fn
					Key:            string | fn.Fn
					ObjectVersion?: string | fn.Fn
					RoleArn:        string | fn.Fn
				}
				Version?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Glue :: {
		Classifier :: {
			Type: "AWS::Glue::Classifier"
			Properties: {
				CsvClassifier?: {
					AllowSingleColumn?:    bool | fn.Fn
					ContainsHeader?:       string | fn.Fn
					Delimiter?:            string | fn.Fn
					DisableValueTrimming?: bool | fn.Fn
					Header?:               [...(string | fn.Fn)] | fn.Fn
					Name?:                 string | fn.Fn
					QuoteSymbol?:          string | fn.Fn
				}
				GrokClassifier?: {
					Classification:  string | fn.Fn
					CustomPatterns?: string | fn.Fn
					GrokPattern:     string | fn.Fn
					Name?:           string | fn.Fn
				}
				JsonClassifier?: {
					JsonPath: string | fn.Fn
					Name?:    string | fn.Fn
				}
				XMLClassifier?: {
					Classification: string | fn.Fn
					Name?:          string | fn.Fn
					RowTag:         string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Connection :: {
			Type: "AWS::Glue::Connection"
			Properties: {
				CatalogId: string | fn.Fn
				ConnectionInput: {
					ConnectionProperties: {
						[string]: _
					} | fn.Fn
					ConnectionType: (string & ("JDBC" | "SFTP")) | fn.Fn
					Description?:   string | fn.Fn
					MatchCriteria?: [...(string | fn.Fn)] | fn.Fn
					Name?:          string | fn.Fn
					PhysicalConnectionRequirements?: {
						AvailabilityZone?:    string | fn.Fn
						SecurityGroupIdList?: [...(string | fn.Fn)] | fn.Fn
						SubnetId?:            string | fn.Fn
					}
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Crawler :: {
			Type: "AWS::Glue::Crawler"
			Properties: {
				Classifiers?:                  [...(string | fn.Fn)] | fn.Fn
				Configuration?:                string | fn.Fn
				CrawlerSecurityConfiguration?: string | fn.Fn
				DatabaseName?:                 string | fn.Fn
				Description?:                  string | fn.Fn
				Name?:                         string | fn.Fn
				Role:                          string | fn.Fn
				Schedule?: ScheduleExpression?: string | fn.Fn
				SchemaChangePolicy?: {
					DeleteBehavior?: (string & ("DELETE_FROM_DATABASE" | "DEPRECATE_IN_DATABASE" | "LOG")) | fn.Fn
					UpdateBehavior?: (string & ("LOG" | "UPDATE_IN_DATABASE")) | fn.Fn
				}
				TablePrefix?: string | fn.Fn
				Tags?:        {
					[string]: _
				} | fn.Fn
				Targets: {
					CatalogTargets?: [...{
						DatabaseName?: string | fn.Fn
						Tables?:       [...(string | fn.Fn)] | fn.Fn
					}]
					DynamoDBTargets?: [...{
						Path?: string | fn.Fn
					}]
					JdbcTargets?: [...{
						ConnectionName?: string | fn.Fn
						Exclusions?:     [...(string | fn.Fn)] | fn.Fn
						Path?:           string | fn.Fn
					}]
					S3Targets?: [...{
						Exclusions?: [...(string | fn.Fn)] | fn.Fn
						Path?:       string | fn.Fn
					}]
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DataCatalogEncryptionSettings :: {
			Type: "AWS::Glue::DataCatalogEncryptionSettings"
			Properties: {
				CatalogId: string | fn.Fn
				DataCatalogEncryptionSettings: {
					ConnectionPasswordEncryption?: {
						KmsKeyId?:                          string | fn.Fn
						ReturnConnectionPasswordEncrypted?: bool | fn.Fn
					}
					EncryptionAtRest?: {
						CatalogEncryptionMode?: string | fn.Fn
						SseAwsKmsKeyId?:        string | fn.Fn
					}
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Database :: {
			Type: "AWS::Glue::Database"
			Properties: {
				CatalogId: string | fn.Fn
				DatabaseInput: {
					Description?: string | fn.Fn
					LocationUri?: string | fn.Fn
					Name?:        string | fn.Fn
					Parameters?:  {
						[string]: _
					} | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DevEndpoint :: {
			Type: "AWS::Glue::DevEndpoint"
			Properties: {
				Arguments?: {
					[string]: _
				} | fn.Fn
				EndpointName?:          string | fn.Fn
				ExtraJarsS3Path?:       string | fn.Fn
				ExtraPythonLibsS3Path?: string | fn.Fn
				GlueVersion?:           string | fn.Fn
				NumberOfNodes?:         int | fn.Fn
				NumberOfWorkers?:       int | fn.Fn
				PublicKey?:             string | fn.Fn
				RoleArn:                string | fn.Fn
				SecurityConfiguration?: string | fn.Fn
				SecurityGroupIds?:      [...(string | fn.Fn)] | fn.Fn
				SubnetId?:              string | fn.Fn
				Tags?:                  {
					[string]: _
				} | fn.Fn
				WorkerType?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Job :: {
			Type: "AWS::Glue::Job"
			Properties: {
				AllocatedCapacity?: float | fn.Fn
				Command: {
					Name?:           string | fn.Fn
					PythonVersion?:  string | fn.Fn
					ScriptLocation?: string | fn.Fn
				}
				Connections?: Connections?: [...(string | fn.Fn)] | fn.Fn
				DefaultArguments?: {
					[string]: _
				} | fn.Fn
				Description?: string | fn.Fn
				ExecutionProperty?: MaxConcurrentRuns?: float | fn.Fn
				GlueVersion?: string | fn.Fn
				LogUri?:      string | fn.Fn
				MaxCapacity?: float | fn.Fn
				MaxRetries?:  float | fn.Fn
				Name?:        string | fn.Fn
				NotificationProperty?: NotifyDelayAfter?: int | fn.Fn
				NumberOfWorkers?:       (int & (>=0 & <=299)) | fn.Fn
				Role:                   string | fn.Fn
				SecurityConfiguration?: string | fn.Fn
				Tags?:                  {
					[string]: _
				} | fn.Fn
				Timeout?:    int | fn.Fn
				WorkerType?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		MLTransform :: {
			Type: "AWS::Glue::MLTransform"
			Properties: {
				Description?: string | fn.Fn
				GlueVersion?: string | fn.Fn
				InputRecordTables: GlueTables?: [...{
					CatalogId?:      string | fn.Fn
					ConnectionName?: string | fn.Fn
					DatabaseName:    string | fn.Fn
					TableName:       string | fn.Fn
				}]
				MaxCapacity?:     (float & (>=1 & <=100)) | fn.Fn
				MaxRetries?:      int | fn.Fn
				Name?:            string | fn.Fn
				NumberOfWorkers?: int | fn.Fn
				Role:             string | fn.Fn
				Timeout?:         int | fn.Fn
				TransformParameters: {
					FindMatchesParameters?: {
						AccuracyCostTradeoff?:    float | fn.Fn
						EnforceProvidedLabels?:   bool | fn.Fn
						PrecisionRecallTradeoff?: float | fn.Fn
						PrimaryKeyColumnName:     string | fn.Fn
					}
					TransformType: string | fn.Fn
				}
				WorkerType?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Partition :: {
			Type: "AWS::Glue::Partition"
			Properties: {
				CatalogId:    string | fn.Fn
				DatabaseName: string | fn.Fn
				PartitionInput: {
					Parameters?: {
						[string]: _
					} | fn.Fn
					StorageDescriptor?: {
						BucketColumns?: [...(string | fn.Fn)] | fn.Fn
						Columns?: [...{
							Comment?: string | fn.Fn
							Name:     string | fn.Fn
							Type?:    string | fn.Fn
						}]
						Compressed?:      bool | fn.Fn
						InputFormat?:     string | fn.Fn
						Location?:        string | fn.Fn
						NumberOfBuckets?: int | fn.Fn
						OutputFormat?:    string | fn.Fn
						Parameters?:      {
							[string]: _
						} | fn.Fn
						SerdeInfo?: {
							Name?:       string | fn.Fn
							Parameters?: {
								[string]: _
							} | fn.Fn
							SerializationLibrary?: string | fn.Fn
						}
						SkewedInfo?: {
							SkewedColumnNames?:             [...(string | fn.Fn)] | fn.Fn
							SkewedColumnValueLocationMaps?: {
								[string]: _
							} | fn.Fn
							SkewedColumnValues?: [...(string | fn.Fn)] | fn.Fn
						}
						SortColumns?: [...{
							Column:     string | fn.Fn
							SortOrder?: int | fn.Fn
						}]
						StoredAsSubDirectories?: bool | fn.Fn
					}
					Values: [...(string | fn.Fn)] | fn.Fn
				}
				TableName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SecurityConfiguration :: {
			Type: "AWS::Glue::SecurityConfiguration"
			Properties: {
				EncryptionConfiguration: {
					CloudWatchEncryption?: {
						CloudWatchEncryptionMode?: string | fn.Fn
						KmsKeyArn?:                string | fn.Fn
					}
					JobBookmarksEncryption?: {
						JobBookmarksEncryptionMode?: string | fn.Fn
						KmsKeyArn?:                  string | fn.Fn
					}
					S3Encryptions?: [...{
						KmsKeyArn?:        string | fn.Fn
						S3EncryptionMode?: string | fn.Fn
					}]
				}
				Name: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Table :: {
			Type: "AWS::Glue::Table"
			Properties: {
				CatalogId:    string | fn.Fn
				DatabaseName: string | fn.Fn
				TableInput: {
					Description?: string | fn.Fn
					Name?:        string | fn.Fn
					Owner?:       string | fn.Fn
					Parameters?:  {
						[string]: _
					} | fn.Fn
					PartitionKeys?: [...{
						Comment?: string | fn.Fn
						Name:     string | fn.Fn
						Type?:    string | fn.Fn
					}]
					Retention?: int | fn.Fn
					StorageDescriptor?: {
						BucketColumns?: [...(string | fn.Fn)] | fn.Fn
						Columns?: [...{
							Comment?: string | fn.Fn
							Name:     string | fn.Fn
							Type?:    string | fn.Fn
						}]
						Compressed?:      bool | fn.Fn
						InputFormat?:     string | fn.Fn
						Location?:        string | fn.Fn
						NumberOfBuckets?: int | fn.Fn
						OutputFormat?:    string | fn.Fn
						Parameters?:      {
							[string]: _
						} | fn.Fn
						SerdeInfo?: {
							Name?:       string | fn.Fn
							Parameters?: {
								[string]: _
							} | fn.Fn
							SerializationLibrary?: string | fn.Fn
						}
						SkewedInfo?: {
							SkewedColumnNames?:             [...(string | fn.Fn)] | fn.Fn
							SkewedColumnValueLocationMaps?: {
								[string]: _
							} | fn.Fn
							SkewedColumnValues?: [...(string | fn.Fn)] | fn.Fn
						}
						SortColumns?: [...{
							Column:    string | fn.Fn
							SortOrder: int | fn.Fn
						}]
						StoredAsSubDirectories?: bool | fn.Fn
					}
					TableType?:        (string & ("EXTERNAL_TABLE" | "VIRTUAL_VIEW")) | fn.Fn
					ViewExpandedText?: string | fn.Fn
					ViewOriginalText?: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Trigger :: {
			Type: "AWS::Glue::Trigger"
			Properties: {
				Actions: [...{
					Arguments?: {
						[string]: _
					} | fn.Fn
					CrawlerName?: string | fn.Fn
					JobName?:     string | fn.Fn
					NotificationProperty?: NotifyDelayAfter?: int | fn.Fn
					SecurityConfiguration?: string | fn.Fn
					Timeout?:               int | fn.Fn
				}]
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				Predicate?: {
					Conditions?: [...{
						CrawlState?:      string | fn.Fn
						CrawlerName?:     string | fn.Fn
						JobName?:         string | fn.Fn
						LogicalOperator?: (string & ("EQUALS")) | fn.Fn
						State?:           (string & ("SUCCEEDED")) | fn.Fn
					}]
					Logical?: (string & ("AND")) | fn.Fn
				}
				Schedule?:        string | fn.Fn
				StartOnCreation?: bool | fn.Fn
				Tags?:            {
					[string]: _
				} | fn.Fn
				Type:          (string & ("CONDITIONAL" | "ON_DEMAND" | "SCHEDULED")) | fn.Fn
				WorkflowName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Workflow :: {
			Type: "AWS::Glue::Workflow"
			Properties: {
				DefaultRunProperties?: {
					[string]: _
				} | fn.Fn
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				Tags?:        {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Greengrass :: {
		ConnectorDefinition :: {
			Type: "AWS::Greengrass::ConnectorDefinition"
			Properties: {
				InitialVersion?: Connectors: [...{
					ConnectorArn: string | fn.Fn
					Id:           string | fn.Fn
					Parameters?:  {
						[string]: _
					} | fn.Fn
				}]
				Name:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ConnectorDefinitionVersion :: {
			Type: "AWS::Greengrass::ConnectorDefinitionVersion"
			Properties: {
				ConnectorDefinitionId: string | fn.Fn
				Connectors: [...{
					ConnectorArn: string | fn.Fn
					Id:           string | fn.Fn
					Parameters?:  {
						[string]: _
					} | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		CoreDefinition :: {
			Type: "AWS::Greengrass::CoreDefinition"
			Properties: {
				InitialVersion?: Cores: [...{
					CertificateArn: string | fn.Fn
					Id:             string | fn.Fn
					SyncShadow?:    bool | fn.Fn
					ThingArn:       string | fn.Fn
				}]
				Name:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		CoreDefinitionVersion :: {
			Type: "AWS::Greengrass::CoreDefinitionVersion"
			Properties: {
				CoreDefinitionId: string | fn.Fn
				Cores: [...{
					CertificateArn: string | fn.Fn
					Id:             string | fn.Fn
					SyncShadow?:    bool | fn.Fn
					ThingArn:       string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DeviceDefinition :: {
			Type: "AWS::Greengrass::DeviceDefinition"
			Properties: {
				InitialVersion?: Devices: [...{
					CertificateArn: string | fn.Fn
					Id:             string | fn.Fn
					SyncShadow?:    bool | fn.Fn
					ThingArn:       string | fn.Fn
				}]
				Name:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DeviceDefinitionVersion :: {
			Type: "AWS::Greengrass::DeviceDefinitionVersion"
			Properties: {
				DeviceDefinitionId: string | fn.Fn
				Devices: [...{
					CertificateArn: string | fn.Fn
					Id:             string | fn.Fn
					SyncShadow?:    bool | fn.Fn
					ThingArn:       string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		FunctionDefinition :: {
			Type: "AWS::Greengrass::FunctionDefinition"
			Properties: {
				InitialVersion?: {
					DefaultConfig?: Execution: {
						IsolationMode?: string | fn.Fn
						RunAs?: {
							Gid?: int | fn.Fn
							Uid?: int | fn.Fn
						}
					}
					Functions: [...{
						FunctionArn: string | fn.Fn
						FunctionConfiguration: {
							EncodingType?: string | fn.Fn
							Environment?: {
								AccessSysfs?: bool | fn.Fn
								Execution?: {
									IsolationMode?: string | fn.Fn
									RunAs?: {
										Gid?: int | fn.Fn
										Uid?: int | fn.Fn
									}
								}
								ResourceAccessPolicies?: [...{
									Permission?: string | fn.Fn
									ResourceId:  string | fn.Fn
								}]
								Variables?: {
									[string]: _
								} | fn.Fn
							}
							ExecArgs?:   string | fn.Fn
							Executable?: string | fn.Fn
							MemorySize?: int | fn.Fn
							Pinned?:     bool | fn.Fn
							Timeout?:    int | fn.Fn
						}
						Id: string | fn.Fn
					}]
				}
				Name:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		FunctionDefinitionVersion :: {
			Type: "AWS::Greengrass::FunctionDefinitionVersion"
			Properties: {
				DefaultConfig?: Execution: {
					IsolationMode?: string | fn.Fn
					RunAs?: {
						Gid?: int | fn.Fn
						Uid?: int | fn.Fn
					}
				}
				FunctionDefinitionId: string | fn.Fn
				Functions: [...{
					FunctionArn: string | fn.Fn
					FunctionConfiguration: {
						EncodingType?: string | fn.Fn
						Environment?: {
							AccessSysfs?: bool | fn.Fn
							Execution?: {
								IsolationMode?: string | fn.Fn
								RunAs?: {
									Gid?: int | fn.Fn
									Uid?: int | fn.Fn
								}
							}
							ResourceAccessPolicies?: [...{
								Permission?: string | fn.Fn
								ResourceId:  string | fn.Fn
							}]
							Variables?: {
								[string]: _
							} | fn.Fn
						}
						ExecArgs?:   string | fn.Fn
						Executable?: string | fn.Fn
						MemorySize?: int | fn.Fn
						Pinned?:     bool | fn.Fn
						Timeout?:    int | fn.Fn
					}
					Id: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Group :: {
			Type: "AWS::Greengrass::Group"
			Properties: {
				InitialVersion?: {
					ConnectorDefinitionVersionArn?:    string | fn.Fn
					CoreDefinitionVersionArn?:         string | fn.Fn
					DeviceDefinitionVersionArn?:       string | fn.Fn
					FunctionDefinitionVersionArn?:     string | fn.Fn
					LoggerDefinitionVersionArn?:       string | fn.Fn
					ResourceDefinitionVersionArn?:     string | fn.Fn
					SubscriptionDefinitionVersionArn?: string | fn.Fn
				}
				Name:     string | fn.Fn
				RoleArn?: string | fn.Fn
				Tags?:    {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		GroupVersion :: {
			Type: "AWS::Greengrass::GroupVersion"
			Properties: {
				ConnectorDefinitionVersionArn?:    string | fn.Fn
				CoreDefinitionVersionArn?:         string | fn.Fn
				DeviceDefinitionVersionArn?:       string | fn.Fn
				FunctionDefinitionVersionArn?:     string | fn.Fn
				GroupId:                           string | fn.Fn
				LoggerDefinitionVersionArn?:       string | fn.Fn
				ResourceDefinitionVersionArn?:     string | fn.Fn
				SubscriptionDefinitionVersionArn?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LoggerDefinition :: {
			Type: "AWS::Greengrass::LoggerDefinition"
			Properties: {
				InitialVersion?: Loggers: [...{
					Component: string | fn.Fn
					Id:        string | fn.Fn
					Level:     string | fn.Fn
					Space?:    int | fn.Fn
					Type:      string | fn.Fn
				}]
				Name:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LoggerDefinitionVersion :: {
			Type: "AWS::Greengrass::LoggerDefinitionVersion"
			Properties: {
				LoggerDefinitionId: string | fn.Fn
				Loggers: [...{
					Component: string | fn.Fn
					Id:        string | fn.Fn
					Level:     string | fn.Fn
					Space?:    int | fn.Fn
					Type:      string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ResourceDefinition :: {
			Type: "AWS::Greengrass::ResourceDefinition"
			Properties: {
				InitialVersion?: Resources: [...{
					Id:   string | fn.Fn
					Name: string | fn.Fn
					ResourceDataContainer: {
						LocalDeviceResourceData?: {
							GroupOwnerSetting?: {
								AutoAddGroupOwner: bool | fn.Fn
								GroupOwner?:       string | fn.Fn
							}
							SourcePath: string | fn.Fn
						}
						LocalVolumeResourceData?: {
							DestinationPath: string | fn.Fn
							GroupOwnerSetting?: {
								AutoAddGroupOwner: bool | fn.Fn
								GroupOwner?:       string | fn.Fn
							}
							SourcePath: string | fn.Fn
						}
						S3MachineLearningModelResourceData?: {
							DestinationPath: string | fn.Fn
							S3Uri:           string | fn.Fn
						}
						SageMakerMachineLearningModelResourceData?: {
							DestinationPath: string | fn.Fn
							SageMakerJobArn: string | fn.Fn
						}
						SecretsManagerSecretResourceData?: {
							ARN:                                string | fn.Fn
							AdditionalStagingLabelsToDownload?: [...(string | fn.Fn)] | fn.Fn
						}
					}
				}]
				Name:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ResourceDefinitionVersion :: {
			Type: "AWS::Greengrass::ResourceDefinitionVersion"
			Properties: {
				ResourceDefinitionId: string | fn.Fn
				Resources: [...{
					Id:   string | fn.Fn
					Name: string | fn.Fn
					ResourceDataContainer: {
						LocalDeviceResourceData?: {
							GroupOwnerSetting?: {
								AutoAddGroupOwner: bool | fn.Fn
								GroupOwner?:       string | fn.Fn
							}
							SourcePath: string | fn.Fn
						}
						LocalVolumeResourceData?: {
							DestinationPath: string | fn.Fn
							GroupOwnerSetting?: {
								AutoAddGroupOwner: bool | fn.Fn
								GroupOwner?:       string | fn.Fn
							}
							SourcePath: string | fn.Fn
						}
						S3MachineLearningModelResourceData?: {
							DestinationPath: string | fn.Fn
							S3Uri:           string | fn.Fn
						}
						SageMakerMachineLearningModelResourceData?: {
							DestinationPath: string | fn.Fn
							SageMakerJobArn: string | fn.Fn
						}
						SecretsManagerSecretResourceData?: {
							ARN:                                string | fn.Fn
							AdditionalStagingLabelsToDownload?: [...(string | fn.Fn)] | fn.Fn
						}
					}
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SubscriptionDefinition :: {
			Type: "AWS::Greengrass::SubscriptionDefinition"
			Properties: {
				InitialVersion?: Subscriptions: [...{
					Id:      string | fn.Fn
					Source:  string | fn.Fn
					Subject: string | fn.Fn
					Target:  string | fn.Fn
				}]
				Name:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SubscriptionDefinitionVersion :: {
			Type: "AWS::Greengrass::SubscriptionDefinitionVersion"
			Properties: {
				SubscriptionDefinitionId: string | fn.Fn
				Subscriptions: [...{
					Id:      string | fn.Fn
					Source:  string | fn.Fn
					Subject: string | fn.Fn
					Target:  string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	GuardDuty :: {
		Detector :: {
			Type: "AWS::GuardDuty::Detector"
			Properties: {
				Enable:                      bool | fn.Fn
				FindingPublishingFrequency?: (string & ("FIFTEEN_MINUTES" | "ONE_HOUR" | "SIX_HOURS")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Filter :: {
			Type: "AWS::GuardDuty::Filter"
			Properties: {
				Action:      (string & ("ARCHIVE" | "NOOP")) | fn.Fn
				Description: string | fn.Fn
				DetectorId:  string | fn.Fn
				FindingCriteria: {
					Criterion?: {
						[string]: _
					} | fn.Fn
					ItemType?: {
						Eq?:  [...(string | fn.Fn)] | fn.Fn
						Gte?: int | fn.Fn
						Lt?:  int | fn.Fn
						Lte?: int | fn.Fn
						Neq?: [...(string | fn.Fn)] | fn.Fn
					}
				}
				Name?: string | fn.Fn
				Rank:  int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		IPSet :: {
			Type: "AWS::GuardDuty::IPSet"
			Properties: {
				Activate:   bool | fn.Fn
				DetectorId: string | fn.Fn
				Format:     (string & ("OTX_CSV" | "STIX" | "TXT")) | fn.Fn
				Location:   string | fn.Fn
				Name?:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Master :: {
			Type: "AWS::GuardDuty::Master"
			Properties: {
				DetectorId:    string | fn.Fn
				InvitationId?: string | fn.Fn
				MasterId:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Member :: {
			Type: "AWS::GuardDuty::Member"
			Properties: {
				DetectorId:                string | fn.Fn
				DisableEmailNotification?: bool | fn.Fn
				Email:                     string | fn.Fn
				MemberId:                  string | fn.Fn
				Message?:                  string | fn.Fn
				Status?:                   (string & ("Created" | "Disabled" | "Enabled" | "Invited" | "Removed" | "Resigned")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ThreatIntelSet :: {
			Type: "AWS::GuardDuty::ThreatIntelSet"
			Properties: {
				Activate:   bool | fn.Fn
				DetectorId: string | fn.Fn
				Format:     (string & ("ALIEN_VAULT" | "FIRE_EYE" | "OTX_CSV" | "PROOF_POINT" | "STIX" | "TXT")) | fn.Fn
				Location:   string | fn.Fn
				Name?:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	IAM :: {
		AccessKey :: {
			Type: "AWS::IAM::AccessKey"
			Properties: {
				Serial?:  int | fn.Fn
				Status?:  (string & ("Active" | "Inactive")) | fn.Fn
				UserName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Group :: {
			Type: "AWS::IAM::Group"
			Properties: {
				GroupName?:         string | fn.Fn
				ManagedPolicyArns?: [...((string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn)] | fn.Fn
				Path?:              (string & (=~#"^/(.+/)*$"#)) | fn.Fn
				Policies?: [...{
					PolicyDocument: {
						[string]: _
					} | fn.Fn
					PolicyName: (string & (strings.MinRunes(1) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		InstanceProfile :: {
			Type: "AWS::IAM::InstanceProfile"
			Properties: {
				InstanceProfileName?: string | fn.Fn
				Path?:                (string & (=~#"^/(.+/)*$"#)) | fn.Fn
				Roles:                [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ManagedPolicy :: {
			Type: "AWS::IAM::ManagedPolicy"
			Properties: {
				Description?:       string | fn.Fn
				Groups?:            [...(string | fn.Fn)] | fn.Fn
				ManagedPolicyName?: string | fn.Fn
				Path?:              (string & (=~#"^/(.+/)*$"#)) | fn.Fn
				PolicyDocument:     {
					[string]: _
				} | fn.Fn
				Roles?: [...(string | fn.Fn)] | fn.Fn
				Users?: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Policy :: {
			Type: "AWS::IAM::Policy"
			Properties: {
				Groups?:        [...(string | fn.Fn)] | fn.Fn
				PolicyDocument: {
					[string]: _
				} | fn.Fn
				PolicyName: (string & (strings.MinRunes(1) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.Fn
				Roles?:     [...(string | fn.Fn)] | fn.Fn
				Users?:     [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Role :: {
			Type: "AWS::IAM::Role"
			Properties: {
				AssumeRolePolicyDocument: {
					[string]: _
				} | fn.Fn
				Description?:         string | fn.Fn
				ManagedPolicyArns?:   [...((string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn)] | fn.Fn
				MaxSessionDuration?:  (int & (>=3600 & <=43200)) | fn.Fn
				Path?:                (string & (=~#"^/(.+/)*$"#)) | fn.Fn
				PermissionsBoundary?: string | fn.Fn
				Policies?: [...{
					PolicyDocument: {
						[string]: _
					} | fn.Fn
					PolicyName: (string & (strings.MinRunes(1) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.Fn
				}]
				RoleName?: string | fn.Fn
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
		ServiceLinkedRole :: {
			Type: "AWS::IAM::ServiceLinkedRole"
			Properties: {
				AWSServiceName: string | fn.Fn
				CustomSuffix?:  string | fn.Fn
				Description?:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		User :: {
			Type: "AWS::IAM::User"
			Properties: {
				Groups?: [...(string | fn.Fn)] | fn.Fn
				LoginProfile?: {
					Password:               string | fn.Fn
					PasswordResetRequired?: bool | fn.Fn
				}
				ManagedPolicyArns?:   [...((string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::(\d{12}|aws):policy/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn)] | fn.Fn
				Path?:                (string & (=~#"^/(.+/)*$"#)) | fn.Fn
				PermissionsBoundary?: string | fn.Fn
				Policies?: [...{
					PolicyDocument: {
						[string]: _
					} | fn.Fn
					PolicyName: (string & (strings.MinRunes(1) & strings.MaxRunes(128)) & (=~#"^[a-zA-Z0-9+=,.@\-_]+$"#)) | fn.Fn
				}]
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				UserName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserToGroupAddition :: {
			Type: "AWS::IAM::UserToGroupAddition"
			Properties: {
				GroupName: string | fn.Fn
				Users:     [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Inspector :: {
		AssessmentTarget :: {
			Type: "AWS::Inspector::AssessmentTarget"
			Properties: {
				AssessmentTargetName?: string | fn.Fn
				ResourceGroupArn?:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		AssessmentTemplate :: {
			Type: "AWS::Inspector::AssessmentTemplate"
			Properties: {
				AssessmentTargetArn:     string | fn.Fn
				AssessmentTemplateName?: string | fn.Fn
				DurationInSeconds:       (int & (>=180 & <=86400)) | fn.Fn
				RulesPackageArns:        [...(string | fn.Fn)] | fn.Fn
				UserAttributesForFindings?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ResourceGroup :: {
			Type: "AWS::Inspector::ResourceGroup"
			Properties: ResourceGroupTags: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	IoT :: {
		Certificate :: {
			Type: "AWS::IoT::Certificate"
			Properties: {
				CertificateSigningRequest: string | fn.Fn
				Status:                    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Policy :: {
			Type: "AWS::IoT::Policy"
			Properties: {
				PolicyDocument: {
					[string]: _
				} | fn.Fn
				PolicyName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		PolicyPrincipalAttachment :: {
			Type: "AWS::IoT::PolicyPrincipalAttachment"
			Properties: {
				PolicyName: string | fn.Fn
				Principal:  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Thing :: {
			Type: "AWS::IoT::Thing"
			Properties: {
				AttributePayload?: Attributes?: [string]: string | fn.Fn
				ThingName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ThingPrincipalAttachment :: {
			Type: "AWS::IoT::ThingPrincipalAttachment"
			Properties: {
				Principal: string | fn.Fn
				ThingName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TopicRule :: {
			Type: "AWS::IoT::TopicRule"
			Properties: {
				RuleName?: string | fn.Fn
				TopicRulePayload: {
					Actions: [...{
						CloudwatchAlarm?: {
							AlarmName:   string | fn.Fn
							RoleArn:     string | fn.Fn
							StateReason: string | fn.Fn
							StateValue:  string | fn.Fn
						}
						CloudwatchMetric?: {
							MetricName:       string | fn.Fn
							MetricNamespace:  string | fn.Fn
							MetricTimestamp?: string | fn.Fn
							MetricUnit:       string | fn.Fn
							MetricValue:      string | fn.Fn
							RoleArn:          string | fn.Fn
						}
						DynamoDB?: {
							HashKeyField:   string | fn.Fn
							HashKeyType?:   string | fn.Fn
							HashKeyValue:   string | fn.Fn
							PayloadField?:  string | fn.Fn
							RangeKeyField?: string | fn.Fn
							RangeKeyType?:  string | fn.Fn
							RangeKeyValue?: string | fn.Fn
							RoleArn:        string | fn.Fn
							TableName:      string | fn.Fn
						}
						DynamoDBv2?: {
							PutItem?: TableName: string | fn.Fn
							RoleArn?: string | fn.Fn
						}
						Elasticsearch?: {
							Endpoint: string | fn.Fn
							Id:       string | fn.Fn
							Index:    string | fn.Fn
							RoleArn:  string | fn.Fn
							Type:     string | fn.Fn
						}
						Firehose?: {
							DeliveryStreamName: string | fn.Fn
							RoleArn:            string | fn.Fn
							Separator?:         string | fn.Fn
						}
						IotAnalytics?: {
							ChannelName: string | fn.Fn
							RoleArn:     string | fn.Fn
						}
						Kinesis?: {
							PartitionKey?: string | fn.Fn
							RoleArn:       string | fn.Fn
							StreamName:    string | fn.Fn
						}
						Lambda?: FunctionArn?: string | fn.Fn
						Republish?: {
							RoleArn: string | fn.Fn
							Topic:   string | fn.Fn
						}
						S3?: {
							BucketName: string | fn.Fn
							Key:        string | fn.Fn
							RoleArn:    string | fn.Fn
						}
						Sns?: {
							MessageFormat?: string | fn.Fn
							RoleArn:        string | fn.Fn
							TargetArn:      string | fn.Fn
						}
						Sqs?: {
							QueueUrl:   string | fn.Fn
							RoleArn:    string | fn.Fn
							UseBase64?: bool | fn.Fn
						}
						StepFunctions?: {
							ExecutionNamePrefix?: string | fn.Fn
							RoleArn:              string | fn.Fn
							StateMachineName:     string | fn.Fn
						}
					}]
					AwsIotSqlVersion?: string | fn.Fn
					Description?:      string | fn.Fn
					ErrorAction?: {
						CloudwatchAlarm?: {
							AlarmName:   string | fn.Fn
							RoleArn:     string | fn.Fn
							StateReason: string | fn.Fn
							StateValue:  string | fn.Fn
						}
						CloudwatchMetric?: {
							MetricName:       string | fn.Fn
							MetricNamespace:  string | fn.Fn
							MetricTimestamp?: string | fn.Fn
							MetricUnit:       string | fn.Fn
							MetricValue:      string | fn.Fn
							RoleArn:          string | fn.Fn
						}
						DynamoDB?: {
							HashKeyField:   string | fn.Fn
							HashKeyType?:   string | fn.Fn
							HashKeyValue:   string | fn.Fn
							PayloadField?:  string | fn.Fn
							RangeKeyField?: string | fn.Fn
							RangeKeyType?:  string | fn.Fn
							RangeKeyValue?: string | fn.Fn
							RoleArn:        string | fn.Fn
							TableName:      string | fn.Fn
						}
						DynamoDBv2?: {
							PutItem?: TableName: string | fn.Fn
							RoleArn?: string | fn.Fn
						}
						Elasticsearch?: {
							Endpoint: string | fn.Fn
							Id:       string | fn.Fn
							Index:    string | fn.Fn
							RoleArn:  string | fn.Fn
							Type:     string | fn.Fn
						}
						Firehose?: {
							DeliveryStreamName: string | fn.Fn
							RoleArn:            string | fn.Fn
							Separator?:         string | fn.Fn
						}
						IotAnalytics?: {
							ChannelName: string | fn.Fn
							RoleArn:     string | fn.Fn
						}
						Kinesis?: {
							PartitionKey?: string | fn.Fn
							RoleArn:       string | fn.Fn
							StreamName:    string | fn.Fn
						}
						Lambda?: FunctionArn?: string | fn.Fn
						Republish?: {
							RoleArn: string | fn.Fn
							Topic:   string | fn.Fn
						}
						S3?: {
							BucketName: string | fn.Fn
							Key:        string | fn.Fn
							RoleArn:    string | fn.Fn
						}
						Sns?: {
							MessageFormat?: string | fn.Fn
							RoleArn:        string | fn.Fn
							TargetArn:      string | fn.Fn
						}
						Sqs?: {
							QueueUrl:   string | fn.Fn
							RoleArn:    string | fn.Fn
							UseBase64?: bool | fn.Fn
						}
						StepFunctions?: {
							ExecutionNamePrefix?: string | fn.Fn
							RoleArn:              string | fn.Fn
							StateMachineName:     string | fn.Fn
						}
					}
					RuleDisabled: bool | fn.Fn
					Sql:          string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	IoT1Click :: {
		Device :: {
			Type: "AWS::IoT1Click::Device"
			Properties: {
				DeviceId: string | fn.Fn
				Enabled:  bool | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Placement :: {
			Type: "AWS::IoT1Click::Placement"
			Properties: {
				AssociatedDevices?: {
					[string]: _
				} | fn.Fn
				Attributes?: {
					[string]: _
				} | fn.Fn
				PlacementName?: string | fn.Fn
				ProjectName:    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Project :: {
			Type: "AWS::IoT1Click::Project"
			Properties: {
				Description?: string | fn.Fn
				PlacementTemplate: {
					DefaultAttributes?: {
						[string]: _
					} | fn.Fn
					DeviceTemplates?: {
						[string]: _
					} | fn.Fn
				}
				ProjectName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	IoTAnalytics :: {
		Channel :: {
			Type: "AWS::IoTAnalytics::Channel"
			Properties: {
				ChannelName?: string | fn.Fn
				ChannelStorage?: {
					CustomerManagedS3?: {
						Bucket:     string | fn.Fn
						KeyPrefix?: string | fn.Fn
						RoleArn:    string | fn.Fn
					}
					ServiceManagedS3?: {
					}
				}
				RetentionPeriod?: {
					NumberOfDays?: int | fn.Fn
					Unlimited?:    bool | fn.Fn
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
		Dataset :: {
			Type: "AWS::IoTAnalytics::Dataset"
			Properties: {
				Actions: [...{
					ActionName: string | fn.Fn
					ContainerAction?: {
						ExecutionRoleArn: string | fn.Fn
						Image:            string | fn.Fn
						ResourceConfiguration: {
							ComputeType:    string | fn.Fn
							VolumeSizeInGB: int | fn.Fn
						}
						Variables?: [...{
							DatasetContentVersionValue?: DatasetName?: string | fn.Fn
							DoubleValue?: float | fn.Fn
							OutputFileUriValue?: FileName?: string | fn.Fn
							StringValue?: string | fn.Fn
							VariableName: string | fn.Fn
						}]
					}
					QueryAction?: {
						Filters?: [...{
							DeltaTime?: {
								OffsetSeconds:  int | fn.Fn
								TimeExpression: string | fn.Fn
							}
						}]
						SqlQuery: string | fn.Fn
					}
				}]
				ContentDeliveryRules?: [...{
					Destination: {
						IotEventsDestinationConfiguration?: {
							InputName: string | fn.Fn
							RoleArn:   string | fn.Fn
						}
						S3DestinationConfiguration?: {
							Bucket: string | fn.Fn
							GlueConfiguration?: {
								DatabaseName: string | fn.Fn
								TableName:    string | fn.Fn
							}
							Key:     string | fn.Fn
							RoleArn: string | fn.Fn
						}
					}
					EntryName?: string | fn.Fn
				}]
				DatasetName?: string | fn.Fn
				RetentionPeriod?: {
					NumberOfDays: int | fn.Fn
					Unlimited:    bool | fn.Fn
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Triggers?: [...{
					Schedule?: ScheduleExpression:   string | fn.Fn
					TriggeringDataset?: DatasetName: string | fn.Fn
				}]
				VersioningConfiguration?: {
					MaxVersions?: int | fn.Fn
					Unlimited?:   bool | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Datastore :: {
			Type: "AWS::IoTAnalytics::Datastore"
			Properties: {
				DatastoreName?: string | fn.Fn
				DatastoreStorage?: {
					CustomerManagedS3?: {
						Bucket:     string | fn.Fn
						KeyPrefix?: string | fn.Fn
						RoleArn:    string | fn.Fn
					}
					ServiceManagedS3?: {
					}
				}
				RetentionPeriod?: {
					NumberOfDays?: int | fn.Fn
					Unlimited?:    bool | fn.Fn
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
		Pipeline :: {
			Type: "AWS::IoTAnalytics::Pipeline"
			Properties: {
				PipelineActivities: [...{
					AddAttributes?: {
						Attributes?: {
							[string]: _
						} | fn.Fn
						Name?: string | fn.Fn
						Next?: string | fn.Fn
					}
					Channel?: {
						ChannelName?: string | fn.Fn
						Name?:        string | fn.Fn
						Next?:        string | fn.Fn
					}
					Datastore?: {
						DatastoreName?: string | fn.Fn
						Name?:          string | fn.Fn
					}
					DeviceRegistryEnrich?: {
						Attribute?: string | fn.Fn
						Name?:      string | fn.Fn
						Next?:      string | fn.Fn
						RoleArn?:   string | fn.Fn
						ThingName?: string | fn.Fn
					}
					DeviceShadowEnrich?: {
						Attribute?: string | fn.Fn
						Name?:      string | fn.Fn
						Next?:      string | fn.Fn
						RoleArn?:   string | fn.Fn
						ThingName?: string | fn.Fn
					}
					Filter?: {
						Filter?: string | fn.Fn
						Name?:   string | fn.Fn
						Next?:   string | fn.Fn
					}
					Lambda?: {
						BatchSize?:  int | fn.Fn
						LambdaName?: string | fn.Fn
						Name?:       string | fn.Fn
						Next?:       string | fn.Fn
					}
					Math?: {
						Attribute?: string | fn.Fn
						Math?:      string | fn.Fn
						Name?:      string | fn.Fn
						Next?:      string | fn.Fn
					}
					RemoveAttributes?: {
						Attributes?: [...(string | fn.Fn)] | fn.Fn
						Name?:       string | fn.Fn
						Next?:       string | fn.Fn
					}
					SelectAttributes?: {
						Attributes?: [...(string | fn.Fn)] | fn.Fn
						Name?:       string | fn.Fn
						Next?:       string | fn.Fn
					}
				}]
				PipelineName?: string | fn.Fn
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
	}

	IoTEvents :: {
		DetectorModel :: {
			Type: "AWS::IoTEvents::DetectorModel"
			Properties: {
				DetectorModelDefinition?: {
					InitialStateName?: string | fn.Fn
					States?: [...{
						OnEnter?: Events?: [...{
							Actions?: [...{
								ClearTimer?: TimerName?: string | fn.Fn
								Firehose?: {
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								}
								IotEvents?: InputName?:       string | fn.Fn
								IotTopicPublish?: MqttTopic?: string | fn.Fn
								Lambda?: FunctionArn?:        string | fn.Fn
								ResetTimer?: TimerName?:      string | fn.Fn
								SetTimer?: {
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								}
								SetVariable?: {
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								}
								Sns?: TargetArn?: string | fn.Fn
								Sqs?: {
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								}
							}]
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						}]
						OnExit?: Events?: [...{
							Actions?: [...{
								ClearTimer?: TimerName?: string | fn.Fn
								Firehose?: {
									DeliveryStreamName?: string | fn.Fn
									Separator?:          string | fn.Fn
								}
								IotEvents?: InputName?:       string | fn.Fn
								IotTopicPublish?: MqttTopic?: string | fn.Fn
								Lambda?: FunctionArn?:        string | fn.Fn
								ResetTimer?: TimerName?:      string | fn.Fn
								SetTimer?: {
									Seconds?:   int | fn.Fn
									TimerName?: string | fn.Fn
								}
								SetVariable?: {
									Value?:        string | fn.Fn
									VariableName?: string | fn.Fn
								}
								Sns?: TargetArn?: string | fn.Fn
								Sqs?: {
									QueueUrl?:  string | fn.Fn
									UseBase64?: bool | fn.Fn
								}
							}]
							Condition?: string | fn.Fn
							EventName?: string | fn.Fn
						}]
						OnInput?: {
							Events?: [...{
								Actions?: [...{
									ClearTimer?: TimerName?: string | fn.Fn
									Firehose?: {
										DeliveryStreamName?: string | fn.Fn
										Separator?:          string | fn.Fn
									}
									IotEvents?: InputName?:       string | fn.Fn
									IotTopicPublish?: MqttTopic?: string | fn.Fn
									Lambda?: FunctionArn?:        string | fn.Fn
									ResetTimer?: TimerName?:      string | fn.Fn
									SetTimer?: {
										Seconds?:   int | fn.Fn
										TimerName?: string | fn.Fn
									}
									SetVariable?: {
										Value?:        string | fn.Fn
										VariableName?: string | fn.Fn
									}
									Sns?: TargetArn?: string | fn.Fn
									Sqs?: {
										QueueUrl?:  string | fn.Fn
										UseBase64?: bool | fn.Fn
									}
								}]
								Condition?: string | fn.Fn
								EventName?: string | fn.Fn
							}]
							TransitionEvents?: [...{
								Actions?: [...{
									ClearTimer?: TimerName?: string | fn.Fn
									Firehose?: {
										DeliveryStreamName?: string | fn.Fn
										Separator?:          string | fn.Fn
									}
									IotEvents?: InputName?:       string | fn.Fn
									IotTopicPublish?: MqttTopic?: string | fn.Fn
									Lambda?: FunctionArn?:        string | fn.Fn
									ResetTimer?: TimerName?:      string | fn.Fn
									SetTimer?: {
										Seconds?:   int | fn.Fn
										TimerName?: string | fn.Fn
									}
									SetVariable?: {
										Value?:        string | fn.Fn
										VariableName?: string | fn.Fn
									}
									Sns?: TargetArn?: string | fn.Fn
									Sqs?: {
										QueueUrl?:  string | fn.Fn
										UseBase64?: bool | fn.Fn
									}
								}]
								Condition?: string | fn.Fn
								EventName?: string | fn.Fn
								NextState?: string | fn.Fn
							}]
						}
						StateName?: string | fn.Fn
					}]
				}
				DetectorModelDescription?: string | fn.Fn
				DetectorModelName?:        string | fn.Fn
				Key?:                      string | fn.Fn
				RoleArn?:                  string | fn.Fn
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
		Input :: {
			Type: "AWS::IoTEvents::Input"
			Properties: {
				InputDefinition?: Attributes?: [...{
					JsonPath?: string | fn.Fn
				}]
				InputDescription?: string | fn.Fn
				InputName?:        string | fn.Fn
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
	}

	IoTThingsGraph :: {
		FlowTemplate :: {
			Type: "AWS::IoTThingsGraph::FlowTemplate"
			Properties: {
				CompatibleNamespaceVersion?: float | fn.Fn
				Definition: {
					Language: string | fn.Fn
					Text:     string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	KMS :: {
		Alias :: {
			Type: "AWS::KMS::Alias"
			Properties: {
				AliasName:   string | fn.Fn
				TargetKeyId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Key :: {
			Type: "AWS::KMS::Key"
			Properties: {
				Description?:       string | fn.Fn
				EnableKeyRotation?: bool | fn.Fn
				Enabled?:           bool | fn.Fn
				KeyPolicy:          {
					[string]: _
				} | fn.Fn
				KeyUsage?:            string | fn.Fn
				PendingWindowInDays?: (int & (>=7 & <=30)) | fn.Fn
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
	}

	Kinesis :: {
		Stream :: {
			Type: "AWS::Kinesis::Stream"
			Properties: {
				Name?:                 string | fn.Fn
				RetentionPeriodHours?: (int & (>=1 & <=168)) | fn.Fn
				ShardCount:            (int & (>=1 & <=100000)) | fn.Fn
				StreamEncryption?: {
					EncryptionType: string | fn.Fn
					KeyId:          string | fn.Fn
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
		StreamConsumer :: {
			Type: "AWS::Kinesis::StreamConsumer"
			Properties: {
				ConsumerName: string | fn.Fn
				StreamARN:    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	KinesisAnalytics :: {
		Application :: {
			Type: "AWS::KinesisAnalytics::Application"
			Properties: {
				ApplicationCode?:        string | fn.Fn
				ApplicationDescription?: string | fn.Fn
				ApplicationName?:        string | fn.Fn
				Inputs: [...{
					InputParallelism?: Count?: int | fn.Fn
					InputProcessingConfiguration?: InputLambdaProcessor?: {
						ResourceARN: string | fn.Fn
						RoleARN:     string | fn.Fn
					}
					InputSchema: {
						RecordColumns: [...{
							Mapping?: string | fn.Fn
							Name:     string | fn.Fn
							SqlType:  string | fn.Fn
						}]
						RecordEncoding?: string | fn.Fn
						RecordFormat: {
							MappingParameters?: {
								CSVMappingParameters?: {
									RecordColumnDelimiter: string | fn.Fn
									RecordRowDelimiter:    string | fn.Fn
								}
								JSONMappingParameters?: RecordRowPath: string | fn.Fn
							}
							RecordFormatType: string | fn.Fn
						}
					}
					KinesisFirehoseInput?: {
						ResourceARN: string | fn.Fn
						RoleARN:     string | fn.Fn
					}
					KinesisStreamsInput?: {
						ResourceARN: string | fn.Fn
						RoleARN:     string | fn.Fn
					}
					NamePrefix: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApplicationOutput :: {
			Type: "AWS::KinesisAnalytics::ApplicationOutput"
			Properties: {
				ApplicationName: string | fn.Fn
				Output: {
					DestinationSchema: RecordFormatType?: string | fn.Fn
					KinesisFirehoseOutput?: {
						ResourceARN: string | fn.Fn
						RoleARN:     string | fn.Fn
					}
					KinesisStreamsOutput?: {
						ResourceARN: string | fn.Fn
						RoleARN:     string | fn.Fn
					}
					LambdaOutput?: {
						ResourceARN: string | fn.Fn
						RoleARN:     string | fn.Fn
					}
					Name?: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApplicationReferenceDataSource :: {
			Type: "AWS::KinesisAnalytics::ApplicationReferenceDataSource"
			Properties: {
				ApplicationName: string | fn.Fn
				ReferenceDataSource: {
					ReferenceSchema: {
						RecordColumns: [...{
							Mapping?: string | fn.Fn
							Name:     string | fn.Fn
							SqlType:  string | fn.Fn
						}]
						RecordEncoding?: string | fn.Fn
						RecordFormat: {
							MappingParameters?: {
								CSVMappingParameters?: {
									RecordColumnDelimiter: string | fn.Fn
									RecordRowDelimiter:    string | fn.Fn
								}
								JSONMappingParameters?: RecordRowPath: string | fn.Fn
							}
							RecordFormatType: string | fn.Fn
						}
					}
					S3ReferenceDataSource?: {
						BucketARN:        string | fn.Fn
						FileKey:          string | fn.Fn
						ReferenceRoleARN: string | fn.Fn
					}
					TableName?: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	KinesisAnalyticsV2 :: {
		Application :: {
			Type: "AWS::KinesisAnalyticsV2::Application"
			Properties: {
				ApplicationConfiguration?: {
					ApplicationCodeConfiguration?: {
						CodeContent: {
							S3ContentLocation?: {
								BucketARN?:     string | fn.Fn
								FileKey?:       string | fn.Fn
								ObjectVersion?: string | fn.Fn
							}
							TextContent?:    string | fn.Fn
							ZipFileContent?: string | fn.Fn
						}
						CodeContentType: string | fn.Fn
					}
					ApplicationSnapshotConfiguration?: SnapshotsEnabled: bool | fn.Fn
					EnvironmentProperties?: PropertyGroups?: [...{
						PropertyGroupId?: string | fn.Fn
						PropertyMap?:     {
							[string]: _
						} | fn.Fn
					}]
					FlinkApplicationConfiguration?: {
						CheckpointConfiguration?: {
							CheckpointInterval?:         int | fn.Fn
							CheckpointingEnabled?:       bool | fn.Fn
							ConfigurationType:           string | fn.Fn
							MinPauseBetweenCheckpoints?: int | fn.Fn
						}
						MonitoringConfiguration?: {
							ConfigurationType: string | fn.Fn
							LogLevel?:         string | fn.Fn
							MetricsLevel?:     string | fn.Fn
						}
						ParallelismConfiguration?: {
							AutoScalingEnabled?: bool | fn.Fn
							ConfigurationType:   string | fn.Fn
							Parallelism?:        int | fn.Fn
							ParallelismPerKPU?:  int | fn.Fn
						}
					}
					SqlApplicationConfiguration?: Inputs?: [...{
						InputParallelism?: Count?: int | fn.Fn
						InputProcessingConfiguration?: InputLambdaProcessor?: ResourceARN: string | fn.Fn
						InputSchema: {
							RecordColumns: [...{
								Mapping?: string | fn.Fn
								Name:     string | fn.Fn
								SqlType:  string | fn.Fn
							}]
							RecordEncoding?: string | fn.Fn
							RecordFormat: {
								MappingParameters?: {
									CSVMappingParameters?: {
										RecordColumnDelimiter: string | fn.Fn
										RecordRowDelimiter:    string | fn.Fn
									}
									JSONMappingParameters?: RecordRowPath: string | fn.Fn
								}
								RecordFormatType: string | fn.Fn
							}
						}
						KinesisFirehoseInput?: ResourceARN: string | fn.Fn
						KinesisStreamsInput?: ResourceARN:  string | fn.Fn
						NamePrefix: string | fn.Fn
					}]
				}
				ApplicationDescription?: string | fn.Fn
				ApplicationName?:        string | fn.Fn
				RuntimeEnvironment:      string | fn.Fn
				ServiceExecutionRole:    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApplicationCloudWatchLoggingOption :: {
			Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
			Properties: {
				ApplicationName: string | fn.Fn
				CloudWatchLoggingOption: LogStreamARN: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApplicationOutput :: {
			Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
			Properties: {
				ApplicationName: string | fn.Fn
				Output: {
					DestinationSchema: RecordFormatType?: string | fn.Fn
					KinesisFirehoseOutput?: ResourceARN:  string | fn.Fn
					KinesisStreamsOutput?: ResourceARN:   string | fn.Fn
					LambdaOutput?: ResourceARN:           string | fn.Fn
					Name?: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApplicationReferenceDataSource :: {
			Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
			Properties: {
				ApplicationName: string | fn.Fn
				ReferenceDataSource: {
					ReferenceSchema: {
						RecordColumns: [...{
							Mapping?: string | fn.Fn
							Name:     string | fn.Fn
							SqlType:  string | fn.Fn
						}]
						RecordEncoding?: string | fn.Fn
						RecordFormat: {
							MappingParameters?: {
								CSVMappingParameters?: {
									RecordColumnDelimiter: string | fn.Fn
									RecordRowDelimiter:    string | fn.Fn
								}
								JSONMappingParameters?: RecordRowPath: string | fn.Fn
							}
							RecordFormatType: string | fn.Fn
						}
					}
					S3ReferenceDataSource?: {
						BucketARN: string | fn.Fn
						FileKey:   string | fn.Fn
					}
					TableName?: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	KinesisFirehose :: {
		DeliveryStream :: {
			Type: "AWS::KinesisFirehose::DeliveryStream"
			Properties: {
				DeliveryStreamName?: string | fn.Fn
				DeliveryStreamType?: string | fn.Fn
				ElasticsearchDestinationConfiguration?: {
					BufferingHints: {
						IntervalInSeconds: int | fn.Fn
						SizeInMBs:         int | fn.Fn
					}
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					DomainARN:           string | fn.Fn
					IndexName:           string | fn.Fn
					IndexRotationPeriod: string | fn.Fn
					ProcessingConfiguration?: {
						Enabled?: bool | fn.Fn
						Processors?: [...{
							Parameters: [...{
								ParameterName:  string | fn.Fn
								ParameterValue: string | fn.Fn
							}]
							Type: string | fn.Fn
						}]
					}
					RetryOptions: DurationInSeconds: int | fn.Fn
					RoleARN:      string | fn.Fn
					S3BackupMode: string | fn.Fn
					S3Configuration: {
						BucketARN: string | fn.Fn
						BufferingHints: {
							IntervalInSeconds: int | fn.Fn
							SizeInMBs:         int | fn.Fn
						}
						CloudWatchLoggingOptions?: {
							Enabled?:       bool | fn.Fn
							LogGroupName?:  string | fn.Fn
							LogStreamName?: string | fn.Fn
						}
						CompressionFormat: string | fn.Fn
						EncryptionConfiguration?: {
							KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
							NoEncryptionConfig?: string | fn.Fn
						}
						ErrorOutputPrefix?: string | fn.Fn
						Prefix?:            string | fn.Fn
						RoleARN:            string | fn.Fn
					}
					TypeName: string | fn.Fn
				}
				ExtendedS3DestinationConfiguration?: {
					BucketARN: string | fn.Fn
					BufferingHints: {
						IntervalInSeconds: int | fn.Fn
						SizeInMBs:         int | fn.Fn
					}
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					CompressionFormat: string | fn.Fn
					DataFormatConversionConfiguration?: {
						Enabled: bool | fn.Fn
						InputFormatConfiguration: Deserializer: {
							HiveJsonSerDe?: TimestampFormats?: [...(string | fn.Fn)] | fn.Fn
							OpenXJsonSerDe?: {
								CaseInsensitive?: bool | fn.Fn
								ColumnToJsonKeyMappings?: [string]: string | fn.Fn
								ConvertDotsInJsonKeysToUnderscores?: bool | fn.Fn
							}
						}
						OutputFormatConfiguration: Serializer: {
							OrcSerDe?: {
								BlockSizeBytes?:                      int | fn.Fn
								BloomFilterColumns?:                  [...(string | fn.Fn)] | fn.Fn
								BloomFilterFalsePositiveProbability?: float | fn.Fn
								Compression?:                         string | fn.Fn
								DictionaryKeyThreshold?:              float | fn.Fn
								EnablePadding?:                       bool | fn.Fn
								FormatVersion?:                       string | fn.Fn
								PaddingTolerance?:                    float | fn.Fn
								RowIndexStride?:                      int | fn.Fn
								StripeSizeBytes?:                     int | fn.Fn
							}
							ParquetSerDe?: {
								BlockSizeBytes?:              int | fn.Fn
								Compression?:                 string | fn.Fn
								EnableDictionaryCompression?: bool | fn.Fn
								MaxPaddingBytes?:             int | fn.Fn
								PageSizeBytes?:               int | fn.Fn
								WriterVersion?:               string | fn.Fn
							}
						}
						SchemaConfiguration: {
							CatalogId:    string | fn.Fn
							DatabaseName: string | fn.Fn
							Region:       string | fn.Fn
							RoleARN:      string | fn.Fn
							TableName:    string | fn.Fn
							VersionId:    string | fn.Fn
						}
					}
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
						NoEncryptionConfig?: string | fn.Fn
					}
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					ProcessingConfiguration?: {
						Enabled?: bool | fn.Fn
						Processors?: [...{
							Parameters: [...{
								ParameterName:  string | fn.Fn
								ParameterValue: string | fn.Fn
							}]
							Type: string | fn.Fn
						}]
					}
					RoleARN: string | fn.Fn
					S3BackupConfiguration?: {
						BucketARN: string | fn.Fn
						BufferingHints: {
							IntervalInSeconds: int | fn.Fn
							SizeInMBs:         int | fn.Fn
						}
						CloudWatchLoggingOptions?: {
							Enabled?:       bool | fn.Fn
							LogGroupName?:  string | fn.Fn
							LogStreamName?: string | fn.Fn
						}
						CompressionFormat: string | fn.Fn
						EncryptionConfiguration?: {
							KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
							NoEncryptionConfig?: string | fn.Fn
						}
						ErrorOutputPrefix?: string | fn.Fn
						Prefix?:            string | fn.Fn
						RoleARN:            string | fn.Fn
					}
					S3BackupMode?: string | fn.Fn
				}
				KinesisStreamSourceConfiguration?: {
					KinesisStreamARN: string | fn.Fn
					RoleARN:          string | fn.Fn
				}
				RedshiftDestinationConfiguration?: {
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					ClusterJDBCURL: string | fn.Fn
					CopyCommand: {
						CopyOptions?:      string | fn.Fn
						DataTableColumns?: string | fn.Fn
						DataTableName:     string | fn.Fn
					}
					Password: string | fn.Fn
					ProcessingConfiguration?: {
						Enabled?: bool | fn.Fn
						Processors?: [...{
							Parameters: [...{
								ParameterName:  string | fn.Fn
								ParameterValue: string | fn.Fn
							}]
							Type: string | fn.Fn
						}]
					}
					RoleARN: string | fn.Fn
					S3Configuration: {
						BucketARN: string | fn.Fn
						BufferingHints: {
							IntervalInSeconds: int | fn.Fn
							SizeInMBs:         int | fn.Fn
						}
						CloudWatchLoggingOptions?: {
							Enabled?:       bool | fn.Fn
							LogGroupName?:  string | fn.Fn
							LogStreamName?: string | fn.Fn
						}
						CompressionFormat: string | fn.Fn
						EncryptionConfiguration?: {
							KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
							NoEncryptionConfig?: string | fn.Fn
						}
						ErrorOutputPrefix?: string | fn.Fn
						Prefix?:            string | fn.Fn
						RoleARN:            string | fn.Fn
					}
					Username: string | fn.Fn
				}
				S3DestinationConfiguration?: {
					BucketARN: string | fn.Fn
					BufferingHints: {
						IntervalInSeconds: int | fn.Fn
						SizeInMBs:         int | fn.Fn
					}
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					CompressionFormat: string | fn.Fn
					EncryptionConfiguration?: {
						KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
						NoEncryptionConfig?: string | fn.Fn
					}
					ErrorOutputPrefix?: string | fn.Fn
					Prefix?:            string | fn.Fn
					RoleARN:            string | fn.Fn
				}
				SplunkDestinationConfiguration?: {
					CloudWatchLoggingOptions?: {
						Enabled?:       bool | fn.Fn
						LogGroupName?:  string | fn.Fn
						LogStreamName?: string | fn.Fn
					}
					HECAcknowledgmentTimeoutInSeconds?: int | fn.Fn
					HECEndpoint:                        string | fn.Fn
					HECEndpointType:                    string | fn.Fn
					HECToken:                           string | fn.Fn
					ProcessingConfiguration?: {
						Enabled?: bool | fn.Fn
						Processors?: [...{
							Parameters: [...{
								ParameterName:  string | fn.Fn
								ParameterValue: string | fn.Fn
							}]
							Type: string | fn.Fn
						}]
					}
					RetryOptions?: DurationInSeconds: int | fn.Fn
					S3BackupMode?: string | fn.Fn
					S3Configuration: {
						BucketARN: string | fn.Fn
						BufferingHints: {
							IntervalInSeconds: int | fn.Fn
							SizeInMBs:         int | fn.Fn
						}
						CloudWatchLoggingOptions?: {
							Enabled?:       bool | fn.Fn
							LogGroupName?:  string | fn.Fn
							LogStreamName?: string | fn.Fn
						}
						CompressionFormat: string | fn.Fn
						EncryptionConfiguration?: {
							KMSEncryptionConfig?: AWSKMSKeyARN: string | fn.Fn
							NoEncryptionConfig?: string | fn.Fn
						}
						ErrorOutputPrefix?: string | fn.Fn
						Prefix?:            string | fn.Fn
						RoleARN:            string | fn.Fn
					}
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	LakeFormation :: {
		DataLakeSettings :: {
			Type: "AWS::LakeFormation::DataLakeSettings"
			Properties: Admins?: [...{
				DataLakePrincipalIdentifier?: string | fn.Fn
			}]
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Permissions :: {
			Type: "AWS::LakeFormation::Permissions"
			Properties: {
				DataLakePrincipal: DataLakePrincipalIdentifier?: string | fn.Fn
				Permissions?:                [...(string | fn.Fn)] | fn.Fn
				PermissionsWithGrantOption?: [...(string | fn.Fn)] | fn.Fn
				Resource: {
					DatabaseResource?: Name?: string | fn.Fn
					TableResource?: {
						DatabaseName?: string | fn.Fn
						Name?:         string | fn.Fn
					}
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Resource :: {
			Type: "AWS::LakeFormation::Resource"
			Properties: {
				ResourceArn:          string | fn.Fn
				RoleArn?:             string | fn.Fn
				UseServiceLinkedRole: bool | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Lambda :: {
		Alias :: {
			Type: "AWS::Lambda::Alias"
			Properties: {
				Description?:    string | fn.Fn
				FunctionName:    string | fn.Fn
				FunctionVersion: string | fn.Fn
				Name:            string | fn.Fn
				ProvisionedConcurrencyConfig?: ProvisionedConcurrentExecutions: int | fn.Fn
				RoutingConfig?: AdditionalVersionWeights: [...{
					FunctionVersion: string | fn.Fn
					FunctionWeight:  float | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EventInvokeConfig :: {
			Type: "AWS::Lambda::EventInvokeConfig"
			Properties: {
				DestinationConfig?: {
					OnFailure?: Destination: string | fn.Fn
					OnSuccess?: Destination: string | fn.Fn
				}
				FunctionName:              string | fn.Fn
				MaximumEventAgeInSeconds?: int | fn.Fn
				MaximumRetryAttempts?:     int | fn.Fn
				Qualifier:                 string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EventSourceMapping :: {
			Type: "AWS::Lambda::EventSourceMapping"
			Properties: {
				BatchSize?:                  (int & (>=1 & <=10000)) | fn.Fn
				BisectBatchOnFunctionError?: bool | fn.Fn
				DestinationConfig?: OnFailure: Destination: string | fn.Fn
				Enabled?:                        bool | fn.Fn
				EventSourceArn:                  string | fn.Fn
				FunctionName:                    string | fn.Fn
				MaximumBatchingWindowInSeconds?: int | fn.Fn
				MaximumRecordAgeInSeconds?:      int | fn.Fn
				MaximumRetryAttempts?:           int | fn.Fn
				ParallelizationFactor?:          int | fn.Fn
				StartingPosition?:               string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Function :: {
			Type: "AWS::Lambda::Function"
			Properties: {
				Code: {
					S3Bucket?:        string | fn.Fn
					S3Key?:           string | fn.Fn
					S3ObjectVersion?: string | fn.Fn
					ZipFile?:         string | fn.Fn
				}
				DeadLetterConfig?: TargetArn?: string | fn.Fn
				Description?: string | fn.Fn
				Environment?: Variables?: [string]: string | fn.Fn
				FunctionName?:                 string | fn.Fn
				Handler:                       string | fn.Fn
				KmsKeyArn?:                    string | fn.Fn
				Layers?:                       [...(string | fn.Fn)] | fn.Fn
				MemorySize?:                   (int & (>=128 & <=3008)) | fn.Fn
				ReservedConcurrentExecutions?: int | fn.Fn
				Role:                          (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
				Runtime:                       (string & ("dotnetcore1.0" | "dotnetcore2.0" | "dotnetcore2.1" | "go1.x" | "java8" | "java11" | "nodejs" | "nodejs4.3-edge" | "nodejs4.3" | "nodejs6.10" | "nodejs8.10" | "nodejs10.x" | "nodejs12.x" | "provided" | "python2.7" | "python3.6" | "python3.7" | "python3.8" | "ruby2.5")) | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Timeout?: (int & (>=1 & <=900)) | fn.Fn
				TracingConfig?: Mode?: string | fn.Fn
				VpcConfig?: {
					SecurityGroupIds: [...(string | fn.Fn)] | fn.Fn
					SubnetIds:        [...(string | fn.Fn)] | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LayerVersion :: {
			Type: "AWS::Lambda::LayerVersion"
			Properties: {
				CompatibleRuntimes?: [...(string | fn.Fn)] | fn.Fn
				Content: {
					S3Bucket:         string | fn.Fn
					S3Key:            string | fn.Fn
					S3ObjectVersion?: string | fn.Fn
				}
				Description?: string | fn.Fn
				LayerName?:   string | fn.Fn
				LicenseInfo?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LayerVersionPermission :: {
			Type: "AWS::Lambda::LayerVersionPermission"
			Properties: {
				Action:          string | fn.Fn
				LayerVersionArn: string | fn.Fn
				OrganizationId?: string | fn.Fn
				Principal:       string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Permission :: {
			Type: "AWS::Lambda::Permission"
			Properties: {
				Action:            string | fn.Fn
				EventSourceToken?: string | fn.Fn
				FunctionName:      string | fn.Fn
				Principal:         string | fn.Fn
				SourceAccount?:    string | fn.Fn
				SourceArn?:        string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Version :: {
			Type: "AWS::Lambda::Version"
			Properties: {
				CodeSha256?:  string | fn.Fn
				Description?: string | fn.Fn
				FunctionName: string | fn.Fn
				ProvisionedConcurrencyConfig?: ProvisionedConcurrentExecutions: int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Logs :: {
		Destination :: {
			Type: "AWS::Logs::Destination"
			Properties: {
				DestinationName:   string | fn.Fn
				DestinationPolicy: string | fn.Fn
				RoleArn:           string | fn.Fn
				TargetArn:         string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LogGroup :: {
			Type: "AWS::Logs::LogGroup"
			Properties: {
				LogGroupName?:    (string & (strings.MinRunes(1) & strings.MaxRunes(512))) | fn.Fn
				RetentionInDays?: (int & (1 | 3 | 5 | 7 | 14 | 30 | 60 | 90 | 120 | 150 | 180 | 365 | 400 | 545 | 731 | 1827 | 3653)) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LogStream :: {
			Type: "AWS::Logs::LogStream"
			Properties: {
				LogGroupName:   string | fn.Fn
				LogStreamName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		MetricFilter :: {
			Type: "AWS::Logs::MetricFilter"
			Properties: {
				FilterPattern: string | fn.Fn
				LogGroupName:  string | fn.Fn
				MetricTransformations: [...{
					DefaultValue?:   float | fn.Fn
					MetricName:      string | fn.Fn
					MetricNamespace: string | fn.Fn
					MetricValue:     string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SubscriptionFilter :: {
			Type: "AWS::Logs::SubscriptionFilter"
			Properties: {
				DestinationArn: string | fn.Fn
				FilterPattern:  string | fn.Fn
				LogGroupName:   string | fn.Fn
				RoleArn?:       string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	MSK :: {
		Cluster :: {
			Type: "AWS::MSK::Cluster"
			Properties: {
				BrokerNodeGroupInfo: {
					BrokerAZDistribution?: string | fn.Fn
					ClientSubnets:         [...(string | fn.Fn)] | fn.Fn
					InstanceType:          string | fn.Fn
					SecurityGroups?:       [...(string | fn.Fn)] | fn.Fn
					StorageInfo?: EBSStorageInfo?: VolumeSize?: int | fn.Fn
				}
				ClientAuthentication?: Tls?: CertificateAuthorityArnList?: [...(string | fn.Fn)] | fn.Fn
				ClusterName: string | fn.Fn
				ConfigurationInfo?: {
					Arn:      string | fn.Fn
					Revision: int | fn.Fn
				}
				EncryptionInfo?: {
					EncryptionAtRest?: DataVolumeKMSKeyId: string | fn.Fn
					EncryptionInTransit?: {
						ClientBroker?: string | fn.Fn
						InCluster?:    bool | fn.Fn
					}
				}
				EnhancedMonitoring?: string | fn.Fn
				KafkaVersion:        string | fn.Fn
				NumberOfBrokerNodes: int | fn.Fn
				Tags?:               {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	MediaConvert :: {
		JobTemplate :: {
			Type: "AWS::MediaConvert::JobTemplate"
			Properties: {
				AccelerationSettings?: Mode: string | fn.Fn
				Category?:    string | fn.Fn
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				Priority?:    int | fn.Fn
				Queue?:       string | fn.Fn
				SettingsJson: {
					[string]: _
				} | fn.Fn
				StatusUpdateInterval?: string | fn.Fn
				Tags?:                 {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Preset :: {
			Type: "AWS::MediaConvert::Preset"
			Properties: {
				Category?:    string | fn.Fn
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				SettingsJson: {
					[string]: _
				} | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Queue :: {
			Type: "AWS::MediaConvert::Queue"
			Properties: {
				Description?: string | fn.Fn
				Name?:        string | fn.Fn
				PricingPlan?: string | fn.Fn
				Status?:      string | fn.Fn
				Tags?:        {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	MediaLive :: {
		Channel :: {
			Type: "AWS::MediaLive::Channel"
			Properties: {
				ChannelClass?: string | fn.Fn
				Destinations?: [...{
					Id?: string | fn.Fn
					MediaPackageSettings?: [...{
						ChannelId?: string | fn.Fn
					}]
					Settings?: [...{
						PasswordParam?: string | fn.Fn
						StreamName?:    string | fn.Fn
						Url?:           string | fn.Fn
						Username?:      string | fn.Fn
					}]
				}]
				EncoderSettings?: {
					[string]: _
				} | fn.Fn
				InputAttachments?: [...{
					InputAttachmentName?: string | fn.Fn
					InputId?:             string | fn.Fn
					InputSettings?: {
						AudioSelectors?: [...{
							Name?: string | fn.Fn
							SelectorSettings?: {
								AudioLanguageSelection?: {
									LanguageCode?:            string | fn.Fn
									LanguageSelectionPolicy?: string | fn.Fn
								}
								AudioPidSelection?: Pid?: int | fn.Fn
							}
						}]
						CaptionSelectors?: [...{
							LanguageCode?: string | fn.Fn
							Name?:         string | fn.Fn
							SelectorSettings?: {
								AribSourceSettings?: {
								}
								DvbSubSourceSettings?: Pid?: int | fn.Fn
								EmbeddedSourceSettings?: {
									Convert608To708?:        string | fn.Fn
									Scte20Detection?:        string | fn.Fn
									Source608ChannelNumber?: int | fn.Fn
									Source608TrackNumber?:   int | fn.Fn
								}
								Scte20SourceSettings?: {
									Convert608To708?:        string | fn.Fn
									Source608ChannelNumber?: int | fn.Fn
								}
								Scte27SourceSettings?: Pid?:          int | fn.Fn
								TeletextSourceSettings?: PageNumber?: string | fn.Fn
							}
						}]
						DeblockFilter?:  string | fn.Fn
						DenoiseFilter?:  string | fn.Fn
						FilterStrength?: int | fn.Fn
						InputFilter?:    string | fn.Fn
						NetworkInputSettings?: {
							HlsInputSettings?: {
								Bandwidth?:      int | fn.Fn
								BufferSegments?: int | fn.Fn
								Retries?:        int | fn.Fn
								RetryInterval?:  int | fn.Fn
							}
							ServerValidation?: string | fn.Fn
						}
						SourceEndBehavior?: string | fn.Fn
						VideoSelector?: {
							ColorSpace?:      string | fn.Fn
							ColorSpaceUsage?: string | fn.Fn
							SelectorSettings?: {
								VideoSelectorPid?: Pid?:             int | fn.Fn
								VideoSelectorProgramId?: ProgramId?: int | fn.Fn
							}
						}
					}
				}]
				InputSpecification?: {
					Codec?:          string | fn.Fn
					MaximumBitrate?: string | fn.Fn
					Resolution?:     string | fn.Fn
				}
				LogLevel?: string | fn.Fn
				Name?:     string | fn.Fn
				RoleArn?:  string | fn.Fn
				Tags?:     {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Input :: {
			Type: "AWS::MediaLive::Input"
			Properties: {
				Destinations?: [...{
					StreamName?: string | fn.Fn
				}]
				InputSecurityGroups?: [...(string | fn.Fn)] | fn.Fn
				MediaConnectFlows?: [...{
					FlowArn?: string | fn.Fn
				}]
				Name?:    string | fn.Fn
				RoleArn?: string | fn.Fn
				Sources?: [...{
					PasswordParam?: string | fn.Fn
					Url?:           string | fn.Fn
					Username?:      string | fn.Fn
				}]
				Tags?: {
					[string]: _
				} | fn.Fn
				Type?: string | fn.Fn
				Vpc?: {
					SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
					SubnetIds?:        [...(string | fn.Fn)] | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		InputSecurityGroup :: {
			Type: "AWS::MediaLive::InputSecurityGroup"
			Properties: {
				Tags?: {
					[string]: _
				} | fn.Fn
				WhitelistRules?: [...{
					Cidr?: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	MediaStore :: {
		Container :: {
			Type: "AWS::MediaStore::Container"
			Properties: {
				AccessLoggingEnabled?: bool | fn.Fn
				ContainerName:         string | fn.Fn
				CorsPolicy?: [...{
					AllowedHeaders?: [...(string | fn.Fn)] | fn.Fn
					AllowedMethods?: [...(string | fn.Fn)] | fn.Fn
					AllowedOrigins?: [...(string | fn.Fn)] | fn.Fn
					ExposeHeaders?:  [...(string | fn.Fn)] | fn.Fn
					MaxAgeSeconds?:  int | fn.Fn
				}]
				LifecyclePolicy?: string | fn.Fn
				Policy?:          string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Neptune :: {
		DBCluster :: {
			Type: "AWS::Neptune::DBCluster"
			Properties: {
				AvailabilityZones?:           [...(string | fn.Fn)] | fn.Fn
				BackupRetentionPeriod?:       int | fn.Fn
				DBClusterIdentifier?:         string | fn.Fn
				DBClusterParameterGroupName?: string | fn.Fn
				DBSubnetGroupName?:           string | fn.Fn
				EnableCloudwatchLogsExports?: [...(string | fn.Fn)] | fn.Fn
				IamAuthEnabled?:              bool | fn.Fn
				KmsKeyId?:                    string | fn.Fn
				Port?:                        int | fn.Fn
				PreferredBackupWindow?:       string | fn.Fn
				PreferredMaintenanceWindow?:  string | fn.Fn
				SnapshotIdentifier?:          string | fn.Fn
				StorageEncrypted?:            bool | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcSecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
			UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
			Metadata?: [string]: _
		}
		DBClusterParameterGroup :: {
			Type: "AWS::Neptune::DBClusterParameterGroup"
			Properties: {
				Description: string | fn.Fn
				Family:      string | fn.Fn
				Name?:       string | fn.Fn
				Parameters:  {
					[string]: _
				} | fn.Fn
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
		DBInstance :: {
			Type: "AWS::Neptune::DBInstance"
			Properties: {
				AllowMajorVersionUpgrade?:   bool | fn.Fn
				AutoMinorVersionUpgrade?:    bool | fn.Fn
				AvailabilityZone?:           string | fn.Fn
				DBClusterIdentifier?:        string | fn.Fn
				DBInstanceClass:             (string & ("db.r4.2xlarge" | "db.r4.4xlarge" | "db.r4.8xlarge" | "db.r4.large" | "db.r4.xlarge" | "db.r5.12xl" | "db.r5.2xl" | "db.r5.4xl" | "db.r5.large" | "db.r5.xl")) | fn.Fn
				DBInstanceIdentifier?:       string | fn.Fn
				DBParameterGroupName?:       string | fn.Fn
				DBSnapshotIdentifier?:       string | fn.Fn
				DBSubnetGroupName?:          string | fn.Fn
				PreferredMaintenanceWindow?: string | fn.Fn
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
		DBParameterGroup :: {
			Type: "AWS::Neptune::DBParameterGroup"
			Properties: {
				Description: string | fn.Fn
				Family:      string | fn.Fn
				Name?:       string | fn.Fn
				Parameters:  {
					[string]: _
				} | fn.Fn
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
		DBSubnetGroup :: {
			Type: "AWS::Neptune::DBSubnetGroup"
			Properties: {
				DBSubnetGroupDescription: string | fn.Fn
				DBSubnetGroupName?:       string | fn.Fn
				SubnetIds:                [...(string | fn.Fn)] | fn.Fn
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
	}

	OpsWorks :: {
		App :: {
			Type: "AWS::OpsWorks::App"
			Properties: {
				AppSource?: {
					Password?: string | fn.Fn
					Revision?: string | fn.Fn
					SshKey?:   string | fn.Fn
					Type?:     string | fn.Fn
					Url?:      string | fn.Fn
					Username?: string | fn.Fn
				}
				Attributes?: [string]: string | fn.Fn
				DataSources?: [...{
					Arn?:          string | fn.Fn
					DatabaseName?: string | fn.Fn
					Type?:         string | fn.Fn
				}]
				Description?: string | fn.Fn
				Domains?:     [...(string | fn.Fn)] | fn.Fn
				EnableSsl?:   bool | fn.Fn
				Environment?: [...{
					Key:     string | fn.Fn
					Secure?: bool | fn.Fn
					Value:   string | fn.Fn
				}]
				Name:       string | fn.Fn
				Shortname?: string | fn.Fn
				SslConfiguration?: {
					Certificate?: string | fn.Fn
					Chain?:       string | fn.Fn
					PrivateKey?:  string | fn.Fn
				}
				StackId: string | fn.Fn
				Type:    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ElasticLoadBalancerAttachment :: {
			Type: "AWS::OpsWorks::ElasticLoadBalancerAttachment"
			Properties: {
				ElasticLoadBalancerName: string | fn.Fn
				LayerId:                 string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Instance :: {
			Type: "AWS::OpsWorks::Instance"
			Properties: {
				AgentVersion?:     string | fn.Fn
				AmiId?:            string | fn.Fn
				Architecture?:     string | fn.Fn
				AutoScalingType?:  string | fn.Fn
				AvailabilityZone?: string | fn.Fn
				BlockDeviceMappings?: [...{
					DeviceName?: string | fn.Fn
					Ebs?: {
						DeleteOnTermination?: bool | fn.Fn
						Iops?:                int | fn.Fn
						SnapshotId?:          string | fn.Fn
						VolumeSize?:          int | fn.Fn
						VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
					}
					NoDevice?:    string | fn.Fn
					VirtualName?: string | fn.Fn
				}]
				EbsOptimized?:         bool | fn.Fn
				ElasticIps?:           [...(string | fn.Fn)] | fn.Fn
				Hostname?:             string | fn.Fn
				InstallUpdatesOnBoot?: bool | fn.Fn
				InstanceType:          string | fn.Fn
				LayerIds:              [...(string | fn.Fn)] | fn.Fn
				Os?:                   string | fn.Fn
				RootDeviceType?:       string | fn.Fn
				SshKeyName?:           string | fn.Fn
				StackId:               string | fn.Fn
				SubnetId?:             string | fn.Fn
				Tenancy?:              string | fn.Fn
				TimeBasedAutoScaling?: {
					Friday?: [string]:    string | fn.Fn
					Monday?: [string]:    string | fn.Fn
					Saturday?: [string]:  string | fn.Fn
					Sunday?: [string]:    string | fn.Fn
					Thursday?: [string]:  string | fn.Fn
					Tuesday?: [string]:   string | fn.Fn
					Wednesday?: [string]: string | fn.Fn
				}
				VirtualizationType?: string | fn.Fn
				Volumes?:            [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Layer :: {
			Type: "AWS::OpsWorks::Layer"
			Properties: {
				Attributes?: [string]: string | fn.Fn
				AutoAssignElasticIps:      bool | fn.Fn
				AutoAssignPublicIps:       bool | fn.Fn
				CustomInstanceProfileArn?: string | fn.Fn
				CustomJson?:               {
					[string]: _
				} | fn.Fn
				CustomRecipes?: {
					Configure?: [...(string | fn.Fn)] | fn.Fn
					Deploy?:    [...(string | fn.Fn)] | fn.Fn
					Setup?:     [...(string | fn.Fn)] | fn.Fn
					Shutdown?:  [...(string | fn.Fn)] | fn.Fn
					Undeploy?:  [...(string | fn.Fn)] | fn.Fn
				}
				CustomSecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
				EnableAutoHealing:       bool | fn.Fn
				InstallUpdatesOnBoot?:   bool | fn.Fn
				LifecycleEventConfiguration?: ShutdownEventConfiguration?: {
					DelayUntilElbConnectionsDrained?: bool | fn.Fn
					ExecutionTimeout?:                int | fn.Fn
				}
				LoadBasedAutoScaling?: {
					DownScaling?: {
						CpuThreshold?:       float | fn.Fn
						IgnoreMetricsTime?:  int | fn.Fn
						InstanceCount?:      int | fn.Fn
						LoadThreshold?:      float | fn.Fn
						MemoryThreshold?:    float | fn.Fn
						ThresholdsWaitTime?: int | fn.Fn
					}
					Enable?: bool | fn.Fn
					UpScaling?: {
						CpuThreshold?:       float | fn.Fn
						IgnoreMetricsTime?:  int | fn.Fn
						InstanceCount?:      int | fn.Fn
						LoadThreshold?:      float | fn.Fn
						MemoryThreshold?:    float | fn.Fn
						ThresholdsWaitTime?: int | fn.Fn
					}
				}
				Name:      string | fn.Fn
				Packages?: [...(string | fn.Fn)] | fn.Fn
				Shortname: string | fn.Fn
				StackId:   string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Type:                      string | fn.Fn
				UseEbsOptimizedInstances?: bool | fn.Fn
				VolumeConfigurations?: [...{
					Encrypted?:     bool | fn.Fn
					Iops?:          int | fn.Fn
					MountPoint?:    string | fn.Fn
					NumberOfDisks?: int | fn.Fn
					RaidLevel?:     int | fn.Fn
					Size?:          int | fn.Fn
					VolumeType?:    (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Stack :: {
			Type: "AWS::OpsWorks::Stack"
			Properties: {
				AgentVersion?: string | fn.Fn
				Attributes?: [string]: string | fn.Fn
				ChefConfiguration?: {
					BerkshelfVersion?: string | fn.Fn
					ManageBerkshelf?:  bool | fn.Fn
				}
				CloneAppIds?:      [...(string | fn.Fn)] | fn.Fn
				ClonePermissions?: bool | fn.Fn
				ConfigurationManager?: {
					Name?:    string | fn.Fn
					Version?: string | fn.Fn
				}
				CustomCookbooksSource?: {
					Password?: string | fn.Fn
					Revision?: string | fn.Fn
					SshKey?:   string | fn.Fn
					Type?:     string | fn.Fn
					Url?:      string | fn.Fn
					Username?: string | fn.Fn
				}
				CustomJson?: {
					[string]: _
				} | fn.Fn
				DefaultAvailabilityZone?:  string | fn.Fn
				DefaultInstanceProfileArn: string | fn.Fn
				DefaultOs?:                string | fn.Fn
				DefaultRootDeviceType?:    string | fn.Fn
				DefaultSshKeyName?:        string | fn.Fn
				DefaultSubnetId?:          string | fn.Fn
				EcsClusterArn?:            string | fn.Fn
				ElasticIps?: [...{
					Ip:    string | fn.Fn
					Name?: string | fn.Fn
				}]
				HostnameTheme?: string | fn.Fn
				Name:           string | fn.Fn
				RdsDbInstances?: [...{
					DbPassword:       string | fn.Fn
					DbUser:           string | fn.Fn
					RdsDbInstanceArn: string | fn.Fn
				}]
				ServiceRoleArn: string | fn.Fn
				SourceStackId?: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				UseCustomCookbooks?:        bool | fn.Fn
				UseOpsworksSecurityGroups?: bool | fn.Fn
				VpcId?:                     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		UserProfile :: {
			Type: "AWS::OpsWorks::UserProfile"
			Properties: {
				AllowSelfManagement?: bool | fn.Fn
				IamUserArn:           string | fn.Fn
				SshPublicKey?:        string | fn.Fn
				SshUsername?:         string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Volume :: {
			Type: "AWS::OpsWorks::Volume"
			Properties: {
				Ec2VolumeId: string | fn.Fn
				MountPoint?: string | fn.Fn
				Name?:       string | fn.Fn
				StackId:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	OpsWorksCM :: {
		Server :: {
			Type: "AWS::OpsWorksCM::Server"
			Properties: {
				AssociatePublicIpAddress?: bool | fn.Fn
				BackupId?:                 string | fn.Fn
				BackupRetentionCount?:     int | fn.Fn
				CustomCertificate?:        string | fn.Fn
				CustomDomain?:             string | fn.Fn
				CustomPrivateKey?:         string | fn.Fn
				DisableAutomatedBackup?:   bool | fn.Fn
				Engine?:                   string | fn.Fn
				EngineAttributes?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				EngineModel?:                string | fn.Fn
				EngineVersion?:              string | fn.Fn
				InstanceProfileArn:          string | fn.Fn
				InstanceType:                string | fn.Fn
				KeyPair?:                    string | fn.Fn
				PreferredBackupWindow?:      string | fn.Fn
				PreferredMaintenanceWindow?: string | fn.Fn
				SecurityGroupIds?:           [...(string | fn.Fn)] | fn.Fn
				ServerName?:                 string | fn.Fn
				ServiceRoleArn:              string | fn.Fn
				SubnetIds?:                  [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Pinpoint :: {
		ADMChannel :: {
			Type: "AWS::Pinpoint::ADMChannel"
			Properties: {
				ApplicationId: string | fn.Fn
				ClientId:      string | fn.Fn
				ClientSecret:  string | fn.Fn
				Enabled?:      bool | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		APNSChannel :: {
			Type: "AWS::Pinpoint::APNSChannel"
			Properties: {
				ApplicationId:                string | fn.Fn
				BundleId?:                    string | fn.Fn
				Certificate?:                 string | fn.Fn
				DefaultAuthenticationMethod?: string | fn.Fn
				Enabled?:                     bool | fn.Fn
				PrivateKey?:                  string | fn.Fn
				TeamId?:                      string | fn.Fn
				TokenKey?:                    string | fn.Fn
				TokenKeyId?:                  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		APNSSandboxChannel :: {
			Type: "AWS::Pinpoint::APNSSandboxChannel"
			Properties: {
				ApplicationId:                string | fn.Fn
				BundleId?:                    string | fn.Fn
				Certificate?:                 string | fn.Fn
				DefaultAuthenticationMethod?: string | fn.Fn
				Enabled?:                     bool | fn.Fn
				PrivateKey?:                  string | fn.Fn
				TeamId?:                      string | fn.Fn
				TokenKey?:                    string | fn.Fn
				TokenKeyId?:                  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		APNSVoipChannel :: {
			Type: "AWS::Pinpoint::APNSVoipChannel"
			Properties: {
				ApplicationId:                string | fn.Fn
				BundleId?:                    string | fn.Fn
				Certificate?:                 string | fn.Fn
				DefaultAuthenticationMethod?: string | fn.Fn
				Enabled?:                     bool | fn.Fn
				PrivateKey?:                  string | fn.Fn
				TeamId?:                      string | fn.Fn
				TokenKey?:                    string | fn.Fn
				TokenKeyId?:                  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		APNSVoipSandboxChannel :: {
			Type: "AWS::Pinpoint::APNSVoipSandboxChannel"
			Properties: {
				ApplicationId:                string | fn.Fn
				BundleId?:                    string | fn.Fn
				Certificate?:                 string | fn.Fn
				DefaultAuthenticationMethod?: string | fn.Fn
				Enabled?:                     bool | fn.Fn
				PrivateKey?:                  string | fn.Fn
				TeamId?:                      string | fn.Fn
				TokenKey?:                    string | fn.Fn
				TokenKeyId?:                  string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		App :: {
			Type: "AWS::Pinpoint::App"
			Properties: {
				Name:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ApplicationSettings :: {
			Type: "AWS::Pinpoint::ApplicationSettings"
			Properties: {
				ApplicationId: string | fn.Fn
				CampaignHook?: {
					LambdaFunctionName?: string | fn.Fn
					Mode?:               string | fn.Fn
					WebUrl?:             string | fn.Fn
				}
				CloudWatchMetricsEnabled?: bool | fn.Fn
				Limits?: {
					Daily?:             int | fn.Fn
					MaximumDuration?:   int | fn.Fn
					MessagesPerSecond?: int | fn.Fn
					Total?:             int | fn.Fn
				}
				QuietTime?: {
					End:   string | fn.Fn
					Start: string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		BaiduChannel :: {
			Type: "AWS::Pinpoint::BaiduChannel"
			Properties: {
				ApiKey:        string | fn.Fn
				ApplicationId: string | fn.Fn
				Enabled?:      bool | fn.Fn
				SecretKey:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Campaign :: {
			Type: "AWS::Pinpoint::Campaign"
			Properties: {
				AdditionalTreatments?: [...{
					MessageConfiguration?: {
						ADMMessage?: {
							Action?:            string | fn.Fn
							Body?:              string | fn.Fn
							ImageIconUrl?:      string | fn.Fn
							ImageSmallIconUrl?: string | fn.Fn
							ImageUrl?:          string | fn.Fn
							JsonBody?:          string | fn.Fn
							MediaUrl?:          string | fn.Fn
							RawContent?:        string | fn.Fn
							SilentPush?:        bool | fn.Fn
							TimeToLive?:        int | fn.Fn
							Title?:             string | fn.Fn
							Url?:               string | fn.Fn
						}
						APNSMessage?: {
							Action?:            string | fn.Fn
							Body?:              string | fn.Fn
							ImageIconUrl?:      string | fn.Fn
							ImageSmallIconUrl?: string | fn.Fn
							ImageUrl?:          string | fn.Fn
							JsonBody?:          string | fn.Fn
							MediaUrl?:          string | fn.Fn
							RawContent?:        string | fn.Fn
							SilentPush?:        bool | fn.Fn
							TimeToLive?:        int | fn.Fn
							Title?:             string | fn.Fn
							Url?:               string | fn.Fn
						}
						BaiduMessage?: {
							Action?:            string | fn.Fn
							Body?:              string | fn.Fn
							ImageIconUrl?:      string | fn.Fn
							ImageSmallIconUrl?: string | fn.Fn
							ImageUrl?:          string | fn.Fn
							JsonBody?:          string | fn.Fn
							MediaUrl?:          string | fn.Fn
							RawContent?:        string | fn.Fn
							SilentPush?:        bool | fn.Fn
							TimeToLive?:        int | fn.Fn
							Title?:             string | fn.Fn
							Url?:               string | fn.Fn
						}
						DefaultMessage?: {
							Action?:            string | fn.Fn
							Body?:              string | fn.Fn
							ImageIconUrl?:      string | fn.Fn
							ImageSmallIconUrl?: string | fn.Fn
							ImageUrl?:          string | fn.Fn
							JsonBody?:          string | fn.Fn
							MediaUrl?:          string | fn.Fn
							RawContent?:        string | fn.Fn
							SilentPush?:        bool | fn.Fn
							TimeToLive?:        int | fn.Fn
							Title?:             string | fn.Fn
							Url?:               string | fn.Fn
						}
						EmailMessage?: {
							Body?:        string | fn.Fn
							FromAddress?: string | fn.Fn
							HtmlBody?:    string | fn.Fn
							Title?:       string | fn.Fn
						}
						GCMMessage?: {
							Action?:            string | fn.Fn
							Body?:              string | fn.Fn
							ImageIconUrl?:      string | fn.Fn
							ImageSmallIconUrl?: string | fn.Fn
							ImageUrl?:          string | fn.Fn
							JsonBody?:          string | fn.Fn
							MediaUrl?:          string | fn.Fn
							RawContent?:        string | fn.Fn
							SilentPush?:        bool | fn.Fn
							TimeToLive?:        int | fn.Fn
							Title?:             string | fn.Fn
							Url?:               string | fn.Fn
						}
						SMSMessage?: {
							Body?:        string | fn.Fn
							MessageType?: string | fn.Fn
							SenderId?:    string | fn.Fn
						}
					}
					Schedule?: {
						EndTime?: string | fn.Fn
						EventFilter?: {
							Dimensions?: {
								Attributes?: {
									[string]: _
								} | fn.Fn
								EventType?: {
									DimensionType?: string | fn.Fn
									Values?:        [...(string | fn.Fn)] | fn.Fn
								}
								Metrics?: {
									[string]: _
								} | fn.Fn
							}
							FilterType?: string | fn.Fn
						}
						Frequency?:   string | fn.Fn
						IsLocalTime?: bool | fn.Fn
						QuietTime?: {
							End:   string | fn.Fn
							Start: string | fn.Fn
						}
						StartTime?: string | fn.Fn
						TimeZone?:  string | fn.Fn
					}
					SizePercent?:          int | fn.Fn
					TreatmentDescription?: string | fn.Fn
					TreatmentName?:        string | fn.Fn
				}]
				ApplicationId: string | fn.Fn
				CampaignHook?: {
					LambdaFunctionName?: string | fn.Fn
					Mode?:               string | fn.Fn
					WebUrl?:             string | fn.Fn
				}
				Description?:    string | fn.Fn
				HoldoutPercent?: int | fn.Fn
				IsPaused?:       bool | fn.Fn
				Limits?: {
					Daily?:             int | fn.Fn
					MaximumDuration?:   int | fn.Fn
					MessagesPerSecond?: int | fn.Fn
					Total?:             int | fn.Fn
				}
				MessageConfiguration: {
					ADMMessage?: {
						Action?:            string | fn.Fn
						Body?:              string | fn.Fn
						ImageIconUrl?:      string | fn.Fn
						ImageSmallIconUrl?: string | fn.Fn
						ImageUrl?:          string | fn.Fn
						JsonBody?:          string | fn.Fn
						MediaUrl?:          string | fn.Fn
						RawContent?:        string | fn.Fn
						SilentPush?:        bool | fn.Fn
						TimeToLive?:        int | fn.Fn
						Title?:             string | fn.Fn
						Url?:               string | fn.Fn
					}
					APNSMessage?: {
						Action?:            string | fn.Fn
						Body?:              string | fn.Fn
						ImageIconUrl?:      string | fn.Fn
						ImageSmallIconUrl?: string | fn.Fn
						ImageUrl?:          string | fn.Fn
						JsonBody?:          string | fn.Fn
						MediaUrl?:          string | fn.Fn
						RawContent?:        string | fn.Fn
						SilentPush?:        bool | fn.Fn
						TimeToLive?:        int | fn.Fn
						Title?:             string | fn.Fn
						Url?:               string | fn.Fn
					}
					BaiduMessage?: {
						Action?:            string | fn.Fn
						Body?:              string | fn.Fn
						ImageIconUrl?:      string | fn.Fn
						ImageSmallIconUrl?: string | fn.Fn
						ImageUrl?:          string | fn.Fn
						JsonBody?:          string | fn.Fn
						MediaUrl?:          string | fn.Fn
						RawContent?:        string | fn.Fn
						SilentPush?:        bool | fn.Fn
						TimeToLive?:        int | fn.Fn
						Title?:             string | fn.Fn
						Url?:               string | fn.Fn
					}
					DefaultMessage?: {
						Action?:            string | fn.Fn
						Body?:              string | fn.Fn
						ImageIconUrl?:      string | fn.Fn
						ImageSmallIconUrl?: string | fn.Fn
						ImageUrl?:          string | fn.Fn
						JsonBody?:          string | fn.Fn
						MediaUrl?:          string | fn.Fn
						RawContent?:        string | fn.Fn
						SilentPush?:        bool | fn.Fn
						TimeToLive?:        int | fn.Fn
						Title?:             string | fn.Fn
						Url?:               string | fn.Fn
					}
					EmailMessage?: {
						Body?:        string | fn.Fn
						FromAddress?: string | fn.Fn
						HtmlBody?:    string | fn.Fn
						Title?:       string | fn.Fn
					}
					GCMMessage?: {
						Action?:            string | fn.Fn
						Body?:              string | fn.Fn
						ImageIconUrl?:      string | fn.Fn
						ImageSmallIconUrl?: string | fn.Fn
						ImageUrl?:          string | fn.Fn
						JsonBody?:          string | fn.Fn
						MediaUrl?:          string | fn.Fn
						RawContent?:        string | fn.Fn
						SilentPush?:        bool | fn.Fn
						TimeToLive?:        int | fn.Fn
						Title?:             string | fn.Fn
						Url?:               string | fn.Fn
					}
					SMSMessage?: {
						Body?:        string | fn.Fn
						MessageType?: string | fn.Fn
						SenderId?:    string | fn.Fn
					}
				}
				Name: string | fn.Fn
				Schedule: {
					EndTime?: string | fn.Fn
					EventFilter?: {
						Dimensions?: {
							Attributes?: {
								[string]: _
							} | fn.Fn
							EventType?: {
								DimensionType?: string | fn.Fn
								Values?:        [...(string | fn.Fn)] | fn.Fn
							}
							Metrics?: {
								[string]: _
							} | fn.Fn
						}
						FilterType?: string | fn.Fn
					}
					Frequency?:   string | fn.Fn
					IsLocalTime?: bool | fn.Fn
					QuietTime?: {
						End:   string | fn.Fn
						Start: string | fn.Fn
					}
					StartTime?: string | fn.Fn
					TimeZone?:  string | fn.Fn
				}
				SegmentId:       string | fn.Fn
				SegmentVersion?: int | fn.Fn
				Tags?:           {
					[string]: _
				} | fn.Fn
				TreatmentDescription?: string | fn.Fn
				TreatmentName?:        string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EmailChannel :: {
			Type: "AWS::Pinpoint::EmailChannel"
			Properties: {
				ApplicationId:     string | fn.Fn
				ConfigurationSet?: string | fn.Fn
				Enabled?:          bool | fn.Fn
				FromAddress:       string | fn.Fn
				Identity:          string | fn.Fn
				RoleArn?:          string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EmailTemplate :: {
			Type: "AWS::Pinpoint::EmailTemplate"
			Properties: {
				HtmlPart?: string | fn.Fn
				Subject:   string | fn.Fn
				Tags?:     {
					[string]: _
				} | fn.Fn
				TemplateName: string | fn.Fn
				TextPart?:    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		EventStream :: {
			Type: "AWS::Pinpoint::EventStream"
			Properties: {
				ApplicationId:        string | fn.Fn
				DestinationStreamArn: string | fn.Fn
				RoleArn:              string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		GCMChannel :: {
			Type: "AWS::Pinpoint::GCMChannel"
			Properties: {
				ApiKey:        string | fn.Fn
				ApplicationId: string | fn.Fn
				Enabled?:      bool | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		PushTemplate :: {
			Type: "AWS::Pinpoint::PushTemplate"
			Properties: {
				ADM?: {
					Action?:            string | fn.Fn
					Body?:              string | fn.Fn
					ImageIconUrl?:      string | fn.Fn
					ImageUrl?:          string | fn.Fn
					SmallImageIconUrl?: string | fn.Fn
					Sound?:             string | fn.Fn
					Title?:             string | fn.Fn
					Url?:               string | fn.Fn
				}
				APNS?: {
					Action?:   string | fn.Fn
					Body?:     string | fn.Fn
					MediaUrl?: string | fn.Fn
					Sound?:    string | fn.Fn
					Title?:    string | fn.Fn
					Url?:      string | fn.Fn
				}
				Baidu?: {
					Action?:            string | fn.Fn
					Body?:              string | fn.Fn
					ImageIconUrl?:      string | fn.Fn
					ImageUrl?:          string | fn.Fn
					SmallImageIconUrl?: string | fn.Fn
					Sound?:             string | fn.Fn
					Title?:             string | fn.Fn
					Url?:               string | fn.Fn
				}
				Default?: {
					Action?: string | fn.Fn
					Body?:   string | fn.Fn
					Sound?:  string | fn.Fn
					Title?:  string | fn.Fn
					Url?:    string | fn.Fn
				}
				GCM?: {
					Action?:            string | fn.Fn
					Body?:              string | fn.Fn
					ImageIconUrl?:      string | fn.Fn
					ImageUrl?:          string | fn.Fn
					SmallImageIconUrl?: string | fn.Fn
					Sound?:             string | fn.Fn
					Title?:             string | fn.Fn
					Url?:               string | fn.Fn
				}
				Tags?: {
					[string]: _
				} | fn.Fn
				TemplateName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SMSChannel :: {
			Type: "AWS::Pinpoint::SMSChannel"
			Properties: {
				ApplicationId: string | fn.Fn
				Enabled?:      bool | fn.Fn
				SenderId?:     string | fn.Fn
				ShortCode?:    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Segment :: {
			Type: "AWS::Pinpoint::Segment"
			Properties: {
				ApplicationId: string | fn.Fn
				Dimensions?: {
					Attributes?: {
						[string]: _
					} | fn.Fn
					Behavior?: Recency?: {
						Duration:    string | fn.Fn
						RecencyType: string | fn.Fn
					}
					Demographic?: {
						AppVersion?: {
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | fn.Fn
						}
						Channel?: {
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | fn.Fn
						}
						DeviceType?: {
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | fn.Fn
						}
						Make?: {
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | fn.Fn
						}
						Model?: {
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | fn.Fn
						}
						Platform?: {
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | fn.Fn
						}
					}
					Location?: {
						Country?: {
							DimensionType?: string | fn.Fn
							Values?:        [...(string | fn.Fn)] | fn.Fn
						}
						GPSPoint?: {
							Coordinates: {
								Latitude:  float | fn.Fn
								Longitude: float | fn.Fn
							}
							RangeInKilometers: float | fn.Fn
						}
					}
					Metrics?: {
						[string]: _
					} | fn.Fn
					UserAttributes?: {
						[string]: _
					} | fn.Fn
				}
				Name: string | fn.Fn
				SegmentGroups?: {
					Groups?: [...{
						Dimensions?: [...{
							Attributes?: {
								[string]: _
							} | fn.Fn
							Behavior?: Recency?: {
								Duration:    string | fn.Fn
								RecencyType: string | fn.Fn
							}
							Demographic?: {
								AppVersion?: {
									DimensionType?: string | fn.Fn
									Values?:        [...(string | fn.Fn)] | fn.Fn
								}
								Channel?: {
									DimensionType?: string | fn.Fn
									Values?:        [...(string | fn.Fn)] | fn.Fn
								}
								DeviceType?: {
									DimensionType?: string | fn.Fn
									Values?:        [...(string | fn.Fn)] | fn.Fn
								}
								Make?: {
									DimensionType?: string | fn.Fn
									Values?:        [...(string | fn.Fn)] | fn.Fn
								}
								Model?: {
									DimensionType?: string | fn.Fn
									Values?:        [...(string | fn.Fn)] | fn.Fn
								}
								Platform?: {
									DimensionType?: string | fn.Fn
									Values?:        [...(string | fn.Fn)] | fn.Fn
								}
							}
							Location?: {
								Country?: {
									DimensionType?: string | fn.Fn
									Values?:        [...(string | fn.Fn)] | fn.Fn
								}
								GPSPoint?: {
									Coordinates: {
										Latitude:  float | fn.Fn
										Longitude: float | fn.Fn
									}
									RangeInKilometers: float | fn.Fn
								}
							}
							Metrics?: {
								[string]: _
							} | fn.Fn
							UserAttributes?: {
								[string]: _
							} | fn.Fn
						}]
						SourceSegments?: [...{
							Id:       string | fn.Fn
							Version?: int | fn.Fn
						}]
						SourceType?: string | fn.Fn
						Type?:       string | fn.Fn
					}]
					Include?: string | fn.Fn
				}
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SmsTemplate :: {
			Type: "AWS::Pinpoint::SmsTemplate"
			Properties: {
				Body:  string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
				TemplateName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		VoiceChannel :: {
			Type: "AWS::Pinpoint::VoiceChannel"
			Properties: {
				ApplicationId: string | fn.Fn
				Enabled?:      bool | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	PinpointEmail :: {
		ConfigurationSet :: {
			Type: "AWS::PinpointEmail::ConfigurationSet"
			Properties: {
				DeliveryOptions?: SendingPoolName?: string | fn.Fn
				Name: string | fn.Fn
				ReputationOptions?: ReputationMetricsEnabled?: bool | fn.Fn
				SendingOptions?: SendingEnabled?:              bool | fn.Fn
				Tags?: [...{
					Key?:   string | fn.Fn
					Value?: string | fn.Fn
				}]
				TrackingOptions?: CustomRedirectDomain?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ConfigurationSetEventDestination :: {
			Type: "AWS::PinpointEmail::ConfigurationSetEventDestination"
			Properties: {
				ConfigurationSetName: string | fn.Fn
				EventDestination?: {
					CloudWatchDestination?: DimensionConfigurations?: [...{
						DefaultDimensionValue: string | fn.Fn
						DimensionName:         string | fn.Fn
						DimensionValueSource:  string | fn.Fn
					}]
					Enabled?: bool | fn.Fn
					KinesisFirehoseDestination?: {
						DeliveryStreamArn: string | fn.Fn
						IamRoleArn:        string | fn.Fn
					}
					MatchingEventTypes: [...(string | fn.Fn)] | fn.Fn
					PinpointDestination?: ApplicationArn?: string | fn.Fn
					SnsDestination?: TopicArn:             string | fn.Fn
				}
				EventDestinationName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Identity :: {
			Type: "AWS::PinpointEmail::Identity"
			Properties: {
				DkimSigningEnabled?:        bool | fn.Fn
				FeedbackForwardingEnabled?: bool | fn.Fn
				MailFromAttributes?: {
					BehaviorOnMxFailure?: string | fn.Fn
					MailFromDomain?:      string | fn.Fn
				}
				Name: string | fn.Fn
				Tags?: [...{
					Key?:   string | fn.Fn
					Value?: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	QLDB :: {
		Ledger :: {
			Type: "AWS::QLDB::Ledger"
			Properties: {
				DeletionProtection?: bool | fn.Fn
				Name?:               string | fn.Fn
				PermissionsMode:     string | fn.Fn
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
	}

	RAM :: {
		ResourceShare :: {
			Type: "AWS::RAM::ResourceShare"
			Properties: {
				AllowExternalPrincipals?: bool | fn.Fn
				Name:                     string | fn.Fn
				Principals?:              [...(string | fn.Fn)] | fn.Fn
				ResourceArns?:            [...(string | fn.Fn)] | fn.Fn
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
	}

	RDS :: {
		DBCluster :: {
			Type: "AWS::RDS::DBCluster"
			Properties: {
				AssociatedRoles?: [...{
					FeatureName?: string | fn.Fn
					RoleArn:      string | fn.Fn
				}]
				AvailabilityZones?:               [...(string | fn.Fn)] | fn.Fn
				BacktrackWindow?:                 int | fn.Fn
				BackupRetentionPeriod?:           (int & (>=1 & <=35)) | fn.Fn
				DBClusterIdentifier?:             string | fn.Fn
				DBClusterParameterGroupName?:     string | fn.Fn
				DBSubnetGroupName?:               string | fn.Fn
				DatabaseName?:                    string | fn.Fn
				DeletionProtection?:              bool | fn.Fn
				EnableCloudwatchLogsExports?:     [...(string | fn.Fn)] | fn.Fn
				EnableHttpEndpoint?:              bool | fn.Fn
				EnableIAMDatabaseAuthentication?: bool | fn.Fn
				Engine:                           string | fn.Fn
				EngineMode?:                      string | fn.Fn
				EngineVersion?:                   string | fn.Fn
				KmsKeyId?:                        string | fn.Fn
				MasterUserPassword?:              string | fn.Fn
				MasterUsername?:                  string | fn.Fn
				Port?:                            int | fn.Fn
				PreferredBackupWindow?:           string | fn.Fn
				PreferredMaintenanceWindow?:      string | fn.Fn
				ReplicationSourceIdentifier?:     string | fn.Fn
				RestoreType?:                     string | fn.Fn
				ScalingConfiguration?: {
					AutoPause?:             bool | fn.Fn
					MaxCapacity?:           int | fn.Fn
					MinCapacity?:           int | fn.Fn
					SecondsUntilAutoPause?: int | fn.Fn
				}
				SnapshotIdentifier?:        string | fn.Fn
				SourceDBClusterIdentifier?: string | fn.Fn
				SourceRegion?:              string | fn.Fn
				StorageEncrypted?:          bool | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				UseLatestRestorableTime?: bool | fn.Fn
				VpcSecurityGroupIds?:     [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
			UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
			Metadata?: [string]: _
		}
		DBClusterParameterGroup :: {
			Type: "AWS::RDS::DBClusterParameterGroup"
			Properties: {
				Description: string | fn.Fn
				Family:      string | fn.Fn
				Parameters:  {
					[string]: _
				} | fn.Fn
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
		DBInstance :: {
			Type: "AWS::RDS::DBInstance"
			Properties: {
				AllocatedStorage?:         string | fn.Fn
				AllowMajorVersionUpgrade?: bool | fn.Fn
				AssociatedRoles?: [...{
					FeatureName: string | fn.Fn
					RoleArn:     string | fn.Fn
				}]
				AutoMinorVersionUpgrade?:            bool | fn.Fn
				AvailabilityZone?:                   string | fn.Fn
				BackupRetentionPeriod?:              (int & (>=0 & <=35)) | fn.Fn
				CharacterSetName?:                   string | fn.Fn
				CopyTagsToSnapshot?:                 bool | fn.Fn
				DBClusterIdentifier?:                string | fn.Fn
				DBInstanceClass:                     string | fn.Fn
				DBInstanceIdentifier?:               string | fn.Fn
				DBName?:                             string | fn.Fn
				DBParameterGroupName?:               string | fn.Fn
				DBSecurityGroups?:                   [...(string | fn.Fn)] | fn.Fn
				DBSnapshotIdentifier?:               string | fn.Fn
				DBSubnetGroupName?:                  string | fn.Fn
				DeleteAutomatedBackups?:             bool | fn.Fn
				DeletionProtection?:                 bool | fn.Fn
				Domain?:                             string | fn.Fn
				DomainIAMRoleName?:                  string | fn.Fn
				EnableCloudwatchLogsExports?:        [...(string | fn.Fn)] | fn.Fn
				EnableIAMDatabaseAuthentication?:    bool | fn.Fn
				EnablePerformanceInsights?:          bool | fn.Fn
				Engine?:                             string | fn.Fn
				EngineVersion?:                      string | fn.Fn
				Iops?:                               int | fn.Fn
				KmsKeyId?:                           string | fn.Fn
				LicenseModel?:                       string | fn.Fn
				MasterUserPassword?:                 string | fn.Fn
				MasterUsername?:                     string | fn.Fn
				MonitoringInterval?:                 int | fn.Fn
				MonitoringRoleArn?:                  string | fn.Fn
				MultiAZ?:                            bool | fn.Fn
				OptionGroupName?:                    string | fn.Fn
				PerformanceInsightsKMSKeyId?:        string | fn.Fn
				PerformanceInsightsRetentionPeriod?: int | fn.Fn
				Port?:                               string | fn.Fn
				PreferredBackupWindow?:              string | fn.Fn
				PreferredMaintenanceWindow?:         string | fn.Fn
				ProcessorFeatures?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				PromotionTier?:              (int & (>=0 & <=15)) | fn.Fn
				PubliclyAccessible?:         bool | fn.Fn
				SourceDBInstanceIdentifier?: string | fn.Fn
				SourceRegion?:               string | fn.Fn
				StorageEncrypted?:           bool | fn.Fn
				StorageType?:                string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Timezone?:                    string | fn.Fn
				UseDefaultProcessorFeatures?: bool | fn.Fn
				VPCSecurityGroups?:           [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
			UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
			Metadata?: [string]: _
		}
		DBParameterGroup :: {
			Type: "AWS::RDS::DBParameterGroup"
			Properties: {
				Description: string | fn.Fn
				Family:      string | fn.Fn
				Parameters?: [string]: string | fn.Fn
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
		DBSecurityGroup :: {
			Type: "AWS::RDS::DBSecurityGroup"
			Properties: {
				DBSecurityGroupIngress: [...{
					CIDRIP?:                  string | fn.Fn
					EC2SecurityGroupId?:      string | fn.Fn
					EC2SecurityGroupName?:    string | fn.Fn
					EC2SecurityGroupOwnerId?: string | fn.Fn
				}]
				EC2VpcId?:        string | fn.Fn
				GroupDescription: string | fn.Fn
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
		DBSecurityGroupIngress :: {
			Type: "AWS::RDS::DBSecurityGroupIngress"
			Properties: {
				CIDRIP?:                  string | fn.Fn
				DBSecurityGroupName:      string | fn.Fn
				EC2SecurityGroupId?:      string | fn.Fn
				EC2SecurityGroupName?:    string | fn.Fn
				EC2SecurityGroupOwnerId?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		DBSubnetGroup :: {
			Type: "AWS::RDS::DBSubnetGroup"
			Properties: {
				DBSubnetGroupDescription: string | fn.Fn
				DBSubnetGroupName?:       string | fn.Fn
				SubnetIds:                [...(string | fn.Fn)] | fn.Fn
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
		EventSubscription :: {
			Type: "AWS::RDS::EventSubscription"
			Properties: {
				Enabled?:         bool | fn.Fn
				EventCategories?: [...(string | fn.Fn)] | fn.Fn
				SnsTopicArn:      string | fn.Fn
				SourceIds?:       [...(string | fn.Fn)] | fn.Fn
				SourceType?:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		OptionGroup :: {
			Type: "AWS::RDS::OptionGroup"
			Properties: {
				EngineName:         string | fn.Fn
				MajorEngineVersion: string | fn.Fn
				OptionConfigurations: [...{
					DBSecurityGroupMemberships?: [...(string | fn.Fn)] | fn.Fn
					OptionName:                  string | fn.Fn
					OptionSettings?: [...{
						Name?:  string | fn.Fn
						Value?: string | fn.Fn
					}]
					OptionVersion?:               string | fn.Fn
					Port?:                        int | fn.Fn
					VpcSecurityGroupMemberships?: [...(string | fn.Fn)] | fn.Fn
				}]
				OptionGroupDescription: string | fn.Fn
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
	}

	Redshift :: {
		Cluster :: {
			Type: "AWS::Redshift::Cluster"
			Properties: {
				AllowVersionUpgrade?:              bool | fn.Fn
				AutomatedSnapshotRetentionPeriod?: int | fn.Fn
				AvailabilityZone?:                 string | fn.Fn
				ClusterIdentifier?:                string | fn.Fn
				ClusterParameterGroupName?:        string | fn.Fn
				ClusterSecurityGroups?:            [...(string | fn.Fn)] | fn.Fn
				ClusterSubnetGroupName?:           string | fn.Fn
				ClusterType:                       (string & ("multi-node" | "single-node")) | fn.Fn
				ClusterVersion?:                   (string & ("1.0")) | fn.Fn
				DBName:                            string | fn.Fn
				ElasticIp?:                        string | fn.Fn
				Encrypted?:                        bool | fn.Fn
				HsmClientCertificateIdentifier?:   string | fn.Fn
				HsmConfigurationIdentifier?:       string | fn.Fn
				IamRoles?:                         [...(string | fn.Fn)] | fn.Fn
				KmsKeyId?:                         string | fn.Fn
				LoggingProperties?: {
					BucketName:   string | fn.Fn
					S3KeyPrefix?: string | fn.Fn
				}
				MasterUserPassword:          string | fn.Fn
				MasterUsername:              string | fn.Fn
				NodeType:                    (string & ("dc1.8xlarge" | "dc1.large" | "dc2.8xlarge" | "dc2.large" | "ds1.8xlarge" | "ds1.xlarge" | "ds2.8xlarge" | "ds2.xlarge")) | fn.Fn
				NumberOfNodes?:              (int & (>=1 & <=100)) | fn.Fn
				OwnerAccount?:               string | fn.Fn
				Port?:                       int | fn.Fn
				PreferredMaintenanceWindow?: string | fn.Fn
				PubliclyAccessible?:         bool | fn.Fn
				SnapshotClusterIdentifier?:  string | fn.Fn
				SnapshotIdentifier?:         string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcSecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
			UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
			Metadata?: [string]: _
		}
		ClusterParameterGroup :: {
			Type: "AWS::Redshift::ClusterParameterGroup"
			Properties: {
				Description:          string | fn.Fn
				ParameterGroupFamily: string | fn.Fn
				Parameters?: [...{
					ParameterName:  string | fn.Fn
					ParameterValue: string | fn.Fn
				}]
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
		ClusterSecurityGroup :: {
			Type: "AWS::Redshift::ClusterSecurityGroup"
			Properties: {
				Description: string | fn.Fn
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
		ClusterSecurityGroupIngress :: {
			Type: "AWS::Redshift::ClusterSecurityGroupIngress"
			Properties: {
				CIDRIP?:                  string | fn.Fn
				ClusterSecurityGroupName: string | fn.Fn
				EC2SecurityGroupName?:    string | fn.Fn
				EC2SecurityGroupOwnerId?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ClusterSubnetGroup :: {
			Type: "AWS::Redshift::ClusterSubnetGroup"
			Properties: {
				Description: string | fn.Fn
				SubnetIds:   [...(string | fn.Fn)] | fn.Fn
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
	}

	RoboMaker :: {
		Fleet :: {
			Type: "AWS::RoboMaker::Fleet"
			Properties: {
				Name?: string | fn.Fn
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Robot :: {
			Type: "AWS::RoboMaker::Robot"
			Properties: {
				Architecture:      string | fn.Fn
				Fleet?:            string | fn.Fn
				GreengrassGroupId: string | fn.Fn
				Name?:             string | fn.Fn
				Tags?:             {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RobotApplication :: {
			Type: "AWS::RoboMaker::RobotApplication"
			Properties: {
				CurrentRevisionId?: string | fn.Fn
				Name?:              string | fn.Fn
				RobotSoftwareSuite: {
					Name:    string | fn.Fn
					Version: string | fn.Fn
				}
				Sources: [...{
					Architecture: string | fn.Fn
					S3Bucket:     string | fn.Fn
					S3Key:        string | fn.Fn
				}]
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RobotApplicationVersion :: {
			Type: "AWS::RoboMaker::RobotApplicationVersion"
			Properties: {
				Application:        string | fn.Fn
				CurrentRevisionId?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SimulationApplication :: {
			Type: "AWS::RoboMaker::SimulationApplication"
			Properties: {
				CurrentRevisionId?: string | fn.Fn
				Name?:              string | fn.Fn
				RenderingEngine: {
					Name:    string | fn.Fn
					Version: string | fn.Fn
				}
				RobotSoftwareSuite: {
					Name:    string | fn.Fn
					Version: string | fn.Fn
				}
				SimulationSoftwareSuite: {
					Name:    string | fn.Fn
					Version: string | fn.Fn
				}
				Sources: [...{
					Architecture: string | fn.Fn
					S3Bucket:     string | fn.Fn
					S3Key:        string | fn.Fn
				}]
				Tags?: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SimulationApplicationVersion :: {
			Type: "AWS::RoboMaker::SimulationApplicationVersion"
			Properties: {
				Application:        string | fn.Fn
				CurrentRevisionId?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Route53 :: {
		HealthCheck :: {
			Type: "AWS::Route53::HealthCheck"
			Properties: {
				HealthCheckConfig: {
					AlarmIdentifier?: {
						Name:   string | fn.Fn
						Region: string | fn.Fn
					}
					ChildHealthChecks?:            [...(string | fn.Fn)] | fn.Fn
					EnableSNI?:                    bool | fn.Fn
					FailureThreshold?:             int | fn.Fn
					FullyQualifiedDomainName?:     string | fn.Fn
					HealthThreshold?:              int | fn.Fn
					IPAddress?:                    string | fn.Fn
					InsufficientDataHealthStatus?: (string & ("Healthy" | "LastKnownStatus" | "Unhealthy")) | fn.Fn
					Inverted?:                     bool | fn.Fn
					MeasureLatency?:               bool | fn.Fn
					Port?:                         int | fn.Fn
					Regions?:                      [...(string | fn.Fn)] | fn.Fn
					RequestInterval?:              int | fn.Fn
					ResourcePath?:                 string | fn.Fn
					SearchString?:                 string | fn.Fn
					Type:                          (string & ("CALCULATED" | "CLOUDWATCH_METRIC" | "HTTP_STR_MATCH" | "HTTP" | "HTTPS_STR_MATCH" | "HTTPS" | "TCP")) | fn.Fn
				}
				HealthCheckTags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		HostedZone :: {
			Type: "AWS::Route53::HostedZone"
			Properties: {
				HostedZoneConfig?: Comment?: string | fn.Fn
				HostedZoneTags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				Name: string | fn.Fn
				QueryLoggingConfig?: CloudWatchLogsLogGroupArn: string | fn.Fn
				VPCs?: [...{
					VPCId:     string | fn.Fn
					VPCRegion: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RecordSet :: {
			Type: "AWS::Route53::RecordSet"
			Properties: {
				AliasTarget?: {
					DNSName:               string | fn.Fn
					EvaluateTargetHealth?: bool | fn.Fn
					HostedZoneId:          string | fn.Fn
				}
				Comment?:  string | fn.Fn
				Failover?: (string & ("PRIMARY" | "SECONDARY")) | fn.Fn
				GeoLocation?: {
					ContinentCode?:   (string & ("AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA")) | fn.Fn
					CountryCode?:     string | fn.Fn
					SubdivisionCode?: string | fn.Fn
				}
				HealthCheckId?:    string | fn.Fn
				HostedZoneId?:     string | fn.Fn
				HostedZoneName?:   string | fn.Fn
				MultiValueAnswer?: bool | fn.Fn
				Name:              string | fn.Fn
				Region?:           string | fn.Fn
				ResourceRecords?:  [...(string | fn.Fn)] | fn.Fn
				SetIdentifier?:    string | fn.Fn
				TTL?:              string | fn.Fn
				Type:              (string & ("A" | "AAAA" | "CAA" | "CNAME" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT")) | fn.Fn
				Weight?:           int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RecordSetGroup :: {
			Type: "AWS::Route53::RecordSetGroup"
			Properties: {
				Comment?:        string | fn.Fn
				HostedZoneId?:   string | fn.Fn
				HostedZoneName?: string | fn.Fn
				RecordSets?: [...{
					AliasTarget?: {
						DNSName:               string | fn.Fn
						EvaluateTargetHealth?: bool | fn.Fn
						HostedZoneId:          string | fn.Fn
					}
					Comment?:  string | fn.Fn
					Failover?: (string & ("PRIMARY" | "SECONDARY")) | fn.Fn
					GeoLocation?: {
						ContinentCode?:   (string & ("AF" | "AN" | "AS" | "EU" | "NA" | "OC" | "SA")) | fn.Fn
						CountryCode?:     string | fn.Fn
						SubdivisionCode?: string | fn.Fn
					}
					HealthCheckId?:    string | fn.Fn
					HostedZoneId?:     string | fn.Fn
					HostedZoneName?:   string | fn.Fn
					MultiValueAnswer?: bool | fn.Fn
					Name:              string | fn.Fn
					Region?:           string | fn.Fn
					ResourceRecords?:  [...(string | fn.Fn)] | fn.Fn
					SetIdentifier?:    string | fn.Fn
					TTL?:              string | fn.Fn
					Type:              (string & ("A" | "AAAA" | "CAA" | "CNAME" | "MX" | "NAPTR" | "NS" | "PTR" | "SOA" | "SPF" | "SRV" | "TXT")) | fn.Fn
					Weight?:           int | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	Route53Resolver :: {
		ResolverEndpoint :: {
			Type: "AWS::Route53Resolver::ResolverEndpoint"
			Properties: {
				Direction: (string & ("INBOUND" | "OUTBOUND")) | fn.Fn
				IpAddresses: [...{
					Ip?:      string | fn.Fn
					SubnetId: string | fn.Fn
				}]
				Name?:            string | fn.Fn
				SecurityGroupIds: [...(string | fn.Fn)] | fn.Fn
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
		ResolverRule :: {
			Type: "AWS::Route53Resolver::ResolverRule"
			Properties: {
				DomainName:          string | fn.Fn
				Name?:               string | fn.Fn
				ResolverEndpointId?: string | fn.Fn
				RuleType:            (string & ("FORWARD" | "RECURSIVE" | "SYSTEM")) | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TargetIps?: [...{
					Ip:    string | fn.Fn
					Port?: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ResolverRuleAssociation :: {
			Type: "AWS::Route53Resolver::ResolverRuleAssociation"
			Properties: {
				Name?:          string | fn.Fn
				ResolverRuleId: string | fn.Fn
				VPCId:          string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	S3 :: {
		Bucket :: {
			Type: "AWS::S3::Bucket"
			Properties: {
				AccelerateConfiguration?: AccelerationStatus: (string & ("Enabled" | "Suspended")) | fn.Fn
				AccessControl?: (string & ("AuthenticatedRead" | "AwsExecRead" | "BucketOwnerFullControl" | "BucketOwnerRead" | "LogDeliveryWrite" | "Private" | "PublicRead" | "PublicReadWrite")) | fn.Fn
				AnalyticsConfigurations?: [...{
					Id:      string | fn.Fn
					Prefix?: string | fn.Fn
					StorageClassAnalysis: DataExport?: {
						Destination: {
							BucketAccountId?: string | fn.Fn
							BucketArn:        string | fn.Fn
							Format:           string | fn.Fn
							Prefix?:          string | fn.Fn
						}
						OutputSchemaVersion: string | fn.Fn
					}
					TagFilters?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				BucketEncryption?: ServerSideEncryptionConfiguration: [...{
					ServerSideEncryptionByDefault?: {
						KMSMasterKeyID?: string | fn.Fn
						SSEAlgorithm:    (string & ("AES256" | "aws:kms")) | fn.Fn
					}
				}]
				BucketName?: (string & (strings.MinRunes(3) & strings.MaxRunes(63)) & (=~#"^[a-z0-9][a-z0-9.-]*[a-z0-9]$"#)) | fn.Fn
				CorsConfiguration?: CorsRules: [...{
					AllowedHeaders?: [...(string | fn.Fn)] | fn.Fn
					AllowedMethods:  [...(string | fn.Fn)] | fn.Fn
					AllowedOrigins:  [...(string | fn.Fn)] | fn.Fn
					ExposedHeaders?: [...(string | fn.Fn)] | fn.Fn
					Id?:             string | fn.Fn
					MaxAge?:         int | fn.Fn
				}]
				InventoryConfigurations?: [...{
					Destination: {
						BucketAccountId?: string | fn.Fn
						BucketArn:        string | fn.Fn
						Format:           string | fn.Fn
						Prefix?:          string | fn.Fn
					}
					Enabled:                bool | fn.Fn
					Id:                     string | fn.Fn
					IncludedObjectVersions: string | fn.Fn
					OptionalFields?:        [...(string | fn.Fn)] | fn.Fn
					Prefix?:                string | fn.Fn
					ScheduleFrequency:      string | fn.Fn
				}]
				LifecycleConfiguration?: Rules: [...{
					AbortIncompleteMultipartUpload?: DaysAfterInitiation: int | fn.Fn
					ExpirationDate?:                    time.Time | fn.Fn
					ExpirationInDays?:                  int | fn.Fn
					Id?:                                string | fn.Fn
					NoncurrentVersionExpirationInDays?: int | fn.Fn
					NoncurrentVersionTransition?: {
						StorageClass:     string | fn.Fn
						TransitionInDays: int | fn.Fn
					}
					NoncurrentVersionTransitions?: [...{
						StorageClass:     string | fn.Fn
						TransitionInDays: int | fn.Fn
					}]
					Prefix?: string | fn.Fn
					Status:  string | fn.Fn
					TagFilters?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
					Transition?: {
						StorageClass:      string | fn.Fn
						TransitionDate?:   time.Time | fn.Fn
						TransitionInDays?: int | fn.Fn
					}
					Transitions?: [...{
						StorageClass:      string | fn.Fn
						TransitionDate?:   time.Time | fn.Fn
						TransitionInDays?: int | fn.Fn
					}]
				}]
				LoggingConfiguration?: {
					DestinationBucketName?: string | fn.Fn
					LogFilePrefix?:         string | fn.Fn
				}
				MetricsConfigurations?: [...{
					Id:      string | fn.Fn
					Prefix?: string | fn.Fn
					TagFilters?: [...{
						Key:   string | fn.Fn
						Value: string | fn.Fn
					}]
				}]
				NotificationConfiguration?: {
					LambdaConfigurations?: [...{
						Event: string | fn.Fn
						Filter?: S3Key: Rules: [...{
							Name:  string | fn.Fn
							Value: string | fn.Fn
						}]
						Function: string | fn.Fn
					}]
					QueueConfigurations?: [...{
						Event: string | fn.Fn
						Filter?: S3Key: Rules: [...{
							Name:  string | fn.Fn
							Value: string | fn.Fn
						}]
						Queue: string | fn.Fn
					}]
					TopicConfigurations?: [...{
						Event: (string & ("s3:ObjectCreated:*" | "s3:ObjectCreated:CompleteMultipartUpload" | "s3:ObjectCreated:Copy" | "s3:ObjectCreated:Post" | "s3:ObjectCreated:Put" | "s3:ObjectRemoved:*" | "s3:ObjectRemoved:Delete" | "s3:ObjectRemoved:DeleteMarkerCreated" | "s3:ObjectRestore:Completed" | "s3:ObjectRestore:Post" | "s3:ReducedRedundancyLostObject")) | fn.Fn
						Filter?: S3Key: Rules: [...{
							Name:  string | fn.Fn
							Value: string | fn.Fn
						}]
						Topic: string | fn.Fn
					}]
				}
				ObjectLockConfiguration?: {
					ObjectLockEnabled?: string | fn.Fn
					Rule?: DefaultRetention?: {
						Days?:  int | fn.Fn
						Mode?:  string | fn.Fn
						Years?: int | fn.Fn
					}
				}
				ObjectLockEnabled?: bool | fn.Fn
				PublicAccessBlockConfiguration?: {
					BlockPublicAcls?:       bool | fn.Fn
					BlockPublicPolicy?:     bool | fn.Fn
					IgnorePublicAcls?:      bool | fn.Fn
					RestrictPublicBuckets?: bool | fn.Fn
				}
				ReplicationConfiguration?: {
					Role: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
					Rules: [...{
						Destination: {
							AccessControlTranslation?: Owner: string | fn.Fn
							Account?: string | fn.Fn
							Bucket:   string | fn.Fn
							EncryptionConfiguration?: ReplicaKmsKeyID: string | fn.Fn
							StorageClass?: string | fn.Fn
						}
						Id?:    string | fn.Fn
						Prefix: string | fn.Fn
						SourceSelectionCriteria?: SseKmsEncryptedObjects: Status: string | fn.Fn
						Status: string | fn.Fn
					}]
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VersioningConfiguration?: Status: (string & ("Enabled" | "Suspended")) | fn.Fn
				WebsiteConfiguration?: {
					ErrorDocument?: string | fn.Fn
					IndexDocument?: string | fn.Fn
					RedirectAllRequestsTo?: {
						HostName:  string | fn.Fn
						Protocol?: (string & ("http" | "https")) | fn.Fn
					}
					RoutingRules?: [...{
						RedirectRule: {
							HostName?:             string | fn.Fn
							HttpRedirectCode?:     string | fn.Fn
							Protocol?:             string | fn.Fn
							ReplaceKeyPrefixWith?: string | fn.Fn
							ReplaceKeyWith?:       string | fn.Fn
						}
						RoutingRuleCondition?: {
							HttpErrorCodeReturnedEquals?: string | fn.Fn
							KeyPrefixEquals?:             string | fn.Fn
						}
					}]
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		BucketPolicy :: {
			Type: "AWS::S3::BucketPolicy"
			Properties: {
				Bucket:         string | fn.Fn
				PolicyDocument: {
					[string]: _
				} | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	SDB :: {
		Domain :: {
			Type: "AWS::SDB::Domain"
			Properties: Description?: string | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	SES :: {
		ConfigurationSet :: {
			Type: "AWS::SES::ConfigurationSet"
			Properties: Name?: string | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ConfigurationSetEventDestination :: {
			Type: "AWS::SES::ConfigurationSetEventDestination"
			Properties: {
				ConfigurationSetName: string | fn.Fn
				EventDestination: {
					CloudWatchDestination?: DimensionConfigurations?: [...{
						DefaultDimensionValue: string | fn.Fn
						DimensionName:         string | fn.Fn
						DimensionValueSource:  string | fn.Fn
					}]
					Enabled?: bool | fn.Fn
					KinesisFirehoseDestination?: {
						DeliveryStreamARN: string | fn.Fn
						IAMRoleARN:        string | fn.Fn
					}
					MatchingEventTypes: [...(string | fn.Fn)] | fn.Fn
					Name?:              string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ReceiptFilter :: {
			Type: "AWS::SES::ReceiptFilter"
			Properties: Filter: {
				IpFilter: {
					Cidr:   string | fn.Fn
					Policy: string | fn.Fn
				}
				Name?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ReceiptRule :: {
			Type: "AWS::SES::ReceiptRule"
			Properties: {
				After?: string | fn.Fn
				Rule: {
					Actions?: [...{
						AddHeaderAction?: {
							HeaderName:  string | fn.Fn
							HeaderValue: string | fn.Fn
						}
						BounceAction?: {
							Message:       string | fn.Fn
							Sender:        string | fn.Fn
							SmtpReplyCode: string | fn.Fn
							StatusCode?:   string | fn.Fn
							TopicArn?:     string | fn.Fn
						}
						LambdaAction?: {
							FunctionArn:     string | fn.Fn
							InvocationType?: string | fn.Fn
							TopicArn?:       string | fn.Fn
						}
						S3Action?: {
							BucketName:       string | fn.Fn
							KmsKeyArn?:       string | fn.Fn
							ObjectKeyPrefix?: string | fn.Fn
							TopicArn?:        string | fn.Fn
						}
						SNSAction?: {
							Encoding?: string | fn.Fn
							TopicArn?: string | fn.Fn
						}
						StopAction?: {
							Scope:     string | fn.Fn
							TopicArn?: string | fn.Fn
						}
						WorkmailAction?: {
							OrganizationArn: string | fn.Fn
							TopicArn?:       string | fn.Fn
						}
					}]
					Enabled?:     bool | fn.Fn
					Name?:        string | fn.Fn
					Recipients?:  [...(string | fn.Fn)] | fn.Fn
					ScanEnabled?: bool | fn.Fn
					TlsPolicy?:   (string & ("Optional" | "Require")) | fn.Fn
				}
				RuleSetName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ReceiptRuleSet :: {
			Type: "AWS::SES::ReceiptRuleSet"
			Properties: RuleSetName?: string | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Template :: {
			Type: "AWS::SES::Template"
			Properties: Template?: {
				HtmlPart?:     string | fn.Fn
				SubjectPart?:  string | fn.Fn
				TemplateName?: string | fn.Fn
				TextPart?:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	SNS :: {
		Subscription :: {
			Type: "AWS::SNS::Subscription"
			Properties: {
				DeliveryPolicy?: {
					[string]: _
				} | fn.Fn
				Endpoint?:     string | fn.Fn
				FilterPolicy?: {
					[string]: _
				} | fn.Fn
				Protocol:            (string & ("application" | "email-json" | "email" | "http" | "https" | "lambda" | "sms" | "sqs")) | fn.Fn
				RawMessageDelivery?: bool | fn.Fn
				RedrivePolicy?:      {
					[string]: _
				} | fn.Fn
				Region?:  string | fn.Fn
				TopicArn: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Topic :: {
			Type: "AWS::SNS::Topic"
			Properties: {
				DisplayName?:    string | fn.Fn
				KmsMasterKeyId?: string | fn.Fn
				Subscription?: [...{
					Endpoint: string | fn.Fn
					Protocol: string | fn.Fn
				}]
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				TopicName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TopicPolicy :: {
			Type: "AWS::SNS::TopicPolicy"
			Properties: {
				PolicyDocument: {
					[string]: _
				} | fn.Fn
				Topics: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	SQS :: {
		Queue :: {
			Type: "AWS::SQS::Queue"
			Properties: {
				ContentBasedDeduplication?:     bool | fn.Fn
				DelaySeconds?:                  (int & (>=0 & <=900)) | fn.Fn
				FifoQueue?:                     bool | fn.Fn
				KmsDataKeyReusePeriodSeconds?:  (int & (>=60 & <=86400)) | fn.Fn
				KmsMasterKeyId?:                string | fn.Fn
				MaximumMessageSize?:            (int & (>=1024 & <=262144)) | fn.Fn
				MessageRetentionPeriod?:        (int & (>=60 & <=1209600)) | fn.Fn
				QueueName?:                     string | fn.Fn
				ReceiveMessageWaitTimeSeconds?: (int & (>=0 & <=20)) | fn.Fn
				RedrivePolicy?:                 {
					[string]: _
				} | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VisibilityTimeout?: (int & (>=0 & <=43200)) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		QueuePolicy :: {
			Type: "AWS::SQS::QueuePolicy"
			Properties: {
				PolicyDocument: {
					[string]: _
				} | fn.Fn
				Queues: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	SSM :: {
		Association :: {
			Type: "AWS::SSM::Association"
			Properties: {
				AssociationName?: string | fn.Fn
				DocumentVersion?: string | fn.Fn
				InstanceId?:      string | fn.Fn
				Name:             string | fn.Fn
				OutputLocation?: S3Location?: {
					OutputS3BucketName?: string | fn.Fn
					OutputS3KeyPrefix?:  string | fn.Fn
				}
				Parameters?: [string]: ParameterValues: [...(string | fn.Fn)] | fn.Fn
				ScheduleExpression?: string | fn.Fn
				Targets?: [...{
					Key:    string | fn.Fn
					Values: [...(string | fn.Fn)] | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Document :: {
			Type: "AWS::SSM::Document"
			Properties: {
				Content: {
					[string]: _
				} | fn.Fn
				DocumentType?: string | fn.Fn
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
		MaintenanceWindow :: {
			Type: "AWS::SSM::MaintenanceWindow"
			Properties: {
				AllowUnassociatedTargets: bool | fn.Fn
				Cutoff:                   (int & (>=0 & <=23)) | fn.Fn
				Description?:             string | fn.Fn
				Duration:                 (int & (>=1 & <=24)) | fn.Fn
				EndDate?:                 string | fn.Fn
				Name:                     string | fn.Fn
				Schedule:                 string | fn.Fn
				ScheduleTimezone?:        string | fn.Fn
				StartDate?:               string | fn.Fn
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
		MaintenanceWindowTarget :: {
			Type: "AWS::SSM::MaintenanceWindowTarget"
			Properties: {
				Description?:      string | fn.Fn
				Name?:             string | fn.Fn
				OwnerInformation?: string | fn.Fn
				ResourceType:      string | fn.Fn
				Targets: [...{
					Key:     string | fn.Fn
					Values?: [...(string | fn.Fn)] | fn.Fn
				}]
				WindowId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		MaintenanceWindowTask :: {
			Type: "AWS::SSM::MaintenanceWindowTask"
			Properties: {
				Description?: string | fn.Fn
				LoggingInfo?: {
					Region:    string | fn.Fn
					S3Bucket:  string | fn.Fn
					S3Prefix?: string | fn.Fn
				}
				MaxConcurrency:  string | fn.Fn
				MaxErrors:       string | fn.Fn
				Name?:           string | fn.Fn
				Priority:        int | fn.Fn
				ServiceRoleArn?: string | fn.Fn
				Targets: [...{
					Key:     string | fn.Fn
					Values?: [...(string | fn.Fn)] | fn.Fn
				}]
				TaskArn: string | fn.Fn
				TaskInvocationParameters?: {
					MaintenanceWindowAutomationParameters?: {
						DocumentVersion?: string | fn.Fn
						Parameters?:      {
							[string]: _
						} | fn.Fn
					}
					MaintenanceWindowLambdaParameters?: {
						ClientContext?: string | fn.Fn
						Payload?:       string | fn.Fn
						Qualifier?:     string | fn.Fn
					}
					MaintenanceWindowRunCommandParameters?: {
						Comment?:          string | fn.Fn
						DocumentHash?:     string | fn.Fn
						DocumentHashType?: string | fn.Fn
						NotificationConfig?: {
							NotificationArn:     string | fn.Fn
							NotificationEvents?: [...(string | fn.Fn)] | fn.Fn
							NotificationType?:   string | fn.Fn
						}
						OutputS3BucketName?: string | fn.Fn
						OutputS3KeyPrefix?:  string | fn.Fn
						Parameters?:         {
							[string]: _
						} | fn.Fn
						ServiceRoleArn?: string | fn.Fn
						TimeoutSeconds?: int | fn.Fn
					}
					MaintenanceWindowStepFunctionsParameters?: {
						Input?: string | fn.Fn
						Name?:  string | fn.Fn
					}
				}
				TaskParameters?: {
					[string]: _
				} | fn.Fn
				TaskType: string | fn.Fn
				WindowId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Parameter :: {
			Type: "AWS::SSM::Parameter"
			Properties: {
				AllowedPattern?: string | fn.Fn
				Description?:    string | fn.Fn
				Name?:           string | fn.Fn
				Policies?:       string | fn.Fn
				Tags?:           {
					[string]: _
				} | fn.Fn
				Tier?: string | fn.Fn
				Type:  string | fn.Fn
				Value: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		PatchBaseline :: {
			Type: "AWS::SSM::PatchBaseline"
			Properties: {
				ApprovalRules?: PatchRules?: [...{
					ApproveAfterDays?:  int | fn.Fn
					ComplianceLevel?:   string | fn.Fn
					EnableNonSecurity?: bool | fn.Fn
					PatchFilterGroup?: PatchFilters?: [...{
						Key?:    string | fn.Fn
						Values?: [...(string | fn.Fn)] | fn.Fn
					}]
				}]
				ApprovedPatches?:                  [...(string | fn.Fn)] | fn.Fn
				ApprovedPatchesComplianceLevel?:   string | fn.Fn
				ApprovedPatchesEnableNonSecurity?: bool | fn.Fn
				Description?:                      string | fn.Fn
				GlobalFilters?: PatchFilters?: [...{
					Key?:    string | fn.Fn
					Values?: [...(string | fn.Fn)] | fn.Fn
				}]
				Name:                   string | fn.Fn
				OperatingSystem?:       string | fn.Fn
				PatchGroups?:           [...(string | fn.Fn)] | fn.Fn
				RejectedPatches?:       [...(string | fn.Fn)] | fn.Fn
				RejectedPatchesAction?: string | fn.Fn
				Sources?: [...{
					Configuration?: string | fn.Fn
					Name?:          string | fn.Fn
					Products?:      [...(string | fn.Fn)] | fn.Fn
				}]
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
		ResourceDataSync :: {
			Type: "AWS::SSM::ResourceDataSync"
			Properties: {
				BucketName:    string | fn.Fn
				BucketPrefix?: string | fn.Fn
				BucketRegion:  string | fn.Fn
				KMSKeyArn?:    string | fn.Fn
				SyncFormat:    string | fn.Fn
				SyncName:      string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	SageMaker :: {
		CodeRepository :: {
			Type: "AWS::SageMaker::CodeRepository"
			Properties: {
				CodeRepositoryName?: string | fn.Fn
				GitConfig: {
					Branch?:       string | fn.Fn
					RepositoryUrl: string | fn.Fn
					SecretArn?:    string | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Endpoint :: {
			Type: "AWS::SageMaker::Endpoint"
			Properties: {
				EndpointConfigName: string | fn.Fn
				EndpointName?:      string | fn.Fn
				ExcludeRetainedVariantProperties?: [...{
					VariantPropertyType?: string | fn.Fn
				}]
				RetainAllVariantProperties?: bool | fn.Fn
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
		EndpointConfig :: {
			Type: "AWS::SageMaker::EndpointConfig"
			Properties: {
				EndpointConfigName?: string | fn.Fn
				KmsKeyId?:           string | fn.Fn
				ProductionVariants: [...{
					AcceleratorType?:     string | fn.Fn
					InitialInstanceCount: int | fn.Fn
					InitialVariantWeight: float | fn.Fn
					InstanceType:         string | fn.Fn
					ModelName:            string | fn.Fn
					VariantName:          string | fn.Fn
				}]
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
		Model :: {
			Type: "AWS::SageMaker::Model"
			Properties: {
				Containers?: [...{
					ContainerHostname?: string | fn.Fn
					Environment?:       {
						[string]: _
					} | fn.Fn
					Image:         string | fn.Fn
					ModelDataUrl?: string | fn.Fn
				}]
				ExecutionRoleArn: string | fn.Fn
				ModelName?:       string | fn.Fn
				PrimaryContainer?: {
					ContainerHostname?: string | fn.Fn
					Environment?:       {
						[string]: _
					} | fn.Fn
					Image:         string | fn.Fn
					ModelDataUrl?: string | fn.Fn
				}
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VpcConfig?: {
					SecurityGroupIds: [...(string | fn.Fn)] | fn.Fn
					Subnets:          [...(string | fn.Fn)] | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		NotebookInstance :: {
			Type: "AWS::SageMaker::NotebookInstance"
			Properties: {
				AcceleratorTypes?:           [...(string | fn.Fn)] | fn.Fn
				AdditionalCodeRepositories?: [...(string | fn.Fn)] | fn.Fn
				DefaultCodeRepository?:      string | fn.Fn
				DirectInternetAccess?:       string | fn.Fn
				InstanceType:                string | fn.Fn
				KmsKeyId?:                   string | fn.Fn
				LifecycleConfigName?:        string | fn.Fn
				NotebookInstanceName?:       string | fn.Fn
				RoleArn:                     string | fn.Fn
				RootAccess?:                 string | fn.Fn
				SecurityGroupIds?:           [...(string | fn.Fn)] | fn.Fn
				SubnetId?:                   string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VolumeSizeInGB?: (int & (>=5 & <=16384)) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		NotebookInstanceLifecycleConfig :: {
			Type: "AWS::SageMaker::NotebookInstanceLifecycleConfig"
			Properties: {
				NotebookInstanceLifecycleConfigName?: string | fn.Fn
				OnCreate?: [...{
					Content?: string | fn.Fn
				}]
				OnStart?: [...{
					Content?: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Workteam :: {
			Type: "AWS::SageMaker::Workteam"
			Properties: {
				Description?: string | fn.Fn
				MemberDefinitions?: [...{
					CognitoMemberDefinition: {
						CognitoClientId:  string | fn.Fn
						CognitoUserGroup: string | fn.Fn
						CognitoUserPool:  string | fn.Fn
					}
				}]
				NotificationConfiguration?: NotificationTopicArn: string | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				WorkteamName?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	SecretsManager :: {
		ResourcePolicy :: {
			Type: "AWS::SecretsManager::ResourcePolicy"
			Properties: {
				ResourcePolicy: {
					[string]: _
				} | fn.Fn
				SecretId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RotationSchedule :: {
			Type: "AWS::SecretsManager::RotationSchedule"
			Properties: {
				RotationLambdaARN?: string | fn.Fn
				RotationRules?: AutomaticallyAfterDays?: int | fn.Fn
				SecretId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Secret :: {
			Type: "AWS::SecretsManager::Secret"
			Properties: {
				Description?: string | fn.Fn
				GenerateSecretString?: {
					ExcludeCharacters?:       string | fn.Fn
					ExcludeLowercase?:        bool | fn.Fn
					ExcludeNumbers?:          bool | fn.Fn
					ExcludePunctuation?:      bool | fn.Fn
					ExcludeUppercase?:        bool | fn.Fn
					GenerateStringKey?:       string | fn.Fn
					IncludeSpace?:            bool | fn.Fn
					PasswordLength?:          int | fn.Fn
					RequireEachIncludedType?: bool | fn.Fn
					SecretStringTemplate?:    string | fn.Fn
				}
				KmsKeyId?:     string | fn.Fn
				Name?:         string | fn.Fn
				SecretString?: string | fn.Fn
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
		SecretTargetAttachment :: {
			Type: "AWS::SecretsManager::SecretTargetAttachment"
			Properties: {
				SecretId:   string | fn.Fn
				TargetId:   string | fn.Fn
				TargetType: (string & ("AWS::RDS::DBCluster" | "AWS::RDS::DBInstance")) | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	SecurityHub :: {
		Hub :: {
			Type: "AWS::SecurityHub::Hub"
			Properties: Tags?: {
				[string]: _
			} | fn.Fn
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ServiceCatalog :: {
		AcceptedPortfolioShare :: {
			Type: "AWS::ServiceCatalog::AcceptedPortfolioShare"
			Properties: {
				AcceptLanguage?: string | fn.Fn
				PortfolioId:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		CloudFormationProduct :: {
			Type: "AWS::ServiceCatalog::CloudFormationProduct"
			Properties: {
				AcceptLanguage?: string | fn.Fn
				Description?:    string | fn.Fn
				Distributor?:    string | fn.Fn
				Name:            string | fn.Fn
				Owner:           string | fn.Fn
				ProvisioningArtifactParameters: [...{
					Description?:               string | fn.Fn
					DisableTemplateValidation?: bool | fn.Fn
					Info:                       {
						[string]: _
					} | fn.Fn
					Name?: string | fn.Fn
				}]
				SupportDescription?: string | fn.Fn
				SupportEmail?:       string | fn.Fn
				SupportUrl?:         string | fn.Fn
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
		CloudFormationProvisionedProduct :: {
			Type: "AWS::ServiceCatalog::CloudFormationProvisionedProduct"
			Properties: {
				AcceptLanguage?:           string | fn.Fn
				NotificationArns?:         [...(string | fn.Fn)] | fn.Fn
				PathId?:                   string | fn.Fn
				ProductId?:                string | fn.Fn
				ProductName?:              string | fn.Fn
				ProvisionedProductName?:   string | fn.Fn
				ProvisioningArtifactId?:   string | fn.Fn
				ProvisioningArtifactName?: string | fn.Fn
				ProvisioningParameters?: [...{
					Key?:   string | fn.Fn
					Value?: string | fn.Fn
				}]
				ProvisioningPreferences?: {
					StackSetAccounts?:                   [...(string | fn.Fn)] | fn.Fn
					StackSetFailureToleranceCount?:      int | fn.Fn
					StackSetFailureTolerancePercentage?: int | fn.Fn
					StackSetMaxConcurrencyCount?:        int | fn.Fn
					StackSetMaxConcurrencyPercentage?:   int | fn.Fn
					StackSetOperationType?:              string | fn.Fn
					StackSetRegions?:                    [...(string | fn.Fn)] | fn.Fn
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
		LaunchNotificationConstraint :: {
			Type: "AWS::ServiceCatalog::LaunchNotificationConstraint"
			Properties: {
				AcceptLanguage?:  string | fn.Fn
				Description?:     string | fn.Fn
				NotificationArns: [...(string | fn.Fn)] | fn.Fn
				PortfolioId:      string | fn.Fn
				ProductId:        string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LaunchRoleConstraint :: {
			Type: "AWS::ServiceCatalog::LaunchRoleConstraint"
			Properties: {
				AcceptLanguage?: string | fn.Fn
				Description?:    string | fn.Fn
				PortfolioId:     string | fn.Fn
				ProductId:       string | fn.Fn
				RoleArn:         string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		LaunchTemplateConstraint :: {
			Type: "AWS::ServiceCatalog::LaunchTemplateConstraint"
			Properties: {
				AcceptLanguage?: string | fn.Fn
				Description?:    string | fn.Fn
				PortfolioId:     string | fn.Fn
				ProductId:       string | fn.Fn
				Rules:           string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Portfolio :: {
			Type: "AWS::ServiceCatalog::Portfolio"
			Properties: {
				AcceptLanguage?: string | fn.Fn
				Description?:    string | fn.Fn
				DisplayName:     string | fn.Fn
				ProviderName:    string | fn.Fn
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
		PortfolioPrincipalAssociation :: {
			Type: "AWS::ServiceCatalog::PortfolioPrincipalAssociation"
			Properties: {
				AcceptLanguage?: string | fn.Fn
				PortfolioId:     string | fn.Fn
				PrincipalARN:    string | fn.Fn
				PrincipalType:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		PortfolioProductAssociation :: {
			Type: "AWS::ServiceCatalog::PortfolioProductAssociation"
			Properties: {
				AcceptLanguage?:    string | fn.Fn
				PortfolioId:        string | fn.Fn
				ProductId:          string | fn.Fn
				SourcePortfolioId?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		PortfolioShare :: {
			Type: "AWS::ServiceCatalog::PortfolioShare"
			Properties: {
				AcceptLanguage?: string | fn.Fn
				AccountId:       string | fn.Fn
				PortfolioId:     string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		ResourceUpdateConstraint :: {
			Type: "AWS::ServiceCatalog::ResourceUpdateConstraint"
			Properties: {
				AcceptLanguage?:               string | fn.Fn
				Description?:                  string | fn.Fn
				PortfolioId:                   string | fn.Fn
				ProductId:                     string | fn.Fn
				TagUpdateOnProvisionedProduct: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		StackSetConstraint :: {
			Type: "AWS::ServiceCatalog::StackSetConstraint"
			Properties: {
				AcceptLanguage?:      string | fn.Fn
				AccountList:          [...(string | fn.Fn)] | fn.Fn
				AdminRole:            string | fn.Fn
				Description:          string | fn.Fn
				ExecutionRole:        string | fn.Fn
				PortfolioId:          string | fn.Fn
				ProductId:            string | fn.Fn
				RegionList:           [...(string | fn.Fn)] | fn.Fn
				StackInstanceControl: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TagOption :: {
			Type: "AWS::ServiceCatalog::TagOption"
			Properties: {
				Active?: bool | fn.Fn
				Key:     string | fn.Fn
				Value:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		TagOptionAssociation :: {
			Type: "AWS::ServiceCatalog::TagOptionAssociation"
			Properties: {
				ResourceId:  string | fn.Fn
				TagOptionId: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ServiceDiscovery :: {
		HttpNamespace :: {
			Type: "AWS::ServiceDiscovery::HttpNamespace"
			Properties: {
				Description?: string | fn.Fn
				Name:         string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Instance :: {
			Type: "AWS::ServiceDiscovery::Instance"
			Properties: {
				InstanceAttributes: [string]: string | fn.Fn
				InstanceId?: string | fn.Fn
				ServiceId:   string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		PrivateDnsNamespace :: {
			Type: "AWS::ServiceDiscovery::PrivateDnsNamespace"
			Properties: {
				Description?: string | fn.Fn
				Name:         string | fn.Fn
				Vpc:          string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		PublicDnsNamespace :: {
			Type: "AWS::ServiceDiscovery::PublicDnsNamespace"
			Properties: {
				Description?: string | fn.Fn
				Name:         string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Service :: {
			Type: "AWS::ServiceDiscovery::Service"
			Properties: {
				Description?: string | fn.Fn
				DnsConfig?: {
					DnsRecords: [...{
						TTL:  float | fn.Fn
						Type: (string & ("A" | "AAAA" | "SRV")) | fn.Fn
					}]
					NamespaceId?:   string | fn.Fn
					RoutingPolicy?: string | fn.Fn
				}
				HealthCheckConfig?: {
					FailureThreshold?: float | fn.Fn
					ResourcePath?:     string | fn.Fn
					Type:              (string & ("HTTP" | "HTTPS" | "TCP")) | fn.Fn
				}
				HealthCheckCustomConfig?: FailureThreshold?: float | fn.Fn
				Name?:        string | fn.Fn
				NamespaceId?: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	StepFunctions :: {
		Activity :: {
			Type: "AWS::StepFunctions::Activity"
			Properties: {
				Name: string | fn.Fn
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
		StateMachine :: {
			Type: "AWS::StepFunctions::StateMachine"
			Properties: {
				DefinitionString:  string | fn.Fn
				RoleArn:           string | fn.Fn
				StateMachineName?: string | fn.Fn
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
	}

	Transfer :: {
		Server :: {
			Type: "AWS::Transfer::Server"
			Properties: {
				EndpointDetails?: VpcEndpointId: string | fn.Fn
				EndpointType?: string | fn.Fn
				IdentityProviderDetails?: {
					InvocationRole: string | fn.Fn
					Url:            string | fn.Fn
				}
				IdentityProviderType?: string | fn.Fn
				LoggingRole?:          string | fn.Fn
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
		User :: {
			Type: "AWS::Transfer::User"
			Properties: {
				HomeDirectory?: string | fn.Fn
				Policy?:        string | fn.Fn
				Role:           string | fn.Fn
				ServerId:       string | fn.Fn
				SshPublicKeys?: [...(string | fn.Fn)] | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				UserName: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	WAF :: {
		ByteMatchSet :: {
			Type: "AWS::WAF::ByteMatchSet"
			Properties: {
				ByteMatchTuples?: [...{
					FieldToMatch: {
						Data?: string | fn.Fn
						Type:  string | fn.Fn
					}
					PositionalConstraint: string | fn.Fn
					TargetString?:        string | fn.Fn
					TargetStringBase64?:  string | fn.Fn
					TextTransformation:   string | fn.Fn
				}]
				Name: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		IPSet :: {
			Type: "AWS::WAF::IPSet"
			Properties: {
				IPSetDescriptors?: [...{
					Type:  string | fn.Fn
					Value: string | fn.Fn
				}]
				Name: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Rule :: {
			Type: "AWS::WAF::Rule"
			Properties: {
				MetricName: string | fn.Fn
				Name:       string | fn.Fn
				Predicates?: [...{
					DataId:  string | fn.Fn
					Negated: bool | fn.Fn
					Type:    (string & ("ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch")) | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SizeConstraintSet :: {
			Type: "AWS::WAF::SizeConstraintSet"
			Properties: {
				Name: string | fn.Fn
				SizeConstraints: [...{
					ComparisonOperator: string | fn.Fn
					FieldToMatch: {
						Data?: string | fn.Fn
						Type:  string | fn.Fn
					}
					Size:               int | fn.Fn
					TextTransformation: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SqlInjectionMatchSet :: {
			Type: "AWS::WAF::SqlInjectionMatchSet"
			Properties: {
				Name: string | fn.Fn
				SqlInjectionMatchTuples?: [...{
					FieldToMatch: {
						Data?: string | fn.Fn
						Type:  string | fn.Fn
					}
					TextTransformation: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		WebACL :: {
			Type: "AWS::WAF::WebACL"
			Properties: {
				DefaultAction: Type: string | fn.Fn
				MetricName: string | fn.Fn
				Name:       string | fn.Fn
				Rules?: [...{
					Action?: Type: string | fn.Fn
					Priority: int | fn.Fn
					RuleId:   string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		XssMatchSet :: {
			Type: "AWS::WAF::XssMatchSet"
			Properties: {
				Name: string | fn.Fn
				XssMatchTuples: [...{
					FieldToMatch: {
						Data?: string | fn.Fn
						Type:  string | fn.Fn
					}
					TextTransformation: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	WAFRegional :: {
		ByteMatchSet :: {
			Type: "AWS::WAFRegional::ByteMatchSet"
			Properties: {
				ByteMatchTuples?: [...{
					FieldToMatch: {
						Data?: string | fn.Fn
						Type:  string | fn.Fn
					}
					PositionalConstraint: string | fn.Fn
					TargetString?:        string | fn.Fn
					TargetStringBase64?:  string | fn.Fn
					TextTransformation:   string | fn.Fn
				}]
				Name: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		GeoMatchSet :: {
			Type: "AWS::WAFRegional::GeoMatchSet"
			Properties: {
				GeoMatchConstraints?: [...{
					Type:  string | fn.Fn
					Value: string | fn.Fn
				}]
				Name: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		IPSet :: {
			Type: "AWS::WAFRegional::IPSet"
			Properties: {
				IPSetDescriptors?: [...{
					Type:  string | fn.Fn
					Value: string | fn.Fn
				}]
				Name: string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RateBasedRule :: {
			Type: "AWS::WAFRegional::RateBasedRule"
			Properties: {
				MatchPredicates?: [...{
					DataId:  string | fn.Fn
					Negated: bool | fn.Fn
					Type:    string | fn.Fn
				}]
				MetricName: string | fn.Fn
				Name:       string | fn.Fn
				RateKey:    string | fn.Fn
				RateLimit:  int | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RegexPatternSet :: {
			Type: "AWS::WAFRegional::RegexPatternSet"
			Properties: {
				Name:                string | fn.Fn
				RegexPatternStrings: [...(string | fn.Fn)] | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		Rule :: {
			Type: "AWS::WAFRegional::Rule"
			Properties: {
				MetricName: string | fn.Fn
				Name:       string | fn.Fn
				Predicates?: [...{
					DataId:  string | fn.Fn
					Negated: bool | fn.Fn
					Type:    (string & ("ByteMatch" | "GeoMatch" | "IPMatch" | "RegexMatch" | "SizeConstraint" | "SqlInjectionMatch" | "XssMatch")) | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SizeConstraintSet :: {
			Type: "AWS::WAFRegional::SizeConstraintSet"
			Properties: {
				Name: string | fn.Fn
				SizeConstraints?: [...{
					ComparisonOperator: string | fn.Fn
					FieldToMatch: {
						Data?: string | fn.Fn
						Type:  string | fn.Fn
					}
					Size:               int | fn.Fn
					TextTransformation: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		SqlInjectionMatchSet :: {
			Type: "AWS::WAFRegional::SqlInjectionMatchSet"
			Properties: {
				Name: string | fn.Fn
				SqlInjectionMatchTuples?: [...{
					FieldToMatch: {
						Data?: string | fn.Fn
						Type:  string | fn.Fn
					}
					TextTransformation: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		WebACL :: {
			Type: "AWS::WAFRegional::WebACL"
			Properties: {
				DefaultAction: Type: string | fn.Fn
				MetricName: string | fn.Fn
				Name:       string | fn.Fn
				Rules?: [...{
					Action: Type: string | fn.Fn
					Priority: int | fn.Fn
					RuleId:   string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		WebACLAssociation :: {
			Type: "AWS::WAFRegional::WebACLAssociation"
			Properties: {
				ResourceArn: string | fn.Fn
				WebACLId:    string | fn.Fn
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		XssMatchSet :: {
			Type: "AWS::WAFRegional::XssMatchSet"
			Properties: {
				Name: string | fn.Fn
				XssMatchTuples?: [...{
					FieldToMatch: {
						Data?: string | fn.Fn
						Type:  string | fn.Fn
					}
					TextTransformation: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	WAFv2 :: {
		IPSet :: {
			Type: "AWS::WAFv2::IPSet"
			Properties: {
				Addresses?: IPAddresses?: [...(string | fn.Fn)] | fn.Fn
				Description?:      string | fn.Fn
				IPAddressVersion?: string | fn.Fn
				IPSet?: {
					ARN?: string | fn.Fn
					Addresses?: IPAddresses?: [...(string | fn.Fn)] | fn.Fn
					Description?:      string | fn.Fn
					IPAddressVersion?: string | fn.Fn
					Id?:               string | fn.Fn
					Name?:             string | fn.Fn
				}
				IPSetSummary?: {
					ARN?:         string | fn.Fn
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					LockToken?:   string | fn.Fn
					Name?:        string | fn.Fn
				}
				IPSets?: IPSets?: [...{
					[string]: _
				}]
				Id?:            string | fn.Fn
				Limit?:         int | fn.Fn
				LockToken?:     string | fn.Fn
				Name:           string | fn.Fn
				NextLockToken?: string | fn.Fn
				NextMarker?:    string | fn.Fn
				Scope:          string | fn.Fn
				Summary?: {
					ARN?:         string | fn.Fn
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					LockToken?:   string | fn.Fn
					Name?:        string | fn.Fn
				}
				Tags?: TagList?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RegexPatternSet :: {
			Type: "AWS::WAFv2::RegexPatternSet"
			Properties: {
				Description?:   string | fn.Fn
				Id?:            string | fn.Fn
				Limit?:         int | fn.Fn
				LockToken?:     string | fn.Fn
				Name:           string | fn.Fn
				NextLockToken?: string | fn.Fn
				NextMarker?:    string | fn.Fn
				RegexPatternSet?: {
					ARN?:         string | fn.Fn
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					Name?:        string | fn.Fn
					RegularExpressionList?: RegularExpressionList?: [...{
						[string]: _
					}]
				}
				RegexPatternSets?: RegexPatternSets?: [...{
					[string]: _
				}]
				RegularExpressionList?: RegularExpressionList?: [...{
					[string]: _
				}]
				Scope: string | fn.Fn
				Summary?: {
					ARN?:         string | fn.Fn
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					LockToken?:   string | fn.Fn
					Name?:        string | fn.Fn
				}
				Tags?: TagList?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		RuleGroup :: {
			Type: "AWS::WAFv2::RuleGroup"
			Properties: {
				Capacity?:      int | fn.Fn
				Description?:   string | fn.Fn
				Id?:            string | fn.Fn
				Limit?:         int | fn.Fn
				LockToken?:     string | fn.Fn
				Name:           string | fn.Fn
				NextLockToken?: string | fn.Fn
				NextMarker?:    string | fn.Fn
				RuleGroup?: {
					ARN?:         string | fn.Fn
					Capacity?:    int | fn.Fn
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					Name?:        string | fn.Fn
					Rules?: Rules?: [...{
						[string]: _
					}]
					VisibilityConfig?: {
						CloudWatchMetricsEnabled?: bool | fn.Fn
						MetricName?:               string | fn.Fn
						SampledRequestsEnabled?:   bool | fn.Fn
					}
				}
				RuleGroupSummary?: {
					ARN?:         string | fn.Fn
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					LockToken?:   string | fn.Fn
					Name?:        string | fn.Fn
				}
				RuleGroups?: RuleGroups?: [...{
					[string]: _
				}]
				Rules?: Rules?: [...{
					[string]: _
				}]
				Scope: string | fn.Fn
				Statement?: {
					AndStatement?: Statements?: StatementTwos?: [...{
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
								IPSetReferenceStatement?: ARN?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									ARN?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}]
					ByteMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						PositionalConstraint?: string | fn.Fn
						SearchString?:         string | fn.Fn
						SearchStringBase64?:   string | fn.Fn
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
					IPSetReferenceStatement?: ARN?: string | fn.Fn
					NotStatement?: Statement?: {
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
								IPSetReferenceStatement?: ARN?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									ARN?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}
					OrStatement?: Statements?: StatementTwos?: [...{
						AndStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						ByteMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							PositionalConstraint?: string | fn.Fn
							SearchString?:         string | fn.Fn
							SearchStringBase64?:   string | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
						IPSetReferenceStatement?: ARN?: string | fn.Fn
						NotStatement?: Statement?: {
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
						OrStatement?: Statements?: StatementThrees?: [...{
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}]
						RateBasedStatement?: {
							AggregateKeyType?: string | fn.Fn
							Limit?:            int | fn.Fn
							ScopeDownStatement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
								IPSetReferenceStatement?: ARN?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									ARN?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
						}
						RegexPatternSetReferenceStatement?: {
							ARN?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SizeConstraintStatement?: {
							ComparisonOperator?: string | fn.Fn
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							Size?: int | fn.Fn
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						SqliMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
						XssMatchStatement?: {
							FieldToMatch?: {
								AllQueryArguments?: {
								}
								Body?: {
								}
								Method?: {
								}
								QueryString?: {
								}
								SingleHeader?: Name?:        string | fn.Fn
								SingleQueryArgument?: Name?: string | fn.Fn
								UriPath?: {
								}
							}
							TextTransformations?: TextTransformations?: [...{
								[string]: _
							}]
						}
					}]
					RateBasedStatement?: {
						AggregateKeyType?: string | fn.Fn
						Limit?:            int | fn.Fn
						ScopeDownStatement?: {
							AndStatement?: Statements?: StatementThrees?: [...{
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
								IPSetReferenceStatement?: ARN?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									ARN?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}]
							ByteMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								PositionalConstraint?: string | fn.Fn
								SearchString?:         string | fn.Fn
								SearchStringBase64?:   string | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
							IPSetReferenceStatement?: ARN?: string | fn.Fn
							NotStatement?: Statement?: {
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
								IPSetReferenceStatement?: ARN?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									ARN?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}
							OrStatement?: Statements?: StatementThrees?: [...{
								ByteMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									PositionalConstraint?: string | fn.Fn
									SearchString?:         string | fn.Fn
									SearchStringBase64?:   string | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
								IPSetReferenceStatement?: ARN?: string | fn.Fn
								RegexPatternSetReferenceStatement?: {
									ARN?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SizeConstraintStatement?: {
									ComparisonOperator?: string | fn.Fn
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									Size?: int | fn.Fn
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								SqliMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
								XssMatchStatement?: {
									FieldToMatch?: {
										AllQueryArguments?: {
										}
										Body?: {
										}
										Method?: {
										}
										QueryString?: {
										}
										SingleHeader?: Name?:        string | fn.Fn
										SingleQueryArgument?: Name?: string | fn.Fn
										UriPath?: {
										}
									}
									TextTransformations?: TextTransformations?: [...{
										[string]: _
									}]
								}
							}]
							RateBasedStatement?: {
								AggregateKeyType?: string | fn.Fn
								Limit?:            int | fn.Fn
								ScopeDownStatement?: {
									ByteMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										PositionalConstraint?: string | fn.Fn
										SearchString?:         string | fn.Fn
										SearchStringBase64?:   string | fn.Fn
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									GeoMatchStatement?: CountryCodes?: CountryCodes?: [...(string | fn.Fn)] | fn.Fn
									IPSetReferenceStatement?: ARN?: string | fn.Fn
									RegexPatternSetReferenceStatement?: {
										ARN?: string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									SizeConstraintStatement?: {
										ComparisonOperator?: string | fn.Fn
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										Size?: int | fn.Fn
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									SqliMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
									XssMatchStatement?: {
										FieldToMatch?: {
											AllQueryArguments?: {
											}
											Body?: {
											}
											Method?: {
											}
											QueryString?: {
											}
											SingleHeader?: Name?:        string | fn.Fn
											SingleQueryArgument?: Name?: string | fn.Fn
											UriPath?: {
											}
										}
										TextTransformations?: TextTransformations?: [...{
											[string]: _
										}]
									}
								}
							}
							RegexPatternSetReferenceStatement?: {
								ARN?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SizeConstraintStatement?: {
								ComparisonOperator?: string | fn.Fn
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								Size?: int | fn.Fn
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							SqliMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
							XssMatchStatement?: {
								FieldToMatch?: {
									AllQueryArguments?: {
									}
									Body?: {
									}
									Method?: {
									}
									QueryString?: {
									}
									SingleHeader?: Name?:        string | fn.Fn
									SingleQueryArgument?: Name?: string | fn.Fn
									UriPath?: {
									}
								}
								TextTransformations?: TextTransformations?: [...{
									[string]: _
								}]
							}
						}
					}
					RegexPatternSetReferenceStatement?: {
						ARN?: string | fn.Fn
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					SizeConstraintStatement?: {
						ComparisonOperator?: string | fn.Fn
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						Size?: int | fn.Fn
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					SqliMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
					XssMatchStatement?: {
						FieldToMatch?: {
							AllQueryArguments?: {
							}
							Body?: {
							}
							Method?: {
							}
							QueryString?: {
							}
							SingleHeader?: Name?:        string | fn.Fn
							SingleQueryArgument?: Name?: string | fn.Fn
							UriPath?: {
							}
						}
						TextTransformations?: TextTransformations?: [...{
							[string]: _
						}]
					}
				}
				Summary?: {
					ARN?:         string | fn.Fn
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					LockToken?:   string | fn.Fn
					Name?:        string | fn.Fn
				}
				Tags?: TagList?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VisibilityConfig?: {
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
		WebACL :: {
			Type: "AWS::WAFv2::WebACL"
			Properties: {
				DefaultAction?: {
					Allow?: {
					}
					Block?: {
					}
				}
				Description?:   string | fn.Fn
				Id?:            string | fn.Fn
				Limit?:         int | fn.Fn
				LockToken?:     string | fn.Fn
				Name:           string | fn.Fn
				NextLockToken?: string | fn.Fn
				NextMarker?:    string | fn.Fn
				Rules?: Rules?: [...{
					[string]: _
				}]
				Scope: string | fn.Fn
				Summary?: {
					ARN?:         string | fn.Fn
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					LockToken?:   string | fn.Fn
					Name?:        string | fn.Fn
				}
				Tags?: TagList?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				VisibilityConfig?: {
					CloudWatchMetricsEnabled?: bool | fn.Fn
					MetricName?:               string | fn.Fn
					SampledRequestsEnabled?:   bool | fn.Fn
				}
				WebACL?: {
					ARN?:      string | fn.Fn
					Capacity?: int | fn.Fn
					DefaultAction?: {
						Allow?: {
						}
						Block?: {
						}
					}
					Description?: string | fn.Fn
					Id?:          string | fn.Fn
					Name?:        string | fn.Fn
					Rules?: Rules?: [...{
						[string]: _
					}]
					VisibilityConfig?: {
						CloudWatchMetricsEnabled?: bool | fn.Fn
						MetricName?:               string | fn.Fn
						SampledRequestsEnabled?:   bool | fn.Fn
					}
				}
				WebACLs?: WebACLs?: [...{
					[string]: _
				}]
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	WorkSpaces :: {
		Workspace :: {
			Type: "AWS::WorkSpaces::Workspace"
			Properties: {
				BundleId:                     string | fn.Fn
				DirectoryId:                  string | fn.Fn
				RootVolumeEncryptionEnabled?: bool | fn.Fn
				Tags?: [...{
					Key:   string | fn.Fn
					Value: string | fn.Fn
				}]
				UserName:                     string | fn.Fn
				UserVolumeEncryptionEnabled?: bool | fn.Fn
				VolumeEncryptionKey?:         string | fn.Fn
				WorkspaceProperties?: {
					ComputeTypeName?:                     (string & ("GRAPHICS" | "PERFORMANCE" | "POWER" | "STANDARD" | "VALUE")) | fn.Fn
					RootVolumeSizeGib?:                   int | fn.Fn
					RunningMode?:                         (string & ("ALWAYS_ON" | "AUTO_STOP")) | fn.Fn
					RunningModeAutoStopTimeoutInMinutes?: int | fn.Fn
					UserVolumeSizeGib?:                   int | fn.Fn
				}
			}
			DependsOn?:           string | [...string]
			DeletionPolicy?:      "Delete" | "Retain"
			UpdateReplacePolicy?: "Delete" | "Retain"
			Metadata?: [string]: _
		}
	}

	ResourceTypes :: [ASK.Skill, AmazonMQ.Broker, AmazonMQ.Configuration, AmazonMQ.ConfigurationAssociation, Amplify.App, Amplify.Branch, Amplify.Domain, ApiGateway.Account, ApiGateway.ApiKey, ApiGateway.Authorizer, ApiGateway.BasePathMapping, ApiGateway.ClientCertificate, ApiGateway.Deployment, ApiGateway.DocumentationPart, ApiGateway.DocumentationVersion, ApiGateway.DomainName, ApiGateway.GatewayResponse, ApiGateway.Method, ApiGateway.Model, ApiGateway.RequestValidator, ApiGateway.Resource, ApiGateway.RestApi, ApiGateway.Stage, ApiGateway.UsagePlan, ApiGateway.UsagePlanKey, ApiGateway.VpcLink, ApiGatewayV2.Api, ApiGatewayV2.ApiMapping, ApiGatewayV2.Authorizer, ApiGatewayV2.Deployment, ApiGatewayV2.DomainName, ApiGatewayV2.Integration, ApiGatewayV2.IntegrationResponse, ApiGatewayV2.Model, ApiGatewayV2.Route, ApiGatewayV2.RouteResponse, ApiGatewayV2.Stage, AppMesh.Mesh, AppMesh.Route, AppMesh.VirtualNode, AppMesh.VirtualRouter, AppMesh.VirtualService, AppStream.DirectoryConfig, AppStream.Fleet, AppStream.ImageBuilder, AppStream.Stack, AppStream.StackFleetAssociation, AppStream.StackUserAssociation, AppStream.User, AppSync.ApiCache, AppSync.ApiKey, AppSync.DataSource, AppSync.FunctionConfiguration, AppSync.GraphQLApi, AppSync.GraphQLSchema, AppSync.Resolver, ApplicationAutoScaling.ScalableTarget, ApplicationAutoScaling.ScalingPolicy, Athena.NamedQuery, AutoScaling.AutoScalingGroup, AutoScaling.LaunchConfiguration, AutoScaling.LifecycleHook, AutoScaling.ScalingPolicy, AutoScaling.ScheduledAction, AutoScalingPlans.ScalingPlan, Backup.BackupPlan, Backup.BackupSelection, Backup.BackupVault, Batch.ComputeEnvironment, Batch.JobDefinition, Batch.JobQueue, Budgets.Budget, CDK.Metadata, CertificateManager.Certificate, Cloud9.EnvironmentEC2, CloudFormation.CustomResource, CloudFormation.Macro, CloudFormation.Stack, CloudFormation.WaitCondition, CloudFormation.WaitConditionHandle, CloudFront.CloudFrontOriginAccessIdentity, CloudFront.Distribution, CloudFront.StreamingDistribution, CloudTrail.Trail, CloudWatch.Alarm, CloudWatch.AnomalyDetector, CloudWatch.Dashboard, CloudWatch.InsightRule, CodeBuild.Project, CodeBuild.SourceCredential, CodeCommit.Repository, CodeDeploy.Application, CodeDeploy.DeploymentConfig, CodeDeploy.DeploymentGroup, CodePipeline.CustomActionType, CodePipeline.Pipeline, CodePipeline.Webhook, CodeStar.GitHubRepository, CodeStarNotifications.NotificationRule, Cognito.IdentityPool, Cognito.IdentityPoolRoleAttachment, Cognito.UserPool, Cognito.UserPoolClient, Cognito.UserPoolDomain, Cognito.UserPoolGroup, Cognito.UserPoolIdentityProvider, Cognito.UserPoolResourceServer, Cognito.UserPoolRiskConfigurationAttachment, Cognito.UserPoolUICustomizationAttachment, Cognito.UserPoolUser, Cognito.UserPoolUserToGroupAttachment, Config.AggregationAuthorization, Config.ConfigRule, Config.ConfigurationAggregator, Config.ConfigurationRecorder, Config.DeliveryChannel, Config.OrganizationConfigRule, Config.RemediationConfiguration, DAX.Cluster, DAX.ParameterGroup, DAX.SubnetGroup, DLM.LifecyclePolicy, DMS.Certificate, DMS.Endpoint, DMS.EventSubscription, DMS.ReplicationInstance, DMS.ReplicationSubnetGroup, DMS.ReplicationTask, DataPipeline.Pipeline, DirectoryService.MicrosoftAD, DirectoryService.SimpleAD, DocDB.DBCluster, DocDB.DBClusterParameterGroup, DocDB.DBInstance, DocDB.DBSubnetGroup, DynamoDB.Table, EC2.CapacityReservation, EC2.ClientVpnAuthorizationRule, EC2.ClientVpnEndpoint, EC2.ClientVpnRoute, EC2.ClientVpnTargetNetworkAssociation, EC2.CustomerGateway, EC2.DHCPOptions, EC2.EC2Fleet, EC2.EIP, EC2.EIPAssociation, EC2.EgressOnlyInternetGateway, EC2.FlowLog, EC2.Host, EC2.Instance, EC2.InternetGateway, EC2.LaunchTemplate, EC2.NatGateway, EC2.NetworkAcl, EC2.NetworkAclEntry, EC2.NetworkInterface, EC2.NetworkInterfaceAttachment, EC2.NetworkInterfacePermission, EC2.PlacementGroup, EC2.Route, EC2.RouteTable, EC2.SecurityGroup, EC2.SecurityGroupEgress, EC2.SecurityGroupIngress, EC2.SpotFleet, EC2.Subnet, EC2.SubnetCidrBlock, EC2.SubnetNetworkAclAssociation, EC2.SubnetRouteTableAssociation, EC2.TrafficMirrorFilter, EC2.TrafficMirrorFilterRule, EC2.TrafficMirrorSession, EC2.TrafficMirrorTarget, EC2.TransitGateway, EC2.TransitGatewayAttachment, EC2.TransitGatewayRoute, EC2.TransitGatewayRouteTable, EC2.TransitGatewayRouteTableAssociation, EC2.TransitGatewayRouteTablePropagation, EC2.VPC, EC2.VPCCidrBlock, EC2.VPCDHCPOptionsAssociation, EC2.VPCEndpoint, EC2.VPCEndpointService, EC2.VPCEndpointServicePermissions, EC2.VPCGatewayAttachment, EC2.VPCPeeringConnection, EC2.VPNConnection, EC2.VPNConnectionRoute, EC2.VPNGateway, EC2.VPNGatewayRoutePropagation, EC2.Volume, EC2.VolumeAttachment, ECR.Repository, ECS.Cluster, ECS.PrimaryTaskSet, ECS.Service, ECS.TaskDefinition, ECS.TaskSet, EFS.FileSystem, EFS.MountTarget, EKS.Cluster, EKS.Nodegroup, EMR.Cluster, EMR.InstanceFleetConfig, EMR.InstanceGroupConfig, EMR.SecurityConfiguration, EMR.Step, ElastiCache.CacheCluster, ElastiCache.ParameterGroup, ElastiCache.ReplicationGroup, ElastiCache.SecurityGroup, ElastiCache.SecurityGroupIngress, ElastiCache.SubnetGroup, ElasticBeanstalk.Application, ElasticBeanstalk.ApplicationVersion, ElasticBeanstalk.ConfigurationTemplate, ElasticBeanstalk.Environment, ElasticLoadBalancing.LoadBalancer, ElasticLoadBalancingV2.Listener, ElasticLoadBalancingV2.ListenerCertificate, ElasticLoadBalancingV2.ListenerRule, ElasticLoadBalancingV2.LoadBalancer, ElasticLoadBalancingV2.TargetGroup, Elasticsearch.Domain, Events.EventBus, Events.EventBusPolicy, Events.Rule, FSx.FileSystem, GameLift.Alias, GameLift.Build, GameLift.Fleet, GameLift.GameSessionQueue, GameLift.MatchmakingConfiguration, GameLift.MatchmakingRuleSet, GameLift.Script, Glue.Classifier, Glue.Connection, Glue.Crawler, Glue.DataCatalogEncryptionSettings, Glue.Database, Glue.DevEndpoint, Glue.Job, Glue.MLTransform, Glue.Partition, Glue.SecurityConfiguration, Glue.Table, Glue.Trigger, Glue.Workflow, Greengrass.ConnectorDefinition, Greengrass.ConnectorDefinitionVersion, Greengrass.CoreDefinition, Greengrass.CoreDefinitionVersion, Greengrass.DeviceDefinition, Greengrass.DeviceDefinitionVersion, Greengrass.FunctionDefinition, Greengrass.FunctionDefinitionVersion, Greengrass.Group, Greengrass.GroupVersion, Greengrass.LoggerDefinition, Greengrass.LoggerDefinitionVersion, Greengrass.ResourceDefinition, Greengrass.ResourceDefinitionVersion, Greengrass.SubscriptionDefinition, Greengrass.SubscriptionDefinitionVersion, GuardDuty.Detector, GuardDuty.Filter, GuardDuty.IPSet, GuardDuty.Master, GuardDuty.Member, GuardDuty.ThreatIntelSet, IAM.AccessKey, IAM.Group, IAM.InstanceProfile, IAM.ManagedPolicy, IAM.Policy, IAM.Role, IAM.ServiceLinkedRole, IAM.User, IAM.UserToGroupAddition, Inspector.AssessmentTarget, Inspector.AssessmentTemplate, Inspector.ResourceGroup, IoT.Certificate, IoT.Policy, IoT.PolicyPrincipalAttachment, IoT.Thing, IoT.ThingPrincipalAttachment, IoT.TopicRule, IoT1Click.Device, IoT1Click.Placement, IoT1Click.Project, IoTAnalytics.Channel, IoTAnalytics.Dataset, IoTAnalytics.Datastore, IoTAnalytics.Pipeline, IoTEvents.DetectorModel, IoTEvents.Input, IoTThingsGraph.FlowTemplate, KMS.Alias, KMS.Key, Kinesis.Stream, Kinesis.StreamConsumer, KinesisAnalytics.Application, KinesisAnalytics.ApplicationOutput, KinesisAnalytics.ApplicationReferenceDataSource, KinesisAnalyticsV2.Application, KinesisAnalyticsV2.ApplicationCloudWatchLoggingOption, KinesisAnalyticsV2.ApplicationOutput, KinesisAnalyticsV2.ApplicationReferenceDataSource, KinesisFirehose.DeliveryStream, LakeFormation.DataLakeSettings, LakeFormation.Permissions, LakeFormation.Resource, Lambda.Alias, Lambda.EventInvokeConfig, Lambda.EventSourceMapping, Lambda.Function, Lambda.LayerVersion, Lambda.LayerVersionPermission, Lambda.Permission, Lambda.Version, Logs.Destination, Logs.LogGroup, Logs.LogStream, Logs.MetricFilter, Logs.SubscriptionFilter, MSK.Cluster, MediaConvert.JobTemplate, MediaConvert.Preset, MediaConvert.Queue, MediaLive.Channel, MediaLive.Input, MediaLive.InputSecurityGroup, MediaStore.Container, Neptune.DBCluster, Neptune.DBClusterParameterGroup, Neptune.DBInstance, Neptune.DBParameterGroup, Neptune.DBSubnetGroup, OpsWorks.App, OpsWorks.ElasticLoadBalancerAttachment, OpsWorks.Instance, OpsWorks.Layer, OpsWorks.Stack, OpsWorks.UserProfile, OpsWorks.Volume, OpsWorksCM.Server, Pinpoint.ADMChannel, Pinpoint.APNSChannel, Pinpoint.APNSSandboxChannel, Pinpoint.APNSVoipChannel, Pinpoint.APNSVoipSandboxChannel, Pinpoint.App, Pinpoint.ApplicationSettings, Pinpoint.BaiduChannel, Pinpoint.Campaign, Pinpoint.EmailChannel, Pinpoint.EmailTemplate, Pinpoint.EventStream, Pinpoint.GCMChannel, Pinpoint.PushTemplate, Pinpoint.SMSChannel, Pinpoint.Segment, Pinpoint.SmsTemplate, Pinpoint.VoiceChannel, PinpointEmail.ConfigurationSet, PinpointEmail.ConfigurationSetEventDestination, PinpointEmail.Identity, QLDB.Ledger, RAM.ResourceShare, RDS.DBCluster, RDS.DBClusterParameterGroup, RDS.DBInstance, RDS.DBParameterGroup, RDS.DBSecurityGroup, RDS.DBSecurityGroupIngress, RDS.DBSubnetGroup, RDS.EventSubscription, RDS.OptionGroup, Redshift.Cluster, Redshift.ClusterParameterGroup, Redshift.ClusterSecurityGroup, Redshift.ClusterSecurityGroupIngress, Redshift.ClusterSubnetGroup, RoboMaker.Fleet, RoboMaker.Robot, RoboMaker.RobotApplication, RoboMaker.RobotApplicationVersion, RoboMaker.SimulationApplication, RoboMaker.SimulationApplicationVersion, Route53.HealthCheck, Route53.HostedZone, Route53.RecordSet, Route53.RecordSetGroup, Route53Resolver.ResolverEndpoint, Route53Resolver.ResolverRule, Route53Resolver.ResolverRuleAssociation, S3.Bucket, S3.BucketPolicy, SDB.Domain, SES.ConfigurationSet, SES.ConfigurationSetEventDestination, SES.ReceiptFilter, SES.ReceiptRule, SES.ReceiptRuleSet, SES.Template, SNS.Subscription, SNS.Topic, SNS.TopicPolicy, SQS.Queue, SQS.QueuePolicy, SSM.Association, SSM.Document, SSM.MaintenanceWindow, SSM.MaintenanceWindowTarget, SSM.MaintenanceWindowTask, SSM.Parameter, SSM.PatchBaseline, SSM.ResourceDataSync, SageMaker.CodeRepository, SageMaker.Endpoint, SageMaker.EndpointConfig, SageMaker.Model, SageMaker.NotebookInstance, SageMaker.NotebookInstanceLifecycleConfig, SageMaker.Workteam, SecretsManager.ResourcePolicy, SecretsManager.RotationSchedule, SecretsManager.Secret, SecretsManager.SecretTargetAttachment, SecurityHub.Hub, ServiceCatalog.AcceptedPortfolioShare, ServiceCatalog.CloudFormationProduct, ServiceCatalog.CloudFormationProvisionedProduct, ServiceCatalog.LaunchNotificationConstraint, ServiceCatalog.LaunchRoleConstraint, ServiceCatalog.LaunchTemplateConstraint, ServiceCatalog.Portfolio, ServiceCatalog.PortfolioPrincipalAssociation, ServiceCatalog.PortfolioProductAssociation, ServiceCatalog.PortfolioShare, ServiceCatalog.ResourceUpdateConstraint, ServiceCatalog.StackSetConstraint, ServiceCatalog.TagOption, ServiceCatalog.TagOptionAssociation, ServiceDiscovery.HttpNamespace, ServiceDiscovery.Instance, ServiceDiscovery.PrivateDnsNamespace, ServiceDiscovery.PublicDnsNamespace, ServiceDiscovery.Service, StepFunctions.Activity, StepFunctions.StateMachine, Transfer.Server, Transfer.User, WAF.ByteMatchSet, WAF.IPSet, WAF.Rule, WAF.SizeConstraintSet, WAF.SqlInjectionMatchSet, WAF.WebACL, WAF.XssMatchSet, WAFRegional.ByteMatchSet, WAFRegional.GeoMatchSet, WAFRegional.IPSet, WAFRegional.RateBasedRule, WAFRegional.RegexPatternSet, WAFRegional.Rule, WAFRegional.SizeConstraintSet, WAFRegional.SqlInjectionMatchSet, WAFRegional.WebACL, WAFRegional.WebACLAssociation, WAFRegional.XssMatchSet, WAFv2.IPSet, WAFv2.RegexPatternSet, WAFv2.RuleGroup, WAFv2.WebACL, WorkSpaces.Workspace]
	AWSTemplateFormatVersion?: "2010-09-09"
	Description?:              string
	Metadata?: [string]: _
	Mappings?: [string]: [string]: [=~"[a-zA-Z0-9]"]: string | [...string]
	Conditions?: [string]: fn.And | fn.Equals | fn.If | fn.Not | fn.Or
	Parameters?: [=~"[a-zA-Z0-9]"]: {
		Type:                   "AWS::EC2::AvailabilityZone::Name" | "AWS::EC2::Image::Id" | "AWS::EC2::Instance::Id" | "AWS::EC2::KeyPair::KeyName" | "AWS::EC2::SecurityGroup::GroupName" | "AWS::EC2::SecurityGroup::Id" | "AWS::EC2::Subnet::Id" | "AWS::EC2::VPC::Id" | "AWS::EC2::Volume::Id" | "AWS::Route53::HostedZone::Id" | "AWS::SSM::Parameter::Name" | "AWS::SSM::Parameter::Value<AWS::EC2::AvailabilityZone::Name>" | "AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Instance::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::KeyPair::KeyName>" | "AWS::SSM::Parameter::Value<AWS::EC2::SecurityGroup::GroupName>" | "AWS::SSM::Parameter::Value<AWS::EC2::SecurityGroup::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Subnet::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::VPC::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Volume::Id>" | "AWS::SSM::Parameter::Value<AWS::Route53::HostedZone::Id>" | "AWS::SSM::Parameter::Value<CommaDelimitedList>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::AvailabilityZone::Name>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Image::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Instance::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::KeyPair::KeyName>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::SecurityGroup::GroupName>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::SecurityGroup::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Subnet::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::VPC::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Volume::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::Route53::HostedZone::Id>>" | "AWS::SSM::Parameter::Value<List<String>>" | "AWS::SSM::Parameter::Value<String>" | "CommaDelimitedList" | "List<AWS::EC2::AvailabilityZone::Name>" | "List<AWS::EC2::Image::Id>" | "List<AWS::EC2::Instance::Id>" | "List<AWS::EC2::SecurityGroup::GroupName>" | "List<AWS::EC2::SecurityGroup::Id>" | "List<AWS::EC2::Subnet::Id>" | "List<AWS::EC2::VPC::Id>" | "List<AWS::EC2::Volume::Id>" | "List<AWS::Route53::HostedZone::Id>" | "List<Number>" | "Number" | "String"
		AllowedPattern?:        string
		AllowedValues?:         string
		ConstraintDescription?: string
		Default?:               string
		Description?:           string
		MaxLength?:             int
		MaxValue?:              int
		MinLength?:             int
		MinValue?:              int
		NoEcho?:                bool
	}
	Resources: [=~"[a-zA-Z0-9]"]: {
		Type: "AWS::AmazonMQ::Broker" | "AWS::AmazonMQ::Configuration" | "AWS::AmazonMQ::ConfigurationAssociation" | "AWS::Amplify::App" | "AWS::Amplify::Branch" | "AWS::Amplify::Domain" | "AWS::ApiGateway::Account" | "AWS::ApiGateway::ApiKey" | "AWS::ApiGateway::Authorizer" | "AWS::ApiGateway::BasePathMapping" | "AWS::ApiGateway::ClientCertificate" | "AWS::ApiGateway::Deployment" | "AWS::ApiGateway::DocumentationPart" | "AWS::ApiGateway::DocumentationVersion" | "AWS::ApiGateway::DomainName" | "AWS::ApiGateway::GatewayResponse" | "AWS::ApiGateway::Method" | "AWS::ApiGateway::Model" | "AWS::ApiGateway::RequestValidator" | "AWS::ApiGateway::Resource" | "AWS::ApiGateway::RestApi" | "AWS::ApiGateway::Stage" | "AWS::ApiGateway::UsagePlan" | "AWS::ApiGateway::UsagePlanKey" | "AWS::ApiGateway::VpcLink" | "AWS::ApiGatewayV2::Api" | "AWS::ApiGatewayV2::ApiMapping" | "AWS::ApiGatewayV2::Authorizer" | "AWS::ApiGatewayV2::Deployment" | "AWS::ApiGatewayV2::DomainName" | "AWS::ApiGatewayV2::Integration" | "AWS::ApiGatewayV2::IntegrationResponse" | "AWS::ApiGatewayV2::Model" | "AWS::ApiGatewayV2::Route" | "AWS::ApiGatewayV2::RouteResponse" | "AWS::ApiGatewayV2::Stage" | "AWS::AppMesh::Mesh" | "AWS::AppMesh::Route" | "AWS::AppMesh::VirtualNode" | "AWS::AppMesh::VirtualRouter" | "AWS::AppMesh::VirtualService" | "AWS::AppStream::DirectoryConfig" | "AWS::AppStream::Fleet" | "AWS::AppStream::ImageBuilder" | "AWS::AppStream::Stack" | "AWS::AppStream::StackFleetAssociation" | "AWS::AppStream::StackUserAssociation" | "AWS::AppStream::User" | "AWS::AppSync::ApiCache" | "AWS::AppSync::ApiKey" | "AWS::AppSync::DataSource" | "AWS::AppSync::FunctionConfiguration" | "AWS::AppSync::GraphQLApi" | "AWS::AppSync::GraphQLSchema" | "AWS::AppSync::Resolver" | "AWS::ApplicationAutoScaling::ScalableTarget" | "AWS::ApplicationAutoScaling::ScalingPolicy" | "AWS::Athena::NamedQuery" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::LifecycleHook" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::AutoScalingPlans::ScalingPlan" | "AWS::Backup::BackupPlan" | "AWS::Backup::BackupSelection" | "AWS::Backup::BackupVault" | "AWS::Batch::ComputeEnvironment" | "AWS::Batch::JobDefinition" | "AWS::Batch::JobQueue" | "AWS::Budgets::Budget" | "AWS::CDK::Metadata" | "AWS::CertificateManager::Certificate" | "AWS::Cloud9::EnvironmentEC2" | "AWS::CloudFormation::CustomResource" | "AWS::CloudFormation::Macro" | "AWS::CloudFormation::Stack" | "AWS::CloudFormation::WaitCondition" | "AWS::CloudFormation::WaitConditionHandle" | "AWS::CloudFront::CloudFrontOriginAccessIdentity" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CloudWatch::AnomalyDetector" | "AWS::CloudWatch::Dashboard" | "AWS::CloudWatch::InsightRule" | "AWS::CodeBuild::Project" | "AWS::CodeBuild::SourceCredential" | "AWS::CodeCommit::Repository" | "AWS::CodeDeploy::Application" | "AWS::CodeDeploy::DeploymentConfig" | "AWS::CodeDeploy::DeploymentGroup" | "AWS::CodePipeline::CustomActionType" | "AWS::CodePipeline::Pipeline" | "AWS::CodePipeline::Webhook" | "AWS::CodeStar::GitHubRepository" | "AWS::CodeStarNotifications::NotificationRule" | "AWS::Cognito::IdentityPool" | "AWS::Cognito::IdentityPoolRoleAttachment" | "AWS::Cognito::UserPool" | "AWS::Cognito::UserPoolClient" | "AWS::Cognito::UserPoolDomain" | "AWS::Cognito::UserPoolGroup" | "AWS::Cognito::UserPoolIdentityProvider" | "AWS::Cognito::UserPoolResourceServer" | "AWS::Cognito::UserPoolRiskConfigurationAttachment" | "AWS::Cognito::UserPoolUICustomizationAttachment" | "AWS::Cognito::UserPoolUser" | "AWS::Cognito::UserPoolUserToGroupAttachment" | "AWS::Config::AggregationAuthorization" | "AWS::Config::ConfigRule" | "AWS::Config::ConfigurationAggregator" | "AWS::Config::ConfigurationRecorder" | "AWS::Config::DeliveryChannel" | "AWS::Config::OrganizationConfigRule" | "AWS::Config::RemediationConfiguration" | "AWS::DAX::Cluster" | "AWS::DAX::ParameterGroup" | "AWS::DAX::SubnetGroup" | "AWS::DLM::LifecyclePolicy" | "AWS::DMS::Certificate" | "AWS::DMS::Endpoint" | "AWS::DMS::EventSubscription" | "AWS::DMS::ReplicationInstance" | "AWS::DMS::ReplicationSubnetGroup" | "AWS::DMS::ReplicationTask" | "AWS::DataPipeline::Pipeline" | "AWS::DirectoryService::MicrosoftAD" | "AWS::DirectoryService::SimpleAD" | "AWS::DocDB::DBCluster" | "AWS::DocDB::DBClusterParameterGroup" | "AWS::DocDB::DBInstance" | "AWS::DocDB::DBSubnetGroup" | "AWS::DynamoDB::Table" | "AWS::EC2::CapacityReservation" | "AWS::EC2::ClientVpnAuthorizationRule" | "AWS::EC2::ClientVpnEndpoint" | "AWS::EC2::ClientVpnRoute" | "AWS::EC2::ClientVpnTargetNetworkAssociation" | "AWS::EC2::CustomerGateway" | "AWS::EC2::DHCPOptions" | "AWS::EC2::EC2Fleet" | "AWS::EC2::EIP" | "AWS::EC2::EIPAssociation" | "AWS::EC2::EgressOnlyInternetGateway" | "AWS::EC2::FlowLog" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::LaunchTemplate" | "AWS::EC2::NatGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkAclEntry" | "AWS::EC2::NetworkInterface" | "AWS::EC2::NetworkInterfaceAttachment" | "AWS::EC2::NetworkInterfacePermission" | "AWS::EC2::PlacementGroup" | "AWS::EC2::Route" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::SecurityGroupEgress" | "AWS::EC2::SecurityGroupIngress" | "AWS::EC2::SpotFleet" | "AWS::EC2::Subnet" | "AWS::EC2::SubnetCidrBlock" | "AWS::EC2::SubnetNetworkAclAssociation" | "AWS::EC2::SubnetRouteTableAssociation" | "AWS::EC2::TrafficMirrorFilter" | "AWS::EC2::TrafficMirrorFilterRule" | "AWS::EC2::TrafficMirrorSession" | "AWS::EC2::TrafficMirrorTarget" | "AWS::EC2::TransitGateway" | "AWS::EC2::TransitGatewayAttachment" | "AWS::EC2::TransitGatewayRoute" | "AWS::EC2::TransitGatewayRouteTable" | "AWS::EC2::TransitGatewayRouteTableAssociation" | "AWS::EC2::TransitGatewayRouteTablePropagation" | "AWS::EC2::VPC" | "AWS::EC2::VPCCidrBlock" | "AWS::EC2::VPCDHCPOptionsAssociation" | "AWS::EC2::VPCEndpoint" | "AWS::EC2::VPCEndpointService" | "AWS::EC2::VPCEndpointServicePermissions" | "AWS::EC2::VPCGatewayAttachment" | "AWS::EC2::VPCPeeringConnection" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNConnectionRoute" | "AWS::EC2::VPNGateway" | "AWS::EC2::VPNGatewayRoutePropagation" | "AWS::EC2::Volume" | "AWS::EC2::VolumeAttachment" | "AWS::ECR::Repository" | "AWS::ECS::Cluster" | "AWS::ECS::PrimaryTaskSet" | "AWS::ECS::Service" | "AWS::ECS::TaskDefinition" | "AWS::ECS::TaskSet" | "AWS::EFS::FileSystem" | "AWS::EFS::MountTarget" | "AWS::EKS::Cluster" | "AWS::EKS::Nodegroup" | "AWS::EMR::Cluster" | "AWS::EMR::InstanceFleetConfig" | "AWS::EMR::InstanceGroupConfig" | "AWS::EMR::SecurityConfiguration" | "AWS::EMR::Step" | "AWS::ElastiCache::CacheCluster" | "AWS::ElastiCache::ParameterGroup" | "AWS::ElastiCache::ReplicationGroup" | "AWS::ElastiCache::SecurityGroup" | "AWS::ElastiCache::SecurityGroupIngress" | "AWS::ElastiCache::SubnetGroup" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::ConfigurationTemplate" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::Listener" | "AWS::ElasticLoadBalancingV2::ListenerCertificate" | "AWS::ElasticLoadBalancingV2::ListenerRule" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::ElasticLoadBalancingV2::TargetGroup" | "AWS::Elasticsearch::Domain" | "AWS::Events::EventBus" | "AWS::Events::EventBusPolicy" | "AWS::Events::Rule" | "AWS::FSx::FileSystem" | "AWS::GameLift::Alias" | "AWS::GameLift::Build" | "AWS::GameLift::Fleet" | "AWS::GameLift::GameSessionQueue" | "AWS::GameLift::MatchmakingConfiguration" | "AWS::GameLift::MatchmakingRuleSet" | "AWS::GameLift::Script" | "AWS::Glue::Classifier" | "AWS::Glue::Connection" | "AWS::Glue::Crawler" | "AWS::Glue::DataCatalogEncryptionSettings" | "AWS::Glue::Database" | "AWS::Glue::DevEndpoint" | "AWS::Glue::Job" | "AWS::Glue::MLTransform" | "AWS::Glue::Partition" | "AWS::Glue::SecurityConfiguration" | "AWS::Glue::Table" | "AWS::Glue::Trigger" | "AWS::Glue::Workflow" | "AWS::Greengrass::ConnectorDefinition" | "AWS::Greengrass::ConnectorDefinitionVersion" | "AWS::Greengrass::CoreDefinition" | "AWS::Greengrass::CoreDefinitionVersion" | "AWS::Greengrass::DeviceDefinition" | "AWS::Greengrass::DeviceDefinitionVersion" | "AWS::Greengrass::FunctionDefinition" | "AWS::Greengrass::FunctionDefinitionVersion" | "AWS::Greengrass::Group" | "AWS::Greengrass::GroupVersion" | "AWS::Greengrass::LoggerDefinition" | "AWS::Greengrass::LoggerDefinitionVersion" | "AWS::Greengrass::ResourceDefinition" | "AWS::Greengrass::ResourceDefinitionVersion" | "AWS::Greengrass::SubscriptionDefinition" | "AWS::Greengrass::SubscriptionDefinitionVersion" | "AWS::GuardDuty::Detector" | "AWS::GuardDuty::Filter" | "AWS::GuardDuty::IPSet" | "AWS::GuardDuty::Master" | "AWS::GuardDuty::Member" | "AWS::GuardDuty::ThreatIntelSet" | "AWS::IAM::AccessKey" | "AWS::IAM::Group" | "AWS::IAM::InstanceProfile" | "AWS::IAM::ManagedPolicy" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::ServiceLinkedRole" | "AWS::IAM::User" | "AWS::IAM::UserToGroupAddition" | "AWS::Inspector::AssessmentTarget" | "AWS::Inspector::AssessmentTemplate" | "AWS::Inspector::ResourceGroup" | "AWS::IoT1Click::Device" | "AWS::IoT1Click::Placement" | "AWS::IoT1Click::Project" | "AWS::IoT::Certificate" | "AWS::IoT::Policy" | "AWS::IoT::PolicyPrincipalAttachment" | "AWS::IoT::Thing" | "AWS::IoT::ThingPrincipalAttachment" | "AWS::IoT::TopicRule" | "AWS::IoTAnalytics::Channel" | "AWS::IoTAnalytics::Dataset" | "AWS::IoTAnalytics::Datastore" | "AWS::IoTAnalytics::Pipeline" | "AWS::IoTEvents::DetectorModel" | "AWS::IoTEvents::Input" | "AWS::IoTThingsGraph::FlowTemplate" | "AWS::KMS::Alias" | "AWS::KMS::Key" | "AWS::Kinesis::Stream" | "AWS::Kinesis::StreamConsumer" | "AWS::KinesisAnalytics::Application" | "AWS::KinesisAnalytics::ApplicationOutput" | "AWS::KinesisAnalytics::ApplicationReferenceDataSource" | "AWS::KinesisAnalyticsV2::Application" | "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption" | "AWS::KinesisAnalyticsV2::ApplicationOutput" | "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource" | "AWS::KinesisFirehose::DeliveryStream" | "AWS::LakeFormation::DataLakeSettings" | "AWS::LakeFormation::Permissions" | "AWS::LakeFormation::Resource" | "AWS::Lambda::Alias" | "AWS::Lambda::EventInvokeConfig" | "AWS::Lambda::EventSourceMapping" | "AWS::Lambda::Function" | "AWS::Lambda::LayerVersion" | "AWS::Lambda::LayerVersionPermission" | "AWS::Lambda::Permission" | "AWS::Lambda::Version" | "AWS::Logs::Destination" | "AWS::Logs::LogGroup" | "AWS::Logs::LogStream" | "AWS::Logs::MetricFilter" | "AWS::Logs::SubscriptionFilter" | "AWS::MSK::Cluster" | "AWS::MediaConvert::JobTemplate" | "AWS::MediaConvert::Preset" | "AWS::MediaConvert::Queue" | "AWS::MediaLive::Channel" | "AWS::MediaLive::Input" | "AWS::MediaLive::InputSecurityGroup" | "AWS::MediaStore::Container" | "AWS::Neptune::DBCluster" | "AWS::Neptune::DBClusterParameterGroup" | "AWS::Neptune::DBInstance" | "AWS::Neptune::DBParameterGroup" | "AWS::Neptune::DBSubnetGroup" | "AWS::OpsWorks::App" | "AWS::OpsWorks::ElasticLoadBalancerAttachment" | "AWS::OpsWorks::Instance" | "AWS::OpsWorks::Layer" | "AWS::OpsWorks::Stack" | "AWS::OpsWorks::UserProfile" | "AWS::OpsWorks::Volume" | "AWS::OpsWorksCM::Server" | "AWS::Pinpoint::ADMChannel" | "AWS::Pinpoint::APNSChannel" | "AWS::Pinpoint::APNSSandboxChannel" | "AWS::Pinpoint::APNSVoipChannel" | "AWS::Pinpoint::APNSVoipSandboxChannel" | "AWS::Pinpoint::App" | "AWS::Pinpoint::ApplicationSettings" | "AWS::Pinpoint::BaiduChannel" | "AWS::Pinpoint::Campaign" | "AWS::Pinpoint::EmailChannel" | "AWS::Pinpoint::EmailTemplate" | "AWS::Pinpoint::EventStream" | "AWS::Pinpoint::GCMChannel" | "AWS::Pinpoint::PushTemplate" | "AWS::Pinpoint::SMSChannel" | "AWS::Pinpoint::Segment" | "AWS::Pinpoint::SmsTemplate" | "AWS::Pinpoint::VoiceChannel" | "AWS::PinpointEmail::ConfigurationSet" | "AWS::PinpointEmail::ConfigurationSetEventDestination" | "AWS::PinpointEmail::Identity" | "AWS::QLDB::Ledger" | "AWS::RAM::ResourceShare" | "AWS::RDS::DBCluster" | "AWS::RDS::DBClusterParameterGroup" | "AWS::RDS::DBInstance" | "AWS::RDS::DBParameterGroup" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSecurityGroupIngress" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::RDS::OptionGroup" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSecurityGroupIngress" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::RoboMaker::Fleet" | "AWS::RoboMaker::Robot" | "AWS::RoboMaker::RobotApplication" | "AWS::RoboMaker::RobotApplicationVersion" | "AWS::RoboMaker::SimulationApplication" | "AWS::RoboMaker::SimulationApplicationVersion" | "AWS::Route53::HealthCheck" | "AWS::Route53::HostedZone" | "AWS::Route53::RecordSet" | "AWS::Route53::RecordSetGroup" | "AWS::Route53Resolver::ResolverEndpoint" | "AWS::Route53Resolver::ResolverRule" | "AWS::Route53Resolver::ResolverRuleAssociation" | "AWS::S3::Bucket" | "AWS::S3::BucketPolicy" | "AWS::SDB::Domain" | "AWS::SES::ConfigurationSet" | "AWS::SES::ConfigurationSetEventDestination" | "AWS::SES::ReceiptFilter" | "AWS::SES::ReceiptRule" | "AWS::SES::ReceiptRuleSet" | "AWS::SES::Template" | "AWS::SNS::Subscription" | "AWS::SNS::Topic" | "AWS::SNS::TopicPolicy" | "AWS::SQS::Queue" | "AWS::SQS::QueuePolicy" | "AWS::SSM::Association" | "AWS::SSM::Document" | "AWS::SSM::MaintenanceWindow" | "AWS::SSM::MaintenanceWindowTarget" | "AWS::SSM::MaintenanceWindowTask" | "AWS::SSM::Parameter" | "AWS::SSM::PatchBaseline" | "AWS::SSM::ResourceDataSync" | "AWS::SageMaker::CodeRepository" | "AWS::SageMaker::Endpoint" | "AWS::SageMaker::EndpointConfig" | "AWS::SageMaker::Model" | "AWS::SageMaker::NotebookInstance" | "AWS::SageMaker::NotebookInstanceLifecycleConfig" | "AWS::SageMaker::Workteam" | "AWS::SecretsManager::ResourcePolicy" | "AWS::SecretsManager::RotationSchedule" | "AWS::SecretsManager::Secret" | "AWS::SecretsManager::SecretTargetAttachment" | "AWS::SecurityHub::Hub" | "AWS::ServiceCatalog::AcceptedPortfolioShare" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::LaunchNotificationConstraint" | "AWS::ServiceCatalog::LaunchRoleConstraint" | "AWS::ServiceCatalog::LaunchTemplateConstraint" | "AWS::ServiceCatalog::Portfolio" | "AWS::ServiceCatalog::PortfolioPrincipalAssociation" | "AWS::ServiceCatalog::PortfolioProductAssociation" | "AWS::ServiceCatalog::PortfolioShare" | "AWS::ServiceCatalog::ResourceUpdateConstraint" | "AWS::ServiceCatalog::StackSetConstraint" | "AWS::ServiceCatalog::TagOption" | "AWS::ServiceCatalog::TagOptionAssociation" | "AWS::ServiceDiscovery::HttpNamespace" | "AWS::ServiceDiscovery::Instance" | "AWS::ServiceDiscovery::PrivateDnsNamespace" | "AWS::ServiceDiscovery::PublicDnsNamespace" | "AWS::ServiceDiscovery::Service" | "AWS::StepFunctions::Activity" | "AWS::StepFunctions::StateMachine" | "AWS::Transfer::Server" | "AWS::Transfer::User" | "AWS::WAF::ByteMatchSet" | "AWS::WAF::IPSet" | "AWS::WAF::Rule" | "AWS::WAF::SizeConstraintSet" | "AWS::WAF::SqlInjectionMatchSet" | "AWS::WAF::WebACL" | "AWS::WAF::XssMatchSet" | "AWS::WAFRegional::ByteMatchSet" | "AWS::WAFRegional::GeoMatchSet" | "AWS::WAFRegional::IPSet" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::RegexPatternSet" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::SizeConstraintSet" | "AWS::WAFRegional::SqlInjectionMatchSet" | "AWS::WAFRegional::WebACL" | "AWS::WAFRegional::WebACLAssociation" | "AWS::WAFRegional::XssMatchSet" | "AWS::WAFv2::IPSet" | "AWS::WAFv2::RegexPatternSet" | "AWS::WAFv2::RuleGroup" | "AWS::WAFv2::WebACL" | "AWS::WorkSpaces::Workspace" | "Alexa::ASK::Skill"
		Properties: [string]: _
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		Metadata?: [string]: _
	}
	for resourceName, resource in Resources {
		for cfnResource in ResourceTypes {
			if resource.Type == cfnResource.Type {
				Resources: "\(resourceName)": cfnResource
			}
		}
	}

	Outputs?: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Value:        _
		Export?: Name: _
	}

	// Fn::Base64
	// Fn::Cidr
	// Fn::FindInMap
	// Fn::GetAZs
	// Fn::GetAtt
	// Fn::ImportValue
	// Fn::Join
	// Fn::Select
	// Fn::Split
	// Fn::Sub
	// Fn::Transform
	// Ref

	// Base64: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-base64.html
	// You can use any function that returns a string inside the Fn::Base64 function.
	Base64 :: {
		"Fn::Base64": string | Base64 | FindInMap | GetAtt | ImportValue | Join | Select | Sub | Ref | If
	}

	// Cidr: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-cidr.html
	Cidr :: {
		// CidrFn :: Select | Ref
		"Fn::Cidr": [string | Select | Ref | GetAtt | Sub | Select, (>=1 & <=256) | Select | Ref, (>=0 & <=128) | Select | Ref]
	}

	// FindInMap: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html
	FindInMap :: {
		// FindInMapFn :: FindInMap | Ref
		"Fn::FindInMap": [string | FindInMap | Ref, string | FindInMap | Ref, string | FindInMap | Ref]
	}

	// GetAZs: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getavailabilityzones.html
	GetAZs :: {
		"Fn::GetAZs": regions.Regions | "" // | (Ref & {"Ref": "AWS::Region"})
	}

	// GetAtt: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getatt.html
	GetAtt :: {
		// [Resource Name, Attribute Name]
		GetAttRef="Fn::GetAtt": [string, string | Ref] | string
		if (GetAttRef & string) != _|_ {
			ResourceName = strings.Split(GetAttRef, ".")[0]
			if (Resources[ResourceName] == _|_) {
				"Fn::GetAtt": "`\(ResourceName)` is not a valid Resource name"
			}
		}

		if (GetAttRef & [string, string | Ref]) != _|_ {
			ResourceName = GetAttRef[0]
			if (Resources[ResourceName] == _|_) {
				"Fn::GetAtt": ["is not a valid Resource name", ""]
			}
		}
	}

	GetAttTypeCheck :: GetAtt & {
		GetAttRef="Fn::GetAtt": [string, string | Ref] | string
		// ResourceType :: [...string]

		// if (GetAttRef & string) != _|_ {
		//  split = strings.Split(GetAttRef, ".")
		//  ResourceName = split[0]
		//  if (Resources[ResourceName] != _|_) {
		//   if !list.Contains(ResourceType, Resources[ResourceName].Type) {
		//    "Fn::GetAtt": "`\(ResourceName)` is not a Resource of type \(strings.Join(ResourceType, ", "))"
		//   }
		//  }
		// }

		ResourceType :: [string]: string
		if (GetAttRef & string) != _|_ {
			split = strings.SplitN(GetAttRef, ".", 2)
			ResourceName = split[0]
			Attribute = split[1]
			if (Resources[ResourceName] != _|_) {
				type = Resources[ResourceName].Type
				if ResourceType[type] == _|_ {
					ResourceTypeList = [ r for r, v in ResourceType ]
					"Fn::GetAtt": "`\(ResourceName)` is not a Resource of type \(strings.Join(ResourceTypeList, ", "))"
				}
				if (ResourceType[type] != _|_) && (ResourceType[type] != Attribute) {
					"Fn::GetAtt": "`\(Attribute)` is not an attribute on \(type)"
				}
			}
		}
		if (GetAttRef & [string, string | Ref]) != _|_ {
			ResourceName = GetAttRef[0]
			Attribute = GetAttRef[1]
			if (Resources[ResourceName] != _|_) {
				type = Resources[ResourceName].Type
				if ResourceType[type] == _|_ {
					ResourceTypeList = [ r for r, v in ResourceType ]
					"Fn::GetAtt": ["is not a Resource of type \(strings.Join(ResourceTypeList, " or "))", ""]
				}
				if ResourceType[type] != _|_ && (Attribute & string) != _|_ && (ResourceType[type] != Attribute) {
					"Fn::GetAtt": [string, "is not an attribute on \(type)"]
				}
			}
		}
	}

	// ImportValue: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html
	// You can use the following functions in the Fn::ImportValue function. The value of these functions can't depend on a resource.

	ImportValue :: {
		"Fn::ImportValue": string | Base64 | FindInMap | If | Join | Select | Split | Sub | Ref
	}

	// Join: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-join.html
	Join :: {
		// JoinFn :: Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Split | Select | Sub | Ref
		"Fn::Join": [string, [...(bool | string | bytes | int | float | Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Split | Select | Sub | Ref)]]
	}

	// Select: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-select.html
	Select :: {
		// SelectFn :: FindInMap | GetAtt | GetAZs | If | Split | Ref
		"Fn::Select": [>=0 | Ref | FindInMap, [...(bool | string | bytes | int | float | FindInMap | GetAtt | GetAZs | If | Split | Cidr | Ref)] | FindInMap | GetAtt | GetAZs | If | Split | Ref]
	}

	// Split: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-split.html
	Split :: {
		// SplitFn :: Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref
		"Fn::Split": [string, string | Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref]
	}

	// Sub: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-sub.html
	Sub :: {
		// SubFn ::   Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Ref
		"Fn::Sub": string | [string, {[string]: string | Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref}]
		// "Fn::Sub": string | [string, {[string]: string | Sub | Ref}]
		// "Fn::Sub": string | [string, {[string | SubFn]: string | SubFn}]
	}

	// Transform: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-transform.html
	Transform :: {
		"Fn::Transform": {
			Name: string
			Parameters: {}
		}
	}

	// Ref: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-ref.html
	Ref :: {
		Ref: string
		if (Resources[Ref] == _|_) && (Parameters[Ref] == _|_ ) {
			Ref: "`\(Ref)` is not a valid Resource or Parameter name"
		}
	}

	RefTypeCheck :: Ref & {
		Ref: string
		ResourceType :: [...string]
		ParameterType :: [...string]
		if Resources[Ref] != _|_ {
			// if Resources[Ref].Type != ResourceType {
			if !list.Contains(ResourceType, Resources[Ref].Type) {
				Ref: "`\(Ref)` is not a Resource of type \(strings.Join(ResourceType, ", "))"
			}
		}
		if Parameters[Ref] != _|_ {
			// if Parameters[Ref].Type != ParameterType {
			if !list.Contains(ParameterType, Parameters[Ref].Type) {
				Ref: "Parameter `\(Ref)` type \(Parameters[Ref].Type) != type \(strings.Join(ParameterType, ", "))"
			}
		}
	}

	// Condition Functions
	// You can use the following functions in all other condition functions, such as Fn::Equals and Fn::Or:
	// - Fn::FindInMap
	// - Ref
	// - Other condition functions

	// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-and
	And :: {
		"Fn::And": [...({Condition: string} | LogicFn)]
		// "Fn::And": list.MinItems(2) & list.MaxItems(10)
	}

	// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-equals
	Equals :: {
		"Fn::Equals": 2 * [string | Ref | FindInMap | ConditionFn]
	}

	// You can use the following functions in the Fn::If condition:
	// - Fn::Base64
	// - Fn::FindInMap
	// - Fn::GetAtt
	// - Fn::GetAZs
	// - Fn::If
	// - Fn::Join
	// - Fn::Select
	// - Fn::Sub
	// - Ref

	// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-if
	If :: {
		"Fn::If": [string, _ | Base64 | FindInMap | GetAtt | GetAZs | If | Join | Select | Sub | Ref, _ | Base64 | FindInMap | GetAtt | GetAZs | If | Join | Select | Sub | Ref]
	}

	// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-not
	Not :: {
		"Fn::Not": [{Condition: string} | LogicFn]
	}

	// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-or
	// Returns true if any one of the specified conditions evaluate to true, or returns false if all of the conditions evaluates to false. Fn::Or acts as an OR operator. The minimum number of conditions that you can include is 2, and the maximum is 10.

	Or :: {
		"Fn::Or": [...({Condition: string} | LogicFn)]
	}

	LogicFn :: And | Equals | Not | Or

	ConditionFn :: LogicFn | If

	fn :: Fn :: Base64 | Cidr | FindInMap | GetAZs | GetAtt | ImportValue | Join | Select | Split | Sub | Transform | Ref | If
	// Fn : Sub | Ref
	// Fn : Sub
}

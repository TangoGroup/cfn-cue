package apsouth1

import "github.com/TangoGroup/aws/fn"

#AppFlow: {
	#ConnectorProfile: {
		Type: "AWS::AppFlow::ConnectorProfile"
		Properties: {
			ConnectionMode:          string | fn.#Fn
			ConnectorProfileConfig?: {
				ConnectorProfileCredentials: {
					Amplitude?: {
						ApiKey:    string | fn.#Fn
						SecretKey: string | fn.#Fn
					} | fn.#If
					Datadog?: {
						ApiKey:         string | fn.#Fn
						ApplicationKey: string | fn.#Fn
					} | fn.#If
					Dynatrace?: {
						ApiToken: string | fn.#Fn
					} | fn.#If
					GoogleAnalytics?: {
						AccessToken?:           string | fn.#Fn
						ClientId:               string | fn.#Fn
						ClientSecret:           string | fn.#Fn
						ConnectorOAuthRequest?: {
							AuthCode?:    string | fn.#Fn
							RedirectUri?: string | fn.#Fn
						} | fn.#If
						RefreshToken?: string | fn.#Fn
					} | fn.#If
					InforNexus?: {
						AccessKeyId:     string | fn.#Fn
						Datakey:         string | fn.#Fn
						SecretAccessKey: string | fn.#Fn
						UserId:          string | fn.#Fn
					} | fn.#If
					Marketo?: {
						AccessToken?:           string | fn.#Fn
						ClientId:               string | fn.#Fn
						ClientSecret:           string | fn.#Fn
						ConnectorOAuthRequest?: {
							AuthCode?:    string | fn.#Fn
							RedirectUri?: string | fn.#Fn
						} | fn.#If
					} | fn.#If
					Redshift?: {
						Password: string | fn.#Fn
						Username: string | fn.#Fn
					} | fn.#If
					Salesforce?: {
						AccessToken?:           string | fn.#Fn
						ClientCredentialsArn?:  string | fn.#Fn
						ConnectorOAuthRequest?: {
							AuthCode?:    string | fn.#Fn
							RedirectUri?: string | fn.#Fn
						} | fn.#If
						RefreshToken?: string | fn.#Fn
					} | fn.#If
					ServiceNow?: {
						Password: string | fn.#Fn
						Username: string | fn.#Fn
					} | fn.#If
					Singular?: {
						ApiKey: string | fn.#Fn
					} | fn.#If
					Slack?: {
						AccessToken?:           string | fn.#Fn
						ClientId:               string | fn.#Fn
						ClientSecret:           string | fn.#Fn
						ConnectorOAuthRequest?: {
							AuthCode?:    string | fn.#Fn
							RedirectUri?: string | fn.#Fn
						} | fn.#If
					} | fn.#If
					Snowflake?: {
						Password: string | fn.#Fn
						Username: string | fn.#Fn
					} | fn.#If
					Trendmicro?: {
						ApiSecretKey: string | fn.#Fn
					} | fn.#If
					Veeva?: {
						Password: string | fn.#Fn
						Username: string | fn.#Fn
					} | fn.#If
					Zendesk?: {
						AccessToken?:           string | fn.#Fn
						ClientId:               string | fn.#Fn
						ClientSecret:           string | fn.#Fn
						ConnectorOAuthRequest?: {
							AuthCode?:    string | fn.#Fn
							RedirectUri?: string | fn.#Fn
						} | fn.#If
					} | fn.#If
				} | fn.#If
				ConnectorProfileProperties?: {
					Datadog?: {
						InstanceUrl: string | fn.#Fn
					} | fn.#If
					Dynatrace?: {
						InstanceUrl: string | fn.#Fn
					} | fn.#If
					InforNexus?: {
						InstanceUrl: string | fn.#Fn
					} | fn.#If
					Marketo?: {
						InstanceUrl: string | fn.#Fn
					} | fn.#If
					Redshift?: {
						BucketName:    string | fn.#Fn
						BucketPrefix?: string | fn.#Fn
						DatabaseUrl:   string | fn.#Fn
						RoleArn:       string | fn.#Fn
					} | fn.#If
					Salesforce?: {
						InstanceUrl?:          string | fn.#Fn
						isSandboxEnvironment?: bool | fn.#Fn
					} | fn.#If
					ServiceNow?: {
						InstanceUrl: string | fn.#Fn
					} | fn.#If
					Slack?: {
						InstanceUrl: string | fn.#Fn
					} | fn.#If
					Snowflake?: {
						AccountName?:            string | fn.#Fn
						BucketName:              string | fn.#Fn
						BucketPrefix?:           string | fn.#Fn
						PrivateLinkServiceName?: string | fn.#Fn
						Region?:                 string | fn.#Fn
						Stage:                   string | fn.#Fn
						Warehouse:               string | fn.#Fn
					} | fn.#If
					Veeva?: {
						InstanceUrl: string | fn.#Fn
					} | fn.#If
					Zendesk?: {
						InstanceUrl: string | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			ConnectorProfileName: string | fn.#Fn
			ConnectorType:        string | fn.#Fn
			KMSArn?:              string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Flow: {
		Type: "AWS::AppFlow::Flow"
		Properties: {
			Description?:              string | fn.#Fn
			DestinationFlowConfigList: [...{
				ConnectorProfileName?:          string | fn.#Fn
				ConnectorType:                  string | fn.#Fn
				DestinationConnectorProperties: {
					EventBridge?: {
						ErrorHandlingConfig?: {
							BucketName?:       string | fn.#Fn
							BucketPrefix?:     string | fn.#Fn
							FailOnFirstError?: bool | fn.#Fn
						} | fn.#If
						Object: string | fn.#Fn
					} | fn.#If
					Redshift?: {
						BucketPrefix?:        string | fn.#Fn
						ErrorHandlingConfig?: {
							BucketName?:       string | fn.#Fn
							BucketPrefix?:     string | fn.#Fn
							FailOnFirstError?: bool | fn.#Fn
						} | fn.#If
						IntermediateBucketName: string | fn.#Fn
						Object:                 string | fn.#Fn
					} | fn.#If
					S3?: {
						BucketName:            string | fn.#Fn
						BucketPrefix?:         string | fn.#Fn
						S3OutputFormatConfig?: {
							AggregationConfig?: {
								AggregationType?: string | fn.#Fn
							} | fn.#If
							FileType?:     string | fn.#Fn
							PrefixConfig?: {
								PrefixFormat?: string | fn.#Fn
								PrefixType?:   string | fn.#Fn
							} | fn.#If
						} | fn.#If
					} | fn.#If
					Salesforce?: {
						ErrorHandlingConfig?: {
							BucketName?:       string | fn.#Fn
							BucketPrefix?:     string | fn.#Fn
							FailOnFirstError?: bool | fn.#Fn
						} | fn.#If
						Object: string | fn.#Fn
					} | fn.#If
					Snowflake?: {
						BucketPrefix?:        string | fn.#Fn
						ErrorHandlingConfig?: {
							BucketName?:       string | fn.#Fn
							BucketPrefix?:     string | fn.#Fn
							FailOnFirstError?: bool | fn.#Fn
						} | fn.#If
						IntermediateBucketName: string | fn.#Fn
						Object:                 string | fn.#Fn
					} | fn.#If
					Upsolver?: {
						BucketName:           string | fn.#Fn
						BucketPrefix?:        string | fn.#Fn
						S3OutputFormatConfig: {
							AggregationConfig?: {
								AggregationType?: string | fn.#Fn
							} | fn.#If
							FileType?:    string | fn.#Fn
							PrefixConfig: {
								PrefixFormat?: string | fn.#Fn
								PrefixType?:   string | fn.#Fn
							} | fn.#If
						} | fn.#If
					} | fn.#If
				} | fn.#If
			}] | fn.#If
			FlowName:         string | fn.#Fn
			KMSArn?:          string | fn.#Fn
			SourceFlowConfig: {
				ConnectorProfileName?:  string | fn.#Fn
				ConnectorType:          string | fn.#Fn
				IncrementalPullConfig?: {
					DatetimeTypeFieldName?: string | fn.#Fn
				} | fn.#If
				SourceConnectorProperties: {
					Amplitude?: {
						Object: string | fn.#Fn
					} | fn.#If
					Datadog?: {
						Object: string | fn.#Fn
					} | fn.#If
					Dynatrace?: {
						Object: string | fn.#Fn
					} | fn.#If
					GoogleAnalytics?: {
						Object: string | fn.#Fn
					} | fn.#If
					InforNexus?: {
						Object: string | fn.#Fn
					} | fn.#If
					Marketo?: {
						Object: string | fn.#Fn
					} | fn.#If
					S3?: {
						BucketName:   string | fn.#Fn
						BucketPrefix: string | fn.#Fn
					} | fn.#If
					Salesforce?: {
						EnableDynamicFieldUpdate?: bool | fn.#Fn
						IncludeDeletedRecords?:    bool | fn.#Fn
						Object:                    string | fn.#Fn
					} | fn.#If
					ServiceNow?: {
						Object: string | fn.#Fn
					} | fn.#If
					Singular?: {
						Object: string | fn.#Fn
					} | fn.#If
					Slack?: {
						Object: string | fn.#Fn
					} | fn.#If
					Trendmicro?: {
						Object: string | fn.#Fn
					} | fn.#If
					Veeva?: {
						Object: string | fn.#Fn
					} | fn.#If
					Zendesk?: {
						Object: string | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			Tasks: [...{
				ConnectorOperator?: {
					Amplitude?:       string | fn.#Fn
					Datadog?:         string | fn.#Fn
					Dynatrace?:       string | fn.#Fn
					GoogleAnalytics?: string | fn.#Fn
					InforNexus?:      string | fn.#Fn
					Marketo?:         string | fn.#Fn
					S3?:              string | fn.#Fn
					Salesforce?:      string | fn.#Fn
					ServiceNow?:      string | fn.#Fn
					Singular?:        string | fn.#Fn
					Slack?:           string | fn.#Fn
					Trendmicro?:      string | fn.#Fn
					Veeva?:           string | fn.#Fn
					Zendesk?:         string | fn.#Fn
				} | fn.#If
				DestinationField?: string | fn.#Fn
				SourceFields:      [...(string | fn.#Fn)] | (string | fn.#Fn)
				TaskProperties?:   [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
				TaskType: string | fn.#Fn
			}] | fn.#If
			TriggerConfig: {
				TriggerProperties?: {
					DataPullMode?:      string | fn.#Fn
					ScheduleEndTime?:   number | fn.#Fn
					ScheduleExpression: string | fn.#Fn
					ScheduleStartTime?: number | fn.#Fn
					TimeZone?:          string | fn.#Fn
				} | fn.#If
				TriggerType: string | fn.#Fn
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

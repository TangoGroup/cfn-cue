package apsoutheast2

import "github.com/TangoGroup/aws/fn"

AppFlow :: {
	ConnectorProfile :: {
		Type:       "AWS::AppFlow::ConnectorProfile"
		Properties: close({
			ConnectionMode:          string | fn.Fn
			ConnectorProfileConfig?: close({
				ConnectorProfileCredentials: close({
					Amplitude?: close({
						ApiKey:    string | fn.Fn
						SecretKey: string | fn.Fn
					}) | fn.If
					Datadog?: close({
						ApiKey:         string | fn.Fn
						ApplicationKey: string | fn.Fn
					}) | fn.If
					Dynatrace?: close({
						ApiToken: string | fn.Fn
					}) | fn.If
					GoogleAnalytics?: close({
						AccessToken?:           string | fn.Fn
						ClientId:               string | fn.Fn
						ClientSecret:           string | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
						RefreshToken?: string | fn.Fn
					}) | fn.If
					InforNexus?: close({
						AccessKeyId:     string | fn.Fn
						Datakey:         string | fn.Fn
						SecretAccessKey: string | fn.Fn
						UserId:          string | fn.Fn
					}) | fn.If
					Marketo?: close({
						AccessToken?:           string | fn.Fn
						ClientId:               string | fn.Fn
						ClientSecret:           string | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
					}) | fn.If
					Redshift?: close({
						Password: string | fn.Fn
						Username: string | fn.Fn
					}) | fn.If
					Salesforce?: close({
						AccessToken?:           string | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
						RefreshToken?: string | fn.Fn
					}) | fn.If
					ServiceNow?: close({
						Password: string | fn.Fn
						Username: string | fn.Fn
					}) | fn.If
					Singular?: close({
						ApiKey: string | fn.Fn
					}) | fn.If
					Slack?: close({
						AccessToken?:           string | fn.Fn
						ClientId:               string | fn.Fn
						ClientSecret:           string | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
					}) | fn.If
					Snowflake?: close({
						Password: string | fn.Fn
						Username: string | fn.Fn
					}) | fn.If
					Trendmicro?: close({
						ApiSecretKey: string | fn.Fn
					}) | fn.If
					Veeva?: close({
						Password: string | fn.Fn
						Username: string | fn.Fn
					}) | fn.If
					Zendesk?: close({
						AccessToken?:           string | fn.Fn
						ClientId:               string | fn.Fn
						ClientSecret:           string | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
				ConnectorProfileProperties?: close({
					Datadog?: close({
						InstanceUrl: string | fn.Fn
					}) | fn.If
					Dynatrace?: close({
						InstanceUrl: string | fn.Fn
					}) | fn.If
					InforNexus?: close({
						InstanceUrl: string | fn.Fn
					}) | fn.If
					Marketo?: close({
						InstanceUrl: string | fn.Fn
					}) | fn.If
					Redshift?: close({
						BucketName:    string | fn.Fn
						BucketPrefix?: string | fn.Fn
						DatabaseUrl:   string | fn.Fn
						RoleArn:       string | fn.Fn
					}) | fn.If
					Salesforce?: close({
						InstanceUrl?:          string | fn.Fn
						isSandboxEnvironment?: bool | fn.Fn
					}) | fn.If
					ServiceNow?: close({
						InstanceUrl: string | fn.Fn
					}) | fn.If
					Slack?: close({
						InstanceUrl: string | fn.Fn
					}) | fn.If
					Snowflake?: close({
						AccountName?:            string | fn.Fn
						BucketName:              string | fn.Fn
						BucketPrefix?:           string | fn.Fn
						PrivateLinkServiceName?: string | fn.Fn
						Region?:                 string | fn.Fn
						Stage:                   string | fn.Fn
						Warehouse:               string | fn.Fn
					}) | fn.If
					Veeva?: close({
						InstanceUrl: string | fn.Fn
					}) | fn.If
					Zendesk?: close({
						InstanceUrl: string | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			ConnectorProfileName: string | fn.Fn
			ConnectorType:        string | fn.Fn
			KMSArn?:              string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Flow :: {
		Type:       "AWS::AppFlow::Flow"
		Properties: close({
			Description?:              string | fn.Fn
			DestinationFlowConfigList: [...close({
				ConnectorProfileName?:          string | fn.Fn
				ConnectorType:                  string | fn.Fn
				DestinationConnectorProperties: close({
					EventBridge?: close({
						ErrorHandlingConfig?: close({
							BucketName?:       string | fn.Fn
							BucketPrefix?:     string | fn.Fn
							FailOnFirstError?: bool | fn.Fn
						}) | fn.If
						Object: string | fn.Fn
					}) | fn.If
					Redshift?: close({
						BucketPrefix?:        string | fn.Fn
						ErrorHandlingConfig?: close({
							BucketName?:       string | fn.Fn
							BucketPrefix?:     string | fn.Fn
							FailOnFirstError?: bool | fn.Fn
						}) | fn.If
						IntermediateBucketName: string | fn.Fn
						Object:                 string | fn.Fn
					}) | fn.If
					S3?: close({
						BucketName:            string | fn.Fn
						BucketPrefix?:         string | fn.Fn
						S3OutputFormatConfig?: close({
							AggregationConfig?: close({
								AggregationType?: string | fn.Fn
							}) | fn.If
							FileType?:     string | fn.Fn
							PrefixConfig?: close({
								PrefixFormat?: string | fn.Fn
								PrefixType?:   string | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					Salesforce?: close({
						ErrorHandlingConfig?: close({
							BucketName?:       string | fn.Fn
							BucketPrefix?:     string | fn.Fn
							FailOnFirstError?: bool | fn.Fn
						}) | fn.If
						Object: string | fn.Fn
					}) | fn.If
					Snowflake?: close({
						BucketPrefix?:        string | fn.Fn
						ErrorHandlingConfig?: close({
							BucketName?:       string | fn.Fn
							BucketPrefix?:     string | fn.Fn
							FailOnFirstError?: bool | fn.Fn
						}) | fn.If
						IntermediateBucketName: string | fn.Fn
						Object:                 string | fn.Fn
					}) | fn.If
				}) | fn.If
			})] | fn.If
			FlowName:         string | fn.Fn
			KMSArn?:          string | fn.Fn
			SourceFlowConfig: close({
				ConnectorProfileName?:     string | fn.Fn
				ConnectorType:             string | fn.Fn
				SourceConnectorProperties: close({
					Amplitude?: close({
						Object: string | fn.Fn
					}) | fn.If
					Datadog?: close({
						Object: string | fn.Fn
					}) | fn.If
					Dynatrace?: close({
						Object: string | fn.Fn
					}) | fn.If
					GoogleAnalytics?: close({
						Object: string | fn.Fn
					}) | fn.If
					InforNexus?: close({
						Object: string | fn.Fn
					}) | fn.If
					Marketo?: close({
						Object: string | fn.Fn
					}) | fn.If
					S3?: close({
						BucketName:   string | fn.Fn
						BucketPrefix: string | fn.Fn
					}) | fn.If
					Salesforce?: close({
						EnableDynamicFieldUpdate?: bool | fn.Fn
						IncludeDeletedRecords?:    bool | fn.Fn
						Object:                    string | fn.Fn
					}) | fn.If
					ServiceNow?: close({
						Object: string | fn.Fn
					}) | fn.If
					Singular?: close({
						Object: string | fn.Fn
					}) | fn.If
					Slack?: close({
						Object: string | fn.Fn
					}) | fn.If
					Trendmicro?: close({
						Object: string | fn.Fn
					}) | fn.If
					Veeva?: close({
						Object: string | fn.Fn
					}) | fn.If
					Zendesk?: close({
						Object: string | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Tasks: [...close({
				ConnectorOperator?: close({
					Amplitude?:       string | fn.Fn
					Datadog?:         string | fn.Fn
					Dynatrace?:       string | fn.Fn
					GoogleAnalytics?: string | fn.Fn
					InforNexus?:      string | fn.Fn
					Marketo?:         string | fn.Fn
					S3?:              string | fn.Fn
					Salesforce?:      string | fn.Fn
					ServiceNow?:      string | fn.Fn
					Singular?:        string | fn.Fn
					Slack?:           string | fn.Fn
					Trendmicro?:      string | fn.Fn
					Veeva?:           string | fn.Fn
					Zendesk?:         string | fn.Fn
				}) | fn.If
				DestinationField?: string | fn.Fn
				SourceFields:      [...(string | fn.Fn)] | (string | fn.Fn)
				TaskProperties?:   [...close({
					Key:   string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
				TaskType: string | fn.Fn
			})] | fn.If
			TriggerConfig: close({
				TriggerProperties?: close({
					DataPullMode?:      string | fn.Fn
					ScheduleEndTime?:   number | fn.Fn
					ScheduleExpression: string | fn.Fn
					ScheduleStartTime?: number | fn.Fn
					TimeZone?:          string | fn.Fn
				}) | fn.If
				TriggerType: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

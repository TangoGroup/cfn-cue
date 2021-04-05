package uswest2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

AppFlow :: {
	ConnectorProfile :: {
		Type:       "AWS::AppFlow::ConnectorProfile"
		Properties: close({
			ConnectionMode:          ("Public" | "Private") | fn.Fn
			ConnectorProfileConfig?: close({
				ConnectorProfileCredentials: close({
					Amplitude?: close({
						ApiKey:    (=~#"\S+"#) | fn.Fn
						SecretKey: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Datadog?: close({
						ApiKey:         (=~#"\S+"#) | fn.Fn
						ApplicationKey: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Dynatrace?: close({
						ApiToken: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					GoogleAnalytics?: close({
						AccessToken?:           (=~#"\S+"#) | fn.Fn
						ClientId:               (=~#"\S+"#) | fn.Fn
						ClientSecret:           (=~#"\S+"#) | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
						RefreshToken?: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					InforNexus?: close({
						AccessKeyId:     (=~#"\S+"#) | fn.Fn
						Datakey:         (=~#"\S+"#) | fn.Fn
						SecretAccessKey: (=~#"\S+"#) | fn.Fn
						UserId:          (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Marketo?: close({
						AccessToken?:           (=~#"\S+"#) | fn.Fn
						ClientId:               (=~#"\S+"#) | fn.Fn
						ClientSecret:           (=~#"\S+"#) | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
					}) | fn.If
					Redshift?: close({
						Password: (=~#"\S+"#) | fn.Fn
						Username: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Salesforce?: close({
						AccessToken?:           (=~#"\S+"#) | fn.Fn
						ClientCredentialsArn?:  (=~#"arn:aws:secretsmanager:.*:[0-9]+:.*"#) | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
						RefreshToken?: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					ServiceNow?: close({
						Password: (=~#"\S+"#) | fn.Fn
						Username: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Singular?: close({
						ApiKey: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Slack?: close({
						AccessToken?:           (=~#"\S+"#) | fn.Fn
						ClientId:               (=~#"\S+"#) | fn.Fn
						ClientSecret:           (=~#"\S+"#) | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
					}) | fn.If
					Snowflake?: close({
						Password: (=~#"\S+"#) | fn.Fn
						Username: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Trendmicro?: close({
						ApiSecretKey: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Veeva?: close({
						Password: (=~#"\S+"#) | fn.Fn
						Username: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Zendesk?: close({
						AccessToken?:           (=~#"\S+"#) | fn.Fn
						ClientId:               (=~#"\S+"#) | fn.Fn
						ClientSecret:           (=~#"\S+"#) | fn.Fn
						ConnectorOAuthRequest?: close({
							AuthCode?:    string | fn.Fn
							RedirectUri?: string | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
				ConnectorProfileProperties?: close({
					Datadog?: close({
						InstanceUrl: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Dynatrace?: close({
						InstanceUrl: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					InforNexus?: close({
						InstanceUrl: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Marketo?: close({
						InstanceUrl: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Redshift?: close({
						BucketName:    (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
						BucketPrefix?: string | fn.Fn
						DatabaseUrl:   (=~#"\S+"#) | fn.Fn
						RoleArn:       (=~#"arn:aws:iam:.*:[0-9]+:.*"#) | fn.Fn
					}) | fn.If
					Salesforce?: close({
						InstanceUrl?:          (=~#"\S+"#) | fn.Fn
						isSandboxEnvironment?: bool | fn.Fn
					}) | fn.If
					ServiceNow?: close({
						InstanceUrl: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Slack?: close({
						InstanceUrl: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Snowflake?: close({
						AccountName?:            (=~#"\S+"#) | fn.Fn
						BucketName:              (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
						BucketPrefix?:           string | fn.Fn
						PrivateLinkServiceName?: (=~#"\S+"#) | fn.Fn
						Region?:                 (=~#"\S+"#) | fn.Fn
						Stage:                   (=~#"\S+"#) | fn.Fn
						Warehouse:               (=~#"[\s\w/!@#+=.-]*"#) | fn.Fn
					}) | fn.If
					Veeva?: close({
						InstanceUrl: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Zendesk?: close({
						InstanceUrl: (=~#"\S+"#) | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			ConnectorProfileName: (=~#"[\w/!@#+=.-]+"#) | fn.Fn
			ConnectorType:        ("Salesforce" | "Singular" | "Slack" | "Redshift" | "Marketo" | "Googleanalytics" | "Zendesk" | "Servicenow" | "Datadog" | "Trendmicro" | "Snowflake" | "Dynatrace" | "Infornexus" | "Amplitude" | "Veeva") | fn.Fn
			KMSArn?:              (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"arn:aws:kms:.*:[0-9]+:.*"#)) | fn.Fn
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
			Description?:              (=~#"[\w!@#\-.?,\s]*"#) | fn.Fn
			DestinationFlowConfigList: [...close({
				ConnectorProfileName?:          (=~#"[\w/!@#+=.-]+"#) | fn.Fn
				ConnectorType:                  ("Salesforce" | "Singular" | "Slack" | "Redshift" | "S3" | "Marketo" | "Googleanalytics" | "Zendesk" | "Servicenow" | "Datadog" | "Trendmicro" | "Snowflake" | "Dynatrace" | "Infornexus" | "Amplitude" | "Veeva" | "EventBridge" | "Upsolver" | "LookoutMetrics") | fn.Fn
				DestinationConnectorProperties: close({
					EventBridge?: close({
						ErrorHandlingConfig?: close({
							BucketName?:       (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
							BucketPrefix?:     string | fn.Fn
							FailOnFirstError?: bool | fn.Fn
						}) | fn.If
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					LookoutMetrics?: close({
						Object?: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Redshift?: close({
						BucketPrefix?:        string | fn.Fn
						ErrorHandlingConfig?: close({
							BucketName?:       (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
							BucketPrefix?:     string | fn.Fn
							FailOnFirstError?: bool | fn.Fn
						}) | fn.If
						IntermediateBucketName: (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
						Object:                 (=~#"\S+"#) | fn.Fn
					}) | fn.If
					S3?: close({
						BucketName:            (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
						BucketPrefix?:         string | fn.Fn
						S3OutputFormatConfig?: close({
							AggregationConfig?: close({
								AggregationType?: ("None" | "SingleFile") | fn.Fn
							}) | fn.If
							FileType?:     ("CSV" | "JSON" | "PARQUET") | fn.Fn
							PrefixConfig?: close({
								PrefixFormat?: ("YEAR" | "MONTH" | "DAY" | "HOUR" | "MINUTE") | fn.Fn
								PrefixType?:   ("FILENAME" | "PATH" | "PATH_AND_FILENAME") | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
					Salesforce?: close({
						ErrorHandlingConfig?: close({
							BucketName?:       (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
							BucketPrefix?:     string | fn.Fn
							FailOnFirstError?: bool | fn.Fn
						}) | fn.If
						IdFieldNames?: close({
							IdFieldNamesList?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						Object:              (=~#"\S+"#) | fn.Fn
						WriteOperationType?: ("INSERT" | "UPSERT" | "UPDATE") | fn.Fn
					}) | fn.If
					Snowflake?: close({
						BucketPrefix?:        string | fn.Fn
						ErrorHandlingConfig?: close({
							BucketName?:       (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
							BucketPrefix?:     string | fn.Fn
							FailOnFirstError?: bool | fn.Fn
						}) | fn.If
						IntermediateBucketName: (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
						Object:                 (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Upsolver?: close({
						BucketName:           (strings.MinRunes(16) & strings.MaxRunes(63) & (=~#"^(upsolver-appflow)\S*"#)) | fn.Fn
						BucketPrefix?:        string | fn.Fn
						S3OutputFormatConfig: close({
							AggregationConfig?: close({
								AggregationType?: ("None" | "SingleFile") | fn.Fn
							}) | fn.If
							FileType?:    ("CSV" | "JSON" | "PARQUET") | fn.Fn
							PrefixConfig: close({
								PrefixFormat?: ("YEAR" | "MONTH" | "DAY" | "HOUR" | "MINUTE") | fn.Fn
								PrefixType?:   ("FILENAME" | "PATH" | "PATH_AND_FILENAME") | fn.Fn
							}) | fn.If
						}) | fn.If
					}) | fn.If
				}) | fn.If
			})] | fn.If
			FlowName:         (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[a-zA-Z0-9][\w!@#.-]+"#)) | fn.Fn
			KMSArn?:          (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"arn:aws:kms:.*:[0-9]+:.*"#)) | fn.Fn
			SourceFlowConfig: close({
				ConnectorProfileName?:  (=~#"[\w/!@#+=.-]+"#) | fn.Fn
				ConnectorType:          ("Salesforce" | "Singular" | "Slack" | "Redshift" | "S3" | "Marketo" | "Googleanalytics" | "Zendesk" | "Servicenow" | "Datadog" | "Trendmicro" | "Snowflake" | "Dynatrace" | "Infornexus" | "Amplitude" | "Veeva" | "EventBridge" | "Upsolver" | "LookoutMetrics") | fn.Fn
				IncrementalPullConfig?: close({
					DatetimeTypeFieldName?: string | fn.Fn
				}) | fn.If
				SourceConnectorProperties: close({
					Amplitude?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Datadog?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Dynatrace?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					GoogleAnalytics?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					InforNexus?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Marketo?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					S3?: close({
						BucketName:   (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"\S+"#)) | fn.Fn
						BucketPrefix: string | fn.Fn
					}) | fn.If
					Salesforce?: close({
						EnableDynamicFieldUpdate?: bool | fn.Fn
						IncludeDeletedRecords?:    bool | fn.Fn
						Object:                    (=~#"\S+"#) | fn.Fn
					}) | fn.If
					ServiceNow?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Singular?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Slack?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Trendmicro?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Veeva?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
					Zendesk?: close({
						Object: (=~#"\S+"#) | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Tasks: [...close({
				ConnectorOperator?: close({
					Amplitude?:       ("BETWEEN") | fn.Fn
					Datadog?:         ("PROJECTION" | "BETWEEN" | "EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					Dynatrace?:       ("PROJECTION" | "BETWEEN" | "EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					GoogleAnalytics?: ("PROJECTION" | "BETWEEN") | fn.Fn
					InforNexus?:      ("PROJECTION" | "BETWEEN" | "EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					Marketo?:         ("PROJECTION" | "LESS_THAN" | "GREATER_THAN" | "BETWEEN" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					S3?:              ("PROJECTION" | "LESS_THAN" | "GREATER_THAN" | "BETWEEN" | "LESS_THAN_OR_EQUAL_TO" | "GREATER_THAN_OR_EQUAL_TO" | "EQUAL_TO" | "NOT_EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					Salesforce?:      ("PROJECTION" | "LESS_THAN" | "CONTAINS" | "GREATER_THAN" | "BETWEEN" | "LESS_THAN_OR_EQUAL_TO" | "GREATER_THAN_OR_EQUAL_TO" | "EQUAL_TO" | "NOT_EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					ServiceNow?:      ("PROJECTION" | "LESS_THAN" | "CONTAINS" | "GREATER_THAN" | "BETWEEN" | "LESS_THAN_OR_EQUAL_TO" | "GREATER_THAN_OR_EQUAL_TO" | "EQUAL_TO" | "NOT_EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					Singular?:        ("PROJECTION" | "EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					Slack?:           ("PROJECTION" | "BETWEEN" | "EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					Trendmicro?:      ("PROJECTION" | "EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					Veeva?:           ("PROJECTION" | "LESS_THAN" | "GREATER_THAN" | "BETWEEN" | "LESS_THAN_OR_EQUAL_TO" | "GREATER_THAN_OR_EQUAL_TO" | "EQUAL_TO" | "NOT_EQUAL_TO" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
					Zendesk?:         ("PROJECTION" | "GREATER_THAN" | "ADDITION" | "MULTIPLICATION" | "DIVISION" | "SUBTRACTION" | "MASK_ALL" | "MASK_FIRST_N" | "MASK_LAST_N" | "VALIDATE_NON_NULL" | "VALIDATE_NON_ZERO" | "VALIDATE_NON_NEGATIVE" | "VALIDATE_NUMERIC" | "NO_OP") | fn.Fn
				}) | fn.If
				DestinationField?: string | fn.Fn
				SourceFields:      [...(string | fn.Fn)] | (string | fn.Fn)
				TaskProperties?:   [...close({
					Key:   ("VALUE" | "VALUES" | "DATA_TYPE" | "UPPER_BOUND" | "LOWER_BOUND" | "SOURCE_DATA_TYPE" | "DESTINATION_DATA_TYPE" | "VALIDATION_ACTION" | "MASK_VALUE" | "MASK_LENGTH" | "TRUNCATE_LENGTH" | "MATH_OPERATION_FIELDS_ORDER" | "CONCAT_FORMAT" | "SUBFIELD_CATEGORY_MAP") | fn.Fn
					Value: (=~#".+"#) | fn.Fn
				})] | fn.If
				TaskType: ("Arithmetic" | "Filter" | "Map" | "Mask" | "Merge" | "Truncate" | "Validate") | fn.Fn
			})] | fn.If
			TriggerConfig: close({
				TriggerProperties?: close({
					DataPullMode?:      ("Incremental" | "Complete") | fn.Fn
					ScheduleEndTime?:   number | fn.Fn
					ScheduleExpression: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
					ScheduleStartTime?: number | fn.Fn
					TimeZone?:          string | fn.Fn
				}) | fn.If
				TriggerType: ("Scheduled" | "Event" | "OnDemand") | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

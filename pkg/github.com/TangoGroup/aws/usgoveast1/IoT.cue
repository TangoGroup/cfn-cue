package usgoveast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

IoT :: {
	AccountAuditConfiguration :: {
		Type:       "AWS::IoT::AccountAuditConfiguration"
		Properties: close({
			AccountId:                (strings.MinRunes(12) & strings.MaxRunes(12)) | fn.Fn
			AuditCheckConfigurations: close({
				AuthenticatedCognitoRoleOverlyPermissiveCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				CaCertificateExpiringCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				CaCertificateKeyQualityCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				ConflictingClientIdsCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				DeviceCertificateExpiringCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				DeviceCertificateKeyQualityCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				DeviceCertificateSharedCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				IotPolicyOverlyPermissiveCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				IotRoleAliasAllowsAccessToUnusedServicesCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				IotRoleAliasOverlyPermissiveCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				LoggingDisabledCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				RevokedCaCertificateStillActiveCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				RevokedDeviceCertificateStillActiveCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
				UnauthenticatedCognitoRoleOverlyPermissiveCheck?: close({
					Enabled?: bool | fn.Fn
				}) | fn.If
			}) | fn.If
			AuditNotificationTargetConfigurations?: close({
				Sns?: close({
					Enabled?:   bool | fn.Fn
					RoleArn?:   (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
					TargetArn?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			RoleArn: (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Authorizer :: {
		Type:       "AWS::IoT::Authorizer"
		Properties: close({
			AuthorizerFunctionArn: string | fn.Fn
			AuthorizerName?:       (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[\w=,@-]+"#)) | fn.Fn
			SigningDisabled?:      bool | fn.Fn
			Status?:               ("ACTIVE" | "INACTIVE") | fn.Fn
			Tags?:                 [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TokenKeyName?:           string | fn.Fn
			TokenSigningPublicKeys?: {
				[string]: string | fn.Fn
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Certificate :: {
		Type:       "AWS::IoT::Certificate"
		Properties: close({
			CACertificatePem?:          (strings.MinRunes(1) & strings.MaxRunes(65536)) | fn.Fn
			CertificateMode?:           ("DEFAULT" | "SNI_ONLY") | fn.Fn
			CertificatePem?:            (strings.MinRunes(1) & strings.MaxRunes(65536)) | fn.Fn
			CertificateSigningRequest?: string | fn.Fn
			Status:                     ("ACTIVE" | "INACTIVE" | "REVOKED" | "PENDING_TRANSFER" | "PENDING_ACTIVATION") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	CustomMetric :: {
		Type:       "AWS::IoT::CustomMetric"
		Properties: close({
			DisplayName?: string | fn.Fn
			MetricName?:  (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
			MetricType:   ("string-list" | "ip-address-list" | "number-list" | "number") | fn.Fn
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
	Dimension :: {
		Type:       "AWS::IoT::Dimension"
		Properties: close({
			Name?:        (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
			StringValues: [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
			Tags?:        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: ("TOPIC_FILTER") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MitigationAction :: {
		Type:       "AWS::IoT::MitigationAction"
		Properties: close({
			ActionName?:  (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
			ActionParams: close({
				AddThingsToThingGroupParams?: close({
					OverrideDynamicGroups?: bool | fn.Fn
					ThingGroupNames:        [...((strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn)
				}) | fn.If
				EnableIoTLoggingParams?: close({
					LogLevel:          ("DEBUG" | "INFO" | "ERROR" | "WARN") | fn.Fn
					RoleArnForLogging: (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
				}) | fn.If
				PublishFindingToSnsParams?: close({
					TopicArn: (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
				}) | fn.If
				ReplaceDefaultPolicyVersionParams?: close({
					TemplateName: ("BLANK_POLICY") | fn.Fn
				}) | fn.If
				UpdateCACertificateParams?: close({
					Action: ("DEACTIVATE") | fn.Fn
				}) | fn.If
				UpdateDeviceCertificateParams?: close({
					Action: ("DEACTIVATE") | fn.Fn
				}) | fn.If
			}) | fn.If
			RoleArn: string | fn.Fn
			Tags?:   [...close({
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
	Policy :: {
		Type:       "AWS::IoT::Policy"
		Properties: close({
			PolicyDocument: {
				[string]: _
				Version:  string | *"2012-10-17"
			} | fn.Fn
			PolicyName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PolicyPrincipalAttachment :: {
		Type:       "AWS::IoT::PolicyPrincipalAttachment"
		Properties: close({
			PolicyName: string | fn.Fn
			Principal:  string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ProvisioningTemplate :: {
		Type:       "AWS::IoT::ProvisioningTemplate"
		Properties: close({
			Description?:         string | fn.Fn
			Enabled?:             bool | fn.Fn
			PreProvisioningHook?: close({
				PayloadVersion?: string | fn.Fn
				TargetArn?:      string | fn.Fn
			}) | fn.If
			ProvisioningRoleArn: string | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TemplateBody:  string | fn.Fn
			TemplateName?: (strings.MinRunes(1) & strings.MaxRunes(36) & (=~#"^[0-9A-Za-z_-]+$"#)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ScheduledAudit :: {
		Type:       "AWS::IoT::ScheduledAudit"
		Properties: close({
			DayOfMonth?:         (=~#"^([1-9]|[12][0-9]|3[01])$|^LAST$"#) | fn.Fn
			DayOfWeek?:          ("SUN" | "MON" | "TUE" | "WED" | "THU" | "FRI" | "SAT") | fn.Fn
			Frequency:           ("DAILY" | "WEEKLY" | "BIWEEKLY" | "MONTHLY") | fn.Fn
			ScheduledAuditName?: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TargetCheckNames: [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SecurityProfile :: {
		Type:       "AWS::IoT::SecurityProfile"
		Properties: close({
			AdditionalMetricsToRetainV2?: [...close({
				Metric:           (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
				MetricDimension?: close({
					DimensionName: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
					Operator?:     ("IN" | "NOT_IN") | fn.Fn
				}) | fn.If
			})] | fn.If
			AlertTargets?: {
				[string]: close({
					AlertTargetArn: string | fn.Fn
					RoleArn:        string | fn.Fn
				})
			} | fn.If
			Behaviors?: [...close({
				Criteria?: close({
					ComparisonOperator?:           ("less-than" | "less-than-equals" | "greater-than" | "greater-than-equals" | "in-cidr-set" | "not-in-cidr-set" | "in-port-set" | "not-in-port-set" | "in-set" | "not-in-set") | fn.Fn
					ConsecutiveDatapointsToAlarm?: (>=1 & <=10) | fn.Fn
					ConsecutiveDatapointsToClear?: (>=1 & <=10) | fn.Fn
					DurationSeconds?:              int | fn.Fn
					MlDetectionConfig?:            close({
						ConfidenceLevel?: ("LOW" | "MEDIUM" | "HIGH") | fn.Fn
					}) | fn.If
					StatisticalThreshold?: close({
						Statistic?: ("Average" | "p0" | "p0.1" | "p0.01" | "p1" | "p10" | "p50" | "p90" | "p99" | "p99.9" | "p99.99" | "p100") | fn.Fn
					}) | fn.If
					Value?: close({
						Cidrs?:   [...(string | fn.Fn)] | (string | fn.Fn)
						Count?:   string | fn.Fn
						Number?:  number | fn.Fn
						Numbers?: [...(number | fn.Fn)] | (number | fn.Fn)
						Ports?:   [...(int | fn.Fn)] | (int | fn.Fn)
						Strings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
				}) | fn.If
				Metric?:          (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
				MetricDimension?: close({
					DimensionName: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
					Operator?:     ("IN" | "NOT_IN") | fn.Fn
				}) | fn.If
				Name:            (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
				SuppressAlerts?: bool | fn.Fn
			})] | fn.If
			SecurityProfileDescription?: string | fn.Fn
			SecurityProfileName?:        (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"[a-zA-Z0-9:_-]+"#)) | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TargetArns?: [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Thing :: {
		Type:       "AWS::IoT::Thing"
		Properties: close({
			AttributePayload?: close({
				Attributes?: {
					[string]: string | fn.Fn
				} | fn.If
			}) | fn.If
			ThingName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ThingPrincipalAttachment :: {
		Type:       "AWS::IoT::ThingPrincipalAttachment"
		Properties: close({
			Principal: string | fn.Fn
			ThingName: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TopicRule :: {
		Type:       "AWS::IoT::TopicRule"
		Properties: close({
			RuleName?:        string | fn.Fn
			TopicRulePayload: close({
				Actions: [...close({
					CloudwatchAlarm?: close({
						AlarmName:   string | fn.Fn
						RoleArn:     string | fn.Fn
						StateReason: string | fn.Fn
						StateValue:  string | fn.Fn
					}) | fn.If
					CloudwatchMetric?: close({
						MetricName:       string | fn.Fn
						MetricNamespace:  string | fn.Fn
						MetricTimestamp?: string | fn.Fn
						MetricUnit:       string | fn.Fn
						MetricValue:      string | fn.Fn
						RoleArn:          string | fn.Fn
					}) | fn.If
					DynamoDB?: close({
						HashKeyField:   string | fn.Fn
						HashKeyType?:   string | fn.Fn
						HashKeyValue:   string | fn.Fn
						PayloadField?:  string | fn.Fn
						RangeKeyField?: string | fn.Fn
						RangeKeyType?:  string | fn.Fn
						RangeKeyValue?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TableName:      string | fn.Fn
					}) | fn.If
					DynamoDBv2?: close({
						PutItem?: close({
							TableName: string | fn.Fn
						}) | fn.If
						RoleArn?: string | fn.Fn
					}) | fn.If
					Elasticsearch?: close({
						Endpoint: string | fn.Fn
						Id:       string | fn.Fn
						Index:    string | fn.Fn
						RoleArn:  string | fn.Fn
						Type:     string | fn.Fn
					}) | fn.If
					Firehose?: close({
						DeliveryStreamName: string | fn.Fn
						RoleArn:            string | fn.Fn
						Separator?:         string | fn.Fn
					}) | fn.If
					Http?: close({
						Auth?: close({
							Sigv4?: close({
								RoleArn:       string | fn.Fn
								ServiceName:   string | fn.Fn
								SigningRegion: string | fn.Fn
							}) | fn.If
						}) | fn.If
						ConfirmationUrl?: string | fn.Fn
						Headers?:         [...close({
							Key:   string | fn.Fn
							Value: string | fn.Fn
						})] | fn.If
						Url: string | fn.Fn
					}) | fn.If
					IotAnalytics?: close({
						ChannelName: string | fn.Fn
						RoleArn:     string | fn.Fn
					}) | fn.If
					IotEvents?: close({
						InputName:  string | fn.Fn
						MessageId?: string | fn.Fn
						RoleArn:    string | fn.Fn
					}) | fn.If
					IotSiteWise?: close({
						PutAssetPropertyValueEntries: [...close({
							AssetId?:       string | fn.Fn
							EntryId?:       string | fn.Fn
							PropertyAlias?: string | fn.Fn
							PropertyId?:    string | fn.Fn
							PropertyValues: [...close({
								Quality?:  string | fn.Fn
								Timestamp: close({
									OffsetInNanos?: string | fn.Fn
									TimeInSeconds:  string | fn.Fn
								}) | fn.If
								Value: close({
									BooleanValue?: string | fn.Fn
									DoubleValue?:  string | fn.Fn
									IntegerValue?: string | fn.Fn
									StringValue?:  string | fn.Fn
								}) | fn.If
							})] | fn.If
						})] | fn.If
						RoleArn: string | fn.Fn
					}) | fn.If
					Kinesis?: close({
						PartitionKey?: string | fn.Fn
						RoleArn:       string | fn.Fn
						StreamName:    string | fn.Fn
					}) | fn.If
					Lambda?: close({
						FunctionArn?: string | fn.Fn
					}) | fn.If
					Republish?: close({
						Qos?:    int | fn.Fn
						RoleArn: string | fn.Fn
						Topic:   string | fn.Fn
					}) | fn.If
					S3?: close({
						BucketName: string | fn.Fn
						CannedAcl?: ("private" | "public-read" | "public-read-write" | "aws-exec-read" | "authenticated-read" | "bucket-owner-read" | "bucket-owner-full-control" | "log-delivery-write") | fn.Fn
						Key:        string | fn.Fn
						RoleArn:    string | fn.Fn
					}) | fn.If
					Sns?: close({
						MessageFormat?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TargetArn:      string | fn.Fn
					}) | fn.If
					Sqs?: close({
						QueueUrl:   string | fn.Fn
						RoleArn:    string | fn.Fn
						UseBase64?: bool | fn.Fn
					}) | fn.If
					StepFunctions?: close({
						ExecutionNamePrefix?: string | fn.Fn
						RoleArn:              string | fn.Fn
						StateMachineName:     string | fn.Fn
					}) | fn.If
				})] | fn.If
				AwsIotSqlVersion?: string | fn.Fn
				Description?:      string | fn.Fn
				ErrorAction?:      close({
					CloudwatchAlarm?: close({
						AlarmName:   string | fn.Fn
						RoleArn:     string | fn.Fn
						StateReason: string | fn.Fn
						StateValue:  string | fn.Fn
					}) | fn.If
					CloudwatchMetric?: close({
						MetricName:       string | fn.Fn
						MetricNamespace:  string | fn.Fn
						MetricTimestamp?: string | fn.Fn
						MetricUnit:       string | fn.Fn
						MetricValue:      string | fn.Fn
						RoleArn:          string | fn.Fn
					}) | fn.If
					DynamoDB?: close({
						HashKeyField:   string | fn.Fn
						HashKeyType?:   string | fn.Fn
						HashKeyValue:   string | fn.Fn
						PayloadField?:  string | fn.Fn
						RangeKeyField?: string | fn.Fn
						RangeKeyType?:  string | fn.Fn
						RangeKeyValue?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TableName:      string | fn.Fn
					}) | fn.If
					DynamoDBv2?: close({
						PutItem?: close({
							TableName: string | fn.Fn
						}) | fn.If
						RoleArn?: string | fn.Fn
					}) | fn.If
					Elasticsearch?: close({
						Endpoint: string | fn.Fn
						Id:       string | fn.Fn
						Index:    string | fn.Fn
						RoleArn:  string | fn.Fn
						Type:     string | fn.Fn
					}) | fn.If
					Firehose?: close({
						DeliveryStreamName: string | fn.Fn
						RoleArn:            string | fn.Fn
						Separator?:         string | fn.Fn
					}) | fn.If
					Http?: close({
						Auth?: close({
							Sigv4?: close({
								RoleArn:       string | fn.Fn
								ServiceName:   string | fn.Fn
								SigningRegion: string | fn.Fn
							}) | fn.If
						}) | fn.If
						ConfirmationUrl?: string | fn.Fn
						Headers?:         [...close({
							Key:   string | fn.Fn
							Value: string | fn.Fn
						})] | fn.If
						Url: string | fn.Fn
					}) | fn.If
					IotAnalytics?: close({
						ChannelName: string | fn.Fn
						RoleArn:     string | fn.Fn
					}) | fn.If
					IotEvents?: close({
						InputName:  string | fn.Fn
						MessageId?: string | fn.Fn
						RoleArn:    string | fn.Fn
					}) | fn.If
					IotSiteWise?: close({
						PutAssetPropertyValueEntries: [...close({
							AssetId?:       string | fn.Fn
							EntryId?:       string | fn.Fn
							PropertyAlias?: string | fn.Fn
							PropertyId?:    string | fn.Fn
							PropertyValues: [...close({
								Quality?:  string | fn.Fn
								Timestamp: close({
									OffsetInNanos?: string | fn.Fn
									TimeInSeconds:  string | fn.Fn
								}) | fn.If
								Value: close({
									BooleanValue?: string | fn.Fn
									DoubleValue?:  string | fn.Fn
									IntegerValue?: string | fn.Fn
									StringValue?:  string | fn.Fn
								}) | fn.If
							})] | fn.If
						})] | fn.If
						RoleArn: string | fn.Fn
					}) | fn.If
					Kinesis?: close({
						PartitionKey?: string | fn.Fn
						RoleArn:       string | fn.Fn
						StreamName:    string | fn.Fn
					}) | fn.If
					Lambda?: close({
						FunctionArn?: string | fn.Fn
					}) | fn.If
					Republish?: close({
						Qos?:    int | fn.Fn
						RoleArn: string | fn.Fn
						Topic:   string | fn.Fn
					}) | fn.If
					S3?: close({
						BucketName: string | fn.Fn
						CannedAcl?: ("private" | "public-read" | "public-read-write" | "aws-exec-read" | "authenticated-read" | "bucket-owner-read" | "bucket-owner-full-control" | "log-delivery-write") | fn.Fn
						Key:        string | fn.Fn
						RoleArn:    string | fn.Fn
					}) | fn.If
					Sns?: close({
						MessageFormat?: string | fn.Fn
						RoleArn:        string | fn.Fn
						TargetArn:      string | fn.Fn
					}) | fn.If
					Sqs?: close({
						QueueUrl:   string | fn.Fn
						RoleArn:    string | fn.Fn
						UseBase64?: bool | fn.Fn
					}) | fn.If
					StepFunctions?: close({
						ExecutionNamePrefix?: string | fn.Fn
						RoleArn:              string | fn.Fn
						StateMachineName:     string | fn.Fn
					}) | fn.If
				}) | fn.If
				RuleDisabled?: bool | fn.Fn
				Sql:           string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TopicRuleDestination :: {
		Type:       "AWS::IoT::TopicRuleDestination"
		Properties: close({
			HttpUrlProperties?: close({
				ConfirmationUrl?: string | fn.Fn
			}) | fn.If
			Status?:        ("ENABLED" | "IN_PROGRESS" | "DISABLED") | fn.Fn
			VpcProperties?: close({
				RoleArn?:        string | fn.Fn
				SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetIds?:      [...(string | fn.Fn)] | (string | fn.Fn)
				VpcId?:          string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

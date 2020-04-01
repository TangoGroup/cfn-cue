package apnortheast1

import "github.com/TangoGroup/aws/fn"

IoTAnalytics :: {
	Channel :: {
		Type:       "AWS::IoTAnalytics::Channel"
		Properties: close({
			ChannelName?:    string | fn.Fn
			ChannelStorage?: close({
				CustomerManagedS3?: close({
					Bucket:     string | fn.Fn
					KeyPrefix?: string | fn.Fn
					RoleArn:    string | fn.Fn
				}) | fn.If
				ServiceManagedS3?: close({
				}) | fn.If
			}) | fn.If
			RetentionPeriod?: close({
				NumberOfDays?: int | fn.Fn
				Unlimited?:    bool | fn.Fn
			}) | fn.If
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
	Dataset :: {
		Type:       "AWS::IoTAnalytics::Dataset"
		Properties: close({
			Actions: [...close({
				ActionName:       string | fn.Fn
				ContainerAction?: close({
					ExecutionRoleArn:      string | fn.Fn
					Image:                 string | fn.Fn
					ResourceConfiguration: close({
						ComputeType:    string | fn.Fn
						VolumeSizeInGB: int | fn.Fn
					}) | fn.If
					Variables?: [...close({
						DatasetContentVersionValue?: close({
							DatasetName?: string | fn.Fn
						}) | fn.If
						DoubleValue?:        number | fn.Fn
						OutputFileUriValue?: close({
							FileName?: string | fn.Fn
						}) | fn.If
						StringValue?: string | fn.Fn
						VariableName: string | fn.Fn
					})] | fn.If
				}) | fn.If
				QueryAction?: close({
					Filters?: [...close({
						DeltaTime?: close({
							OffsetSeconds:  int | fn.Fn
							TimeExpression: string | fn.Fn
						}) | fn.If
					})] | fn.If
					SqlQuery: string | fn.Fn
				}) | fn.If
			})] | fn.If
			ContentDeliveryRules?: [...close({
				Destination: close({
					IotEventsDestinationConfiguration?: close({
						InputName: string | fn.Fn
						RoleArn:   string | fn.Fn
					}) | fn.If
					S3DestinationConfiguration?: close({
						Bucket:             string | fn.Fn
						GlueConfiguration?: close({
							DatabaseName: string | fn.Fn
							TableName:    string | fn.Fn
						}) | fn.If
						Key:     string | fn.Fn
						RoleArn: string | fn.Fn
					}) | fn.If
				}) | fn.If
				EntryName?: string | fn.Fn
			})] | fn.If
			DatasetName?:     string | fn.Fn
			RetentionPeriod?: close({
				NumberOfDays: int | fn.Fn
				Unlimited:    bool | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Triggers?: [...close({
				Schedule?: close({
					ScheduleExpression: string | fn.Fn
				}) | fn.If
				TriggeringDataset?: close({
					DatasetName: string | fn.Fn
				}) | fn.If
			})] | fn.If
			VersioningConfiguration?: close({
				MaxVersions?: int | fn.Fn
				Unlimited?:   bool | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Datastore :: {
		Type:       "AWS::IoTAnalytics::Datastore"
		Properties: close({
			DatastoreName?:    string | fn.Fn
			DatastoreStorage?: close({
				CustomerManagedS3?: close({
					Bucket:     string | fn.Fn
					KeyPrefix?: string | fn.Fn
					RoleArn:    string | fn.Fn
				}) | fn.If
				ServiceManagedS3?: close({
				}) | fn.If
			}) | fn.If
			RetentionPeriod?: close({
				NumberOfDays?: int | fn.Fn
				Unlimited?:    bool | fn.Fn
			}) | fn.If
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
	Pipeline :: {
		Type:       "AWS::IoTAnalytics::Pipeline"
		Properties: close({
			PipelineActivities: [...close({
				AddAttributes?: close({
					Attributes?: {
						[string]: _
					} | fn.Fn
					Name?: string | fn.Fn
					Next?: string | fn.Fn
				}) | fn.If
				Channel?: close({
					ChannelName?: string | fn.Fn
					Name?:        string | fn.Fn
					Next?:        string | fn.Fn
				}) | fn.If
				Datastore?: close({
					DatastoreName?: string | fn.Fn
					Name?:          string | fn.Fn
				}) | fn.If
				DeviceRegistryEnrich?: close({
					Attribute?: string | fn.Fn
					Name?:      string | fn.Fn
					Next?:      string | fn.Fn
					RoleArn?:   string | fn.Fn
					ThingName?: string | fn.Fn
				}) | fn.If
				DeviceShadowEnrich?: close({
					Attribute?: string | fn.Fn
					Name?:      string | fn.Fn
					Next?:      string | fn.Fn
					RoleArn?:   string | fn.Fn
					ThingName?: string | fn.Fn
				}) | fn.If
				Filter?: close({
					Filter?: string | fn.Fn
					Name?:   string | fn.Fn
					Next?:   string | fn.Fn
				}) | fn.If
				Lambda?: close({
					BatchSize?:  int | fn.Fn
					LambdaName?: string | fn.Fn
					Name?:       string | fn.Fn
					Next?:       string | fn.Fn
				}) | fn.If
				Math?: close({
					Attribute?: string | fn.Fn
					Math?:      string | fn.Fn
					Name?:      string | fn.Fn
					Next?:      string | fn.Fn
				}) | fn.If
				RemoveAttributes?: close({
					Attributes?: [...(string | fn.Fn)] | (string | fn.Fn)
					Name?:       string | fn.Fn
					Next?:       string | fn.Fn
				}) | fn.If
				SelectAttributes?: close({
					Attributes?: [...(string | fn.Fn)] | (string | fn.Fn)
					Name?:       string | fn.Fn
					Next?:       string | fn.Fn
				}) | fn.If
			})] | fn.If
			PipelineName?: string | fn.Fn
			Tags?:         [...close({
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
}

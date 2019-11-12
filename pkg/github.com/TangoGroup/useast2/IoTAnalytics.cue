package useast2

import "github.com/TangoGroup/fn"

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
					Attributes?: [...(string | fn.Fn)]
					Name?: string | fn.Fn
					Next?: string | fn.Fn
				}
				SelectAttributes?: {
					Attributes?: [...(string | fn.Fn)]
					Name?: string | fn.Fn
					Next?: string | fn.Fn
				}
			}]
			PipelineName?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
	}
}

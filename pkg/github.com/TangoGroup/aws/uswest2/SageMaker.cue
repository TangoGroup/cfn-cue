package uswest2

import "github.com/TangoGroup/aws/fn"

SageMaker :: {
	CodeRepository :: {
		Type:       "AWS::SageMaker::CodeRepository"
		Properties: close({
			CodeRepositoryName?: string | fn.Fn
			GitConfig:           close({
				Branch?:       string | fn.Fn
				RepositoryUrl: string | fn.Fn
				SecretArn?:    string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Endpoint :: {
		Type:       "AWS::SageMaker::Endpoint"
		Properties: close({
			EndpointConfigName:                string | fn.Fn
			EndpointName?:                     string | fn.Fn
			ExcludeRetainedVariantProperties?: [...close({
				VariantPropertyType?: string | fn.Fn
			})] | fn.If
			RetainAllVariantProperties?: bool | fn.Fn
			Tags?:                       [...close({
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
	EndpointConfig :: {
		Type:       "AWS::SageMaker::EndpointConfig"
		Properties: close({
			DataCaptureConfig?: close({
				CaptureContentTypeHeader?: close({
					CsvContentTypes?:  [...(string | fn.Fn)] | (string | fn.Fn)
					JsonContentTypes?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				CaptureOptions: [...close({
					CaptureMode: string | fn.Fn
				})] | fn.If
				DestinationS3Uri:          string | fn.Fn
				EnableCapture?:            bool | fn.Fn
				InitialSamplingPercentage: int | fn.Fn
				KmsKeyId?:                 string | fn.Fn
			}) | fn.If
			EndpointConfigName?: string | fn.Fn
			KmsKeyId?:           string | fn.Fn
			ProductionVariants:  [...close({
				AcceleratorType?:     string | fn.Fn
				InitialInstanceCount: int | fn.Fn
				InitialVariantWeight: number | fn.Fn
				InstanceType:         string | fn.Fn
				ModelName:            string | fn.Fn
				VariantName:          string | fn.Fn
			})] | fn.If
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
	Model :: {
		Type:       "AWS::SageMaker::Model"
		Properties: close({
			Containers?: [...close({
				ContainerHostname?: string | fn.Fn
				Environment?:       {
					[string]: _
				} | fn.Fn
				Image?:       string | fn.Fn
				ImageConfig?: close({
					RepositoryAccessMode: string | fn.Fn
				}) | fn.If
				Mode?:             string | fn.Fn
				ModelDataUrl?:     string | fn.Fn
				ModelPackageName?: string | fn.Fn
				MultiModelConfig?: close({
					ModelCacheSetting?: string | fn.Fn
				}) | fn.If
			})] | fn.If
			EnableNetworkIsolation?: bool | fn.Fn
			ExecutionRoleArn:        string | fn.Fn
			ModelName?:              string | fn.Fn
			PrimaryContainer?:       close({
				ContainerHostname?: string | fn.Fn
				Environment?:       {
					[string]: _
				} | fn.Fn
				Image?:       string | fn.Fn
				ImageConfig?: close({
					RepositoryAccessMode: string | fn.Fn
				}) | fn.If
				Mode?:             string | fn.Fn
				ModelDataUrl?:     string | fn.Fn
				ModelPackageName?: string | fn.Fn
				MultiModelConfig?: close({
					ModelCacheSetting?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcConfig?: close({
				SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
				Subnets:          [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MonitoringSchedule :: {
		Type:       "AWS::SageMaker::MonitoringSchedule"
		Properties: close({
			EndpointName?:                   string | fn.Fn
			FailureReason?:                  string | fn.Fn
			LastMonitoringExecutionSummary?: close({
				CreationTime:              string | fn.Fn
				EndpointName?:             string | fn.Fn
				FailureReason?:            string | fn.Fn
				LastModifiedTime:          string | fn.Fn
				MonitoringExecutionStatus: string | fn.Fn
				MonitoringScheduleName:    string | fn.Fn
				ProcessingJobArn?:         string | fn.Fn
				ScheduledTime:             string | fn.Fn
			}) | fn.If
			MonitoringScheduleArn?:   string | fn.Fn
			MonitoringScheduleConfig: close({
				MonitoringJobDefinition: close({
					BaselineConfig?: close({
						ConstraintsResource?: close({
							S3Uri?: string | fn.Fn
						}) | fn.If
						StatisticsResource?: close({
							S3Uri?: string | fn.Fn
						}) | fn.If
					}) | fn.If
					Environment?: close({
					}) | fn.If
					MonitoringAppSpecification: close({
						ContainerArguments?:              [...(string | fn.Fn)] | (string | fn.Fn)
						ContainerEntrypoint?:             [...(string | fn.Fn)] | (string | fn.Fn)
						ImageUri:                         string | fn.Fn
						PostAnalyticsProcessorSourceUri?: string | fn.Fn
						RecordPreprocessorSourceUri?:     string | fn.Fn
					}) | fn.If
					MonitoringInputs: close({
						MonitoringInputs?: [...close({
							[string]: _
						})] | fn.If
					}) | fn.If
					MonitoringOutputConfig: close({
						KmsKeyId?:         string | fn.Fn
						MonitoringOutputs: [...close({
							S3Output: close({
								LocalPath:     string | fn.Fn
								S3UploadMode?: string | fn.Fn
								S3Uri:         string | fn.Fn
							}) | fn.If
						})] | fn.If
					}) | fn.If
					MonitoringResources: close({
						ClusterConfig: close({
							InstanceCount:   int | fn.Fn
							InstanceType:    string | fn.Fn
							VolumeKmsKeyId?: string | fn.Fn
							VolumeSizeInGB:  int | fn.Fn
						}) | fn.If
					}) | fn.If
					NetworkConfig?: close({
						EnableInterContainerTrafficEncryption?: bool | fn.Fn
						EnableNetworkIsolation?:                bool | fn.Fn
						VpcConfig?:                             close({
							SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
							Subnets:          [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
					}) | fn.If
					RoleArn:            string | fn.Fn
					StoppingCondition?: close({
						MaxRuntimeInSeconds: int | fn.Fn
					}) | fn.If
				}) | fn.If
				ScheduleConfig?: close({
					ScheduleExpression: string | fn.Fn
				}) | fn.If
			}) | fn.If
			MonitoringScheduleName:    string | fn.Fn
			MonitoringScheduleStatus?: string | fn.Fn
			Tags?:                     [...close({
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
	NotebookInstance :: {
		Type:       "AWS::SageMaker::NotebookInstance"
		Properties: close({
			AcceleratorTypes?:           [...(string | fn.Fn)] | (string | fn.Fn)
			AdditionalCodeRepositories?: [...(string | fn.Fn)] | (string | fn.Fn)
			DefaultCodeRepository?:      string | fn.Fn
			DirectInternetAccess?:       string | fn.Fn
			InstanceType:                string | fn.Fn
			KmsKeyId?:                   string | fn.Fn
			LifecycleConfigName?:        string | fn.Fn
			NotebookInstanceName?:       string | fn.Fn
			RoleArn:                     string | fn.Fn
			RootAccess?:                 string | fn.Fn
			SecurityGroupIds?:           [...(string | fn.Fn)] | (string | fn.Fn)
			SubnetId?:                   string | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VolumeSizeInGB?: (>=5 & <=16384) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	NotebookInstanceLifecycleConfig :: {
		Type:       "AWS::SageMaker::NotebookInstanceLifecycleConfig"
		Properties: close({
			NotebookInstanceLifecycleConfigName?: string | fn.Fn
			OnCreate?:                            [...close({
				Content?: string | fn.Fn
			})] | fn.If
			OnStart?: [...close({
				Content?: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Workteam :: {
		Type:       "AWS::SageMaker::Workteam"
		Properties: close({
			Description?:       string | fn.Fn
			MemberDefinitions?: [...close({
				CognitoMemberDefinition: close({
					CognitoClientId:  string | fn.Fn
					CognitoUserGroup: string | fn.Fn
					CognitoUserPool:  string | fn.Fn
				}) | fn.If
			})] | fn.If
			NotificationConfiguration?: close({
				NotificationTopicArn: string | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			WorkteamName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

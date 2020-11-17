package useast1

import "github.com/TangoGroup/aws/fn"

#SageMaker: {
	#CodeRepository: {
		Type: "AWS::SageMaker::CodeRepository"
		Properties: {
			CodeRepositoryName?: string | fn.#Fn
			GitConfig:           {
				Branch?:       string | fn.#Fn
				RepositoryUrl: string | fn.#Fn
				SecretArn?:    string | fn.#Fn
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Endpoint: {
		Type: "AWS::SageMaker::Endpoint"
		Properties: {
			EndpointConfigName:                string | fn.#Fn
			EndpointName?:                     string | fn.#Fn
			ExcludeRetainedVariantProperties?: [...{
				VariantPropertyType?: string | fn.#Fn
			}] | fn.If
			RetainAllVariantProperties?: bool | fn.#Fn
			Tags?:                       [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#EndpointConfig: {
		Type: "AWS::SageMaker::EndpointConfig"
		Properties: {
			DataCaptureConfig?: {
				CaptureContentTypeHeader?: {
					CsvContentTypes?:  [...(string | fn.#Fn)] | (string | fn.#Fn)
					JsonContentTypes?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.If
				CaptureOptions: [...{
					CaptureMode: string | fn.#Fn
				}] | fn.If
				DestinationS3Uri:          string | fn.#Fn
				EnableCapture?:            bool | fn.#Fn
				InitialSamplingPercentage: int | fn.#Fn
				KmsKeyId?:                 string | fn.#Fn
			} | fn.If
			EndpointConfigName?: string | fn.#Fn
			KmsKeyId?:           string | fn.#Fn
			ProductionVariants:  [...{
				AcceleratorType?:     string | fn.#Fn
				InitialInstanceCount: int | fn.#Fn
				InitialVariantWeight: number | fn.#Fn
				InstanceType:         string | fn.#Fn
				ModelName:            string | fn.#Fn
				VariantName:          string | fn.#Fn
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Model: {
		Type: "AWS::SageMaker::Model"
		Properties: {
			Containers?: [...{
				ContainerHostname?: string | fn.#Fn
				Environment?:       {
					[string]: _
				} | fn.#Fn
				Image?:       string | fn.#Fn
				ImageConfig?: {
					RepositoryAccessMode: string | fn.#Fn
				} | fn.If
				Mode?:             string | fn.#Fn
				ModelDataUrl?:     string | fn.#Fn
				ModelPackageName?: string | fn.#Fn
			}] | fn.If
			EnableNetworkIsolation?: bool | fn.#Fn
			ExecutionRoleArn:        string | fn.#Fn
			ModelName?:              string | fn.#Fn
			PrimaryContainer?:       {
				ContainerHostname?: string | fn.#Fn
				Environment?:       {
					[string]: _
				} | fn.#Fn
				Image?:       string | fn.#Fn
				ImageConfig?: {
					RepositoryAccessMode: string | fn.#Fn
				} | fn.If
				Mode?:             string | fn.#Fn
				ModelDataUrl?:     string | fn.#Fn
				ModelPackageName?: string | fn.#Fn
			} | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VpcConfig?: {
				SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
				Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MonitoringSchedule: {
		Type: "AWS::SageMaker::MonitoringSchedule"
		Properties: {
			CreationTime?:                   string | fn.#Fn
			EndpointName?:                   string | fn.#Fn
			FailureReason?:                  string | fn.#Fn
			LastModifiedTime?:               string | fn.#Fn
			LastMonitoringExecutionSummary?: {
				CreationTime:              string | fn.#Fn
				EndpointName?:             string | fn.#Fn
				FailureReason?:            string | fn.#Fn
				LastModifiedTime:          string | fn.#Fn
				MonitoringExecutionStatus: string | fn.#Fn
				MonitoringScheduleName:    string | fn.#Fn
				ProcessingJobArn?:         string | fn.#Fn
				ScheduledTime:             string | fn.#Fn
			} | fn.If
			MonitoringScheduleArn?:   string | fn.#Fn
			MonitoringScheduleConfig: {
				MonitoringJobDefinition: {
					BaselineConfig?: {
						ConstraintsResource?: {
							S3Uri?: string | fn.#Fn
						} | fn.If
						StatisticsResource?: {
							S3Uri?: string | fn.#Fn
						} | fn.If
					} | fn.If
					Environment?:               {} | fn.If
					MonitoringAppSpecification: {
						ContainerArguments?:              [...(string | fn.#Fn)] | (string | fn.#Fn)
						ContainerEntrypoint?:             [...(string | fn.#Fn)] | (string | fn.#Fn)
						ImageUri:                         string | fn.#Fn
						PostAnalyticsProcessorSourceUri?: string | fn.#Fn
						RecordPreprocessorSourceUri?:     string | fn.#Fn
					} | fn.If
					MonitoringInputs: {
						MonitoringInputs?: [...{
							[string]: _
						}] | fn.If
					} | fn.If
					MonitoringOutputConfig: {
						KmsKeyId?:         string | fn.#Fn
						MonitoringOutputs: [...{
							S3Output: {
								LocalPath:     string | fn.#Fn
								S3UploadMode?: string | fn.#Fn
								S3Uri:         string | fn.#Fn
							} | fn.If
						}] | fn.If
					} | fn.If
					MonitoringResources: {
						ClusterConfig: {
							InstanceCount:   int | fn.#Fn
							InstanceType:    string | fn.#Fn
							VolumeKmsKeyId?: string | fn.#Fn
							VolumeSizeInGB:  int | fn.#Fn
						} | fn.If
					} | fn.If
					NetworkConfig?: {
						EnableInterContainerTrafficEncryption?: bool | fn.#Fn
						EnableNetworkIsolation?:                bool | fn.#Fn
						VpcConfig?:                             {
							SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
							Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.If
					} | fn.If
					RoleArn:            string | fn.#Fn
					StoppingCondition?: {
						MaxRuntimeInSeconds: int | fn.#Fn
					} | fn.If
				} | fn.If
				ScheduleConfig?: {
					ScheduleExpression: string | fn.#Fn
				} | fn.If
			} | fn.If
			MonitoringScheduleName:    string | fn.#Fn
			MonitoringScheduleStatus?: string | fn.#Fn
			Tags?:                     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NotebookInstance: {
		Type: "AWS::SageMaker::NotebookInstance"
		Properties: {
			AcceleratorTypes?:           [...(string | fn.#Fn)] | (string | fn.#Fn)
			AdditionalCodeRepositories?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			DefaultCodeRepository?:      string | fn.#Fn
			DirectInternetAccess?:       string | fn.#Fn
			InstanceType:                string | fn.#Fn
			KmsKeyId?:                   string | fn.#Fn
			LifecycleConfigName?:        string | fn.#Fn
			NotebookInstanceName?:       string | fn.#Fn
			RoleArn:                     string | fn.#Fn
			RootAccess?:                 string | fn.#Fn
			SecurityGroupIds?:           [...(string | fn.#Fn)] | (string | fn.#Fn)
			SubnetId?:                   string | fn.#Fn
			Tags?:                       [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			VolumeSizeInGB?: (>=5 & <=16384) | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#NotebookInstanceLifecycleConfig: {
		Type: "AWS::SageMaker::NotebookInstanceLifecycleConfig"
		Properties: {
			NotebookInstanceLifecycleConfigName?: string | fn.#Fn
			OnCreate?:                            [...{
				Content?: string | fn.#Fn
			}] | fn.If
			OnStart?: [...{
				Content?: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Workteam: {
		Type: "AWS::SageMaker::Workteam"
		Properties: {
			Description?:       string | fn.#Fn
			MemberDefinitions?: [...{
				CognitoMemberDefinition: {
					CognitoClientId:  string | fn.#Fn
					CognitoUserGroup: string | fn.#Fn
					CognitoUserPool:  string | fn.#Fn
				} | fn.If
			}] | fn.If
			NotificationConfiguration?: {
				NotificationTopicArn: string | fn.#Fn
			} | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			WorkteamName?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package uswest2

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
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DataQualityJobDefinition: {
		Type: "AWS::SageMaker::DataQualityJobDefinition"
		Properties: {
			DataQualityAppSpecification: {
				ContainerArguments?:              [...(string | fn.#Fn)] | (string | fn.#Fn)
				ContainerEntrypoint?:             [...(string | fn.#Fn)] | (string | fn.#Fn)
				Environment?:                     {} | fn.#If
				ImageUri:                         string | fn.#Fn
				PostAnalyticsProcessorSourceUri?: string | fn.#Fn
				RecordPreprocessorSourceUri?:     string | fn.#Fn
			} | fn.#If
			DataQualityBaselineConfig?: {
				BaseliningJobName?:   string | fn.#Fn
				ConstraintsResource?: {
					S3Uri?: string | fn.#Fn
				} | fn.#If
				StatisticsResource?: {
					S3Uri?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			DataQualityJobInput: {
				EndpointInput: {
					EndpointName:            string | fn.#Fn
					LocalPath:               string | fn.#Fn
					S3DataDistributionType?: string | fn.#Fn
					S3InputMode?:            string | fn.#Fn
				} | fn.#If
			} | fn.#If
			DataQualityJobOutputConfig: {
				KmsKeyId?:         string | fn.#Fn
				MonitoringOutputs: [...{
					S3Output: {
						LocalPath:     string | fn.#Fn
						S3UploadMode?: string | fn.#Fn
						S3Uri:         string | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			JobDefinitionName?: string | fn.#Fn
			JobResources:       {
				ClusterConfig: {
					InstanceCount:   int | fn.#Fn
					InstanceType:    string | fn.#Fn
					VolumeKmsKeyId?: string | fn.#Fn
					VolumeSizeInGB:  int | fn.#Fn
				} | fn.#If
			} | fn.#If
			NetworkConfig?: {
				EnableInterContainerTrafficEncryption?: bool | fn.#Fn
				EnableNetworkIsolation?:                bool | fn.#Fn
				VpcConfig?:                             {
					SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
					Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
			} | fn.#If
			RoleArn:            string | fn.#Fn
			StoppingCondition?: {
				MaxRuntimeInSeconds: int | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Device: {
		Type: "AWS::SageMaker::Device"
		Properties: {
			Device?: {
				[string]: _
			} | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DeviceFleet: {
		Type: "AWS::SageMaker::DeviceFleet"
		Properties: {
			Description?: string | fn.#Fn
			OutputConfig: {
				KmsKeyId?:        string | fn.#Fn
				S3OutputLocation: string | fn.#Fn
			} | fn.#If
			RoleArn: string | fn.#Fn
			Tags?:   [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
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
			DeploymentConfig?: {
				AutoRollbackConfiguration?: {
					Alarms: [...{
						AlarmName: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				BlueGreenUpdatePolicy: {
					MaximumExecutionTimeoutInSeconds?: int | fn.#Fn
					TerminationWaitInSeconds?:         int | fn.#Fn
					TrafficRoutingConfiguration:       {
						CanarySize?: {
							Type:  string | fn.#Fn
							Value: int | fn.#Fn
						} | fn.#If
						Type:                   string | fn.#Fn
						WaitIntervalInSeconds?: int | fn.#Fn
					} | fn.#If
				} | fn.#If
			} | fn.#If
			EndpointConfigName:                string | fn.#Fn
			EndpointName?:                     string | fn.#Fn
			ExcludeRetainedVariantProperties?: [...{
				VariantPropertyType?: string | fn.#Fn
			}] | fn.#If
			RetainAllVariantProperties?: bool | fn.#Fn
			Tags?:                       [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
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
				} | fn.#If
				CaptureOptions: [...{
					CaptureMode: string | fn.#Fn
				}] | fn.#If
				DestinationS3Uri:          string | fn.#Fn
				EnableCapture?:            bool | fn.#Fn
				InitialSamplingPercentage: int | fn.#Fn
				KmsKeyId?:                 string | fn.#Fn
			} | fn.#If
			EndpointConfigName?: string | fn.#Fn
			KmsKeyId?:           string | fn.#Fn
			ProductionVariants:  [...{
				AcceleratorType?:     string | fn.#Fn
				InitialInstanceCount: int | fn.#Fn
				InitialVariantWeight: number | fn.#Fn
				InstanceType:         string | fn.#Fn
				ModelName:            string | fn.#Fn
				VariantName:          string | fn.#Fn
			}] | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
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
				} | fn.#If
				Mode?:             string | fn.#Fn
				ModelDataUrl?:     string | fn.#Fn
				ModelPackageName?: string | fn.#Fn
				MultiModelConfig?: {
					ModelCacheSetting?: string | fn.#Fn
				} | fn.#If
			}] | fn.#If
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
				} | fn.#If
				Mode?:             string | fn.#Fn
				ModelDataUrl?:     string | fn.#Fn
				ModelPackageName?: string | fn.#Fn
				MultiModelConfig?: {
					ModelCacheSetting?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			VpcConfig?: {
				SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
				Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ModelBiasJobDefinition: {
		Type: "AWS::SageMaker::ModelBiasJobDefinition"
		Properties: {
			JobDefinitionName?: string | fn.#Fn
			JobResources:       {
				ClusterConfig: {
					InstanceCount:   int | fn.#Fn
					InstanceType:    string | fn.#Fn
					VolumeKmsKeyId?: string | fn.#Fn
					VolumeSizeInGB:  int | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelBiasAppSpecification: {
				ConfigUri:    string | fn.#Fn
				Environment?: {} | fn.#If
				ImageUri:     string | fn.#Fn
			} | fn.#If
			ModelBiasBaselineConfig?: {
				BaseliningJobName?:   string | fn.#Fn
				ConstraintsResource?: {
					S3Uri?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelBiasJobInput: {
				EndpointInput: {
					EndTimeOffset?:                 string | fn.#Fn
					EndpointName:                   string | fn.#Fn
					FeaturesAttribute?:             string | fn.#Fn
					InferenceAttribute?:            string | fn.#Fn
					LocalPath:                      string | fn.#Fn
					ProbabilityAttribute?:          string | fn.#Fn
					ProbabilityThresholdAttribute?: number | fn.#Fn
					S3DataDistributionType?:        string | fn.#Fn
					S3InputMode?:                   string | fn.#Fn
					StartTimeOffset?:               string | fn.#Fn
				} | fn.#If
				GroundTruthS3Input: {
					S3Uri: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelBiasJobOutputConfig: {
				KmsKeyId?:         string | fn.#Fn
				MonitoringOutputs: [...{
					S3Output: {
						LocalPath:     string | fn.#Fn
						S3UploadMode?: string | fn.#Fn
						S3Uri:         string | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			NetworkConfig?: {
				EnableInterContainerTrafficEncryption?: bool | fn.#Fn
				EnableNetworkIsolation?:                bool | fn.#Fn
				VpcConfig?:                             {
					SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
					Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
			} | fn.#If
			RoleArn:            string | fn.#Fn
			StoppingCondition?: {
				MaxRuntimeInSeconds: int | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ModelExplainabilityJobDefinition: {
		Type: "AWS::SageMaker::ModelExplainabilityJobDefinition"
		Properties: {
			JobDefinitionName?: string | fn.#Fn
			JobResources:       {
				ClusterConfig: {
					InstanceCount:   int | fn.#Fn
					InstanceType:    string | fn.#Fn
					VolumeKmsKeyId?: string | fn.#Fn
					VolumeSizeInGB:  int | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelExplainabilityAppSpecification: {
				ConfigUri:    string | fn.#Fn
				Environment?: {} | fn.#If
				ImageUri:     string | fn.#Fn
			} | fn.#If
			ModelExplainabilityBaselineConfig?: {
				BaseliningJobName?:   string | fn.#Fn
				ConstraintsResource?: {
					S3Uri?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelExplainabilityJobInput: {
				EndpointInput: {
					EndpointName:            string | fn.#Fn
					FeaturesAttribute?:      string | fn.#Fn
					InferenceAttribute?:     string | fn.#Fn
					LocalPath:               string | fn.#Fn
					ProbabilityAttribute?:   string | fn.#Fn
					S3DataDistributionType?: string | fn.#Fn
					S3InputMode?:            string | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelExplainabilityJobOutputConfig: {
				KmsKeyId?:         string | fn.#Fn
				MonitoringOutputs: [...{
					S3Output: {
						LocalPath:     string | fn.#Fn
						S3UploadMode?: string | fn.#Fn
						S3Uri:         string | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			NetworkConfig?: {
				EnableInterContainerTrafficEncryption?: bool | fn.#Fn
				EnableNetworkIsolation?:                bool | fn.#Fn
				VpcConfig?:                             {
					SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
					Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
			} | fn.#If
			RoleArn:            string | fn.#Fn
			StoppingCondition?: {
				MaxRuntimeInSeconds: int | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ModelPackageGroup: {
		Type: "AWS::SageMaker::ModelPackageGroup"
		Properties: {
			ModelPackageGroupDescription?: string | fn.#Fn
			ModelPackageGroupName:         string | fn.#Fn
			ModelPackageGroupPolicy?:      {
				[string]: _
			} | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ModelQualityJobDefinition: {
		Type: "AWS::SageMaker::ModelQualityJobDefinition"
		Properties: {
			JobDefinitionName?: string | fn.#Fn
			JobResources:       {
				ClusterConfig: {
					InstanceCount:   int | fn.#Fn
					InstanceType:    string | fn.#Fn
					VolumeKmsKeyId?: string | fn.#Fn
					VolumeSizeInGB:  int | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelQualityAppSpecification: {
				ContainerArguments?:              [...(string | fn.#Fn)] | (string | fn.#Fn)
				ContainerEntrypoint?:             [...(string | fn.#Fn)] | (string | fn.#Fn)
				Environment?:                     {} | fn.#If
				ImageUri:                         string | fn.#Fn
				PostAnalyticsProcessorSourceUri?: string | fn.#Fn
				ProblemType:                      string | fn.#Fn
				RecordPreprocessorSourceUri?:     string | fn.#Fn
			} | fn.#If
			ModelQualityBaselineConfig?: {
				BaseliningJobName?:   string | fn.#Fn
				ConstraintsResource?: {
					S3Uri?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelQualityJobInput: {
				EndpointInput: {
					EndTimeOffset?:                 string | fn.#Fn
					EndpointName:                   string | fn.#Fn
					InferenceAttribute?:            string | fn.#Fn
					LocalPath:                      string | fn.#Fn
					ProbabilityAttribute?:          string | fn.#Fn
					ProbabilityThresholdAttribute?: number | fn.#Fn
					S3DataDistributionType?:        string | fn.#Fn
					S3InputMode?:                   string | fn.#Fn
					StartTimeOffset?:               string | fn.#Fn
				} | fn.#If
				GroundTruthS3Input: {
					S3Uri: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			ModelQualityJobOutputConfig: {
				KmsKeyId?:         string | fn.#Fn
				MonitoringOutputs: [...{
					S3Output: {
						LocalPath:     string | fn.#Fn
						S3UploadMode?: string | fn.#Fn
						S3Uri:         string | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			NetworkConfig?: {
				EnableInterContainerTrafficEncryption?: bool | fn.#Fn
				EnableNetworkIsolation?:                bool | fn.#Fn
				VpcConfig?:                             {
					SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
					Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
			} | fn.#If
			RoleArn:            string | fn.#Fn
			StoppingCondition?: {
				MaxRuntimeInSeconds: int | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
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
			EndpointName?:                   string | fn.#Fn
			FailureReason?:                  string | fn.#Fn
			LastMonitoringExecutionSummary?: {
				CreationTime:              string | fn.#Fn
				EndpointName?:             string | fn.#Fn
				FailureReason?:            string | fn.#Fn
				LastModifiedTime:          string | fn.#Fn
				MonitoringExecutionStatus: string | fn.#Fn
				MonitoringScheduleName:    string | fn.#Fn
				ProcessingJobArn?:         string | fn.#Fn
				ScheduledTime:             string | fn.#Fn
			} | fn.#If
			MonitoringScheduleConfig: {
				MonitoringJobDefinition?: {
					BaselineConfig?: {
						ConstraintsResource?: {
							S3Uri?: string | fn.#Fn
						} | fn.#If
						StatisticsResource?: {
							S3Uri?: string | fn.#Fn
						} | fn.#If
					} | fn.#If
					Environment?:               {} | fn.#If
					MonitoringAppSpecification: {
						ContainerArguments?:              [...(string | fn.#Fn)] | (string | fn.#Fn)
						ContainerEntrypoint?:             [...(string | fn.#Fn)] | (string | fn.#Fn)
						ImageUri:                         string | fn.#Fn
						PostAnalyticsProcessorSourceUri?: string | fn.#Fn
						RecordPreprocessorSourceUri?:     string | fn.#Fn
					} | fn.#If
					MonitoringInputs: {
						MonitoringInputs?: [...{
							[string]: _
						}] | fn.#If
					} | fn.#If
					MonitoringOutputConfig: {
						KmsKeyId?:         string | fn.#Fn
						MonitoringOutputs: [...{
							S3Output: {
								LocalPath:     string | fn.#Fn
								S3UploadMode?: string | fn.#Fn
								S3Uri:         string | fn.#Fn
							} | fn.#If
						}] | fn.#If
					} | fn.#If
					MonitoringResources: {
						ClusterConfig: {
							InstanceCount:   int | fn.#Fn
							InstanceType:    string | fn.#Fn
							VolumeKmsKeyId?: string | fn.#Fn
							VolumeSizeInGB:  int | fn.#Fn
						} | fn.#If
					} | fn.#If
					NetworkConfig?: {
						EnableInterContainerTrafficEncryption?: bool | fn.#Fn
						EnableNetworkIsolation?:                bool | fn.#Fn
						VpcConfig?:                             {
							SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
							Subnets:          [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
					} | fn.#If
					RoleArn:            string | fn.#Fn
					StoppingCondition?: {
						MaxRuntimeInSeconds: int | fn.#Fn
					} | fn.#If
				} | fn.#If
				MonitoringJobDefinitionName?: string | fn.#Fn
				MonitoringType?:              string | fn.#Fn
				ScheduleConfig?:              {
					ScheduleExpression: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			MonitoringScheduleName:    string | fn.#Fn
			MonitoringScheduleStatus?: string | fn.#Fn
			Tags?:                     [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
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
			}] | fn.#If
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
			}] | fn.#If
			OnStart?: [...{
				Content?: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Pipeline: {
		Type: "AWS::SageMaker::Pipeline"
		Properties: {
			PipelineDefinition: {
				[string]: _
			} | fn.#Fn
			PipelineDescription?: string | fn.#Fn
			PipelineDisplayName?: string | fn.#Fn
			PipelineName:         string | fn.#Fn
			RoleArn:              string | fn.#Fn
			Tags?:                [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Project: {
		Type: "AWS::SageMaker::Project"
		Properties: {
			ProjectDescription?:               string | fn.#Fn
			ProjectName:                       string | fn.#Fn
			ServiceCatalogProvisioningDetails: {
				[string]: _
			} | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
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
				} | fn.#If
			}] | fn.#If
			NotificationConfiguration?: {
				NotificationTopicArn: string | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			WorkteamName?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

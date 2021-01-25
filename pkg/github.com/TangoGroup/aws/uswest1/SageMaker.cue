package uswest1

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
	DataQualityJobDefinition :: {
		Type:       "AWS::SageMaker::DataQualityJobDefinition"
		Properties: close({
			DataQualityAppSpecification: close({
				ContainerArguments?:  [...(string | fn.Fn)] | (string | fn.Fn)
				ContainerEntrypoint?: [...(string | fn.Fn)] | (string | fn.Fn)
				Environment?:         close({
				}) | fn.If
				ImageUri:                         string | fn.Fn
				PostAnalyticsProcessorSourceUri?: string | fn.Fn
				RecordPreprocessorSourceUri?:     string | fn.Fn
			}) | fn.If
			DataQualityBaselineConfig?: close({
				BaseliningJobName?:   string | fn.Fn
				ConstraintsResource?: close({
					S3Uri?: string | fn.Fn
				}) | fn.If
				StatisticsResource?: close({
					S3Uri?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			DataQualityJobInput: close({
				EndpointInput: close({
					EndpointName:            string | fn.Fn
					LocalPath:               string | fn.Fn
					S3DataDistributionType?: string | fn.Fn
					S3InputMode?:            string | fn.Fn
				}) | fn.If
			}) | fn.If
			DataQualityJobOutputConfig: close({
				KmsKeyId?:         string | fn.Fn
				MonitoringOutputs: [...close({
					S3Output: close({
						LocalPath:     string | fn.Fn
						S3UploadMode?: string | fn.Fn
						S3Uri:         string | fn.Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
			JobDefinitionName?: string | fn.Fn
			JobResources:       close({
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
	FeatureGroup :: {
		Type:       "AWS::SageMaker::FeatureGroup"
		Properties: close({
			Description?:         string | fn.Fn
			EventTimeFeatureName: string | fn.Fn
			FeatureDefinitions:   [...close({
				FeatureName: string | fn.Fn
				FeatureType: string | fn.Fn
			})] | fn.If
			FeatureGroupName:    string | fn.Fn
			OfflineStoreConfig?: {
				[string]: _
			} | fn.Fn
			OnlineStoreConfig?: {
				[string]: _
			} | fn.Fn
			RecordIdentifierFeatureName: string | fn.Fn
			RoleArn?:                    string | fn.Fn
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
	ModelBiasJobDefinition :: {
		Type:       "AWS::SageMaker::ModelBiasJobDefinition"
		Properties: close({
			JobDefinitionName?: string | fn.Fn
			JobResources:       close({
				ClusterConfig: close({
					InstanceCount:   int | fn.Fn
					InstanceType:    string | fn.Fn
					VolumeKmsKeyId?: string | fn.Fn
					VolumeSizeInGB:  int | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelBiasAppSpecification: close({
				ConfigUri:    string | fn.Fn
				Environment?: close({
				}) | fn.If
				ImageUri: string | fn.Fn
			}) | fn.If
			ModelBiasBaselineConfig?: close({
				BaseliningJobName?:   string | fn.Fn
				ConstraintsResource?: close({
					S3Uri?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelBiasJobInput: close({
				EndpointInput: close({
					EndTimeOffset?:                 string | fn.Fn
					EndpointName:                   string | fn.Fn
					FeaturesAttribute?:             string | fn.Fn
					InferenceAttribute?:            string | fn.Fn
					LocalPath:                      string | fn.Fn
					ProbabilityAttribute?:          string | fn.Fn
					ProbabilityThresholdAttribute?: number | fn.Fn
					S3DataDistributionType?:        string | fn.Fn
					S3InputMode?:                   string | fn.Fn
					StartTimeOffset?:               string | fn.Fn
				}) | fn.If
				GroundTruthS3Input: close({
					S3Uri: string | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelBiasJobOutputConfig: close({
				KmsKeyId?:         string | fn.Fn
				MonitoringOutputs: [...close({
					S3Output: close({
						LocalPath:     string | fn.Fn
						S3UploadMode?: string | fn.Fn
						S3Uri:         string | fn.Fn
					}) | fn.If
				})] | fn.If
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
	ModelExplainabilityJobDefinition :: {
		Type:       "AWS::SageMaker::ModelExplainabilityJobDefinition"
		Properties: close({
			JobDefinitionName?: string | fn.Fn
			JobResources:       close({
				ClusterConfig: close({
					InstanceCount:   int | fn.Fn
					InstanceType:    string | fn.Fn
					VolumeKmsKeyId?: string | fn.Fn
					VolumeSizeInGB:  int | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelExplainabilityAppSpecification: close({
				ConfigUri:    string | fn.Fn
				Environment?: close({
				}) | fn.If
				ImageUri: string | fn.Fn
			}) | fn.If
			ModelExplainabilityBaselineConfig?: close({
				BaseliningJobName?:   string | fn.Fn
				ConstraintsResource?: close({
					S3Uri?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelExplainabilityJobInput: close({
				EndpointInput: close({
					EndpointName:            string | fn.Fn
					FeaturesAttribute?:      string | fn.Fn
					InferenceAttribute?:     string | fn.Fn
					LocalPath:               string | fn.Fn
					ProbabilityAttribute?:   string | fn.Fn
					S3DataDistributionType?: string | fn.Fn
					S3InputMode?:            string | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelExplainabilityJobOutputConfig: close({
				KmsKeyId?:         string | fn.Fn
				MonitoringOutputs: [...close({
					S3Output: close({
						LocalPath:     string | fn.Fn
						S3UploadMode?: string | fn.Fn
						S3Uri:         string | fn.Fn
					}) | fn.If
				})] | fn.If
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
	ModelPackageGroup :: {
		Type:       "AWS::SageMaker::ModelPackageGroup"
		Properties: close({
			ModelPackageGroupDescription?: string | fn.Fn
			ModelPackageGroupName:         string | fn.Fn
			ModelPackageGroupPolicy?:      {
				[string]: _
			} | fn.Fn
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
	ModelQualityJobDefinition :: {
		Type:       "AWS::SageMaker::ModelQualityJobDefinition"
		Properties: close({
			JobDefinitionName?: string | fn.Fn
			JobResources:       close({
				ClusterConfig: close({
					InstanceCount:   int | fn.Fn
					InstanceType:    string | fn.Fn
					VolumeKmsKeyId?: string | fn.Fn
					VolumeSizeInGB:  int | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelQualityAppSpecification: close({
				ContainerArguments?:  [...(string | fn.Fn)] | (string | fn.Fn)
				ContainerEntrypoint?: [...(string | fn.Fn)] | (string | fn.Fn)
				Environment?:         close({
				}) | fn.If
				ImageUri:                         string | fn.Fn
				PostAnalyticsProcessorSourceUri?: string | fn.Fn
				ProblemType:                      string | fn.Fn
				RecordPreprocessorSourceUri?:     string | fn.Fn
			}) | fn.If
			ModelQualityBaselineConfig?: close({
				BaseliningJobName?:   string | fn.Fn
				ConstraintsResource?: close({
					S3Uri?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelQualityJobInput: close({
				EndpointInput: close({
					EndTimeOffset?:                 string | fn.Fn
					EndpointName:                   string | fn.Fn
					InferenceAttribute?:            string | fn.Fn
					LocalPath:                      string | fn.Fn
					ProbabilityAttribute?:          string | fn.Fn
					ProbabilityThresholdAttribute?: number | fn.Fn
					S3DataDistributionType?:        string | fn.Fn
					S3InputMode?:                   string | fn.Fn
					StartTimeOffset?:               string | fn.Fn
				}) | fn.If
				GroundTruthS3Input: close({
					S3Uri: string | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelQualityJobOutputConfig: close({
				KmsKeyId?:         string | fn.Fn
				MonitoringOutputs: [...close({
					S3Output: close({
						LocalPath:     string | fn.Fn
						S3UploadMode?: string | fn.Fn
						S3Uri:         string | fn.Fn
					}) | fn.If
				})] | fn.If
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
			MonitoringScheduleConfig: close({
				MonitoringJobDefinition?: close({
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
				MonitoringJobDefinitionName?: string | fn.Fn
				MonitoringType?:              string | fn.Fn
				ScheduleConfig?:              close({
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
	Pipeline :: {
		Type:       "AWS::SageMaker::Pipeline"
		Properties: close({
			PipelineDefinition: {
				[string]: _
			} | fn.Fn
			PipelineDescription?: string | fn.Fn
			PipelineDisplayName?: string | fn.Fn
			PipelineName:         string | fn.Fn
			RoleArn:              string | fn.Fn
			Tags?:                [...close({
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
	Project :: {
		Type:       "AWS::SageMaker::Project"
		Properties: close({
			ProjectDescription?:               string | fn.Fn
			ProjectName:                       string | fn.Fn
			ServiceCatalogProvisioningDetails: {
				[string]: _
			} | fn.Fn
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
}

package saeast1

import "github.com/TangoGroup/aws/fn"

#SageMaker: {
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
}

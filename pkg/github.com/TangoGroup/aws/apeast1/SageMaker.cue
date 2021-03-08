package apeast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

SageMaker :: {
	App :: {
		Type:       "AWS::SageMaker::App"
		Properties: close({
			AppName:       (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#)) | fn.Fn
			AppType:       ("JupyterServer" | "KernelGateway") | fn.Fn
			DomainId:      (strings.MinRunes(1) & strings.MaxRunes(63)) | fn.Fn
			ResourceSpec?: close({
				InstanceType?:             ("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.Fn
				SageMakerImageArn?:        (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#)) | fn.Fn
				SageMakerImageVersionArn?: (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#)) | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			UserProfileName: (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	AppImageConfig :: {
		Type:       "AWS::SageMaker::AppImageConfig"
		Properties: close({
			AppImageConfigName:        (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#)) | fn.Fn
			KernelGatewayImageConfig?: close({
				FileSystemConfig?: close({
					DefaultGid?: int | fn.Fn
					DefaultUid?: int | fn.Fn
					MountPath?:  (strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^/.*"#)) | fn.Fn
				}) | fn.If
				KernelSpecs: [...close({
					DisplayName?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
					Name:         (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
				})] | fn.If
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
	DataQualityJobDefinition :: {
		Type:       "AWS::SageMaker::DataQualityJobDefinition"
		Properties: close({
			DataQualityAppSpecification: close({
				ContainerArguments?:  [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
				ContainerEntrypoint?: [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
				Environment?:         close({
				}) | fn.If
				ImageUri:                         (=~#".*"#) | fn.Fn
				PostAnalyticsProcessorSourceUri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				RecordPreprocessorSourceUri?:     (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
			}) | fn.If
			DataQualityBaselineConfig?: close({
				BaseliningJobName?:   (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.Fn
				ConstraintsResource?: close({
					S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
				StatisticsResource?: close({
					S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
			DataQualityJobInput: close({
				EndpointInput: close({
					EndpointName:            (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.Fn
					LocalPath:               (=~#".*"#) | fn.Fn
					S3DataDistributionType?: ("FullyReplicated" | "ShardedByS3Key") | fn.Fn
					S3InputMode?:            ("Pipe" | "File") | fn.Fn
				}) | fn.If
			}) | fn.If
			DataQualityJobOutputConfig: close({
				KmsKeyId?:         (=~#".*"#) | fn.Fn
				MonitoringOutputs: [...close({
					S3Output: close({
						LocalPath:     (=~#".*"#) | fn.Fn
						S3UploadMode?: ("Continuous" | "EndOfJob") | fn.Fn
						S3Uri:         (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
			JobDefinitionName?: (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
			JobResources:       close({
				ClusterConfig: close({
					InstanceCount:   (>=1 & <=100) | fn.Fn
					InstanceType:    string | fn.Fn
					VolumeKmsKeyId?: string | fn.Fn
					VolumeSizeInGB:  (>=1 & <=16384) | fn.Fn
				}) | fn.If
			}) | fn.If
			NetworkConfig?: close({
				EnableInterContainerTrafficEncryption?: bool | fn.Fn
				EnableNetworkIsolation?:                bool | fn.Fn
				VpcConfig?:                             close({
					SecurityGroupIds: [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
					Subnets:          [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
				}) | fn.If
			}) | fn.If
			RoleArn:            (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
			StoppingCondition?: close({
				MaxRuntimeInSeconds: (>=1 & <=86400) | fn.Fn
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
	Domain :: {
		Type:       "AWS::SageMaker::Domain"
		Properties: close({
			AppNetworkAccessType?: ("PublicInternetOnly" | "VpcOnly") | fn.Fn
			AuthMode:              ("SSO" | "IAM") | fn.Fn
			DefaultUserSettings:   close({
				ExecutionRole?:            (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
				JupyterServerAppSettings?: close({
					DefaultResourceSpec?: close({
						InstanceType?:             ("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.Fn
						SageMakerImageArn?:        (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.Fn
						SageMakerImageVersionArn?: (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.Fn
					}) | fn.If
				}) | fn.If
				KernelGatewayAppSettings?: close({
					CustomImages?: [...close({
						AppImageConfigName:  (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.Fn
						ImageName:           (=~#"^[a-zA-Z0-9]([-.]?[a-zA-Z0-9]){0,62}$"#) | fn.Fn
						ImageVersionNumber?: int | fn.Fn
					})] | fn.If
					DefaultResourceSpec?: close({
						InstanceType?:             ("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.Fn
						SageMakerImageArn?:        (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.Fn
						SageMakerImageVersionArn?: (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.Fn
					}) | fn.If
				}) | fn.If
				SecurityGroups?:  [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
				SharingSettings?: close({
					NotebookOutputOption?: ("Allowed" | "Disabled") | fn.Fn
					S3KmsKeyId?:           (=~#".*"#) | fn.Fn
					S3OutputPath?:         (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
			DomainName: (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.Fn
			KmsKeyId?:  (=~#".*"#) | fn.Fn
			SubnetIds:  [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
			Tags?:      [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcId: (=~#"[-0-9a-zA-Z]+"#) | fn.Fn
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
			EventTimeFeatureName: (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,63}"#)) | fn.Fn
			FeatureDefinitions:   [...close({
				FeatureName: (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,63}"#)) | fn.Fn
				FeatureType: ("Integral" | "Fractional" | "String") | fn.Fn
			})] | fn.If
			FeatureGroupName:    (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,63}"#)) | fn.Fn
			OfflineStoreConfig?: {
				[string]: _
			} | fn.Fn
			OnlineStoreConfig?: {
				[string]: _
			} | fn.Fn
			RecordIdentifierFeatureName: (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,63}"#)) | fn.Fn
			RoleArn?:                    (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
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
	Image :: {
		Type:       "AWS::SageMaker::Image"
		Properties: close({
			ImageDescription?: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#".+"#)) | fn.Fn
			ImageDisplayName?: (strings.MinRunes(1) & strings.MaxRunes(128) & (=~#"^[A-Za-z0-9 -_]+$"#)) | fn.Fn
			ImageName:         (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9]([-.]?[a-zA-Z0-9])*$"#)) | fn.Fn
			ImageRoleArn:      (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^arn:aws(-[\w]+)*:iam::[0-9]{12}:role/.*$"#)) | fn.Fn
			Tags?:             [...close({
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
	ImageVersion :: {
		Type:       "AWS::SageMaker::ImageVersion"
		Properties: close({
			BaseImage: (strings.MinRunes(1) & strings.MaxRunes(255) & (=~#".+"#)) | fn.Fn
			ImageName: (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[A-Za-z0-9]([-.]?[A-Za-z0-9])*$"#)) | fn.Fn
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
			JobDefinitionName?: (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
			JobResources:       close({
				ClusterConfig: close({
					InstanceCount:   (>=1 & <=100) | fn.Fn
					InstanceType:    string | fn.Fn
					VolumeKmsKeyId?: string | fn.Fn
					VolumeSizeInGB:  (>=1 & <=16384) | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelBiasAppSpecification: close({
				ConfigUri:    (=~#".*"#) | fn.Fn
				Environment?: close({
				}) | fn.If
				ImageUri: (=~#".*"#) | fn.Fn
			}) | fn.If
			ModelBiasBaselineConfig?: close({
				BaseliningJobName?:   (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.Fn
				ConstraintsResource?: close({
					S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelBiasJobInput: close({
				EndpointInput: close({
					EndTimeOffset?:                 (strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.Fn
					EndpointName:                   (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.Fn
					FeaturesAttribute?:             string | fn.Fn
					InferenceAttribute?:            string | fn.Fn
					LocalPath:                      (=~#".*"#) | fn.Fn
					ProbabilityAttribute?:          string | fn.Fn
					ProbabilityThresholdAttribute?: number | fn.Fn
					S3DataDistributionType?:        ("FullyReplicated" | "ShardedByS3Key") | fn.Fn
					S3InputMode?:                   ("Pipe" | "File") | fn.Fn
					StartTimeOffset?:               (strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.Fn
				}) | fn.If
				GroundTruthS3Input: close({
					S3Uri: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelBiasJobOutputConfig: close({
				KmsKeyId?:         (=~#".*"#) | fn.Fn
				MonitoringOutputs: [...close({
					S3Output: close({
						LocalPath:     (=~#".*"#) | fn.Fn
						S3UploadMode?: ("Continuous" | "EndOfJob") | fn.Fn
						S3Uri:         (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
			NetworkConfig?: close({
				EnableInterContainerTrafficEncryption?: bool | fn.Fn
				EnableNetworkIsolation?:                bool | fn.Fn
				VpcConfig?:                             close({
					SecurityGroupIds: [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
					Subnets:          [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
				}) | fn.If
			}) | fn.If
			RoleArn:            (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
			StoppingCondition?: close({
				MaxRuntimeInSeconds: (>=1 & <=86400) | fn.Fn
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
			JobDefinitionName?: (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
			JobResources:       close({
				ClusterConfig: close({
					InstanceCount:   (>=1 & <=100) | fn.Fn
					InstanceType:    string | fn.Fn
					VolumeKmsKeyId?: string | fn.Fn
					VolumeSizeInGB:  (>=1 & <=16384) | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelExplainabilityAppSpecification: close({
				ConfigUri:    (=~#".*"#) | fn.Fn
				Environment?: close({
				}) | fn.If
				ImageUri: (=~#".*"#) | fn.Fn
			}) | fn.If
			ModelExplainabilityBaselineConfig?: close({
				BaseliningJobName?:   (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.Fn
				ConstraintsResource?: close({
					S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelExplainabilityJobInput: close({
				EndpointInput: close({
					EndpointName:            (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.Fn
					FeaturesAttribute?:      string | fn.Fn
					InferenceAttribute?:     string | fn.Fn
					LocalPath:               (=~#".*"#) | fn.Fn
					ProbabilityAttribute?:   string | fn.Fn
					S3DataDistributionType?: ("FullyReplicated" | "ShardedByS3Key") | fn.Fn
					S3InputMode?:            ("Pipe" | "File") | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelExplainabilityJobOutputConfig: close({
				KmsKeyId?:         (=~#".*"#) | fn.Fn
				MonitoringOutputs: [...close({
					S3Output: close({
						LocalPath:     (=~#".*"#) | fn.Fn
						S3UploadMode?: ("Continuous" | "EndOfJob") | fn.Fn
						S3Uri:         (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
			NetworkConfig?: close({
				EnableInterContainerTrafficEncryption?: bool | fn.Fn
				EnableNetworkIsolation?:                bool | fn.Fn
				VpcConfig?:                             close({
					SecurityGroupIds: [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
					Subnets:          [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
				}) | fn.If
			}) | fn.If
			RoleArn:            (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
			StoppingCondition?: close({
				MaxRuntimeInSeconds: (>=1 & <=86400) | fn.Fn
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
			ModelPackageGroupName:         (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
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
			JobDefinitionName?: (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
			JobResources:       close({
				ClusterConfig: close({
					InstanceCount:   (>=1 & <=100) | fn.Fn
					InstanceType:    string | fn.Fn
					VolumeKmsKeyId?: string | fn.Fn
					VolumeSizeInGB:  (>=1 & <=16384) | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelQualityAppSpecification: close({
				ContainerArguments?:  [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
				ContainerEntrypoint?: [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
				Environment?:         close({
				}) | fn.If
				ImageUri:                         (=~#".*"#) | fn.Fn
				PostAnalyticsProcessorSourceUri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				ProblemType:                      ("BinaryClassification" | "MulticlassClassification" | "Regression") | fn.Fn
				RecordPreprocessorSourceUri?:     (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
			}) | fn.If
			ModelQualityBaselineConfig?: close({
				BaseliningJobName?:   (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.Fn
				ConstraintsResource?: close({
					S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelQualityJobInput: close({
				EndpointInput: close({
					EndTimeOffset?:                 (strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.Fn
					EndpointName:                   (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.Fn
					InferenceAttribute?:            string | fn.Fn
					LocalPath:                      (=~#".*"#) | fn.Fn
					ProbabilityAttribute?:          string | fn.Fn
					ProbabilityThresholdAttribute?: number | fn.Fn
					S3DataDistributionType?:        ("FullyReplicated" | "ShardedByS3Key") | fn.Fn
					S3InputMode?:                   ("Pipe" | "File") | fn.Fn
					StartTimeOffset?:               (strings.MinRunes(1) & strings.MaxRunes(15) & (=~#"^.?P.*"#)) | fn.Fn
				}) | fn.If
				GroundTruthS3Input: close({
					S3Uri: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
			ModelQualityJobOutputConfig: close({
				KmsKeyId?:         (=~#".*"#) | fn.Fn
				MonitoringOutputs: [...close({
					S3Output: close({
						LocalPath:     (=~#".*"#) | fn.Fn
						S3UploadMode?: ("Continuous" | "EndOfJob") | fn.Fn
						S3Uri:         (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
			NetworkConfig?: close({
				EnableInterContainerTrafficEncryption?: bool | fn.Fn
				EnableNetworkIsolation?:                bool | fn.Fn
				VpcConfig?:                             close({
					SecurityGroupIds: [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
					Subnets:          [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
				}) | fn.If
			}) | fn.If
			RoleArn:            (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
			StoppingCondition?: close({
				MaxRuntimeInSeconds: (>=1 & <=86400) | fn.Fn
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
			EndpointName?:                   (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.Fn
			FailureReason?:                  (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			LastMonitoringExecutionSummary?: close({
				CreationTime:              string | fn.Fn
				EndpointName?:             (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#) | fn.Fn
				FailureReason?:            string | fn.Fn
				LastModifiedTime:          string | fn.Fn
				MonitoringExecutionStatus: ("Pending" | "Completed" | "CompletedWithViolations" | "InProgress" | "Failed" | "Stopping" | "Stopped") | fn.Fn
				MonitoringScheduleName:    (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
				ProcessingJobArn?:         (=~#"aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:processing-job/.*"#) | fn.Fn
				ScheduledTime:             string | fn.Fn
			}) | fn.If
			MonitoringScheduleConfig: close({
				MonitoringJobDefinition?: close({
					BaselineConfig?: close({
						ConstraintsResource?: close({
							S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
						}) | fn.If
						StatisticsResource?: close({
							S3Uri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
						}) | fn.If
					}) | fn.If
					Environment?: close({
					}) | fn.If
					MonitoringAppSpecification: close({
						ContainerArguments?:              [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
						ContainerEntrypoint?:             [...((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn)
						ImageUri:                         (=~#".*"#) | fn.Fn
						PostAnalyticsProcessorSourceUri?: (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
						RecordPreprocessorSourceUri?:     (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
					}) | fn.If
					MonitoringInputs: close({
						MonitoringInputs?: [...close({
							[string]: _
						})] | fn.If
					}) | fn.If
					MonitoringOutputConfig: close({
						KmsKeyId?:         (=~#".*"#) | fn.Fn
						MonitoringOutputs: [...close({
							S3Output: close({
								LocalPath:     (=~#".*"#) | fn.Fn
								S3UploadMode?: ("Continuous" | "EndOfJob") | fn.Fn
								S3Uri:         (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
							}) | fn.If
						})] | fn.If
					}) | fn.If
					MonitoringResources: close({
						ClusterConfig: close({
							InstanceCount:   (>=1 & <=100) | fn.Fn
							InstanceType:    string | fn.Fn
							VolumeKmsKeyId?: string | fn.Fn
							VolumeSizeInGB:  (>=1 & <=16384) | fn.Fn
						}) | fn.If
					}) | fn.If
					NetworkConfig?: close({
						EnableInterContainerTrafficEncryption?: bool | fn.Fn
						EnableNetworkIsolation?:                bool | fn.Fn
						VpcConfig?:                             close({
							SecurityGroupIds: [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
							Subnets:          [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
						}) | fn.If
					}) | fn.If
					RoleArn:            (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
					StoppingCondition?: close({
						MaxRuntimeInSeconds: (>=1 & <=86400) | fn.Fn
					}) | fn.If
				}) | fn.If
				MonitoringJobDefinitionName?: (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#)) | fn.Fn
				MonitoringType?:              ("DataQuality" | "ModelQuality" | "ModelBias" | "ModelExplainability") | fn.Fn
				ScheduleConfig?:              close({
					ScheduleExpression: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
				}) | fn.If
			}) | fn.If
			MonitoringScheduleName:    (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$"#) | fn.Fn
			MonitoringScheduleStatus?: ("Pending" | "Failed" | "Scheduled" | "Stopped") | fn.Fn
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
	Pipeline :: {
		Type:       "AWS::SageMaker::Pipeline"
		Properties: close({
			PipelineDefinition: {
				[string]: _
			} | fn.Fn
			PipelineDescription?: string | fn.Fn
			PipelineDisplayName?: (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#)) | fn.Fn
			PipelineName:         (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9])*"#)) | fn.Fn
			RoleArn:              (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
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
	UserProfile :: {
		Type:       "AWS::SageMaker::UserProfile"
		Properties: close({
			DomainId:                    (strings.MinRunes(1) & strings.MaxRunes(63)) | fn.Fn
			SingleSignOnUserIdentifier?: (=~#"UserName"#) | fn.Fn
			SingleSignOnUserValue?:      (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			UserProfileName: (strings.MinRunes(1) & strings.MaxRunes(63)) | fn.Fn
			UserSettings?:   close({
				ExecutionRole?:            (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$"#)) | fn.Fn
				JupyterServerAppSettings?: close({
					DefaultResourceSpec?: close({
						InstanceType?:             ("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.Fn
						SageMakerImageArn?:        (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.Fn
						SageMakerImageVersionArn?: (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.Fn
					}) | fn.If
				}) | fn.If
				KernelGatewayAppSettings?: close({
					CustomImages?: [...close({
						AppImageConfigName:  (=~#"^[a-zA-Z0-9](-*[a-zA-Z0-9]){0,62}"#) | fn.Fn
						ImageName:           (=~#"^[a-zA-Z0-9]([-.]?[a-zA-Z0-9]){0,62}$"#) | fn.Fn
						ImageVersionNumber?: int | fn.Fn
					})] | fn.If
					DefaultResourceSpec?: close({
						InstanceType?:             ("system" | "ml.t3.micro" | "ml.t3.small" | "ml.t3.medium" | "ml.t3.large" | "ml.t3.xlarge" | "ml.t3.2xlarge" | "ml.m5.large" | "ml.m5.xlarge" | "ml.m5.2xlarge" | "ml.m5.4xlarge" | "ml.m5.8xlarge" | "ml.m5.12xlarge" | "ml.m5.16xlarge" | "ml.m5.24xlarge" | "ml.c5.large" | "ml.c5.xlarge" | "ml.c5.2xlarge" | "ml.c5.4xlarge" | "ml.c5.9xlarge" | "ml.c5.12xlarge" | "ml.c5.18xlarge" | "ml.c5.24xlarge" | "ml.p3.2xlarge" | "ml.p3.8xlarge" | "ml.p3.16xlarge" | "ml.g4dn.xlarge" | "ml.g4dn.2xlarge" | "ml.g4dn.4xlarge" | "ml.g4dn.8xlarge" | "ml.g4dn.12xlarge" | "ml.g4dn.16xlarge") | fn.Fn
						SageMakerImageArn?:        (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$"#) | fn.Fn
						SageMakerImageVersionArn?: (=~#"^arn:aws(-[\w]+)*:sagemaker:.+:[0-9]{12}:image-version/[a-z0-9]([-.]?[a-z0-9])*/[0-9]+$"#) | fn.Fn
					}) | fn.If
				}) | fn.If
				SecurityGroups?:  [...((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)] | ((=~#"[-0-9a-zA-Z]+"#) | fn.Fn)
				SharingSettings?: close({
					NotebookOutputOption?: ("Allowed" | "Disabled") | fn.Fn
					S3KmsKeyId?:           (=~#".*"#) | fn.Fn
					S3OutputPath?:         (=~#"^(https|s3)://([^/]+)/?(.*)$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

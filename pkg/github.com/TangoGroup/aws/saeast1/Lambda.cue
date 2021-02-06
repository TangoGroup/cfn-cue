package saeast1

import "github.com/TangoGroup/aws/fn"

Lambda :: {
	Alias :: {
		Type:       "AWS::Lambda::Alias"
		Properties: close({
			Description?:                  string | fn.Fn
			FunctionName:                  string | fn.Fn
			FunctionVersion:               string | fn.Fn
			Name:                          string | fn.Fn
			ProvisionedConcurrencyConfig?: close({
				ProvisionedConcurrentExecutions: int | fn.Fn
			}) | fn.If
			RoutingConfig?: close({
				AdditionalVersionWeights: [...close({
					FunctionVersion: string | fn.Fn
					FunctionWeight:  number | fn.Fn
				})] | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		UpdatePolicy?: [string]: _
		Metadata?: [string]:     _
		Condition?: string
	}
	CodeSigningConfig :: {
		Type:       "AWS::Lambda::CodeSigningConfig"
		Properties: close({
			AllowedPublishers: close({
				SigningProfileVersionArns: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			CodeSigningPolicies?: close({
				UntrustedArtifactOnDeployment: string | fn.Fn
			}) | fn.If
			Description?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EventInvokeConfig :: {
		Type:       "AWS::Lambda::EventInvokeConfig"
		Properties: close({
			DestinationConfig?: close({
				OnFailure?: close({
					Destination: string | fn.Fn
				}) | fn.If
				OnSuccess?: close({
					Destination: string | fn.Fn
				}) | fn.If
			}) | fn.If
			FunctionName:              string | fn.Fn
			MaximumEventAgeInSeconds?: int | fn.Fn
			MaximumRetryAttempts?:     int | fn.Fn
			Qualifier:                 string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	EventSourceMapping :: {
		Type:       "AWS::Lambda::EventSourceMapping"
		Properties: close({
			BatchSize?:                  (>=1 & <=10000) | fn.Fn
			BisectBatchOnFunctionError?: bool | fn.Fn
			DestinationConfig?:          close({
				OnFailure?: close({
					Destination?: string | fn.Fn
				}) | fn.If
			}) | fn.If
			Enabled?:                        bool | fn.Fn
			EventSourceArn?:                 string | fn.Fn
			FunctionName:                    string | fn.Fn
			FunctionResponseTypes?:          [...(string | fn.Fn)] | (string | fn.Fn)
			MaximumBatchingWindowInSeconds?: int | fn.Fn
			MaximumRecordAgeInSeconds?:      (>=-1 & <=604800) | fn.Fn
			MaximumRetryAttempts?:           (>=-1 & <=10000) | fn.Fn
			ParallelizationFactor?:          (>=1 & <=10) | fn.Fn
			PartialBatchResponse?:           bool | fn.Fn
			Queues?:                         [...(string | fn.Fn)] | (string | fn.Fn)
			SelfManagedEventSource?:         close({
				Endpoints?: close({
					KafkaBootstrapServers?: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
			}) | fn.If
			SourceAccessConfigurations?: [...close({
				Type?: string | fn.Fn
				URI?:  string | fn.Fn
			})] | fn.If
			StartingPosition?:        ("AT_TIMESTAMP" | "LATEST" | "TRIM_HORIZON") | fn.Fn
			Topics?:                  [...(string | fn.Fn)] | (string | fn.Fn)
			TumblingWindowInSeconds?: int | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Function :: {
		Type:       "AWS::Lambda::Function"
		Properties: close({
			Code: close({
				ImageUri?:        string | fn.Fn
				S3Bucket?:        string | fn.Fn
				S3Key?:           string | fn.Fn
				S3ObjectVersion?: string | fn.Fn
				ZipFile?:         string | fn.Fn
			}) | fn.If
			CodeSigningConfigArn?: string | fn.Fn
			DeadLetterConfig?:     close({
				TargetArn?: string | fn.Fn
			}) | fn.If
			Description?: string | fn.Fn
			Environment?: close({
				Variables?: {
					[string]: string | fn.Fn
				} | fn.If
			}) | fn.If
			FileSystemConfigs?: [...close({
				Arn:            string | fn.Fn
				LocalMountPath: string | fn.Fn
			})] | fn.If
			FunctionName?: string | fn.Fn
			Handler?:      string | fn.Fn
			ImageConfig?:  close({
				Command?:          [...(string | fn.Fn)] | (string | fn.Fn)
				EntryPoint?:       [...(string | fn.Fn)] | (string | fn.Fn)
				WorkingDirectory?: string | fn.Fn
			}) | fn.If
			KmsKeyArn?:                    string | fn.Fn
			Layers?:                       [...(string | fn.Fn)] | (string | fn.Fn)
			MemorySize?:                   (>=128 & <=10240) | fn.Fn
			PackageType?:                  string | fn.Fn
			ReservedConcurrentExecutions?: int | fn.Fn
			Role:                          (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
			Runtime?:                      ("dotnetcore1.0" | "dotnetcore2.0" | "dotnetcore2.1" | "dotnetcore3.1" | "go1.x" | "java11" | "java8" | "java8.al2" | "nodejs" | "nodejs10.x" | "nodejs12.x" | "nodejs14.x" | "nodejs4.3" | "nodejs4.3-edge" | "nodejs6.10" | "nodejs8.10" | "provided" | "provided.al2" | "python2.7" | "python3.6" | "python3.7" | "python3.8" | "ruby2.5" | "ruby2.7") | fn.Fn
			Tags?:                         [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Timeout?:       (>=1 & <=900) | fn.Fn
			TracingConfig?: close({
				Mode?: string | fn.Fn
			}) | fn.If
			VpcConfig?: close({
				SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetIds:        [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LayerVersion :: {
		Type:       "AWS::Lambda::LayerVersion"
		Properties: close({
			CompatibleRuntimes?: [...(string | fn.Fn)] | (string | fn.Fn)
			Content:             close({
				S3Bucket:         string | fn.Fn
				S3Key:            string | fn.Fn
				S3ObjectVersion?: string | fn.Fn
			}) | fn.If
			Description?: string | fn.Fn
			LayerName?:   string | fn.Fn
			LicenseInfo?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LayerVersionPermission :: {
		Type:       "AWS::Lambda::LayerVersionPermission"
		Properties: close({
			Action:          string | fn.Fn
			LayerVersionArn: string | fn.Fn
			OrganizationId?: string | fn.Fn
			Principal:       string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Permission :: {
		Type:       "AWS::Lambda::Permission"
		Properties: close({
			Action:            string | fn.Fn
			EventSourceToken?: string | fn.Fn
			FunctionName:      string | fn.Fn
			Principal:         string | fn.Fn
			SourceAccount?:    string | fn.Fn
			SourceArn?:        string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Version :: {
		Type:       "AWS::Lambda::Version"
		Properties: close({
			CodeSha256?:                   string | fn.Fn
			Description?:                  string | fn.Fn
			FunctionName:                  string | fn.Fn
			ProvisionedConcurrencyConfig?: close({
				ProvisionedConcurrentExecutions: int | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package usgoveast1

import "github.com/TangoGroup/fn"

Lambda :: {
	Alias :: {
		Type: "AWS::Lambda::Alias"
		Properties: {
			Description?:    string | fn.Fn
			FunctionName:    string | fn.Fn
			FunctionVersion: string | fn.Fn
			Name:            string | fn.Fn
			RoutingConfig?: AdditionalVersionWeights: [...{
				FunctionVersion: string | fn.Fn
				FunctionWeight:  float | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	EventSourceMapping :: {
		Type: "AWS::Lambda::EventSourceMapping"
		Properties: {
			BatchSize?:                      (int & (>=1 & <=10000)) | fn.Fn
			Enabled?:                        bool | fn.Fn
			EventSourceArn:                  string | fn.Fn
			FunctionName:                    string | fn.Fn
			MaximumBatchingWindowInSeconds?: int | fn.Fn
			StartingPosition?:               string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Function :: {
		Type: "AWS::Lambda::Function"
		Properties: {
			Code: {
				S3Bucket?:        string | fn.Fn
				S3Key?:           string | fn.Fn
				S3ObjectVersion?: string | fn.Fn
				ZipFile?:         string | fn.Fn
			}
			DeadLetterConfig?: TargetArn?: string | fn.Fn
			Description?: string | fn.Fn
			Environment?: Variables?: [string]: string | fn.Fn
			FunctionName?: string | fn.Fn
			Handler:       string | fn.Fn
			KmsKeyArn?:    string | fn.Fn
			Layers?: [...(string | fn.Fn)]
			MemorySize?:                   (int & (>=128 & <=3008)) | fn.Fn
			ReservedConcurrentExecutions?: int | fn.Fn
			Role:                          (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
			Runtime:                       (string & ("dotnetcore1.0" | "dotnetcore2.0" | "dotnetcore2.1" | "go1.x" | "java8" | "nodejs" | "nodejs4.3-edge" | "nodejs4.3" | "nodejs6.10" | "nodejs8.10" | "nodejs10.x" | "provided" | "python2.7" | "python3.6" | "python3.7" | "ruby2.5")) | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Timeout?: (int & (>=1 & <=900)) | fn.Fn
			TracingConfig?: Mode?: string | fn.Fn
			VpcConfig?: {
				SecurityGroupIds: [...(string | fn.Fn)]
				SubnetIds: [...(string | fn.Fn)]
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LayerVersionPermission :: {
		Type: "AWS::Lambda::LayerVersionPermission"
		Properties: {
			Action:          string | fn.Fn
			LayerVersionArn: string | fn.Fn
			OrganizationId?: string | fn.Fn
			Principal:       string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Permission :: {
		Type: "AWS::Lambda::Permission"
		Properties: {
			Action:            string | fn.Fn
			EventSourceToken?: string | fn.Fn
			FunctionName:      string | fn.Fn
			Principal:         string | fn.Fn
			SourceAccount?:    string | fn.Fn
			SourceArn?:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Version :: {
		Type: "AWS::Lambda::Version"
		Properties: {
			CodeSha256?:  string | fn.Fn
			Description?: string | fn.Fn
			FunctionName: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

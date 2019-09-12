package Lambda

Alias :: {
	Type: "AWS::Lambda::Alias"
	Properties: {
		Description?:    string
		FunctionName:    string
		FunctionVersion: string
		Name:            string
		RoutingConfig?:  __AliasRoutingConfiguration
	}
	__AliasRoutingConfiguration = {
		AdditionalVersionWeights: [...__VersionWeight]
	}
	__VersionWeight = {
		FunctionVersion: string
		FunctionWeight:  float
	}
}
EventSourceMapping :: {
	Type: "AWS::Lambda::EventSourceMapping"
	Properties: {
		BatchSize?:                      >=1 & <=10000
		BatchSize?:                      int
		Enabled?:                        bool
		EventSourceArn:                  string
		FunctionName:                    string
		MaximumBatchingWindowInSeconds?: int
		StartingPosition?:               string
	}
}
Function :: {
	Type: "AWS::Lambda::Function"
	Properties: {
		Code:              __Code
		DeadLetterConfig?: __DeadLetterConfig
		Description?:      string
		Environment?:      __Environment
		FunctionName?:     string
		Handler:           string
		KmsKeyArn?:        string
		Layers?: [...string]
		MemorySize?:                   >=128 & <=3008
		MemorySize?:                   int
		ReservedConcurrentExecutions?: int
		Role:                          =~"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"
		Role:                          string
		Runtime:                       "dotnetcore1.0" | "dotnetcore2.0" | "dotnetcore2.1" | "go1.x" | "java8" | "nodejs" | "nodejs4.3-edge" | "nodejs4.3" | "nodejs6.10" | "nodejs8.10" | "nodejs10.x" | "provided" | "python2.7" | "python3.6" | "python3.7" | "ruby2.5"
		Runtime:                       string
		Tags?: [...__Tag]
		Timeout?:       >=1 & <=900
		Timeout?:       int
		TracingConfig?: __TracingConfig
		VpcConfig?:     __VpcConfig
	}
	__Code = {
		S3Bucket?:        string
		S3Key?:           string
		S3ObjectVersion?: string
		ZipFile?:         string
	}
	__DeadLetterConfig = {
		TargetArn?: string
	}
	__Environment = {
		Variables?: {
		}
	}
	__TracingConfig = {
		Mode?: string
	}
	__VpcConfig = {
		SecurityGroupIds: [...string]
		SubnetIds: [...string]
	}
}
LayerVersion :: {
	Type: "AWS::Lambda::LayerVersion"
	Properties: {
		CompatibleRuntimes?: [...string]
		Content:      __Content
		Description?: string
		LayerName?:   string
		LicenseInfo?: string
	}
	__Content = {
		S3Bucket:         string
		S3Key:            string
		S3ObjectVersion?: string
	}
}
LayerVersionPermission :: {
	Type: "AWS::Lambda::LayerVersionPermission"
	Properties: {
		Action:          string
		LayerVersionArn: string
		OrganizationId?: string
		Principal:       string
	}
}
Permission :: {
	Type: "AWS::Lambda::Permission"
	Properties: {
		Action:            string
		EventSourceToken?: string
		FunctionName:      string
		Principal:         string
		SourceAccount?:    string
		SourceArn?:        string
	}
}
Version :: {
	Type: "AWS::Lambda::Version"
	Properties: {
		CodeSha256?:  string
		Description?: string
		FunctionName: string
	}
}

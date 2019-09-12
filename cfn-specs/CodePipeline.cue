package CodePipeline

CustomActionType :: {
	Type: "AWS::CodePipeline::CustomActionType"
	Properties: {
		Category: "Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test"
		Category: string
		ConfigurationProperties?: [...__ConfigurationProperties]
		InputArtifactDetails:  __ArtifactDetails
		OutputArtifactDetails: __ArtifactDetails
		Provider:              string
		Settings?:             __Settings
		Version:               string
	}
	__ArtifactDetails = {
		MaximumCount: int
		MinimumCount: int
	}
	__ConfigurationProperties = {
		Description?: string
		Key:          bool
		Name:         string
		Queryable?:   bool
		Required:     bool
		Secret:       bool
		Type?:        "Boolean" | "Number" | "String"
		Type?:        string
	}
	__Settings = {
		EntityUrlTemplate?:          string
		ExecutionUrlTemplate?:       string
		RevisionUrlTemplate?:        string
		ThirdPartyConfigurationUrl?: string
	}
}
Pipeline :: {
	Type: "AWS::CodePipeline::Pipeline"
	Properties: {
		ArtifactStore?: __ArtifactStore
		ArtifactStores?: [...__ArtifactStoreMap]
		DisableInboundStageTransitions?: [...__StageTransition]
		Name?:                     string
		RestartExecutionOnUpdate?: bool
		RoleArn:                   string
		Stages: [...__StageDeclaration]
	}
	__ActionDeclaration = {
		ActionTypeId: __ActionTypeId
		Configuration?: {
		}
		InputArtifacts?: [...__InputArtifact]
		Name: string
		OutputArtifacts?: [...__OutputArtifact]
		Region?:   string
		RoleArn?:  string
		RunOrder?: int
	}
	__ActionTypeId = {
		Category: "Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test"
		Category: string
		Owner:    "AWS" | "Custom" | "ThirdParty"
		Owner:    string
		Provider: string
		Version:  string
	}
	__ArtifactStore = {
		EncryptionKey?: __EncryptionKey
		Location:       string
		Type:           "S3"
		Type:           string
	}
	__ArtifactStoreMap = {
		ArtifactStore: __ArtifactStore
		Region:        string
	}
	__BlockerDeclaration = {
		Name: string
		Type: "Schedule"
		Type: string
	}
	__EncryptionKey = {
		Id:   string
		Type: string
	}
	__InputArtifact = {
		Name: string
	}
	__OutputArtifact = {
		Name: string
	}
	__StageDeclaration = {
		Actions: [...__ActionDeclaration]
		Blockers?: [...__BlockerDeclaration]
		Name: string
	}
	__StageTransition = {
		Reason:    string
		StageName: string
	}
}
Webhook :: {
	Type: "AWS::CodePipeline::Webhook"
	Properties: {
		Authentication:              "GITHUB_HMAC" | "IP" | "UNAUTHENTICATED"
		Authentication:              string
		AuthenticationConfiguration: __WebhookAuthConfiguration
		Filters: [...__WebhookFilterRule]
		Name?:                   string
		RegisterWithThirdParty?: bool
		TargetAction:            string
		TargetPipeline:          string
		TargetPipelineVersion:   int
	}
	__WebhookAuthConfiguration = {
		AllowedIPRange?: string
		SecretToken?:    string
	}
	__WebhookFilterRule = {
		JsonPath:     string
		MatchEquals?: string
	}
}

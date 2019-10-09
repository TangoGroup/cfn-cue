package CodePipeline

import "github.com/TangoGroup/fn"

CustomActionType :: {
	Type: "AWS::CodePipeline::CustomActionType"
	Properties: {
		Category: (string & ("Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test")) | fn.Fn
		ConfigurationProperties?: [...__ConfigurationProperties]
		InputArtifactDetails:  __ArtifactDetails
		OutputArtifactDetails: __ArtifactDetails
		Provider:              string | fn.Fn
		Settings?:             __Settings
		Version:               string | fn.Fn
	}
	__ArtifactDetails :: {
		MaximumCount: int | fn.Fn
		MinimumCount: int | fn.Fn
	}
	__ConfigurationProperties :: {
		Description?: string | fn.Fn
		Key:          bool | fn.Fn
		Name:         string | fn.Fn
		Queryable?:   bool | fn.Fn
		Required:     bool | fn.Fn
		Secret:       bool | fn.Fn
		Type?:        (string & ("Boolean" | "Number" | "String")) | fn.Fn
	}
	__Settings :: {
		EntityUrlTemplate?:          string | fn.Fn
		ExecutionUrlTemplate?:       string | fn.Fn
		RevisionUrlTemplate?:        string | fn.Fn
		ThirdPartyConfigurationUrl?: string | fn.Fn
	}
}
Pipeline :: {
	Type: "AWS::CodePipeline::Pipeline"
	Properties: {
		ArtifactStore?: __ArtifactStore
		ArtifactStores?: [...__ArtifactStoreMap]
		DisableInboundStageTransitions?: [...__StageTransition]
		Name?:                     string | fn.Fn
		RestartExecutionOnUpdate?: bool | fn.Fn
		RoleArn:                   string | fn.Fn
		Stages: [...__StageDeclaration]
	}
	__ActionDeclaration :: {
		ActionTypeId:   __ActionTypeId
		Configuration?: {
		} | fn.Fn
		InputArtifacts?: [...__InputArtifact]
		Name: string | fn.Fn
		OutputArtifacts?: [...__OutputArtifact]
		Region?:   string | fn.Fn
		RoleArn?:  string | fn.Fn
		RunOrder?: int | fn.Fn
	}
	__ActionTypeId :: {
		Category: (string & ("Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test")) | fn.Fn
		Owner:    (string & ("AWS" | "Custom" | "ThirdParty")) | fn.Fn
		Provider: string | fn.Fn
		Version:  string | fn.Fn
	}
	__ArtifactStore :: {
		EncryptionKey?: __EncryptionKey
		Location:       string | fn.Fn
		Type:           (string & ("S3")) | fn.Fn
	}
	__ArtifactStoreMap :: {
		ArtifactStore: __ArtifactStore
		Region:        string | fn.Fn
	}
	__BlockerDeclaration :: {
		Name: string | fn.Fn
		Type: (string & ("Schedule")) | fn.Fn
	}
	__EncryptionKey :: {
		Id:   string | fn.Fn
		Type: string | fn.Fn
	}
	__InputArtifact :: {
		Name: string | fn.Fn
	}
	__OutputArtifact :: {
		Name: string | fn.Fn
	}
	__StageDeclaration :: {
		Actions: [...__ActionDeclaration]
		Blockers?: [...__BlockerDeclaration]
		Name: string | fn.Fn
	}
	__StageTransition :: {
		Reason:    string | fn.Fn
		StageName: string | fn.Fn
	}
}
Webhook :: {
	Type: "AWS::CodePipeline::Webhook"
	Properties: {
		Authentication:              (string & ("GITHUB_HMAC" | "IP" | "UNAUTHENTICATED")) | fn.Fn
		AuthenticationConfiguration: __WebhookAuthConfiguration
		Filters: [...__WebhookFilterRule]
		Name?:                   string | fn.Fn
		RegisterWithThirdParty?: bool | fn.Fn
		TargetAction:            string | fn.Fn
		TargetPipeline:          string | fn.Fn
		TargetPipelineVersion:   int | fn.Fn
	}
	__WebhookAuthConfiguration :: {
		AllowedIPRange?: string | fn.Fn
		SecretToken?:    string | fn.Fn
	}
	__WebhookFilterRule :: {
		JsonPath:     string | fn.Fn
		MatchEquals?: string | fn.Fn
	}
}

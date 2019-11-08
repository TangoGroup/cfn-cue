package CodePipeline

import "github.com/TangoGroup/fn"

CustomActionType :: {
	Type: "AWS::CodePipeline::CustomActionType"
	Properties: {
		Category: (string & ("Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test")) | fn.Fn
		ConfigurationProperties?: [...propConfigurationProperties]
		InputArtifactDetails:  propArtifactDetails
		OutputArtifactDetails: propArtifactDetails
		Provider:              string | fn.Fn
		Settings?:             propSettings
		Tags?: [...propTag]
		Version: string | fn.Fn
	}
	propArtifactDetails :: {
		MaximumCount: int | fn.Fn
		MinimumCount: int | fn.Fn
	}
	propConfigurationProperties :: {
		Description?: string | fn.Fn
		Key:          bool | fn.Fn
		Name:         string | fn.Fn
		Queryable?:   bool | fn.Fn
		Required:     bool | fn.Fn
		Secret:       bool | fn.Fn
		Type?:        (string & ("Boolean" | "Number" | "String")) | fn.Fn
	}
	propSettings :: {
		EntityUrlTemplate?:          string | fn.Fn
		ExecutionUrlTemplate?:       string | fn.Fn
		RevisionUrlTemplate?:        string | fn.Fn
		ThirdPartyConfigurationUrl?: string | fn.Fn
	}
}
Pipeline :: {
	Type: "AWS::CodePipeline::Pipeline"
	Properties: {
		ArtifactStore?: propArtifactStore
		ArtifactStores?: [...propArtifactStoreMap]
		DisableInboundStageTransitions?: [...propStageTransition]
		Name?:                     string | fn.Fn
		RestartExecutionOnUpdate?: bool | fn.Fn
		RoleArn:                   string | fn.Fn
		Stages: [...propStageDeclaration]
		Tags?: [...propTag]
	}
	propActionDeclaration :: {
		ActionTypeId:   propActionTypeId
		Configuration?: {
		} | fn.Fn
		InputArtifacts?: [...propInputArtifact]
		Name: string | fn.Fn
		OutputArtifacts?: [...propOutputArtifact]
		Region?:   string | fn.Fn
		RoleArn?:  string | fn.Fn
		RunOrder?: int | fn.Fn
	}
	propActionTypeId :: {
		Category: (string & ("Approval" | "Build" | "Deploy" | "Invoke" | "Source" | "Test")) | fn.Fn
		Owner:    (string & ("AWS" | "Custom" | "ThirdParty")) | fn.Fn
		Provider: string | fn.Fn
		Version:  string | fn.Fn
	}
	propArtifactStore :: {
		EncryptionKey?: propEncryptionKey
		Location:       string | fn.Fn
		Type:           (string & ("S3")) | fn.Fn
	}
	propArtifactStoreMap :: {
		ArtifactStore: propArtifactStore
		Region:        string | fn.Fn
	}
	propBlockerDeclaration :: {
		Name: string | fn.Fn
		Type: (string & ("Schedule")) | fn.Fn
	}
	propEncryptionKey :: {
		Id:   string | fn.Fn
		Type: string | fn.Fn
	}
	propInputArtifact :: {
		Name: string | fn.Fn
	}
	propOutputArtifact :: {
		Name: string | fn.Fn
	}
	propStageDeclaration :: {
		Actions: [...propActionDeclaration]
		Blockers?: [...propBlockerDeclaration]
		Name: string | fn.Fn
	}
	propStageTransition :: {
		Reason:    string | fn.Fn
		StageName: string | fn.Fn
	}
}
Webhook :: {
	Type: "AWS::CodePipeline::Webhook"
	Properties: {
		Authentication:              (string & ("GITHUB_HMAC" | "IP" | "UNAUTHENTICATED")) | fn.Fn
		AuthenticationConfiguration: propWebhookAuthConfiguration
		Filters: [...propWebhookFilterRule]
		Name?:                   string | fn.Fn
		RegisterWithThirdParty?: bool | fn.Fn
		TargetAction:            string | fn.Fn
		TargetPipeline:          string | fn.Fn
		TargetPipelineVersion:   int | fn.Fn
	}
	propWebhookAuthConfiguration :: {
		AllowedIPRange?: string | fn.Fn
		SecretToken?:    string | fn.Fn
	}
	propWebhookFilterRule :: {
		JsonPath:     string | fn.Fn
		MatchEquals?: string | fn.Fn
	}
}

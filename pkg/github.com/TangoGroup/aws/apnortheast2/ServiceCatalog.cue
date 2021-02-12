package apnortheast2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

ServiceCatalog :: {
	AcceptedPortfolioShare :: {
		Type:       "AWS::ServiceCatalog::AcceptedPortfolioShare"
		Properties: close({
			AcceptLanguage?: string | fn.Fn
			PortfolioId:     string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	CloudFormationProduct :: {
		Type:       "AWS::ServiceCatalog::CloudFormationProduct"
		Properties: close({
			AcceptLanguage?:                string | fn.Fn
			Description?:                   string | fn.Fn
			Distributor?:                   string | fn.Fn
			Name:                           string | fn.Fn
			Owner:                          string | fn.Fn
			ProvisioningArtifactParameters: [...close({
				Description?:               string | fn.Fn
				DisableTemplateValidation?: bool | fn.Fn
				Info:                       {
					[string]: _
				} | fn.Fn
				Name?: string | fn.Fn
			})] | fn.If
			ReplaceProvisioningArtifacts?: bool | fn.Fn
			SupportDescription?:           string | fn.Fn
			SupportEmail?:                 string | fn.Fn
			SupportUrl?:                   string | fn.Fn
			Tags?:                         [...close({
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
	CloudFormationProvisionedProduct :: {
		Type:       "AWS::ServiceCatalog::CloudFormationProvisionedProduct"
		Properties: close({
			AcceptLanguage?:           ("en" | "jp" | "zh") | fn.Fn
			NotificationArns?:         [...(string | fn.Fn)] | (string | fn.Fn)
			PathId?:                   (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
			PathName?:                 (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
			ProductId?:                (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
			ProductName?:              (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
			ProvisionedProductName?:   (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
			ProvisioningArtifactId?:   (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
			ProvisioningArtifactName?: string | fn.Fn
			ProvisioningParameters?:   [...close({
				Key:   (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			ProvisioningPreferences?: close({
				StackSetAccounts?:                   [...((=~#"^[0-9]{12}$"#) | fn.Fn)] | ((=~#"^[0-9]{12}$"#) | fn.Fn)
				StackSetFailureToleranceCount?:      int | fn.Fn
				StackSetFailureTolerancePercentage?: int | fn.Fn
				StackSetMaxConcurrencyCount?:        int | fn.Fn
				StackSetMaxConcurrencyPercentage?:   (>=1 & <=100) | fn.Fn
				StackSetOperationType?:              ("CREATE" | "UPDATE" | "DELETE") | fn.Fn
				StackSetRegions?:                    [...((=~#"^[a-z]{2}-([a-z]+-)+[1-9]"#) | fn.Fn)] | ((=~#"^[a-z]{2}-([a-z]+-)+[1-9]"#) | fn.Fn)
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
	LaunchNotificationConstraint :: {
		Type:       "AWS::ServiceCatalog::LaunchNotificationConstraint"
		Properties: close({
			AcceptLanguage?:  string | fn.Fn
			Description?:     string | fn.Fn
			NotificationArns: [...(string | fn.Fn)] | (string | fn.Fn)
			PortfolioId:      string | fn.Fn
			ProductId:        string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LaunchRoleConstraint :: {
		Type:       "AWS::ServiceCatalog::LaunchRoleConstraint"
		Properties: close({
			AcceptLanguage?: string | fn.Fn
			Description?:    string | fn.Fn
			LocalRoleName?:  string | fn.Fn
			PortfolioId:     string | fn.Fn
			ProductId:       string | fn.Fn
			RoleArn?:        string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LaunchTemplateConstraint :: {
		Type:       "AWS::ServiceCatalog::LaunchTemplateConstraint"
		Properties: close({
			AcceptLanguage?: string | fn.Fn
			Description?:    string | fn.Fn
			PortfolioId:     string | fn.Fn
			ProductId:       string | fn.Fn
			Rules:           string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Portfolio :: {
		Type:       "AWS::ServiceCatalog::Portfolio"
		Properties: close({
			AcceptLanguage?: string | fn.Fn
			Description?:    string | fn.Fn
			DisplayName:     string | fn.Fn
			ProviderName:    string | fn.Fn
			Tags?:           [...close({
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
	PortfolioPrincipalAssociation :: {
		Type:       "AWS::ServiceCatalog::PortfolioPrincipalAssociation"
		Properties: close({
			AcceptLanguage?: string | fn.Fn
			PortfolioId:     string | fn.Fn
			PrincipalARN:    string | fn.Fn
			PrincipalType:   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PortfolioProductAssociation :: {
		Type:       "AWS::ServiceCatalog::PortfolioProductAssociation"
		Properties: close({
			AcceptLanguage?:    string | fn.Fn
			PortfolioId:        string | fn.Fn
			ProductId:          string | fn.Fn
			SourcePortfolioId?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PortfolioShare :: {
		Type:       "AWS::ServiceCatalog::PortfolioShare"
		Properties: close({
			AcceptLanguage?:  string | fn.Fn
			AccountId:        string | fn.Fn
			PortfolioId:      string | fn.Fn
			ShareTagOptions?: bool | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ResourceUpdateConstraint :: {
		Type:       "AWS::ServiceCatalog::ResourceUpdateConstraint"
		Properties: close({
			AcceptLanguage?:               string | fn.Fn
			Description?:                  string | fn.Fn
			PortfolioId:                   string | fn.Fn
			ProductId:                     string | fn.Fn
			TagUpdateOnProvisionedProduct: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ServiceAction :: {
		Type:       "AWS::ServiceCatalog::ServiceAction"
		Properties: close({
			AcceptLanguage?: ("en" | "jp" | "zh") | fn.Fn
			Definition:      [...close({
				Key:   (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			DefinitionType: ("SSM_AUTOMATION") | fn.Fn
			Description?:   string | fn.Fn
			Name:           (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ServiceActionAssociation :: {
		Type:       "AWS::ServiceCatalog::ServiceActionAssociation"
		Properties: close({
			ProductId:              (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9_-]{1,99}\Z"#)) | fn.Fn
			ProvisioningArtifactId: (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9_-]{1,99}\Z"#)) | fn.Fn
			ServiceActionId:        (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9_-]{1,99}\Z"#)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	StackSetConstraint :: {
		Type:       "AWS::ServiceCatalog::StackSetConstraint"
		Properties: close({
			AcceptLanguage?:      string | fn.Fn
			AccountList:          [...(string | fn.Fn)] | (string | fn.Fn)
			AdminRole:            string | fn.Fn
			Description:          string | fn.Fn
			ExecutionRole:        string | fn.Fn
			PortfolioId:          string | fn.Fn
			ProductId:            string | fn.Fn
			RegionList:           [...(string | fn.Fn)] | (string | fn.Fn)
			StackInstanceControl: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TagOption :: {
		Type:       "AWS::ServiceCatalog::TagOption"
		Properties: close({
			Active?: bool | fn.Fn
			Key:     string | fn.Fn
			Value:   string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TagOptionAssociation :: {
		Type:       "AWS::ServiceCatalog::TagOptionAssociation"
		Properties: close({
			ResourceId:  string | fn.Fn
			TagOptionId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

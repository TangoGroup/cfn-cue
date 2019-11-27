package eunorth1

import "github.com/TangoGroup/aws/fn"

ServiceCatalog :: {
	CloudFormationProduct :: {
		Type: "AWS::ServiceCatalog::CloudFormationProduct"
		Properties: {
			AcceptLanguage?: string | fn.Fn
			Description?:    string | fn.Fn
			Distributor?:    string | fn.Fn
			Name:            string | fn.Fn
			Owner:           string | fn.Fn
			ProvisioningArtifactParameters: [...{
				Description?:               string | fn.Fn
				DisableTemplateValidation?: bool | fn.Fn
				Info:                       {
					[string]: _
				} | fn.Fn
				Name?: string | fn.Fn
			}]
			SupportDescription?: string | fn.Fn
			SupportEmail?:       string | fn.Fn
			SupportUrl?:         string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	CloudFormationProvisionedProduct :: {
		Type: "AWS::ServiceCatalog::CloudFormationProvisionedProduct"
		Properties: {
			AcceptLanguage?:           string | fn.Fn
			NotificationArns?:         [...(string | fn.Fn)] | fn.Fn
			PathId?:                   string | fn.Fn
			ProductId?:                string | fn.Fn
			ProductName?:              string | fn.Fn
			ProvisionedProductName?:   string | fn.Fn
			ProvisioningArtifactId?:   string | fn.Fn
			ProvisioningArtifactName?: string | fn.Fn
			ProvisioningParameters?: [...{
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			}]
			ProvisioningPreferences?: {
				StackSetAccounts?:                   [...(string | fn.Fn)] | fn.Fn
				StackSetFailureToleranceCount?:      int | fn.Fn
				StackSetFailureTolerancePercentage?: int | fn.Fn
				StackSetMaxConcurrencyCount?:        int | fn.Fn
				StackSetMaxConcurrencyPercentage?:   int | fn.Fn
				StackSetOperationType?:              string | fn.Fn
				StackSetRegions?:                    [...(string | fn.Fn)] | fn.Fn
			}
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LaunchNotificationConstraint :: {
		Type: "AWS::ServiceCatalog::LaunchNotificationConstraint"
		Properties: {
			AcceptLanguage?:  string | fn.Fn
			Description?:     string | fn.Fn
			NotificationArns: [...(string | fn.Fn)] | fn.Fn
			PortfolioId:      string | fn.Fn
			ProductId:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LaunchRoleConstraint :: {
		Type: "AWS::ServiceCatalog::LaunchRoleConstraint"
		Properties: {
			AcceptLanguage?: string | fn.Fn
			Description?:    string | fn.Fn
			PortfolioId:     string | fn.Fn
			ProductId:       string | fn.Fn
			RoleArn:         string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LaunchTemplateConstraint :: {
		Type: "AWS::ServiceCatalog::LaunchTemplateConstraint"
		Properties: {
			AcceptLanguage?: string | fn.Fn
			Description?:    string | fn.Fn
			PortfolioId:     string | fn.Fn
			ProductId:       string | fn.Fn
			Rules:           string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Portfolio :: {
		Type: "AWS::ServiceCatalog::Portfolio"
		Properties: {
			AcceptLanguage?: string | fn.Fn
			Description?:    string | fn.Fn
			DisplayName:     string | fn.Fn
			ProviderName:    string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	PortfolioPrincipalAssociation :: {
		Type: "AWS::ServiceCatalog::PortfolioPrincipalAssociation"
		Properties: {
			AcceptLanguage?: string | fn.Fn
			PortfolioId:     string | fn.Fn
			PrincipalARN:    string | fn.Fn
			PrincipalType:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ResourceUpdateConstraint :: {
		Type: "AWS::ServiceCatalog::ResourceUpdateConstraint"
		Properties: {
			AcceptLanguage?:               string | fn.Fn
			Description?:                  string | fn.Fn
			PortfolioId:                   string | fn.Fn
			ProductId:                     string | fn.Fn
			TagUpdateOnProvisionedProduct: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	TagOption :: {
		Type: "AWS::ServiceCatalog::TagOption"
		Properties: {
			Active?: bool | fn.Fn
			Key:     string | fn.Fn
			Value:   string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	TagOptionAssociation :: {
		Type: "AWS::ServiceCatalog::TagOptionAssociation"
		Properties: {
			ResourceId:  string | fn.Fn
			TagOptionId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

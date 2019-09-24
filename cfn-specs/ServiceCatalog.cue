package ServiceCatalog

AcceptedPortfolioShare :: {
	Type: "AWS::ServiceCatalog::AcceptedPortfolioShare"
	Properties: {
		AcceptLanguage?: string
		PortfolioId:     string
	}
}
CloudFormationProduct :: {
	Type: "AWS::ServiceCatalog::CloudFormationProduct"
	Properties: {
		AcceptLanguage?: string
		Description?:    string
		Distributor?:    string
		Name:            string
		Owner:           string
		ProvisioningArtifactParameters: [...__ProvisioningArtifactProperties]
		SupportDescription?: string
		SupportEmail?:       string
		SupportUrl?:         string
		Tags?: [...__Tag]
	}
	__ProvisioningArtifactProperties :: {
		Description?:               string
		DisableTemplateValidation?: bool
		Info: {
		}
		Name?: string
	}
}
CloudFormationProvisionedProduct :: {
	Type: "AWS::ServiceCatalog::CloudFormationProvisionedProduct"
	Properties: {
		AcceptLanguage?: string
		NotificationArns?: [...string]
		PathId?:                   string
		ProductId?:                string
		ProductName?:              string
		ProvisionedProductName?:   string
		ProvisioningArtifactId?:   string
		ProvisioningArtifactName?: string
		ProvisioningParameters?: [...__ProvisioningParameter]
		ProvisioningPreferences?: __ProvisioningPreferences
		Tags?: [...__Tag]
	}
	__ProvisioningParameter :: {
		Key?:   string
		Value?: string
	}
	__ProvisioningPreferences :: {
		StackSetAccounts?: [...string]
		StackSetFailureToleranceCount?:      int
		StackSetFailureTolerancePercentage?: int
		StackSetMaxConcurrencyCount?:        int
		StackSetMaxConcurrencyPercentage?:   int
		StackSetOperationType?:              string
		StackSetRegions?: [...string]
	}
}
LaunchNotificationConstraint :: {
	Type: "AWS::ServiceCatalog::LaunchNotificationConstraint"
	Properties: {
		AcceptLanguage?: string
		Description?:    string
		NotificationArns: [...string]
		PortfolioId: string
		ProductId:   string
	}
}
LaunchRoleConstraint :: {
	Type: "AWS::ServiceCatalog::LaunchRoleConstraint"
	Properties: {
		AcceptLanguage?: string
		Description?:    string
		PortfolioId:     string
		ProductId:       string
		RoleArn:         string
	}
}
LaunchTemplateConstraint :: {
	Type: "AWS::ServiceCatalog::LaunchTemplateConstraint"
	Properties: {
		AcceptLanguage?: string
		Description?:    string
		PortfolioId:     string
		ProductId:       string
		Rules:           string
	}
}
Portfolio :: {
	Type: "AWS::ServiceCatalog::Portfolio"
	Properties: {
		AcceptLanguage?: string
		Description?:    string
		DisplayName:     string
		ProviderName:    string
		Tags?: [...__Tag]
	}
}
PortfolioPrincipalAssociation :: {
	Type: "AWS::ServiceCatalog::PortfolioPrincipalAssociation"
	Properties: {
		AcceptLanguage?: string
		PortfolioId:     string
		PrincipalARN:    string
		PrincipalType:   string
	}
}
PortfolioProductAssociation :: {
	Type: "AWS::ServiceCatalog::PortfolioProductAssociation"
	Properties: {
		AcceptLanguage?:    string
		PortfolioId:        string
		ProductId:          string
		SourcePortfolioId?: string
	}
}
PortfolioShare :: {
	Type: "AWS::ServiceCatalog::PortfolioShare"
	Properties: {
		AcceptLanguage?: string
		AccountId:       string
		PortfolioId:     string
	}
}
ResourceUpdateConstraint :: {
	Type: "AWS::ServiceCatalog::ResourceUpdateConstraint"
	Properties: {
		AcceptLanguage?:               string
		Description?:                  string
		PortfolioId:                   string
		ProductId:                     string
		TagUpdateOnProvisionedProduct: string
	}
}
StackSetConstraint :: {
	Type: "AWS::ServiceCatalog::StackSetConstraint"
	Properties: {
		AcceptLanguage?: string
		AccountList: [...string]
		AdminRole:     string
		Description:   string
		ExecutionRole: string
		PortfolioId:   string
		ProductId:     string
		RegionList: [...string]
		StackInstanceControl: string
	}
}
TagOption :: {
	Type: "AWS::ServiceCatalog::TagOption"
	Properties: {
		Active?: bool
		Key:     string
		Value:   string
	}
}
TagOptionAssociation :: {
	Type: "AWS::ServiceCatalog::TagOptionAssociation"
	Properties: {
		ResourceId:  string
		TagOptionId: string
	}
}

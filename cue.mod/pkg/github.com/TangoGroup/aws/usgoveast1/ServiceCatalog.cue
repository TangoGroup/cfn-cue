package usgoveast1

import "github.com/TangoGroup/aws/fn"

#ServiceCatalog: {
	#CloudFormationProvisionedProduct: {
		Type: "AWS::ServiceCatalog::CloudFormationProvisionedProduct"
		Properties: {
			AcceptLanguage?:           string | fn.#Fn
			NotificationArns?:         [...(string | fn.#Fn)] | (string | fn.#Fn)
			PathId?:                   string | fn.#Fn
			PathName?:                 string | fn.#Fn
			ProductId?:                string | fn.#Fn
			ProductName?:              string | fn.#Fn
			ProvisionedProductName?:   string | fn.#Fn
			ProvisioningArtifactId?:   string | fn.#Fn
			ProvisioningArtifactName?: string | fn.#Fn
			ProvisioningParameters?:   [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			ProvisioningPreferences?: {
				StackSetAccounts?:                   [...(string | fn.#Fn)] | (string | fn.#Fn)
				StackSetFailureToleranceCount?:      int | fn.#Fn
				StackSetFailureTolerancePercentage?: int | fn.#Fn
				StackSetMaxConcurrencyCount?:        int | fn.#Fn
				StackSetMaxConcurrencyPercentage?:   int | fn.#Fn
				StackSetOperationType?:              string | fn.#Fn
				StackSetRegions?:                    [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

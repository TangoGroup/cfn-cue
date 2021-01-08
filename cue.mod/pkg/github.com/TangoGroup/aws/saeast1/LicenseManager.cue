package saeast1

import "github.com/TangoGroup/aws/fn"

#LicenseManager: {
	#Grant: {
		Type: "AWS::LicenseManager::Grant"
		Properties: {
			AllowedOperations?: {
				AllowedOperationList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
			ClientToken?: string | fn.#Fn
			Filters?:     {
				FilterList?: [...{
					Name:   string | fn.#Fn
					Values: {
						StringList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			GrantArns?: {
				ArnList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
			GrantName?:         string | fn.#Fn
			GrantStatus?:       string | fn.#Fn
			GrantedOperations?: {
				AllowedOperationList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
			GranteePrincipalArn?: string | fn.#Fn
			HomeRegion?:          string | fn.#Fn
			LicenseArn?:          string | fn.#Fn
			MaxResults?:          int | fn.#Fn
			NextToken?:           string | fn.#Fn
			ParentArn?:           string | fn.#Fn
			Principals?:          {
				ArnList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
			SourceVersion?: string | fn.#Fn
			Status?:        string | fn.#Fn
			StatusReason?:  string | fn.#Fn
			Tags?:          {
				TagList?: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Version?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#License: {
		Type: "AWS::LicenseManager::License"
		Properties: {
			Beneficiary?:             string | fn.#Fn
			ClientToken?:             string | fn.#Fn
			ConsumptionConfiguration: {
				BorrowConfiguration?: {
					AllowEarlyCheckIn:      bool | fn.#Fn
					MaxTimeToLiveInMinutes: int | fn.#Fn
				} | fn.#If
				ProvisionalConfiguration?: {
					MaxTimeToLiveInMinutes: int | fn.#Fn
				} | fn.#If
				RenewType?: string | fn.#Fn
			} | fn.#If
			Entitlements: {
				EntitlementList?: [...{
					AllowCheckIn?:  bool | fn.#Fn
					CheckoutRules?: {
						RuleList?: [...{
							Name:  string | fn.#Fn
							Unit:  string | fn.#Fn
							Value: string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					MaxCount?: int | fn.#Fn
					Name:      string | fn.#Fn
					Overage?:  bool | fn.#Fn
					Unit:      string | fn.#Fn
					Value?:    string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Filters?: {
				FilterList?: [...{
					Name:   string | fn.#Fn
					Values: {
						StringList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
				}] | fn.#If
			} | fn.#If
			HomeRegion: string | fn.#Fn
			Issuer:     {
				Name:     string | fn.#Fn
				SignKey?: string | fn.#Fn
			} | fn.#If
			LicenseArns?: {
				ArnList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.#If
			LicenseMetadata?: {
				MetadataList?: [...{
					Name:  string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			LicenseName?:   string | fn.#Fn
			MaxResults?:    int | fn.#Fn
			NextToken?:     string | fn.#Fn
			ProductName?:   string | fn.#Fn
			ProductSKU?:    string | fn.#Fn
			SourceVersion?: string | fn.#Fn
			Status?:        string | fn.#Fn
			Tags?:          {
				TagList?: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Validity: {
				Begin: string | fn.#Fn
				End:   string | fn.#Fn
			} | fn.#If
			Version?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

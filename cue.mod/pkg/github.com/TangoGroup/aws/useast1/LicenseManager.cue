package useast1

import "github.com/TangoGroup/aws/fn"

#LicenseManager: {
	#Grant: {
		Type:       "AWS::LicenseManager::Grant"
		Properties: close({
			AllowedOperations?: close({
				AllowedOperationList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			ClientToken?: string | fn.#Fn
			Filters?:     close({
				FilterList?: [...close({
					Name:   string | fn.#Fn
					Values: close({
						StringList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
				})] | fn.If
			}) | fn.If
			GrantArns?: close({
				ArnList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			GrantName?:         string | fn.#Fn
			GrantStatus?:       string | fn.#Fn
			GrantedOperations?: close({
				AllowedOperationList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			GranteePrincipalArn?: string | fn.#Fn
			HomeRegion?:          string | fn.#Fn
			LicenseArn?:          string | fn.#Fn
			MaxResults?:          int | fn.#Fn
			NextToken?:           string | fn.#Fn
			ParentArn?:           string | fn.#Fn
			Principals?:          close({
				ArnList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			SourceVersion?: string | fn.#Fn
			Status?:        string | fn.#Fn
			StatusReason?:  string | fn.#Fn
			Tags?:          close({
				TagList?: [...close({
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Version?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#License: {
		Type:       "AWS::LicenseManager::License"
		Properties: close({
			Beneficiary?:             string | fn.#Fn
			ClientToken?:             string | fn.#Fn
			ConsumptionConfiguration: close({
				BorrowConfiguration?: close({
					AllowEarlyCheckIn:      bool | fn.#Fn
					MaxTimeToLiveInMinutes: int | fn.#Fn
				}) | fn.If
				ProvisionalConfiguration?: close({
					MaxTimeToLiveInMinutes: int | fn.#Fn
				}) | fn.If
				RenewType?: string | fn.#Fn
			}) | fn.If
			Entitlements: close({
				EntitlementList?: [...close({
					AllowCheckIn?:  bool | fn.#Fn
					CheckoutRules?: close({
						RuleList?: [...close({
							Name:  string | fn.#Fn
							Unit:  string | fn.#Fn
							Value: string | fn.#Fn
						})] | fn.If
					}) | fn.If
					MaxCount?: int | fn.#Fn
					Name:      string | fn.#Fn
					Overage?:  bool | fn.#Fn
					Unit:      string | fn.#Fn
					Value?:    string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Filters?: close({
				FilterList?: [...close({
					Name:   string | fn.#Fn
					Values: close({
						StringList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
				})] | fn.If
			}) | fn.If
			HomeRegion: string | fn.#Fn
			Issuer:     close({
				Name:     string | fn.#Fn
				SignKey?: string | fn.#Fn
			}) | fn.If
			LicenseArns?: close({
				ArnList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			LicenseMetadata?: close({
				MetadataList?: [...close({
					Name:  string | fn.#Fn
					Value: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			LicenseName?:   string | fn.#Fn
			MaxResults?:    int | fn.#Fn
			NextToken?:     string | fn.#Fn
			ProductName?:   string | fn.#Fn
			ProductSKU?:    string | fn.#Fn
			SourceVersion?: string | fn.#Fn
			Status?:        string | fn.#Fn
			Tags?:          close({
				TagList?: [...close({
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Validity: close({
				Begin: string | fn.#Fn
				End:   string | fn.#Fn
			}) | fn.If
			Version?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

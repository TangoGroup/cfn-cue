package saeast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

LicenseManager :: {
	Grant :: {
		Type:       "AWS::LicenseManager::Grant"
		Properties: close({
			AllowedOperations?: [...(string | fn.Fn)] | (string | fn.Fn)
			GrantName?:         string | fn.Fn
			HomeRegion?:        string | fn.Fn
			LicenseArn?:        string | fn.Fn
			Principals?:        [...(string | fn.Fn)] | (string | fn.Fn)
			Status?:            string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	License :: {
		Type:       "AWS::LicenseManager::License"
		Properties: close({
			Beneficiary?:             string | fn.Fn
			ConsumptionConfiguration: close({
				BorrowConfiguration?: close({
					AllowEarlyCheckIn:      bool | fn.Fn
					MaxTimeToLiveInMinutes: int | fn.Fn
				}) | fn.If
				ProvisionalConfiguration?: close({
					MaxTimeToLiveInMinutes: int | fn.Fn
				}) | fn.If
				RenewType?: string | fn.Fn
			}) | fn.If
			Entitlements: [...close({
				AllowCheckIn?: bool | fn.Fn
				MaxCount?:     int | fn.Fn
				Name:          string | fn.Fn
				Overage?:      bool | fn.Fn
				Unit:          string | fn.Fn
				Value?:        string | fn.Fn
			})] | fn.If
			HomeRegion: string | fn.Fn
			Issuer:     close({
				Name:     string | fn.Fn
				SignKey?: string | fn.Fn
			}) | fn.If
			LicenseMetadata?: [...close({
				Name:  string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			LicenseName: string | fn.Fn
			ProductName: string | fn.Fn
			ProductSKU?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			Status?:     string | fn.Fn
			Validity:    close({
				Begin: string | fn.Fn
				End:   string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

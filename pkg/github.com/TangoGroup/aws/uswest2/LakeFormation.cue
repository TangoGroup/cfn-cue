package uswest2

import "github.com/TangoGroup/aws/fn"

#LakeFormation: {
	#DataLakeSettings: {
		Type:       "AWS::LakeFormation::DataLakeSettings"
		Properties: close({
			Admins?: [...close({
				DataLakePrincipalIdentifier?: string | fn.#Fn
			})] | fn.If
			TrustedResourceOwners?: [...(string | fn.#Fn)] | (string | fn.#Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Permissions: {
		Type:       "AWS::LakeFormation::Permissions"
		Properties: close({
			DataLakePrincipal: close({
				DataLakePrincipalIdentifier?: string | fn.#Fn
			}) | fn.If
			Permissions?:                [...(string | fn.#Fn)] | (string | fn.#Fn)
			PermissionsWithGrantOption?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Resource:                    close({
				DataLocationResource?: close({
					CatalogId?:  string | fn.#Fn
					S3Resource?: string | fn.#Fn
				}) | fn.If
				DatabaseResource?: close({
					CatalogId?: string | fn.#Fn
					Name?:      string | fn.#Fn
				}) | fn.If
				TableResource?: close({
					CatalogId?:     string | fn.#Fn
					DatabaseName?:  string | fn.#Fn
					Name?:          string | fn.#Fn
					TableWildcard?: close({}) | fn.If
				}) | fn.If
				TableWithColumnsResource?: close({
					CatalogId?:      string | fn.#Fn
					ColumnNames?:    [...(string | fn.#Fn)] | (string | fn.#Fn)
					ColumnWildcard?: close({
						ExcludedColumnNames?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					DatabaseName?: string | fn.#Fn
					Name?:         string | fn.#Fn
				}) | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Resource: {
		Type:       "AWS::LakeFormation::Resource"
		Properties: close({
			ResourceArn:          string | fn.#Fn
			RoleArn?:             string | fn.#Fn
			UseServiceLinkedRole: bool | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

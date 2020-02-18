package apnortheast1

import "github.com/TangoGroup/aws/fn"

LakeFormation :: {
	DataLakeSettings :: {
		Type: "AWS::LakeFormation::DataLakeSettings"
		Properties: Admins?: [...close({
			DataLakePrincipalIdentifier?: string | fn.Fn
		})] | fn.If
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Permissions :: {
		Type: "AWS::LakeFormation::Permissions"
		Properties: {
			DataLakePrincipal: close({
				DataLakePrincipalIdentifier?: string | fn.Fn
			}) | fn.If
			Permissions?:                [...(string | fn.Fn)] | (string | fn.Fn)
			PermissionsWithGrantOption?: [...(string | fn.Fn)] | (string | fn.Fn)
			Resource:                    close({
				DataLocationResource?: close({
					S3Resource?: string | fn.Fn
				}) | fn.If
				DatabaseResource?: close({
					Name?: string | fn.Fn
				}) | fn.If
				TableResource?: close({
					DatabaseName?: string | fn.Fn
					Name?:         string | fn.Fn
				}) | fn.If
				TableWithColumnsResource?: close({
					ColumnNames?:    [...(string | fn.Fn)] | (string | fn.Fn)
					ColumnWildcard?: close({
						ExcludedColumnNames?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					DatabaseName?: string | fn.Fn
					Name?:         string | fn.Fn
				}) | fn.If
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Resource :: {
		Type: "AWS::LakeFormation::Resource"
		Properties: {
			ResourceArn:          string | fn.Fn
			RoleArn?:             string | fn.Fn
			UseServiceLinkedRole: bool | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

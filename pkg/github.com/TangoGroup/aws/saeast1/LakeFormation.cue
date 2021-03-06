package saeast1

import "github.com/TangoGroup/aws/fn"

LakeFormation :: {
	DataLakeSettings :: {
		Type: "AWS::LakeFormation::DataLakeSettings"
		Properties: Admins?: [...{
			DataLakePrincipalIdentifier?: string | fn.Fn
		}]
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Permissions :: {
		Type: "AWS::LakeFormation::Permissions"
		Properties: {
			DataLakePrincipal: DataLakePrincipalIdentifier?: string | fn.Fn
			Permissions?:                [...(string | fn.Fn)] | (string | fn.Fn)
			PermissionsWithGrantOption?: [...(string | fn.Fn)] | (string | fn.Fn)
			Resource: {
				DatabaseResource?: Name?: string | fn.Fn
				TableResource?: {
					DatabaseName?: string | fn.Fn
					Name?:         string | fn.Fn
				}
			}
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

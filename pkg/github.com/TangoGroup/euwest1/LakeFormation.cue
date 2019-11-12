package euwest1

import "github.com/TangoGroup/fn"

LakeFormation :: {
	DataLakeSettings :: {
		Type: "AWS::LakeFormation::DataLakeSettings"
		Properties: Admins?: {
		}
	}
	Permissions :: {
		Type: "AWS::LakeFormation::Permissions"
		Properties: {
			DataLakePrincipal: DataLakePrincipalIdentifier?: string | fn.Fn
			Permissions?: [...(string | fn.Fn)]
			PermissionsWithGrantOption?: [...(string | fn.Fn)]
			Resource: {
				DatabaseResource?: Name?: string | fn.Fn
				TableResource?: {
					DatabaseName?: string | fn.Fn
					Name?:         string | fn.Fn
				}
			}
		}
	}
	Resource :: {
		Type: "AWS::LakeFormation::Resource"
		Properties: {
			ResourceArn:          string | fn.Fn
			RoleArn?:             string | fn.Fn
			UseServiceLinkedRole: bool | fn.Fn
		}
	}
}

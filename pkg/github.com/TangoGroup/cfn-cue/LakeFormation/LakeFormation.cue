package LakeFormation

import "github.com/TangoGroup/fn"

DataLakeSettings :: {
	Type: "AWS::LakeFormation::DataLakeSettings"
	Properties: Admins?: propAdmins
	propAdmins :: {
	}
	propDataLakePrincipal :: {
		DataLakePrincipalIdentifier?: string | fn.Fn
	}
}
Permissions :: {
	Type: "AWS::LakeFormation::Permissions"
	Properties: {
		DataLakePrincipal:           propDataLakePrincipal
		Permissions?:                [...string] | fn.Fn
		PermissionsWithGrantOption?: [...string] | fn.Fn
		Resource:                    propResource
	}
	propDataLakePrincipal :: {
		DataLakePrincipalIdentifier?: string | fn.Fn
	}
	propDatabaseResource :: {
		Name?: string | fn.Fn
	}
	propResource :: {
		DatabaseResource?: propDatabaseResource
		TableResource?:    propTableResource
	}
	propTableResource :: {
		DatabaseName?: string | fn.Fn
		Name?:         string | fn.Fn
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

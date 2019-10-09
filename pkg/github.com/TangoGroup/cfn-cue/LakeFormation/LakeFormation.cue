package LakeFormation

import "github.com/TangoGroup/fn"

DataLakeSettings :: {
	Type: "AWS::LakeFormation::DataLakeSettings"
	Properties: {
		Admins?: __Admins
	}
	__Admins :: {
	}
	__DataLakePrincipal :: {
		DataLakePrincipalIdentifier?: string | fn.Fn
	}
}
Permissions :: {
	Type: "AWS::LakeFormation::Permissions"
	Properties: {
		DataLakePrincipal:           __DataLakePrincipal
		Permissions?:                [...string] | fn.Fn
		PermissionsWithGrantOption?: [...string] | fn.Fn
		Resource:                    __Resource
	}
	__DataLakePrincipal :: {
		DataLakePrincipalIdentifier?: string | fn.Fn
	}
	__DatabaseResource :: {
		Name?: string | fn.Fn
	}
	__Resource :: {
		DatabaseResource?: __DatabaseResource
		TableResource?:    __TableResource
	}
	__TableResource :: {
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

package LakeFormation

DataLakeSettings :: {
	Type: "AWS::LakeFormation::DataLakeSettings"
	Properties: {
		Admins?: __Admins
	}
	__Admins = {
	}
	__DataLakePrincipal = {
		DataLakePrincipalIdentifier?: string
	}
}
Permissions :: {
	Type: "AWS::LakeFormation::Permissions"
	Properties: {
		DataLakePrincipal: __DataLakePrincipal
		Permissions?: [...string]
		PermissionsWithGrantOption?: [...string]
		Resource: __Resource
	}
	__DataLakePrincipal = {
		DataLakePrincipalIdentifier?: string
	}
	__DatabaseResource = {
		Name?: string
	}
	__Resource = {
		DatabaseResource?: __DatabaseResource
		TableResource?:    __TableResource
	}
	__TableResource = {
		DatabaseName?: string
		Name?:         string
	}
}
Resource :: {
	Type: "AWS::LakeFormation::Resource"
	Properties: {
		ResourceArn:          string
		RoleArn?:             string
		UseServiceLinkedRole: bool
	}
}

package uswest2extended

import fn "github.com/TangoGroup/aws/fnextended"

#CloudFormation: #CustomResource: {
	Type:       "AWS::CloudFormation::CustomResource" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
	Properties: close({
		ServiceToken: string | fn.#Fn
		{
			...
		}
	})
	DependsOn?:           string | [...string]
	DeletionPolicy?:      "Delete" | "Retain"
	UpdateReplacePolicy?: "Delete" | "Retain"
	Metadata?: [string]: _
	Condition?: string
}

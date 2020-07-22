package saeast1

import "github.com/TangoGroup/aws/fn"

#SDB: {
	#Domain: {
		Type:       "AWS::SDB::Domain"
		Properties: close({
			Description?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

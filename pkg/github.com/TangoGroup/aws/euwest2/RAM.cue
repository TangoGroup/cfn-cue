package euwest2

import "github.com/TangoGroup/aws/fn"

#RAM: {
	#ResourceShare: {
		Type:       "AWS::RAM::ResourceShare"
		Properties: close({
			AllowExternalPrincipals?: bool | fn.#Fn
			Name:                     string | fn.#Fn
			Principals?:              [...(string | fn.#Fn)] | (string | fn.#Fn)
			ResourceArns?:            [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:                    [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

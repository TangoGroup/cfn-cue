package usgoveast1

import "github.com/TangoGroup/aws/fn"

ResourceGroups :: {
	Group :: {
		Type:       "AWS::ResourceGroups::Group"
		Properties: close({
			Description?:   string | fn.Fn
			Name:           string | fn.Fn
			ResourceQuery?: close({
				Query?: close({
					ResourceTypeFilters?: [...(string | fn.Fn)] | (string | fn.Fn)
					StackIdentifier?:     string | fn.Fn
					TagFilters?:          [...close({
						Key?:    string | fn.Fn
						Values?: [...(string | fn.Fn)] | (string | fn.Fn)
					})] | fn.If
				}) | fn.If
				Type?: ("TAG_FILTERS_1_0" | "CLOUDFORMATION_STACK_1_0") | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

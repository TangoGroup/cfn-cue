package cnnorthwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

CE :: {
	CostCategory :: {
		Type:       "AWS::CE::CostCategory"
		Properties: close({
			DefaultValue?: (strings.MinRunes(1) & strings.MaxRunes(50)) | fn.Fn
			Name:          (strings.MinRunes(1) & strings.MaxRunes(50)) | fn.Fn
			RuleVersion:   ("CostCategoryExpression.v1") | fn.Fn
			Rules:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

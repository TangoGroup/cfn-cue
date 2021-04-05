package uswest2

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

FIS :: {
	ExperimentTemplate :: {
		Type:       "AWS::FIS::ExperimentTemplate"
		Properties: close({
			Actions?: {
				[string]: close({
					ActionId:     string | fn.Fn
					Description?: string | fn.Fn
					Parameters?:  close({
					}) | fn.If
					StartAfter?: close({
						ExperimentTemplateActionItemStartAfterList?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					Targets?: close({
					}) | fn.If
				})
			} | fn.If
			Description:    string | fn.Fn
			RoleArn:        string | fn.Fn
			StopConditions: [...close({
				Source: string | fn.Fn
				Value?: (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
			})] | fn.If
			Tags: {
				[string]: string | fn.Fn
			} | fn.If
			Targets: {
				[string]: close({
					Filters?: close({
						ExperimentTemplateTargetFilterList?: [...close({
							Path:   string | fn.Fn
							Values: close({
								ExperimentTemplateTargetFilterValues?: [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
						})] | fn.If
					}) | fn.If
					ResourceArns?: close({
						ResourceArnList?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					ResourceTags?: close({
					}) | fn.If
					ResourceType:  string | fn.Fn
					SelectionMode: string | fn.Fn
				})
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

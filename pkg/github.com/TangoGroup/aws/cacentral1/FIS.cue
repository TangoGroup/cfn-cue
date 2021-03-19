package cacentral1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

FIS :: {
	ExperimentTemplate :: {
		Type:       "AWS::FIS::ExperimentTemplate"
		Properties: close({
			actions?: {
				[string]: close({
					actionId?:    string | fn.Fn
					description?: string | fn.Fn
					parameters?:  close({
					}) | fn.If
					startAfter?: close({
						ExperimentTemplateActionItemStartAfterList?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					targets?: close({
					}) | fn.If
				})
			} | fn.If
			description:    string | fn.Fn
			roleArn:        string | fn.Fn
			stopConditions: [...close({
				source: string | fn.Fn
				value?: (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
			})] | fn.If
			tags: {
				[string]: string | fn.Fn
			} | fn.If
			targets: {
				[string]: close({
					filters?: close({
						ExperimentTemplateTargetFilterList?: [...close({
							path:   string | fn.Fn
							values: close({
								ExperimentTemplateTargetFilterValues?: [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
						})] | fn.If
					}) | fn.If
					resourceArns?: close({
						ResourceArnList?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					resourceTags?: close({
					}) | fn.If
					resourceType:  string | fn.Fn
					selectionMode: string | fn.Fn
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

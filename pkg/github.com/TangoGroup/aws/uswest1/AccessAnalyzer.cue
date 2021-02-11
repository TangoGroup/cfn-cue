package uswest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

AccessAnalyzer :: {
	Analyzer :: {
		Type:       "AWS::AccessAnalyzer::Analyzer"
		Properties: close({
			AnalyzerName?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			ArchiveRules?: [...close({
				Filter: [...close({
					Contains?: [...(string | fn.Fn)] | (string | fn.Fn)
					Eq?:       [...(string | fn.Fn)] | (string | fn.Fn)
					Exists?:   bool | fn.Fn
					Neq?:      [...(string | fn.Fn)] | (string | fn.Fn)
					Property:  string | fn.Fn
				})] | fn.If
				RuleName: string | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package apsoutheast1

import "github.com/TangoGroup/aws/fn"

AccessAnalyzer :: {
	Analyzer :: {
		Type: "AWS::AccessAnalyzer::Analyzer"
		Properties: {
			AnalyzerName?: string | fn.Fn
			ArchiveRules?: [...{
				Filter: [...{
					Contains?: [...(string | fn.Fn)] | (string | fn.Fn)
					Eq?:       [...(string | fn.Fn)] | (string | fn.Fn)
					Exists?:   bool | fn.Fn
					Neq?:      [...(string | fn.Fn)] | (string | fn.Fn)
					Property:  string | fn.Fn
				}] | fn.If
				RuleName: string | fn.Fn
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			Type: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package uswest2

import "github.com/TangoGroup/aws/fn"

EventSchemas :: {
	Discoverer :: {
		Type:       "AWS::EventSchemas::Discoverer"
		Properties: close({
			Description?: string | fn.Fn
			SourceArn:    string | fn.Fn
			Tags?:        [...close({
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
	Registry :: {
		Type:       "AWS::EventSchemas::Registry"
		Properties: close({
			Description?:  string | fn.Fn
			RegistryName?: string | fn.Fn
			Tags?:         [...close({
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
	Schema :: {
		Type:       "AWS::EventSchemas::Schema"
		Properties: close({
			Content:      string | fn.Fn
			Description?: string | fn.Fn
			RegistryName: string | fn.Fn
			SchemaName?:  string | fn.Fn
			Tags?:        [...close({
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

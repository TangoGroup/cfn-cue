package euwest1

import "github.com/TangoGroup/aws/fn"

EventSchemas :: {
	Discoverer :: {
		Type: "AWS::EventSchemas::Discoverer"
		Properties: {
			Description?: string | fn.Fn
			SourceArn:    string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Registry :: {
		Type: "AWS::EventSchemas::Registry"
		Properties: {
			Description?:  string | fn.Fn
			RegistryName?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Schema :: {
		Type: "AWS::EventSchemas::Schema"
		Properties: {
			Content:      string | fn.Fn
			Description?: string | fn.Fn
			RegistryName: string | fn.Fn
			SchemaName?:  string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			Type: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

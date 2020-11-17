package apsoutheast2

import "github.com/TangoGroup/aws/fn"

#DataBrew: {
	#Dataset: {
		Type: "AWS::DataBrew::Dataset"
		Properties: {
			FormatOptions?: {
				[string]: _
			} | fn.#Fn
			Input: {
				[string]: _
			} | fn.#Fn
			Name:  string | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Job: {
		Type: "AWS::DataBrew::Job"
		Properties: {
			DatasetName?:      string | fn.#Fn
			EncryptionKeyArn?: string | fn.#Fn
			EncryptionMode?:   string | fn.#Fn
			LogSubscription?:  string | fn.#Fn
			MaxCapacity?:      int | fn.#Fn
			MaxRetries?:       int | fn.#Fn
			Name:              string | fn.#Fn
			OutputLocation?:   {
				[string]: _
			} | fn.#Fn
			Outputs?: [...{
				CompressionFormat?: string | fn.#Fn
				Format?:            string | fn.#Fn
				Location:           {
					Bucket: string | fn.#Fn
					Key?:   string | fn.#Fn
				} | fn.If
				Overwrite?:        bool | fn.#Fn
				PartitionColumns?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}] | fn.If
			ProjectName?: string | fn.#Fn
			Recipe?:      {
				[string]: _
			} | fn.#Fn
			RoleArn: string | fn.#Fn
			Tags?:   [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			Timeout?: int | fn.#Fn
			Type:     string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Project: {
		Type: "AWS::DataBrew::Project"
		Properties: {
			DatasetName: string | fn.#Fn
			Name:        string | fn.#Fn
			RecipeName:  string | fn.#Fn
			RoleArn:     string | fn.#Fn
			Sample?:     {
				[string]: _
			} | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Recipe: {
		Type: "AWS::DataBrew::Recipe"
		Properties: {
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			ProjectName?: string | fn.#Fn
			Steps:        [...{
				Action: {
					[string]: _
				} | fn.#Fn
				ConditionExpressions?: [...{
					Condition:    string | fn.#Fn
					TargetColumn: string | fn.#Fn
					Value?:       string | fn.#Fn
				}] | fn.If
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			Version?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Schedule: {
		Type: "AWS::DataBrew::Schedule"
		Properties: {
			CronExpression: string | fn.#Fn
			JobNames?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
			Name:           string | fn.#Fn
			Tags?:          [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

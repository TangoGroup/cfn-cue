package uswest2

import "github.com/TangoGroup/aws/fn"

#Timestream: {
	#Database: {
		Type: "AWS::Timestream::Database"
		Properties: {
			DatabaseName?: string | fn.#Fn
			KmsKeyId?:     string | fn.#Fn
			Tags?:         [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Table: {
		Type: "AWS::Timestream::Table"
		Properties: {
			DatabaseName:         string | fn.#Fn
			RetentionProperties?: {
				[string]: _
			} | fn.#Fn
			TableName?: string | fn.#Fn
			Tags?:      [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

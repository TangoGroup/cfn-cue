package eunorth1

import "github.com/TangoGroup/aws/fn"

#Macie: {
	#CustomDataIdentifier: {
		Type:       "AWS::Macie::CustomDataIdentifier"
		Properties: close({
			Description?:          string | fn.#Fn
			IgnoreWords?:          [...(string | fn.#Fn)] | (string | fn.#Fn)
			Keywords?:             [...(string | fn.#Fn)] | (string | fn.#Fn)
			MaximumMatchDistance?: int | fn.#Fn
			Name:                  string | fn.#Fn
			Regex:                 string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#FindingsFilter: {
		Type:       "AWS::Macie::FindingsFilter"
		Properties: close({
			Action?:         string | fn.#Fn
			Description?:    string | fn.#Fn
			FindingCriteria: close({
				Criterion?: close({}) | fn.If
			}) | fn.If
			Name:      string | fn.#Fn
			Position?: int | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Session: {
		Type:       "AWS::Macie::Session"
		Properties: close({
			FindingPublishingFrequency?: string | fn.#Fn
			Status?:                     string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

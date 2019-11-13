package usgovwest1

import "github.com/TangoGroup/aws/fn"

Inspector :: {
	AssessmentTarget :: {
		Type: "AWS::Inspector::AssessmentTarget"
		Properties: {
			AssessmentTargetName?: string | fn.Fn
			ResourceGroupArn?:     string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	AssessmentTemplate :: {
		Type: "AWS::Inspector::AssessmentTemplate"
		Properties: {
			AssessmentTargetArn:     string | fn.Fn
			AssessmentTemplateName?: string | fn.Fn
			DurationInSeconds:       (int & (>=180 & <=86400)) | fn.Fn
			RulesPackageArns: [...(string | fn.Fn)]
			UserAttributesForFindings?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ResourceGroup :: {
		Type: "AWS::Inspector::ResourceGroup"
		Properties: ResourceGroupTags: [...{
			Key:   string | fn.Fn
			Value: string | fn.Fn
		}]
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

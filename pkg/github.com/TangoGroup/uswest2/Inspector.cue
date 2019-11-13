package uswest2

import "github.com/TangoGroup/fn"

Inspector :: {
	AssessmentTarget :: {
		Type: "AWS::Inspector::AssessmentTarget"
		Properties: {
			AssessmentTargetName?: string | fn.Fn
			ResourceGroupArn?:     string | fn.Fn
		}
		DependsOn?: string | [...string]
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
		DependsOn?: string | [...string]
	}
	ResourceGroup :: {
		Type: "AWS::Inspector::ResourceGroup"
		Properties: ResourceGroupTags: [...{
			Key:   string | fn.Fn
			Value: string | fn.Fn
		}]
		DependsOn?: string | [...string]
	}
}

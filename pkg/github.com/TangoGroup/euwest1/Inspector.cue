package euwest1

import "github.com/TangoGroup/fn"

Inspector :: {
	AssessmentTarget :: {
		Type: "AWS::Inspector::AssessmentTarget"
		Properties: {
			AssessmentTargetName?: string | fn.Fn
			ResourceGroupArn?:     string | fn.Fn
		}
	}
	AssessmentTemplate :: {
		Type: "AWS::Inspector::AssessmentTemplate"
		Properties: {
			AssessmentTargetArn:     string | fn.Fn
			AssessmentTemplateName?: string | fn.Fn
			DurationInSeconds:       (int & (>=180 & <=86400)) | fn.Fn
			RulesPackageArns: [...(string | fn.Fn)]
			UserAttributesForFindings?: [...{
			}]
		}
	}
	ResourceGroup :: {
		Type: "AWS::Inspector::ResourceGroup"
		Properties: ResourceGroupTags: [...{
		}]
	}
}

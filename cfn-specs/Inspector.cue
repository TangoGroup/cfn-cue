package Inspector

AssessmentTarget :: {
  Type: "AWS::Inspector::AssessmentTarget"
  Properties: {
    AssessmentTargetName?: string
    ResourceGroupArn?:     string
  }
}
AssessmentTemplate :: {
  Type: "AWS::Inspector::AssessmentTemplate"
  Properties: {
    AssessmentTargetArn:     string
    AssessmentTemplateName?: string
    DurationInSeconds:       >=180 & <=86400
    DurationInSeconds:       int
    RulesPackageArns: [...string]
    UserAttributesForFindings?: [...__Tag]
  }
}
ResourceGroup :: {
  Type: "AWS::Inspector::ResourceGroup"
  Properties: {
    ResourceGroupTags: [...__Tag]
  }
}

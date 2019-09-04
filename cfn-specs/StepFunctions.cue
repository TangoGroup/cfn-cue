package StepFunctions

Activity :: {
  Type: "AWS::StepFunctions::Activity"
  Properties: {
    Name: string
    Tags?: [...__TagsEntry]
  }
  __TagsEntry = {
    Key:   string
    Value: string
  }
}
StateMachine :: {
  Type: "AWS::StepFunctions::StateMachine"
  Properties: {
    DefinitionString:  string
    RoleArn:           string
    StateMachineName?: string
    Tags?: [...__TagsEntry]
  }
  __TagsEntry = {
    Key:   string
    Value: string
  }
}

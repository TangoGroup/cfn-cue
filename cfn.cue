package cfn

Stack :: {
	Capabilities: [...string]
	DisableRollback: bool
	EnableTerminationProtection: bool
	NotificationARNs [...string]
	OnFailure: "DO_NOTHING" | "ROLLBACK" | "DELETE"
	Parameters [...{
		ParameterKey: string
		{
			ParameterValue: string
			UsePreviousValue?: false
		} | {
			UsePreviousValue: true
		}
	}]
	ResourceTypes [...string]
	RoleARN: string & strings.MinLength(20)
	RollbackConfiguration: {
		MonitoringTimeInMinutes: int
		RollbackTriggers: [...{
			Arn: string
			Type: string
		}]
	}
	StackName: string & =~"^[a-zA-Z]" & strings.MaxLength(128)
	{StackPolicyBody: string} | {StackPolicyURL: string}
	Tags [...{
		Key: string & !~"^aws:" & strings.MaxLength(128)
		Value: string & strings.MaxLength(256	)
	}]
	{TemplateBody: string} | {TemplateURL: string}
	TimeoutInMinutes: int
}
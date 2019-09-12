package SSM

Association :: {
	Type: "AWS::SSM::Association"
	Properties: {
		AssociationName?: string
		DocumentVersion?: string
		InstanceId?:      string
		Name:             string
		OutputLocation?:  __InstanceAssociationOutputLocation
		Parameters?: {
		}
		ScheduleExpression?: string
		Targets?: [...__Target]
	}
	__InstanceAssociationOutputLocation = {
		S3Location?: __S3OutputLocation
	}
	__ParameterValues = {
		ParameterValues: [...string]
	}
	__S3OutputLocation = {
		OutputS3BucketName?: string
		OutputS3KeyPrefix?:  string
	}
	__Target = {
		Key: string
		Values: [...string]
	}
}
Document :: {
	Type: "AWS::SSM::Document"
	Properties: {
		Content: {
		}
		DocumentType?: string
		Tags?: [...__Tag]
	}
}
MaintenanceWindow :: {
	Type: "AWS::SSM::MaintenanceWindow"
	Properties: {
		AllowUnassociatedTargets: bool
		Cutoff:                   >=0 & <=23
		Cutoff:                   int
		Description?:             string
		Duration:                 >=1 & <=24
		Duration:                 int
		EndDate?:                 string
		Name:                     string
		Schedule:                 string
		ScheduleTimezone?:        string
		StartDate?:               string
		Tags?: [...__Tag]
	}
}
MaintenanceWindowTarget :: {
	Type: "AWS::SSM::MaintenanceWindowTarget"
	Properties: {
		Description?:      string
		Name?:             string
		OwnerInformation?: string
		ResourceType:      string
		Targets: [...__Target]
		WindowId: string
	}
	__Target = {
		Key: string
		Values?: [...string]
	}
}
MaintenanceWindowTask :: {
	Type: "AWS::SSM::MaintenanceWindowTask"
	Properties: {
		Description?:    string
		LoggingInfo?:    __LoggingInfo
		MaxConcurrency:  string
		MaxErrors:       string
		Name?:           string
		Priority:        int
		ServiceRoleArn?: string
		Targets: [...__Target]
		TaskArn:                   string
		TaskInvocationParameters?: __TaskInvocationParameters
		TaskParameters?: {
		}
		TaskType: string
		WindowId: string
	}
	__LoggingInfo = {
		Region:    string
		S3Bucket:  string
		S3Prefix?: string
	}
	__MaintenanceWindowAutomationParameters = {
		DocumentVersion?: string
		Parameters?: {
		}
	}
	__MaintenanceWindowLambdaParameters = {
		ClientContext?: string
		Payload?:       string
		Qualifier?:     string
	}
	__MaintenanceWindowRunCommandParameters = {
		Comment?:            string
		DocumentHash?:       string
		DocumentHashType?:   string
		NotificationConfig?: __NotificationConfig
		OutputS3BucketName?: string
		OutputS3KeyPrefix?:  string
		Parameters?: {
		}
		ServiceRoleArn?: string
		TimeoutSeconds?: int
	}
	__MaintenanceWindowStepFunctionsParameters = {
		Input?: string
		Name?:  string
	}
	__NotificationConfig = {
		NotificationArn: string
		NotificationEvents?: [...string]
		NotificationType?: string
	}
	__Target = {
		Key: string
		Values?: [...string]
	}
	__TaskInvocationParameters = {
		MaintenanceWindowAutomationParameters?:    __MaintenanceWindowAutomationParameters
		MaintenanceWindowLambdaParameters?:        __MaintenanceWindowLambdaParameters
		MaintenanceWindowRunCommandParameters?:    __MaintenanceWindowRunCommandParameters
		MaintenanceWindowStepFunctionsParameters?: __MaintenanceWindowStepFunctionsParameters
	}
}
Parameter :: {
	Type: "AWS::SSM::Parameter"
	Properties: {
		AllowedPattern?: string
		Description?:    string
		Name?:           string
		Policies?:       string
		Tags?: {
		}
		Tier?: string
		Type:  string
		Value: string
	}
}
PatchBaseline :: {
	Type: "AWS::SSM::PatchBaseline"
	Properties: {
		ApprovalRules?: __RuleGroup
		ApprovedPatches?: [...string]
		ApprovedPatchesComplianceLevel?:   string
		ApprovedPatchesEnableNonSecurity?: bool
		Description?:                      string
		GlobalFilters?:                    __PatchFilterGroup
		Name:                              string
		OperatingSystem?:                  string
		PatchGroups?: [...string]
		RejectedPatches?: [...string]
		RejectedPatchesAction?: string
		Sources?: [...__PatchSource]
		Tags?: [...__Tag]
	}
	__PatchFilter = {
		Key?: string
		Values?: [...string]
	}
	__PatchFilterGroup = {
		PatchFilters?: [...__PatchFilter]
	}
	__PatchSource = {
		Configuration?: string
		Name?:          string
		Products?: [...string]
	}
	__Rule = {
		ApproveAfterDays?:  int
		ComplianceLevel?:   string
		EnableNonSecurity?: bool
		PatchFilterGroup?:  __PatchFilterGroup
	}
	__RuleGroup = {
		PatchRules?: [...__Rule]
	}
}
ResourceDataSync :: {
	Type: "AWS::SSM::ResourceDataSync"
	Properties: {
		BucketName:    string
		BucketPrefix?: string
		BucketRegion:  string
		KMSKeyArn?:    string
		SyncFormat:    string
		SyncName:      string
	}
}

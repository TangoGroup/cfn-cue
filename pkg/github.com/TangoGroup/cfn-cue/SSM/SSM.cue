package SSM

import "github.com/TangoGroup/fn"

Association :: {
	Type: "AWS::SSM::Association"
	Properties: {
		AssociationName?: string | fn.Fn
		DocumentVersion?: string | fn.Fn
		InstanceId?:      string | fn.Fn
		Name:             string | fn.Fn
		OutputLocation?:  __InstanceAssociationOutputLocation
		Parameters?: {
		}
		ScheduleExpression?: string | fn.Fn
		Targets?: [...__Target]
	}
	__InstanceAssociationOutputLocation :: {
		S3Location?: __S3OutputLocation
	}
	__ParameterValues :: {
		ParameterValues: [...string] | fn.Fn
	}
	__S3OutputLocation :: {
		OutputS3BucketName?: string | fn.Fn
		OutputS3KeyPrefix?:  string | fn.Fn
	}
	__Target :: {
		Key:    string | fn.Fn
		Values: [...string] | fn.Fn
	}
}
Document :: {
	Type: "AWS::SSM::Document"
	Properties: {
		Content: {
		} | fn.Fn
		DocumentType?: string | fn.Fn
		Tags?: [...__Tag]
	}
}
MaintenanceWindow :: {
	Type: "AWS::SSM::MaintenanceWindow"
	Properties: {
		AllowUnassociatedTargets: bool | fn.Fn
		Cutoff:                   (int & (>=0 & <=23)) | fn.Fn
		Description?:             string | fn.Fn
		Duration:                 (int & (>=1 & <=24)) | fn.Fn
		EndDate?:                 string | fn.Fn
		Name:                     string | fn.Fn
		Schedule:                 string | fn.Fn
		ScheduleTimezone?:        string | fn.Fn
		StartDate?:               string | fn.Fn
		Tags?: [...__Tag]
	}
}
MaintenanceWindowTarget :: {
	Type: "AWS::SSM::MaintenanceWindowTarget"
	Properties: {
		Description?:      string | fn.Fn
		Name?:             string | fn.Fn
		OwnerInformation?: string | fn.Fn
		ResourceType:      string | fn.Fn
		Targets: [...__Target]
		WindowId: string | fn.Fn
	}
	__Target :: {
		Key:     string | fn.Fn
		Values?: [...string] | fn.Fn
	}
}
MaintenanceWindowTask :: {
	Type: "AWS::SSM::MaintenanceWindowTask"
	Properties: {
		Description?:    string | fn.Fn
		LoggingInfo?:    __LoggingInfo
		MaxConcurrency:  string | fn.Fn
		MaxErrors:       string | fn.Fn
		Name?:           string | fn.Fn
		Priority:        int | fn.Fn
		ServiceRoleArn?: string | fn.Fn
		Targets: [...__Target]
		TaskArn:                   string | fn.Fn
		TaskInvocationParameters?: __TaskInvocationParameters
		TaskParameters?:           {
		} | fn.Fn
		TaskType: string | fn.Fn
		WindowId: string | fn.Fn
	}
	__LoggingInfo :: {
		Region:    string | fn.Fn
		S3Bucket:  string | fn.Fn
		S3Prefix?: string | fn.Fn
	}
	__MaintenanceWindowAutomationParameters :: {
		DocumentVersion?: string | fn.Fn
		Parameters?:      {
		} | fn.Fn
	}
	__MaintenanceWindowLambdaParameters :: {
		ClientContext?: string | fn.Fn
		Payload?:       string | fn.Fn
		Qualifier?:     string | fn.Fn
	}
	__MaintenanceWindowRunCommandParameters :: {
		Comment?:            string | fn.Fn
		DocumentHash?:       string | fn.Fn
		DocumentHashType?:   string | fn.Fn
		NotificationConfig?: __NotificationConfig
		OutputS3BucketName?: string | fn.Fn
		OutputS3KeyPrefix?:  string | fn.Fn
		Parameters?:         {
		} | fn.Fn
		ServiceRoleArn?: string | fn.Fn
		TimeoutSeconds?: int | fn.Fn
	}
	__MaintenanceWindowStepFunctionsParameters :: {
		Input?: string | fn.Fn
		Name?:  string | fn.Fn
	}
	__NotificationConfig :: {
		NotificationArn:     string | fn.Fn
		NotificationEvents?: [...string] | fn.Fn
		NotificationType?:   string | fn.Fn
	}
	__Target :: {
		Key:     string | fn.Fn
		Values?: [...string] | fn.Fn
	}
	__TaskInvocationParameters :: {
		MaintenanceWindowAutomationParameters?:    __MaintenanceWindowAutomationParameters
		MaintenanceWindowLambdaParameters?:        __MaintenanceWindowLambdaParameters
		MaintenanceWindowRunCommandParameters?:    __MaintenanceWindowRunCommandParameters
		MaintenanceWindowStepFunctionsParameters?: __MaintenanceWindowStepFunctionsParameters
	}
}
Parameter :: {
	Type: "AWS::SSM::Parameter"
	Properties: {
		AllowedPattern?: string | fn.Fn
		Description?:    string | fn.Fn
		Name?:           string | fn.Fn
		Policies?:       string | fn.Fn
		Tags?:           {
		} | fn.Fn
		Tier?: string | fn.Fn
		Type:  string | fn.Fn
		Value: string | fn.Fn
	}
}
PatchBaseline :: {
	Type: "AWS::SSM::PatchBaseline"
	Properties: {
		ApprovalRules?:                    __RuleGroup
		ApprovedPatches?:                  [...string] | fn.Fn
		ApprovedPatchesComplianceLevel?:   string | fn.Fn
		ApprovedPatchesEnableNonSecurity?: bool | fn.Fn
		Description?:                      string | fn.Fn
		GlobalFilters?:                    __PatchFilterGroup
		Name:                              string | fn.Fn
		OperatingSystem?:                  string | fn.Fn
		PatchGroups?:                      [...string] | fn.Fn
		RejectedPatches?:                  [...string] | fn.Fn
		RejectedPatchesAction?:            string | fn.Fn
		Sources?: [...__PatchSource]
		Tags?: [...__Tag]
	}
	__PatchFilter :: {
		Key?:    string | fn.Fn
		Values?: [...string] | fn.Fn
	}
	__PatchFilterGroup :: {
		PatchFilters?: [...__PatchFilter]
	}
	__PatchSource :: {
		Configuration?: string | fn.Fn
		Name?:          string | fn.Fn
		Products?:      [...string] | fn.Fn
	}
	__Rule :: {
		ApproveAfterDays?:  int | fn.Fn
		ComplianceLevel?:   string | fn.Fn
		EnableNonSecurity?: bool | fn.Fn
		PatchFilterGroup?:  __PatchFilterGroup
	}
	__RuleGroup :: {
		PatchRules?: [...__Rule]
	}
}
ResourceDataSync :: {
	Type: "AWS::SSM::ResourceDataSync"
	Properties: {
		BucketName:    string | fn.Fn
		BucketPrefix?: string | fn.Fn
		BucketRegion:  string | fn.Fn
		KMSKeyArn?:    string | fn.Fn
		SyncFormat:    string | fn.Fn
		SyncName:      string | fn.Fn
	}
}

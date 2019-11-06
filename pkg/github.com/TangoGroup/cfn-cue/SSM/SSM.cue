package SSM

import "github.com/TangoGroup/fn"

Association :: {
	Type: "AWS::SSM::Association"
	Properties: {
		AssociationName?: string | fn.Fn
		DocumentVersion?: string | fn.Fn
		InstanceId?:      string | fn.Fn
		Name:             string | fn.Fn
		OutputLocation?:  propInstanceAssociationOutputLocation
		Parameters?: {
		}
		ScheduleExpression?: string | fn.Fn
		Targets?: [...propTarget]
	}
	propInstanceAssociationOutputLocation :: {
		S3Location?: propS3OutputLocation
	}
	propParameterValues :: {
		ParameterValues: [...(string | fn.Fn)]
	}
	propS3OutputLocation :: {
		OutputS3BucketName?: string | fn.Fn
		OutputS3KeyPrefix?:  string | fn.Fn
	}
	propTarget :: {
		Key: string | fn.Fn
		Values: [...(string | fn.Fn)]
	}
}
Document :: {
	Type: "AWS::SSM::Document"
	Properties: {
		Content: {
		} | fn.Fn
		DocumentType?: string | fn.Fn
		Tags?: [...propTag]
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
		Tags?: [...propTag]
	}
}
MaintenanceWindowTarget :: {
	Type: "AWS::SSM::MaintenanceWindowTarget"
	Properties: {
		Description?:      string | fn.Fn
		Name?:             string | fn.Fn
		OwnerInformation?: string | fn.Fn
		ResourceType:      string | fn.Fn
		Targets: [...propTarget]
		WindowId: string | fn.Fn
	}
	propTarget :: {
		Key: string | fn.Fn
		Values?: [...(string | fn.Fn)]
	}
}
MaintenanceWindowTask :: {
	Type: "AWS::SSM::MaintenanceWindowTask"
	Properties: {
		Description?:    string | fn.Fn
		LoggingInfo?:    propLoggingInfo
		MaxConcurrency:  string | fn.Fn
		MaxErrors:       string | fn.Fn
		Name?:           string | fn.Fn
		Priority:        int | fn.Fn
		ServiceRoleArn?: string | fn.Fn
		Targets: [...propTarget]
		TaskArn:                   string | fn.Fn
		TaskInvocationParameters?: propTaskInvocationParameters
		TaskParameters?:           {
		} | fn.Fn
		TaskType: string | fn.Fn
		WindowId: string | fn.Fn
	}
	propLoggingInfo :: {
		Region:    string | fn.Fn
		S3Bucket:  string | fn.Fn
		S3Prefix?: string | fn.Fn
	}
	propMaintenanceWindowAutomationParameters :: {
		DocumentVersion?: string | fn.Fn
		Parameters?:      {
		} | fn.Fn
	}
	propMaintenanceWindowLambdaParameters :: {
		ClientContext?: string | fn.Fn
		Payload?:       string | fn.Fn
		Qualifier?:     string | fn.Fn
	}
	propMaintenanceWindowRunCommandParameters :: {
		Comment?:            string | fn.Fn
		DocumentHash?:       string | fn.Fn
		DocumentHashType?:   string | fn.Fn
		NotificationConfig?: propNotificationConfig
		OutputS3BucketName?: string | fn.Fn
		OutputS3KeyPrefix?:  string | fn.Fn
		Parameters?:         {
		} | fn.Fn
		ServiceRoleArn?: string | fn.Fn
		TimeoutSeconds?: int | fn.Fn
	}
	propMaintenanceWindowStepFunctionsParameters :: {
		Input?: string | fn.Fn
		Name?:  string | fn.Fn
	}
	propNotificationConfig :: {
		NotificationArn: string | fn.Fn
		NotificationEvents?: [...(string | fn.Fn)]
		NotificationType?: string | fn.Fn
	}
	propTarget :: {
		Key: string | fn.Fn
		Values?: [...(string | fn.Fn)]
	}
	propTaskInvocationParameters :: {
		MaintenanceWindowAutomationParameters?:    propMaintenanceWindowAutomationParameters
		MaintenanceWindowLambdaParameters?:        propMaintenanceWindowLambdaParameters
		MaintenanceWindowRunCommandParameters?:    propMaintenanceWindowRunCommandParameters
		MaintenanceWindowStepFunctionsParameters?: propMaintenanceWindowStepFunctionsParameters
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
		ApprovalRules?: propRuleGroup
		ApprovedPatches?: [...(string | fn.Fn)]
		ApprovedPatchesComplianceLevel?:   string | fn.Fn
		ApprovedPatchesEnableNonSecurity?: bool | fn.Fn
		Description?:                      string | fn.Fn
		GlobalFilters?:                    propPatchFilterGroup
		Name:                              string | fn.Fn
		OperatingSystem?:                  string | fn.Fn
		PatchGroups?: [...(string | fn.Fn)]
		RejectedPatches?: [...(string | fn.Fn)]
		RejectedPatchesAction?: string | fn.Fn
		Sources?: [...propPatchSource]
		Tags?: [...propTag]
	}
	propPatchFilter :: {
		Key?: string | fn.Fn
		Values?: [...(string | fn.Fn)]
	}
	propPatchFilterGroup :: {
		PatchFilters?: [...propPatchFilter]
	}
	propPatchSource :: {
		Configuration?: string | fn.Fn
		Name?:          string | fn.Fn
		Products?: [...(string | fn.Fn)]
	}
	propRule :: {
		ApproveAfterDays?:  int | fn.Fn
		ComplianceLevel?:   string | fn.Fn
		EnableNonSecurity?: bool | fn.Fn
		PatchFilterGroup?:  propPatchFilterGroup
	}
	propRuleGroup :: {
		PatchRules?: [...propRule]
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

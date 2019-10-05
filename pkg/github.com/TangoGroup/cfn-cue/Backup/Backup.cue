package Backup

BackupPlan :: {
	Type: "AWS::Backup::BackupPlan"
	Properties: {
		BackupPlan: __BackupPlanResourceType
		BackupPlanTags?: {
		}
	}
	__BackupPlanResourceType :: {
		BackupPlanName: string
		BackupPlanRule: [...__BackupRuleResourceType]
	}
	__BackupRuleResourceType :: {
		CompletionWindowMinutes?: int
		Lifecycle?:               __LifecycleResourceType
		RecoveryPointTags?: {
		}
		RuleName:            string
		ScheduleExpression?: string
		StartWindowMinutes?: int
		TargetBackupVault:   string
	}
	__LifecycleResourceType :: {
		DeleteAfterDays?:            int
		MoveToColdStorageAfterDays?: int
	}
}
BackupSelection :: {
	Type: "AWS::Backup::BackupSelection"
	Properties: {
		BackupPlanId:    string
		BackupSelection: __BackupSelectionResourceType
	}
	__BackupSelectionResourceType :: {
		IamRoleArn: =~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#
		IamRoleArn: string
		ListOfTags?: [...__ConditionResourceType]
		Resources?: [...string]
		SelectionName: string
	}
	__ConditionResourceType :: {
		ConditionKey:   string
		ConditionType:  string
		ConditionValue: string
	}
}
BackupVault :: {
	Type: "AWS::Backup::BackupVault"
	Properties: {
		AccessPolicy?: {
		}
		BackupVaultName: string
		BackupVaultTags?: {
		}
		EncryptionKeyArn?: string
		Notifications?:    __NotificationObjectType
	}
	__NotificationObjectType :: {
		BackupVaultEvents: [...string]
		SNSTopicArn: string
	}
}

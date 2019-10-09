package Backup

import "github.com/TangoGroup/fn"

BackupPlan :: {
	Type: "AWS::Backup::BackupPlan"
	Properties: {
		BackupPlan:      __BackupPlanResourceType
		BackupPlanTags?: {
		} | fn.Fn
	}
	__BackupPlanResourceType :: {
		BackupPlanName: string | fn.Fn
		BackupPlanRule: [...__BackupRuleResourceType]
	}
	__BackupRuleResourceType :: {
		CompletionWindowMinutes?: int | fn.Fn
		Lifecycle?:               __LifecycleResourceType
		RecoveryPointTags?:       {
		} | fn.Fn
		RuleName:            string | fn.Fn
		ScheduleExpression?: string | fn.Fn
		StartWindowMinutes?: int | fn.Fn
		TargetBackupVault:   string | fn.Fn
	}
	__LifecycleResourceType :: {
		DeleteAfterDays?:            int | fn.Fn
		MoveToColdStorageAfterDays?: int | fn.Fn
	}
}
BackupSelection :: {
	Type: "AWS::Backup::BackupSelection"
	Properties: {
		BackupPlanId:    string | fn.Fn
		BackupSelection: __BackupSelectionResourceType
	}
	__BackupSelectionResourceType :: {
		IamRoleArn: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		ListOfTags?: [...__ConditionResourceType]
		Resources?:    [...string] | fn.Fn
		SelectionName: string | fn.Fn
	}
	__ConditionResourceType :: {
		ConditionKey:   string | fn.Fn
		ConditionType:  string | fn.Fn
		ConditionValue: string | fn.Fn
	}
}
BackupVault :: {
	Type: "AWS::Backup::BackupVault"
	Properties: {
		AccessPolicy?: {
		} | fn.Fn
		BackupVaultName:  string | fn.Fn
		BackupVaultTags?: {
		} | fn.Fn
		EncryptionKeyArn?: string | fn.Fn
		Notifications?:    __NotificationObjectType
	}
	__NotificationObjectType :: {
		BackupVaultEvents: [...string] | fn.Fn
		SNSTopicArn:       string | fn.Fn
	}
}

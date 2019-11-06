package Backup

import "github.com/TangoGroup/fn"

BackupPlan :: {
	Type: "AWS::Backup::BackupPlan"
	Properties: {
		BackupPlan:      propBackupPlanResourceType
		BackupPlanTags?: {
		} | fn.Fn
	}
	propBackupPlanResourceType :: {
		BackupPlanName: string | fn.Fn
		BackupPlanRule: [...propBackupRuleResourceType]
	}
	propBackupRuleResourceType :: {
		CompletionWindowMinutes?: int | fn.Fn
		Lifecycle?:               propLifecycleResourceType
		RecoveryPointTags?:       {
		} | fn.Fn
		RuleName:            string | fn.Fn
		ScheduleExpression?: string | fn.Fn
		StartWindowMinutes?: int | fn.Fn
		TargetBackupVault:   string | fn.Fn
	}
	propLifecycleResourceType :: {
		DeleteAfterDays?:            int | fn.Fn
		MoveToColdStorageAfterDays?: int | fn.Fn
	}
}
BackupSelection :: {
	Type: "AWS::Backup::BackupSelection"
	Properties: {
		BackupPlanId:    string | fn.Fn
		BackupSelection: propBackupSelectionResourceType
	}
	propBackupSelectionResourceType :: {
		IamRoleArn: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		ListOfTags?: [...propConditionResourceType]
		Resources?:    [...string] | fn.Fn
		SelectionName: string | fn.Fn
	}
	propConditionResourceType :: {
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
		Notifications?:    propNotificationObjectType
	}
	propNotificationObjectType :: {
		BackupVaultEvents: [...string] | fn.Fn
		SNSTopicArn:       string | fn.Fn
	}
}

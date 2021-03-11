package cacentral1

import "github.com/TangoGroup/aws/fn"

Backup :: {
	BackupPlan :: {
		Type:       "AWS::Backup::BackupPlan"
		Properties: close({
			BackupPlan: close({
				AdvancedBackupSettings?: [...close({
					BackupOptions: {
						[string]: _
					} | fn.Fn
					ResourceType: string | fn.Fn
				})] | fn.If
				BackupPlanName: string | fn.Fn
				BackupPlanRule: [...close({
					CompletionWindowMinutes?: int | fn.Fn
					CopyActions?:             [...close({
						DestinationBackupVaultArn: string | fn.Fn
						Lifecycle?:                close({
							DeleteAfterDays?:            int | fn.Fn
							MoveToColdStorageAfterDays?: int | fn.Fn
						}) | fn.If
					})] | fn.If
					Lifecycle?: close({
						DeleteAfterDays?:            int | fn.Fn
						MoveToColdStorageAfterDays?: int | fn.Fn
					}) | fn.If
					RecoveryPointTags?: {
						[string]: _
					} | fn.Fn
					RuleName:            string | fn.Fn
					ScheduleExpression?: string | fn.Fn
					StartWindowMinutes?: int | fn.Fn
					TargetBackupVault:   (=~#"^[a-zA-Z0-9\-\_]{2,50}$"#) | fn.Fn
				})] | fn.If
			}) | fn.If
			BackupPlanTags?: {
				[string]: _
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	BackupSelection :: {
		Type:       "AWS::Backup::BackupSelection"
		Properties: close({
			BackupPlanId:    string | fn.Fn
			BackupSelection: close({
				IamRoleArn:  (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
				ListOfTags?: [...close({
					ConditionKey:   string | fn.Fn
					ConditionType:  string | fn.Fn
					ConditionValue: string | fn.Fn
				})] | fn.If
				Resources?:    [...(string | fn.Fn)] | (string | fn.Fn)
				SelectionName: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	BackupVault :: {
		Type:       "AWS::Backup::BackupVault"
		Properties: close({
			AccessPolicy?: {
				[string]: _
			} | fn.Fn
			BackupVaultName:  (=~#"^[a-zA-Z0-9\-\_]{2,50}$"#) | fn.Fn
			BackupVaultTags?: {
				[string]: _
			} | fn.Fn
			EncryptionKeyArn?: string | fn.Fn
			Notifications?:    close({
				BackupVaultEvents: [...(string | fn.Fn)] | (string | fn.Fn)
				SNSTopicArn:       string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

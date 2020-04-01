package cnnorthwest1

import "github.com/TangoGroup/aws/fn"

Backup :: {
	BackupPlan :: {
		Type:       "AWS::Backup::BackupPlan"
		Properties: close({
			BackupPlan: close({
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
					TargetBackupVault:   string | fn.Fn
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
}

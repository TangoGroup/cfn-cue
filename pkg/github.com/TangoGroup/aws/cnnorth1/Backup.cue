package cnnorth1

import "github.com/TangoGroup/aws/fn"

#Backup: {
	#BackupPlan: {
		Type: "AWS::Backup::BackupPlan"
		Properties: {
			BackupPlan: {
				AdvancedBackupSettings?: [...{
					BackupOptions: {
						[string]: _
					} | fn.#Fn
					ResourceType: string | fn.#Fn
				}] | fn.#If
				BackupPlanName: string | fn.#Fn
				BackupPlanRule: [...{
					CompletionWindowMinutes?: int | fn.#Fn
					CopyActions?:             [...{
						DestinationBackupVaultArn: string | fn.#Fn
						Lifecycle?:                {
							DeleteAfterDays?:            int | fn.#Fn
							MoveToColdStorageAfterDays?: int | fn.#Fn
						} | fn.#If
					}] | fn.#If
					Lifecycle?: {
						DeleteAfterDays?:            int | fn.#Fn
						MoveToColdStorageAfterDays?: int | fn.#Fn
					} | fn.#If
					RecoveryPointTags?: {
						[string]: _
					} | fn.#Fn
					RuleName:            string | fn.#Fn
					ScheduleExpression?: string | fn.#Fn
					StartWindowMinutes?: int | fn.#Fn
					TargetBackupVault:   string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			BackupPlanTags?: {
				[string]: _
			} | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

package uswest2

import "github.com/TangoGroup/aws/fn"

#SSM: {
	#Association: {
		Type: "AWS::SSM::Association"
		Properties: {
			ApplyOnlyAtCronInterval?:       bool | fn.#Fn
			AssociationName?:               string | fn.#Fn
			AutomationTargetParameterName?: string | fn.#Fn
			ComplianceSeverity?:            string | fn.#Fn
			DocumentVersion?:               string | fn.#Fn
			InstanceId?:                    string | fn.#Fn
			MaxConcurrency?:                string | fn.#Fn
			MaxErrors?:                     string | fn.#Fn
			Name:                           string | fn.#Fn
			OutputLocation?:                {
				S3Location?: {
					OutputS3BucketName?: string | fn.#Fn
					OutputS3KeyPrefix?:  string | fn.#Fn
					OutputS3Region?:     string | fn.#Fn
				} | fn.If
			} | fn.If
			Parameters?: {
				[string]: ParameterValues: [...(string | fn.#Fn)] | (string | fn.#Fn)
			} | fn.If
			ScheduleExpression?: string | fn.#Fn
			SyncCompliance?:     string | fn.#Fn
			Targets?:            [...{
				Key:    string | fn.#Fn
				Values: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}] | fn.If
			WaitForSuccessTimeoutSeconds?: int | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Document: {
		Type: "AWS::SSM::Document"
		Properties: {
			Content: {
				[string]: _
			} | fn.#Fn
			DocumentType?: string | fn.#Fn
			Name?:         string | fn.#Fn
			Tags?:         [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MaintenanceWindow: {
		Type: "AWS::SSM::MaintenanceWindow"
		Properties: {
			AllowUnassociatedTargets: bool | fn.#Fn
			Cutoff:                   (>=0 & <=23) | fn.#Fn
			Description?:             string | fn.#Fn
			Duration:                 (>=1 & <=24) | fn.#Fn
			EndDate?:                 string | fn.#Fn
			Name:                     string | fn.#Fn
			Schedule:                 string | fn.#Fn
			ScheduleOffset?:          int | fn.#Fn
			ScheduleTimezone?:        string | fn.#Fn
			StartDate?:               string | fn.#Fn
			Tags?:                    [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MaintenanceWindowTarget: {
		Type: "AWS::SSM::MaintenanceWindowTarget"
		Properties: {
			Description?:      string | fn.#Fn
			Name?:             string | fn.#Fn
			OwnerInformation?: string | fn.#Fn
			ResourceType:      string | fn.#Fn
			Targets:           [...{
				Key:     string | fn.#Fn
				Values?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}] | fn.If
			WindowId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MaintenanceWindowTask: {
		Type: "AWS::SSM::MaintenanceWindowTask"
		Properties: {
			Description?: string | fn.#Fn
			LoggingInfo?: {
				Region:    string | fn.#Fn
				S3Bucket:  string | fn.#Fn
				S3Prefix?: string | fn.#Fn
			} | fn.If
			MaxConcurrency:  string | fn.#Fn
			MaxErrors:       string | fn.#Fn
			Name?:           string | fn.#Fn
			Priority:        int | fn.#Fn
			ServiceRoleArn?: string | fn.#Fn
			Targets:         [...{
				Key:     string | fn.#Fn
				Values?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}] | fn.If
			TaskArn:                   string | fn.#Fn
			TaskInvocationParameters?: {
				MaintenanceWindowAutomationParameters?: {
					DocumentVersion?: string | fn.#Fn
					Parameters?:      {
						[string]: _
					} | fn.#Fn
				} | fn.If
				MaintenanceWindowLambdaParameters?: {
					ClientContext?: string | fn.#Fn
					Payload?:       string | fn.#Fn
					Qualifier?:     string | fn.#Fn
				} | fn.If
				MaintenanceWindowRunCommandParameters?: {
					Comment?:            string | fn.#Fn
					DocumentHash?:       string | fn.#Fn
					DocumentHashType?:   string | fn.#Fn
					NotificationConfig?: {
						NotificationArn:     string | fn.#Fn
						NotificationEvents?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						NotificationType?:   string | fn.#Fn
					} | fn.If
					OutputS3BucketName?: string | fn.#Fn
					OutputS3KeyPrefix?:  string | fn.#Fn
					Parameters?:         {
						[string]: _
					} | fn.#Fn
					ServiceRoleArn?: string | fn.#Fn
					TimeoutSeconds?: int | fn.#Fn
				} | fn.If
				MaintenanceWindowStepFunctionsParameters?: {
					Input?: string | fn.#Fn
					Name?:  string | fn.#Fn
				} | fn.If
			} | fn.If
			TaskParameters?: {
				[string]: _
			} | fn.#Fn
			TaskType: string | fn.#Fn
			WindowId: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Parameter: {
		Type: "AWS::SSM::Parameter"
		Properties: {
			AllowedPattern?: string | fn.#Fn
			DataType?:       string | fn.#Fn
			Description?:    string | fn.#Fn
			Name?:           string | fn.#Fn
			Policies?:       string | fn.#Fn
			Tags?:           {
				[string]: _
			} | fn.#Fn
			Tier?: string | fn.#Fn
			Type:  string | fn.#Fn
			Value: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#PatchBaseline: {
		Type: "AWS::SSM::PatchBaseline"
		Properties: {
			ApprovalRules?: {
				PatchRules?: [...{
					ApproveAfterDays?:  int | fn.#Fn
					ApproveUntilDate?:  {} | fn.If
					ComplianceLevel?:   string | fn.#Fn
					EnableNonSecurity?: bool | fn.#Fn
					PatchFilterGroup?:  {
						PatchFilters?: [...{
							Key?:    string | fn.#Fn
							Values?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}] | fn.If
					} | fn.If
				}] | fn.If
			} | fn.If
			ApprovedPatches?:                  [...(string | fn.#Fn)] | (string | fn.#Fn)
			ApprovedPatchesComplianceLevel?:   string | fn.#Fn
			ApprovedPatchesEnableNonSecurity?: bool | fn.#Fn
			Description?:                      string | fn.#Fn
			GlobalFilters?:                    {
				PatchFilters?: [...{
					Key?:    string | fn.#Fn
					Values?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}] | fn.If
			} | fn.If
			Name:                   string | fn.#Fn
			OperatingSystem?:       string | fn.#Fn
			PatchGroups?:           [...(string | fn.#Fn)] | (string | fn.#Fn)
			RejectedPatches?:       [...(string | fn.#Fn)] | (string | fn.#Fn)
			RejectedPatchesAction?: string | fn.#Fn
			Sources?:               [...{
				Configuration?: string | fn.#Fn
				Name?:          string | fn.#Fn
				Products?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceDataSync: {
		Type: "AWS::SSM::ResourceDataSync"
		Properties: {
			BucketName?:    string | fn.#Fn
			BucketPrefix?:  string | fn.#Fn
			BucketRegion?:  string | fn.#Fn
			KMSKeyArn?:     string | fn.#Fn
			S3Destination?: {
				BucketName:    string | fn.#Fn
				BucketPrefix?: string | fn.#Fn
				BucketRegion:  string | fn.#Fn
				KMSKeyArn?:    string | fn.#Fn
				SyncFormat:    string | fn.#Fn
			} | fn.If
			SyncFormat?: string | fn.#Fn
			SyncName:    string | fn.#Fn
			SyncSource?: {
				AwsOrganizationsSource?: {
					OrganizationSourceType: string | fn.#Fn
					OrganizationalUnits?:   [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.If
				IncludeFutureRegions?: bool | fn.#Fn
				SourceRegions:         [...(string | fn.#Fn)] | (string | fn.#Fn)
				SourceType:            string | fn.#Fn
			} | fn.If
			SyncType?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

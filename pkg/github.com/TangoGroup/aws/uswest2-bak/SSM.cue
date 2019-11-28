package uswest2

import "github.com/TangoGroup/aws/fn"

SSM :: {
	Association :: {
		Type: "AWS::SSM::Association"
		Properties: {
			AssociationName?: string | fn.Fn
			DocumentVersion?: string | fn.Fn
			InstanceId?:      string | fn.Fn
			Name:             string | fn.Fn
			OutputLocation?: S3Location?: {
				OutputS3BucketName?: string | fn.Fn
				OutputS3KeyPrefix?:  string | fn.Fn
			}
			Parameters?: [string]: ParameterValues: [...(string | fn.Fn)] | fn.Fn
			ScheduleExpression?: string | fn.Fn
			Targets?: [...{
				Key:    string | fn.Fn
				Values: [...(string | fn.Fn)] | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Document :: {
		Type: "AWS::SSM::Document"
		Properties: {
			Content: {
				[string]: _
			} | fn.Fn
			DocumentType?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
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
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	MaintenanceWindowTarget :: {
		Type: "AWS::SSM::MaintenanceWindowTarget"
		Properties: {
			Description?:      string | fn.Fn
			Name?:             string | fn.Fn
			OwnerInformation?: string | fn.Fn
			ResourceType:      string | fn.Fn
			Targets: [...{
				Key:     string | fn.Fn
				Values?: [...(string | fn.Fn)] | fn.Fn
			}]
			WindowId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	MaintenanceWindowTask :: {
		Type: "AWS::SSM::MaintenanceWindowTask"
		Properties: {
			Description?: string | fn.Fn
			LoggingInfo?: {
				Region:    string | fn.Fn
				S3Bucket:  string | fn.Fn
				S3Prefix?: string | fn.Fn
			}
			MaxConcurrency:  string | fn.Fn
			MaxErrors:       string | fn.Fn
			Name?:           string | fn.Fn
			Priority:        int | fn.Fn
			ServiceRoleArn?: string | fn.Fn
			Targets: [...{
				Key:     string | fn.Fn
				Values?: [...(string | fn.Fn)] | fn.Fn
			}]
			TaskArn: string | fn.Fn
			TaskInvocationParameters?: {
				MaintenanceWindowAutomationParameters?: {
					DocumentVersion?: string | fn.Fn
					Parameters?:      {
						[string]: _
					} | fn.Fn
				}
				MaintenanceWindowLambdaParameters?: {
					ClientContext?: string | fn.Fn
					Payload?:       string | fn.Fn
					Qualifier?:     string | fn.Fn
				}
				MaintenanceWindowRunCommandParameters?: {
					Comment?:          string | fn.Fn
					DocumentHash?:     string | fn.Fn
					DocumentHashType?: string | fn.Fn
					NotificationConfig?: {
						NotificationArn:     string | fn.Fn
						NotificationEvents?: [...(string | fn.Fn)] | fn.Fn
						NotificationType?:   string | fn.Fn
					}
					OutputS3BucketName?: string | fn.Fn
					OutputS3KeyPrefix?:  string | fn.Fn
					Parameters?:         {
						[string]: _
					} | fn.Fn
					ServiceRoleArn?: string | fn.Fn
					TimeoutSeconds?: int | fn.Fn
				}
				MaintenanceWindowStepFunctionsParameters?: {
					Input?: string | fn.Fn
					Name?:  string | fn.Fn
				}
			}
			TaskParameters?: {
				[string]: _
			} | fn.Fn
			TaskType: string | fn.Fn
			WindowId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Parameter :: {
		Type: "AWS::SSM::Parameter"
		Properties: {
			AllowedPattern?: string | fn.Fn
			Description?:    string | fn.Fn
			Name?:           string | fn.Fn
			Policies?:       string | fn.Fn
			Tags?:           {
				[string]: _
			} | fn.Fn
			Tier?: string | fn.Fn
			Type:  string | fn.Fn
			Value: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	PatchBaseline :: {
		Type: "AWS::SSM::PatchBaseline"
		Properties: {
			ApprovalRules?: PatchRules?: [...{
				ApproveAfterDays?:  int | fn.Fn
				ComplianceLevel?:   string | fn.Fn
				EnableNonSecurity?: bool | fn.Fn
				PatchFilterGroup?: PatchFilters?: [...{
					Key?:    string | fn.Fn
					Values?: [...(string | fn.Fn)] | fn.Fn
				}]
			}]
			ApprovedPatches?:                  [...(string | fn.Fn)] | fn.Fn
			ApprovedPatchesComplianceLevel?:   string | fn.Fn
			ApprovedPatchesEnableNonSecurity?: bool | fn.Fn
			Description?:                      string | fn.Fn
			GlobalFilters?: PatchFilters?: [...{
				Key?:    string | fn.Fn
				Values?: [...(string | fn.Fn)] | fn.Fn
			}]
			Name:                   string | fn.Fn
			OperatingSystem?:       string | fn.Fn
			PatchGroups?:           [...(string | fn.Fn)] | fn.Fn
			RejectedPatches?:       [...(string | fn.Fn)] | fn.Fn
			RejectedPatchesAction?: string | fn.Fn
			Sources?: [...{
				Configuration?: string | fn.Fn
				Name?:          string | fn.Fn
				Products?:      [...(string | fn.Fn)] | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
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
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}

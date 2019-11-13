package usgovwest1

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
			Parameters?: [string]: ParameterValues: [...(string | fn.Fn)]
			ScheduleExpression?: string | fn.Fn
			Targets?: [...{
				Key: string | fn.Fn
				Values: [...(string | fn.Fn)]
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
				Key: string | fn.Fn
				Values?: [...(string | fn.Fn)]
			}]
			WindowId: string | fn.Fn
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

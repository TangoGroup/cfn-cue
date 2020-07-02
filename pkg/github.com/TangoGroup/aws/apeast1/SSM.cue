package apeast1

import "github.com/TangoGroup/aws/fn"

SSM :: {
	Association :: {
		Type:       "AWS::SSM::Association"
		Properties: close({
			AssociationName?:               string | fn.Fn
			AutomationTargetParameterName?: string | fn.Fn
			ComplianceSeverity?:            string | fn.Fn
			DocumentVersion?:               string | fn.Fn
			InstanceId?:                    string | fn.Fn
			MaxConcurrency?:                string | fn.Fn
			MaxErrors?:                     string | fn.Fn
			Name:                           string | fn.Fn
			OutputLocation?:                close({
				S3Location?: close({
					OutputS3BucketName?: string | fn.Fn
					OutputS3KeyPrefix?:  string | fn.Fn
					OutputS3Region?:     string | fn.Fn
				}) | fn.If
			}) | fn.If
			Parameters?: {
				[string]: close({
					ParameterValues: [...(string | fn.Fn)] | (string | fn.Fn)
				})
			} | fn.If
			ScheduleExpression?: string | fn.Fn
			SyncCompliance?:     string | fn.Fn
			Targets?:            [...close({
				Key:    string | fn.Fn
				Values: [...(string | fn.Fn)] | (string | fn.Fn)
			})] | fn.If
			WaitForSuccessTimeoutSeconds?: int | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Document :: {
		Type:       "AWS::SSM::Document"
		Properties: close({
			Content: {
				[string]: _
			} | fn.Fn
			DocumentType?: string | fn.Fn
			Name?:         string | fn.Fn
			Tags?:         [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MaintenanceWindowTarget :: {
		Type:       "AWS::SSM::MaintenanceWindowTarget"
		Properties: close({
			Description?:      string | fn.Fn
			Name?:             string | fn.Fn
			OwnerInformation?: string | fn.Fn
			ResourceType:      string | fn.Fn
			Targets:           [...close({
				Key:     string | fn.Fn
				Values?: [...(string | fn.Fn)] | (string | fn.Fn)
			})] | fn.If
			WindowId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}

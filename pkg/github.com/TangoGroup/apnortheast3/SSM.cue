package apnortheast3

import "github.com/TangoGroup/fn"

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
	}
	Document :: {
		Type: "AWS::SSM::Document"
		Properties: {
			Content: {
			} | fn.Fn
			DocumentType?: string | fn.Fn
			Tags?: [...{
			}]
		}
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
	}
}
